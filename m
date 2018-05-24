Received: from 9pmail.ess.barracuda.com ([64.235.150.224]:40581 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990400AbeEXQg0kv3Pf (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 24 May 2018 18:36:26 +0200
Date: Thu, 24 May 2018 09:36:17 -0700
From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH] MIPS: prctl: Disallow FRE without FR with PR_SET_FP_MODE
 requests
Message-ID: <20180524163617.dts46enhigc2yjfo@pburton-laptop>
References: <alpine.DEB.2.00.1805141439290.10896@tp.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.00.1805141439290.10896@tp.orcam.me.uk>
Return-Path: <Paul.Burton@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: "Maciej W. Rozycki" <macro@mips.com>, James Hogan <jhogan@kernel.org>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Message-ID: <20180524163617.DGLsvxR4B_3PDryzNhedi7D37gwevwos_F4y5DN5a-o@z>

Hi Maciej,

On Tue, May 15, 2018 at 11:04:44PM +0100, Maciej W. Rozycki wrote:
> Having PR_FP_MODE_FRE (i.e. Config5.FRE) set without PR_FP_MODE_FR (i.e. 
> Status.FR) is not supported as the lone purpose of Config5.FRE is to 
> emulate Status.FR=0 handling on FPU hardware that has Status.FR=1 
> hardwired[1][2].  Also we do not handle this case elsewhere, and assume 
> throughout our code that TIF_HYBRID_FPREGS and TIF_32BIT_FPREGS cannot 
> be set both at once for a task, leading to inconsistent behaviour if 
> this does happen.

Reviewing the code I think we should actually end up with FR=1 in this
case, because neither __own_fpu() nor the FPU emulator depend on the
value of TIF_32BIT_FPREGS if TIF_HYBRID_FPREGS is set. So it's not too
awful & I don't see the kernel doing anything too crazy, but it
definitely isn't what the user asked for.

> Return unsuccessfully then from prctl(2) PR_SET_FP_MODE calls requesting 
> PR_FP_MODE_FRE to be set with PR_FP_MODE_FR clear.  This corresponds to 
> modes allowed by `mips_set_personality_fp'.

Looks good to me:

  Reviewed-by: Paul Burton <paul.burton@mips.com>

Thanks,
  Paul

> References:
> 
> [1] "MIPS Architecture For Programmers, Vol. III: MIPS32 / microMIPS32
>     Privileged Resource Architecture", Imagination Technologies,
>     Document Number: MD00090, Revision 6.02, July 10, 2015, Table 9.69 
>     "Config5 Register Field Descriptions", p. 262
> 
> [2] "MIPS Architecture For Programmers, Volume III: MIPS64 / microMIPS64 
>     Privileged Resource Architecture", Imagination Technologies, 
>     Document Number: MD00091, Revision 6.03, December 22, 2015, Table 
>     9.72 "Config5 Register Field Descriptions", p. 288
> 
> Cc: stable@vger.kernel.org # 4.0+
> Fixes: 9791554b45a2 ("MIPS,prctl: add PR_[GS]ET_FP_MODE prctl options for MIPS")
> Signed-off-by: Maciej W. Rozycki <macro@mips.com>
> ---
>  arch/mips/kernel/process.c |    4 ++++
>  1 file changed, 4 insertions(+)
> 
> linux-mips-set-process-fp-mode-fr-fre.diff
> Index: linux/arch/mips/kernel/process.c
> ===================================================================
> --- linux.orig/arch/mips/kernel/process.c	2018-05-12 22:52:11.000000000 +0100
> +++ linux/arch/mips/kernel/process.c	2018-05-12 23:07:15.147112000 +0100
> @@ -721,6 +721,10 @@ int mips_set_process_fp_mode(struct task
>  	if (value & ~known_bits)
>  		return -EOPNOTSUPP;
>  
> +	/* Setting FRE without FR is not supported.  */
> +	if ((value & (PR_FP_MODE_FR | PR_FP_MODE_FRE)) == PR_FP_MODE_FRE)
> +		return -EOPNOTSUPP;
> +
>  	/* Avoid inadvertently triggering emulation */
>  	if ((value & PR_FP_MODE_FR) && raw_cpu_has_fpu &&
>  	    !(raw_current_cpu_data.fpu_id & MIPS_FPIR_F64))
> 
