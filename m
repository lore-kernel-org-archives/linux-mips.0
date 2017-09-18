Received: from mailapp01.imgtec.com ([195.59.15.196]:23871 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992800AbdIRRGRNfrXg (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 18 Sep 2017 19:06:17 +0200
Date: Mon, 18 Sep 2017 18:05:56 +0100
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: [PATCH v2] MIPS: Add basic R5900 support
In-Reply-To: <20170916133423.GB32582@localhost.localdomain>
Message-ID: <alpine.DEB.2.00.1709171001160.16752@tp.orcam.me.uk>
References: <20170911151737.GA2265@localhost.localdomain> <alpine.DEB.2.00.1709141423180.16752@tp.orcam.me.uk> <20170916133423.GB32582@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej.Rozycki@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Fredrik Noring <noring@nocrew.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20170918170556.lZISXayyAWWZSj-pZCr-gTT3fXqngrm4h3lVSrnWN9w@z>

Hi Fredrik,

> >  For the initial R5900 support I think there are two options here, 
> > depending on what hardware supports:
> > 
> > 1. If (for binary compatibility reasons) 128-bit GPR support can somehow 
> >    be disabled in hardware, by flipping a CP0 register bit or suchlike, 
> >    then I suggest doing that in the first stage.
> 
> Unfortunately I haven't found such a switch. There is also a set of 128-bit
> multimedia instructions to consider (GCC is perhaps unlikely to generate
> those but assembly code is an option too).

 The usual minimal approach is to have compiler intrinsics implemented.

> > 2. Otherwise I think that the context initialisation/switch code has to be 
> >    adjusted such that the upper GPR halves are set to a known state, 
> >    either zeroed or sign-extended from bit #63 (or #31 really, given the 
> >    initial 32-bit port only) according to hardware requirements, so as to
> >    make execution stable and prevent data from leaking between contexts.
> > 
> > Later on proper 128-bit support can be added, though for that to make 
> > sense you need to have compiler support too, which AFAICT is currently 
> > missing.  Myself I'd rather defer commenting on that further support until 
> > we get to it, although of course someone else might be willing to sketch 
> > an idea.
> 
> I have a working 32-bit kernel now, except that BusyBox randomly crashes
> unless the kernel saves/restores 64-bit GPRs. The executables and libraries
> declare "ELF 32-bit LSB, MIPS, MIPS-III version 1" so in theory, I suppose,
> they ought to be 32-bit only. It is possible that the error lies in the
> kernel handling of the GPRs but I have double-checked this in several ways.

 Virtually all 64-bit MIPS processors have the CP0.Status.UX bit, which 
the Linux kernel keeps clear for o32 processes (CP0.Status.PX is currently 
unsupported and is kept clear as well), which means that an attempt to use 
any instruction that affects register bits beyond bit #31 will cause a 
Reserved Instruction exception, and in turn SIGILL being sent to the 
program.  

 So any crash caused by the lack of handling of the upper bits is a result 
of either a kernel bug or an issue with hardware.

> The error, as it appears, is nasty for at least two reasons: it occurs
> randomly (when the kernel arbitrarily resets the upper 96 bits of all GPRs)
> and it can easily remain undetected and lead to silent data corruption.

 Hmm, can you verify that no LWU instruction is present in the kernel 
somewhere?

 Can you add a diagnostic consistency check to the context restoration 
code, i.e. all the macros called from RESTORE_ALL (in <asm/stackframe.h>), 
such as a `break 12' (BRK_BUG) instruction if a register value is not 
correctly sign-extended?  You can instead use one of the register trap 
instructions (with the same BRK_BUG code), to avoid the need for a branch.  
Make sure you don't clobber registers restored; you may have to use $k0 or 
$k1 in places.  This will cause a kernel oops, which can then be examined 
to track down a possible cause.

 GAS will prevent the use of any 64-bit instructions (which LWU is one of) 
when the o32 ABI has been selected for assembly, however it can be 
temporarily overridden by `.set' pseudo-ops, and also I haven't verified 
if there isn't an issue with `-march=r5900' in GAS.

> Are there other Linux MIPS implementations that reset GPRs like this?

 No, because keeping CP0.Status.UX clear guarantees that only instructions 
which sign-extend register results from bit #31 can be used.

 Maciej
