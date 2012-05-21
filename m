Received: from e28smtp07.in.ibm.com ([122.248.162.7]:58040 "EHLO
        e28smtp07.in.ibm.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S1903565Ab2EUKtO (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 21 May 2012 12:49:14 +0200
Received: from /spool/local
        by e28smtp07.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-mips@linux-mips.org> from <srivatsa.bhat@linux.vnet.ibm.com>;
        Mon, 21 May 2012 16:18:26 +0530
Message-ID: <4FBA1B54.3@linux.vnet.ibm.com>
Date: Mon, 21 May 2012 16:09:16 +0530
From: "Srivatsa S. Bhat" <srivatsa.bhat@linux.vnet.ibm.com>
MIME-Version: 1.0
Subject: Re: [PATCH 6/8] MIPS: call set_cpu_online() on the uping cpu with
 irq disabled
References: <1337580008-7280-1-git-send-email-yong.zhang0@gmail.com> <1337580008-7280-7-git-send-email-yong.zhang0@gmail.com>
In-Reply-To: <1337580008-7280-7-git-send-email-yong.zhang0@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: Yong Zhang <yong.zhang0@gmail.com>
Cc: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, ralf@linux-mips.org, sshtylyov@mvista.com, david.daney@cavium.comsshtylyov@mvista.com, "Srivatsa S. Bhat" <srivatsa.bhat@linux.vnet.ibm.com>
Message-ID: <20120521103916.7S49wHYSoeN80b0UNYS2QM_mcTfRP9Xvmzg6i9oYU8U@z>

On 05/21/2012 11:30 AM, Yong Zhang wrote:

> From: Yong Zhang <yong.zhang@windriver.com>
> 
> To prevent a problem as commit 5fbd036b [sched: Cleanup cpu_active madness]
> and commit 2baab4e9 [sched: Fix select_fallback_rq() vs cpu_active/cpu_online]
> try to resolve, move set_cpu_online() to the brought up CPU and with irq
> disabled.
> 
> Signed-off-by: Yong Zhang <yong.zhang0@gmail.com>
> Acked-by: David Daney <david.daney@cavium.com>
> ---
>  arch/mips/kernel/smp.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
> index 73a268a..042145f 100644
> --- a/arch/mips/kernel/smp.c
> +++ b/arch/mips/kernel/smp.c
> @@ -122,6 +122,8 @@ asmlinkage __cpuinit void start_secondary(void)
> 
>  	notify_cpu_starting(cpu);
> 
> +	set_cpu_online(cpu, true);
> +


You will also need to use ipi_call_lock/unlock() around this.
See how x86 does it. (MIPS also selects USE_GENERIC_SMP_HELPERS).

Regards,
Srivatsa S. Bhat

>  	set_cpu_sibling_map(cpu);
> 
>  	cpu_set(cpu, cpu_callin_map);
> @@ -249,8 +251,6 @@ int __cpuinit __cpu_up(unsigned int cpu)
>  	while (!cpu_isset(cpu, cpu_callin_map))
>  		udelay(100);
> 
> -	set_cpu_online(cpu, true);
> -
>  	return 0;
>  }
> 
