Received: from localhost.localdomain ([127.0.0.1]:50931 "EHLO
        localhost.localdomain" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6816015AbaCVWVFDKnWt (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 22 Mar 2014 23:21:05 +0100
Date: Sat, 22 Mar 2014 22:21:04 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@linux-mips.org>
Subject: Re: [PATCH] MIPS: Add 1074K CPU support explicitly.
In-Reply-To: <1389992630-64139-1-git-send-email-Steven.Hill@imgtec.com>
Message-ID: <alpine.LFD.2.10.1403222210230.21669@eddie.linux-mips.org>
References: <1389992630-64139-1-git-send-email-Steven.Hill@imgtec.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-Path: <macro@linux-mips.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: "Steven J. Hill" <Steven.Hill@imgtec.com>
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>

On Fri, 17 Jan 2014, Steven J. Hill wrote:

> From: "Steven J. Hill" <Steven.Hill@imgtec.com>
> 
> The 1074K is a multiprocessing coherent processing system (CPS) based
> on modified 74K cores. This patch makes the 1074K an actual unique
> CPU type, instead of a 74K derivative, which it is not.
> 
> Signed-off-by: Steven J. Hill <Steven.Hill@imgtec.com>
> Reviewed-by: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
> ---
[...]
> diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
> index 13b549a..7184363 100644
> --- a/arch/mips/mm/c-r4k.c
> +++ b/arch/mips/mm/c-r4k.c
> @@ -1106,9 +1106,10 @@ static void probe_pcache(void)
>  	case CPU_34K:
>  	case CPU_74K:
>  	case CPU_1004K:
> +	case CPU_1074K:
>  	case CPU_INTERAPTIV:
>  	case CPU_PROAPTIV:
> -		if (current_cpu_type() == CPU_74K)
> +		if ((c->cputype == CPU_74K) || (c->cputype == CPU_1074K))
>  			alias_74k_erratum(c);
>  		if ((read_c0_config7() & (1 << 16))) {
>  			/* effectively physically indexed dcache,

 Hmm, wouldn't it make sense to avoid the repeated condition check and 
make it:

	case CPU_74K:
	case CPU_1074K:
		alias_74k_erratum(c);
		/* Fall through. */
	case CPU_M14KC:
	case CPU_M14KEC:
	case CPU_24K:
	case CPU_34K:
 	case CPU_INTERAPTIV:
 	case CPU_PROAPTIV:
 		if ((read_c0_config7() & (1 << 16))) {
 			/* effectively physically indexed dcache,
	
or suchlike instead?  Also why `c->cputype == CPU_74K' rather than 
`current_cpu_type() == CPU_74K'?

  Maciej
