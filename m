Received: from mailapp01.imgtec.com ([195.59.15.196]:63614 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007488AbbHYUivG8vhQ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 25 Aug 2015 22:38:51 +0200
Date: Tue, 25 Aug 2015 13:38:42 -0700
From: Paul Burton <paul.burton@imgtec.com>
Subject: Re: [PATCH 2/2] MIPS: kernel: signal: Drop unused arguments for
 traditional signal handlers
Message-ID: <20150825203842.GA27406@NP-P-BURTON>
References: <1440071122-24971-1-git-send-email-markos.chandras@imgtec.com>
 <1440071122-24971-3-git-send-email-markos.chandras@imgtec.com>
 <55D759CA.7060409@gmail.com>
 <55DACF45.9050209@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <55DACF45.9050209@imgtec.com>
Return-Path: <Paul.Burton@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Markos Chandras <Markos.Chandras@imgtec.com>
Cc: David Daney <ddaney.cavm@gmail.com>, linux-mips@linux-mips.org
Message-ID: <20150825203842.Kv4U0PoMpsxQS3d-ocl3kowdTGNo-DTAIflcG7B7xmc@z>

On Mon, Aug 24, 2015 at 09:01:09AM +0100, Markos Chandras wrote:
> On 08/21/2015 06:03 PM, David Daney wrote:
> > On 08/20/2015 04:45 AM, Markos Chandras wrote:
> >> Traditional signal handlers (ie !SA_SIGINFO) only need only argument
> >> holding the signal number so we drop the additional arguments and fix
> >> the related comments. We also update the comments for the SA_SIGINFO
> >> case where the second argument is a pointer to a siginfo_t structure.
> >>
> >> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
> >> ---
> >>   arch/mips/kernel/signal.c     | 6 +-----
> >>   arch/mips/kernel/signal32.c   | 6 +-----
> >>   arch/mips/kernel/signal_n32.c | 2 +-
> >>   3 files changed, 3 insertions(+), 11 deletions(-)
> >>
> >> diff --git a/arch/mips/kernel/signal.c b/arch/mips/kernel/signal.c
> >> index be3ac5f7cbbb..3a125331bf8b 100644
> >> --- a/arch/mips/kernel/signal.c
> >> +++ b/arch/mips/kernel/signal.c
> >> @@ -683,15 +683,11 @@ static int setup_frame(void *sig_return, struct
> >> ksignal *ksig,
> >>        * Arguments to signal handler:
> >>        *
> >>        *   a0 = signal number
> >> -     *   a1 = 0 (should be cause)
> >> -     *   a2 = pointer to struct sigcontext
> >>        *
> >>        * $25 and c0_epc point to the signal handler, $29 points to the
> >>        * struct sigframe.
> >>        */
> >>       regs->regs[ 4] = ksig->sig;
> >> -    regs->regs[ 5] = 0;
> >> -    regs->regs[ 6] = (unsigned long) &frame->sf_sc;
> > 
> > This changes the kernel ABI.
> > 
> > Have you tested this change against all userspace applications that use
> > signals to make sure it doesn't break anything?
> > 
> > David Daney
> 
> i am confident there is no userland application that uses inline asm to
> fetch additional arguments from (*sa_handler) when using !SA_SIGINFO
> 
> -- 
> markos

I'm not sure where you get the idea that you'd need inline asm to use
the a1/a2 values - you'd just need to declare the extra parameters to
your signal handling function.

This does seem like a scary change! I'm pretty confident you haven't
actually checked every bit of userland code. Would we perhaps be better
off leaving the registers set (which is a trivial cost) and document the
behaviour instead?

Thanks,
    Paul
