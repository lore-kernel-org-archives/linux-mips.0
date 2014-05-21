Received: from mailapp01.imgtec.com ([195.59.15.196]:51561 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6837162AbaEUNsMiUnQt (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 21 May 2014 15:48:12 +0200
Message-ID: <537CADD1.5020006@imgtec.com>
Date: Wed, 21 May 2014 14:44:49 +0100
From: James Hogan <james.hogan@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH 15/15] MIPS: paravirt: Provide _machine_halt function
 to exit VM on shutdown of guest
References: <1400597236-11352-1-git-send-email-andreas.herrmann@caviumnetworks.com> <1400597236-11352-16-git-send-email-andreas.herrmann@caviumnetworks.com>
In-Reply-To: <1400597236-11352-16-git-send-email-andreas.herrmann@caviumnetworks.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <James.Hogan@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>, linux-mips@linux-mips.org
Cc: David Daney <ddaney.cavm@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, kvm@vger.kernel.org
Message-ID: <20140521134449.mmYCF-FAzOgjTRYqy-4mDUc9zkC8Ovn8OiWQOxBxdjE@z>

On 20/05/14 15:47, Andreas Herrmann wrote:
> Signed-off-by: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>

Does it make sense to provide a _machine_restart too?

I think this should be squashed into patch 10 really, or else patch 10
split up into several parts (irq, smp, serial, other).

Cheers
James

> ---
>  arch/mips/paravirt/setup.c |    7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/mips/paravirt/setup.c b/arch/mips/paravirt/setup.c
> index f80c3bc..6d2781c 100644
> --- a/arch/mips/paravirt/setup.c
> +++ b/arch/mips/paravirt/setup.c
> @@ -8,6 +8,7 @@
>  
>  #include <linux/kernel.h>
>  
> +#include <asm/reboot.h>
>  #include <asm/bootinfo.h>
>  #include <asm/mipsregs.h>
>  #include <asm/smp-ops.h>
> @@ -27,6 +28,11 @@ void __init plat_time_init(void)
>  	preset_lpj = mips_hpt_frequency / (2 * HZ);
>  }
>  
> +static void pv_machine_halt(void)
> +{
> +	hypcall0(1 /* Exit VM */);
> +}
> +
>  /*
>   * Early entry point for arch setup
>   */
> @@ -47,6 +53,7 @@ void __init prom_init(void)
>  		if (i < argc - 1)
>  			strlcat(arcs_cmdline, " ", COMMAND_LINE_SIZE);
>  	}
> +	_machine_halt = pv_machine_halt;
>  	register_smp_ops(&paravirt_smp_ops);
>  }
>  
> 
