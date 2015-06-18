Received: from mailapp01.imgtec.com ([195.59.15.196]:2035 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27006547AbbFRPiUSobBQ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 18 Jun 2015 17:38:20 +0200
Subject: Re: [PATCH] MIPS: CPS: Guard mips_mt_set_cpuoptions call
References: <20150618232909-tung7970@googlemail.com>
From: Markos Chandras <Markos.Chandras@imgtec.com>
Message-ID: <5582E5E5.6080005@imgtec.com>
Date: Thu, 18 Jun 2015 16:38:13 +0100
MIME-Version: 1.0
In-Reply-To: <20150618232909-tung7970@googlemail.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-Path: <Markos.Chandras@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Tony Wu <tung7970@gmail.com>, linux-mips@linux-mips.org, ralf@linux-mips.org
Cc: Paul Burton <paul.burton@imgtec.com>
Message-ID: <20150618153813.qKzr7oWpD76CEZYKn_jdfwNy-0-1k8IDQo0AtImnUjE@z>

On 06/18/2015 04:30 PM, Tony Wu wrote:
> Guard mips_mt_set_cpuoptions with MT specific options to
> avoid undefined reference error on multicore platform
> without multithreading support.
> 
> Signed-off-by: Tony Wu <tung7970@gmail.com>
> Cc: Paul Burton <paul.burton@imgtec.com>
> Cc: linux-mips@linux-mips.org
> ---
>  arch/mips/kernel/smp-cps.c |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
> index 5570bc8..85633d6 100644
> --- a/arch/mips/kernel/smp-cps.c
> +++ b/arch/mips/kernel/smp-cps.c
> @@ -102,7 +102,8 @@ static void __init cps_prepare_cpus(unsigned int max_cpus)
>  	bool cca_unsuitable;
>  	u32 *entry_code;
>  
> -	mips_mt_set_cpuoptions();
> +	if (config_enabled(CONFIG_MIPS_MT_SMP) && cpu_has_mipsmt)
> +		mips_mt_set_cpuoptions();
>  
>  	/* Detect whether the CCA is unsuited to multi-core SMP */
>  	cca = read_c0_config() & CONF_CM_CMASK;
> 

How come you hit a build problem here? according to
arch/mips/include/asm/mips_mt.h the mips_mt_set_cpuoptions() is a NOP
when CONFIG_MIPS_MT is not selected so it should work for non-MT
multicore CPUs. Am I missing something?

-- 
markos
