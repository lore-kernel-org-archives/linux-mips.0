Received: from mailapp01.imgtec.com ([195.59.15.196]:25244 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23994843AbdFPTvKERFDV (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 16 Jun 2017 21:51:10 +0200
Date: Fri, 16 Jun 2017 20:50:50 +0100
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: [PATCH 0/5] MIPS: FP cleanup & no-FP support
In-Reply-To: <3803102.5EWcPJmQIq@np-p-burton>
Message-ID: <alpine.DEB.2.00.1706162029030.23046@tp.orcam.me.uk>
References: <20170605182131.16853-1-paul.burton@imgtec.com> <alpine.DEB.2.00.1706160348450.23046@tp.orcam.me.uk> <3803102.5EWcPJmQIq@np-p-burton>
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
To: Paul Burton <paul.burton@imgtec.com>
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20170616195050.nyu1otC9kgFo57z1OI0q-kPcVG7kKeXEu-MwYtbBgE0@z>

Paul,

> > > Paul Burton (5):
> > >   MIPS: Remove unused R6000 support
> > >   MIPS: Move r4k FP code from r4k_switch.S to r4k_fpu.S
> > >   MIPS: Move r2300 FP code from r2300_switch.S to r2300_fpu.S
> > >   MIPS: Remove unused ST_OFF from r2300_switch.S
> > >   MIPS: Allow floating point support to be disabled
> > 
> > Doesn't ptrace(2) require suitable updates for requests that deal with
> > the FP context?
> 
> I mentioned in the commit message for patch 5 that removing the actual context 
> fields & ptrace access to them could be done as a further improvement.

 Somehow I missed that, sorry, but in any case I don't find it acceptable.

> > Preferably along with the last change (or maybe ahead of
> > it) so that we don't have a kernel revision that presents rubbish to the
> > userland (of course tools like GDB will have to be updated accordingly to
> > cope, but that's out of scope for Linux itself).
> 
> Well, as-is ptrace would still let you read & write to FP registers if you 
> try, it's just those values will never be used. Are you opposed to that 
> behaviour? If we do later remove the context entirely then presumably ptrace 
> would either read 0 or return an error, and ignore writes or return an error - 
> I suppose if we want to ensure consistent behaviour for that potential future 
> change then we could choose one of those options & do that here.
> 
> In practice I'm not sure I see much benefit - if a debugger wants to write to 
> context corresponding to registers that just aren't there then letting it 
> doesn't seem like a big problem. Do you disagree? Note that we already allow 
> this for hi & lo registers on r6 for example - ptrace will freely read/write 
> the context even though the registers don't exist.

 I think there must be -EIO for access to any inexistent resource, just as 
we already do for missing DSP registers.  The client can then handle this 
appropriately.  (ENXIO would probably be more accurate, however EIO has 
already been embedded in GDB and changing it would be problematic).

 I wasn't aware about the HI/LO case with R6 -- it clearly looks like a 
bug to me.  Of course it means more work for GDB and other such software 
maintainers, but I find it unacceptable if we present users with resources 
which are not there.

> > Also how about those prctl(2) calls that also operate on FP state?
> 
> Patch 5 has them return -EOPNOTSUPP, which is consistent with behaviour when 
> attempting to set an unsupported mode.

 I missed that, sorry.  I'm not sure if -EOPNOTSUPP (-EINVAL?) or -EIO 
(-ENXIO?) would be the right code here, i.e. unrecognised vs unsupported, 
but I can see the existing code does not tell these two cases apart, so I 
think I'd accept your proposal here as it stands, although this may have 
to be eventually fixed.  Also glibc code will have to be audited for 
correct error handling here.

  Maciej
