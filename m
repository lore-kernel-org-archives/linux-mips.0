Received: from mailapp01.imgtec.com ([195.59.15.196]:33408 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992312AbdI1MOGjMySa (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 28 Sep 2017 14:14:06 +0200
Date: Thu, 28 Sep 2017 13:13:45 +0100
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: [PATCH v2] MIPS: Add basic R5900 support
In-Reply-To: <20170927172107.GB2631@localhost.localdomain>
Message-ID: <alpine.DEB.2.00.1709272208300.16752@tp.orcam.me.uk>
References: <20170911151737.GA2265@localhost.localdomain> <alpine.DEB.2.00.1709141423180.16752@tp.orcam.me.uk> <20170916133423.GB32582@localhost.localdomain> <alpine.DEB.2.00.1709171001160.16752@tp.orcam.me.uk> <20170918192428.GA391@localhost.localdomain>
 <alpine.DEB.2.00.1709182055090.16752@tp.orcam.me.uk> <20170920145440.GB9255@localhost.localdomain> <alpine.DEB.2.00.1709201705070.16752@tp.orcam.me.uk> <20170927172107.GB2631@localhost.localdomain>
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
Message-ID: <20170928121345.CNQgQZJFe4OfaDp8yc9NWIJek9XynqzZ9iXr86lMmDI@z>

Hi Fredrik,

> >  Instead I think these macros as well all the ones in <asm/stackframe.h> 
> > should remain unchanged and the save and restoration of the 64-bit upper 
> > halves done separately, most likely in `switch_to', which is where all the 
> > user context registers which like these upper halves are not touched by 
> > the kernel (and which are not handled lazily by other means) are switched.
> 
> Hmm... What about a 32-bit kernel and bits 63:32 sign-extended by kernel
> instructions? LONG_{L,S} saves/restores 31:0 using LW/SW thus 63:32 will
> be lost in exceptions?

 You mean for use with MMI instructions?  Offhand I think we have two 
options:

1. Declaring the lack of support for MMI instructions in o32 software.

2. Switching to using LD/SD in <asm/stackframe.h> and preserving statics 
   across syscalls with SAVE_STATIC/RESTORE_STATIC at the cost of
   performance loss.

I'm open for a better suggestion though.  I propose that we start with #1, 
as the zero performance cost and zero effort solution.

> >  Can you try a regular 32-bit MIPS Debian distribution instead?
> 
> BusyBox at
> 
> https://packages.debian.org/stretch/mipsel/busybox-static/download
> 
> seemed appropriate but yields "illegal instruction" which I suppose is
> interesting in itself. My MIPS toolchain is somewhat limited at the moment
> so I will need to get back on this.

 Getting a core dump and using it to figure out which specific instruction 
caused the exception would be interesting.  Also make sure you have RDHWR 
instruction emulation in place for CP0 UserLocal register access.

> >  BTW, I have just noticed that DMULT, DMULTU, DDIV and DDIVU instructions 
> > are not implemented.  Which means that a 64-bit kernel will only work if 
> > compiled with `-march=r5900' and emulation is required for 64-bit user 
> > programs.
> 
> Indeed. In the R5900 patch these instructions are emulated (or simulated as
> it is called in the source) in
> 
> https://github.com/frno7/linux/blob/1c8247e352d1eb7ae9022a76ecf19f74264534f7/arch/mips/kernel/traps.c
> 
> along with LLD, SCD, etc.

 Ah, OK then.

  Maciej
