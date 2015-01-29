Received: from mailapp01.imgtec.com ([195.59.15.196]:4961 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011579AbbA2XNtTeq5W (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 30 Jan 2015 00:13:49 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id E20076B51BEBB
        for <linux-mips@linux-mips.org>; Thu, 29 Jan 2015 23:13:39 +0000 (GMT)
Date: Thu, 29 Jan 2015 23:13:40 +0000
From: Paul Burton <paul.burton@imgtec.com>
Subject: Re: [PATCH RFC v2 67/70] MIPS: kernel: process: Do not allow FR=0 on
 MIPS R6
Message-ID: <20150129231340.GI6116@NP-P-BURTON>
References: <1421405389-15512-1-git-send-email-markos.chandras@imgtec.com>
 <1421405389-15512-68-git-send-email-markos.chandras@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <1421405389-15512-68-git-send-email-markos.chandras@imgtec.com>
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
To: Markos Chandras <markos.chandras@imgtec.com>
Cc: linux-mips@linux-mips.org, Matthew Fortune <matthew.fortune@imgtec.com>
Message-ID: <20150129231340.XUcwr7wHm33lydRGsplxhRW9F_qVIEOJIYokfvrxcF0@z>

On Fri, Jan 16, 2015 at 10:49:46AM +0000, Markos Chandras wrote:
> A prctl() call to set FR=0 for MIPS R6 should not be allowed
> since FR=1 is the only option for R6 cores.
> 
> Cc: Paul Burton <paul.burton@imgtec.com>
> Cc: Matthew Fortune <matthew.fortune@imgtec.com>
> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
> ---
>  arch/mips/include/asm/fpu.h | 3 ++-
>  arch/mips/kernel/process.c  | 4 ++++
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/mips/include/asm/fpu.h b/arch/mips/include/asm/fpu.h
> index 994d21939676..b96d9d327626 100644
> --- a/arch/mips/include/asm/fpu.h
> +++ b/arch/mips/include/asm/fpu.h
> @@ -68,7 +68,8 @@ static inline int __enable_fpu(enum fpu_mode mode)
>  		goto fr_common;
>  
>  	case FPU_64BIT:
> -#if !(defined(CONFIG_CPU_MIPS32_R2) || defined(CONFIG_64BIT))
> +#if !(defined(CONFIG_CPU_MIPS32_R2) || defined(CONFIG_CPU_MIPS32_R6) \
> +      || defined(CONFIG_64BIT))

Hi Markos,

This change really seems like a separate one, since it has nothing to do
with the prctl or disallowing FR=1, but rather with allowing FR=1 on r6.

Thanks,
    Paul

>  		/* we only have a 32-bit FPU */
>  		return SIGFPE;
>  #endif
> diff --git a/arch/mips/kernel/process.c b/arch/mips/kernel/process.c
> index b732c0ce2e56..41ebd5d0ac30 100644
> --- a/arch/mips/kernel/process.c
> +++ b/arch/mips/kernel/process.c
> @@ -581,6 +581,10 @@ int mips_set_process_fp_mode(struct task_struct *task, unsigned int value)
>  	if ((value & PR_FP_MODE_FRE) && !cpu_has_fre)
>  		return -EOPNOTSUPP;
>  
> +	/* FR = 0 not supported in MIPS R6 */
> +	if (!(value & PR_FP_MODE_FR) && cpu_has_fpu && cpu_has_mips_r6)
> +		return -EOPNOTSUPP;
> +
>  	/* Save FP & vector context, then disable FPU & MSA */
>  	if (task->signal == current->signal)
>  		lose_fpu(1);
> -- 
> 2.2.1
> 
