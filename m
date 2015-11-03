Received: from mailapp01.imgtec.com ([195.59.15.196]:63075 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010433AbbKCQmtYTq0A (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 3 Nov 2015 17:42:49 +0100
Subject: Re: [PATCH] MIPS: kernel: proc: Fix typo in proc.c
References: <20151103163943.GA49024@yggdrasil>
From: Markos Chandras <Markos.Chandras@imgtec.com>
Message-ID: <5638E3FE.2010503@imgtec.com>
Date: Tue, 3 Nov 2015 16:42:38 +0000
MIME-Version: 1.0
In-Reply-To: <20151103163943.GA49024@yggdrasil>
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
Message-ID: <20151103164238.VAbuZhGz1PYjzuWJ-fhYddEOKLt5sVepZVUkrWN981s@z>

On 11/03/2015 04:39 PM, Tony Wu wrote:
> Fix typo introduced in commit 515a6393 (MIPS: kernel: proc: Add
> MIPS R6 support to /proc/cpuinfo), mips1 should be tested against
> cpu_has_mips_1, not cpu_has_mips_r1.
> 
> Signed-off-by: Tony Wu <tung7970@gmail.com>
> Cc: Markos Chandras <markos.chandras@imgtec.com>
> 
> diff --git a/arch/mips/kernel/proc.c b/arch/mips/kernel/proc.c
> index 211fcd4..3417ce0 100644
> --- a/arch/mips/kernel/proc.c
> +++ b/arch/mips/kernel/proc.c
> @@ -83,7 +83,7 @@ static int show_cpuinfo(struct seq_file *m, void *v)
>  	}
>  
>  	seq_printf(m, "isa\t\t\t:"); 
> -	if (cpu_has_mips_r1)
> +	if (cpu_has_mips_1)
>  		seq_printf(m, " mips1");
>  	if (cpu_has_mips_2)
>  		seq_printf(m, "%s", " mips2");
> 
Good catch. Might worth adding CC:stable #v4.0+ as well

-- 
markos
