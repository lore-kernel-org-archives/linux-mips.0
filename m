Received: from 9pmail.ess.barracuda.com ([64.235.154.211]:35894 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990400AbeEXRGTl4Htf (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 24 May 2018 19:06:19 +0200
Date: Thu, 24 May 2018 18:06:05 +0100
From: "Maciej W. Rozycki" <macro@mips.com>
Subject: Re: [PATCH] MIPS: prctl: Disallow FRE without FR with PR_SET_FP_MODE
 requests
In-Reply-To: <20180524163617.dts46enhigc2yjfo@pburton-laptop>
Message-ID: <alpine.DEB.2.00.1805241757321.10896@tp.orcam.me.uk>
References: <alpine.DEB.2.00.1805141439290.10896@tp.orcam.me.uk> <20180524163617.dts46enhigc2yjfo@pburton-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej.Rozycki@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Paul Burton <paul.burton@mips.com>
Cc: James Hogan <jhogan@kernel.org>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Message-ID: <20180524170605.mldO14lyU0AtNkrJq29FG2qzpGAEilus9d-jAEbY8jg@z>

Hi Paul,

> > Having PR_FP_MODE_FRE (i.e. Config5.FRE) set without PR_FP_MODE_FR (i.e. 
> > Status.FR) is not supported as the lone purpose of Config5.FRE is to 
> > emulate Status.FR=0 handling on FPU hardware that has Status.FR=1 
> > hardwired[1][2].  Also we do not handle this case elsewhere, and assume 
> > throughout our code that TIF_HYBRID_FPREGS and TIF_32BIT_FPREGS cannot 
> > be set both at once for a task, leading to inconsistent behaviour if 
> > this does happen.
> 
> Reviewing the code I think we should actually end up with FR=1 in this
> case, because neither __own_fpu() nor the FPU emulator depend on the
> value of TIF_32BIT_FPREGS if TIF_HYBRID_FPREGS is set. So it's not too
> awful & I don't see the kernel doing anything too crazy, but it
> definitely isn't what the user asked for.

 However `arch_ptrace' does check TIF_32BIT_FPREGS and gets things wrong 
if TIF_HYBRID_FPREGS is also set.  Which is actually how I discovered 
this issue.

> > Return unsuccessfully then from prctl(2) PR_SET_FP_MODE calls requesting 
> > PR_FP_MODE_FRE to be set with PR_FP_MODE_FR clear.  This corresponds to 
> > modes allowed by `mips_set_personality_fp'.
> 
> Looks good to me:
> 
>   Reviewed-by: Paul Burton <paul.burton@mips.com>

 Thanks for your review.

  Maciej
