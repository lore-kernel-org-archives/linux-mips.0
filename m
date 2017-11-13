Received: from 19pmail.ess.barracuda.com ([64.235.150.244]:33573 "EHLO
        19pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990427AbdKMSWRKxXXR (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 13 Nov 2017 19:22:17 +0100
Date: Mon, 13 Nov 2017 18:21:34 +0000
From: James Hogan <james.hogan@mips.com>
Subject: Re: [PATCH] MIPS: Add iomem resource for kernel bss section.
Message-ID: <20171113182134.GD31917@jhogan-linux.mipstec.com>
References: <20171012195034.5758-1-david.daney@cavium.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20171012195034.5758-1-david.daney@cavium.com>
Return-Path: <James.Hogan@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: David Daney <david.daney@cavium.com>
Cc: linux-mips@linux-mips.org, ralf@linux-mips.org, linux-kernel@vger.kernel.org, "Steven J. Hill" <steven.hill@cavium.com>
Message-ID: <20171113182134.X9nl2slGl_eTPGrBjljlayBdywkZu8nHiu_uDtYvl0s@z>

On Thu, Oct 12, 2017 at 12:50:34PM -0700, David Daney wrote:
> The kexec/kdump tools need to know where the .bss is so it can be
> included in the core dump.  This allows vmcore-dmesg to have access to
> the dmesg buffers of the crashed kernel as well as allowing the
> debugger to examine variables in the bss section.
> 
> Add a request for the bss resource in addition to the already
> requested code and data sections.
> 
> Signed-off-by: David Daney <david.daney@cavium.com>

Thanks, applied.

Cheers
James

> ---
>  arch/mips/kernel/setup.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
> index fe39397..702c678 100644
> --- a/arch/mips/kernel/setup.c
> +++ b/arch/mips/kernel/setup.c
> @@ -80,6 +80,7 @@ EXPORT_SYMBOL(mips_io_port_base);
>  
>  static struct resource code_resource = { .name = "Kernel code", };
>  static struct resource data_resource = { .name = "Kernel data", };
> +static struct resource bss_resource = { .name = "Kernel bss", };
>  
>  static void *detect_magic __initdata = detect_memory_region;
>  
> @@ -927,6 +928,8 @@ static void __init resource_init(void)
>  	code_resource.end = __pa_symbol(&_etext) - 1;
>  	data_resource.start = __pa_symbol(&_etext);
>  	data_resource.end = __pa_symbol(&_edata) - 1;
> +	bss_resource.start = __pa_symbol(&__bss_start);
> +	bss_resource.end = __pa_symbol(&__bss_stop) - 1;
>  
>  	for (i = 0; i < boot_mem_map.nr_map; i++) {
>  		struct resource *res;
> @@ -966,6 +969,7 @@ static void __init resource_init(void)
>  		 */
>  		request_resource(res, &code_resource);
>  		request_resource(res, &data_resource);
> +		request_resource(res, &bss_resource);
>  		request_crashkernel(res);
>  	}
>  }
> -- 
> 2.9.5
> 
