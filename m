Received: from mail-bl2on0098.outbound.protection.outlook.com ([65.55.169.98]:58656
        "EHLO na01-bl2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S27028799AbcEJX05DmzeB (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 11 May 2016 01:26:57 +0200
Subject: Re: [PATCH v2] MIPS: Octeon: detect and fix byte swapped initramfs
References: <1462920603-17512-1-git-send-email-aurelien@aurel32.net>
From: David Daney <ddaney@caviumnetworks.com>
Message-ID: <57326E36.6060708@caviumnetworks.com>
Date: Tue, 10 May 2016 16:26:46 -0700
MIME-Version: 1.0
In-Reply-To: <1462920603-17512-1-git-send-email-aurelien@aurel32.net>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <David.Daney@cavium.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Aurelien Jarno <aurelien@aurel32.net>, linux-mips@linux-mips.org
Cc: Ralf Baechle <ralf@linux-mips.org>, David Daney <david.daney@cavium.com>
Message-ID: <20160510232646.T6BfI6WylIu6V4-TQe5YkR6U4vhDo7q-v9FnCkEEiOE@z>

On 05/10/2016 03:50 PM, Aurelien Jarno wrote:
> Octeon machines support running in little endian mode. U-Boot usually
> runs in big endian-mode. Therefore the initramfs is loaded in big endian
> mode, and the kernel later tries to access it in little endian mode.
>
> This patch fixes that by detecting byte swapped initramfs using either the
> CPIO header or the header from standard compression methods, and
> byte swaps it if needed. It first checks that the header doesn't match
> in the native endianness to avoid false detections. It uses the kernel
> decompress library so that we don't have to maintain the list of magics
> if some decompression methods are added to the kernel.
>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: David Daney <david.daney@cavium.com>
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>

I haven't tested it, but this looks good to me:

Acked-by: David Daney <david.daney@cavium.com>

> ---
>   arch/mips/kernel/setup.c | 32 ++++++++++++++++++++++++++++++++
>   1 file changed, 32 insertions(+)
>
> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
> index 4f60734..8841d7982 100644
> --- a/arch/mips/kernel/setup.c
> +++ b/arch/mips/kernel/setup.c
> @@ -26,6 +26,7 @@
>   #include <linux/sizes.h>
>   #include <linux/device.h>
>   #include <linux/dma-contiguous.h>
> +#include <linux/decompress/generic.h>
>
>   #include <asm/addrspace.h>
>   #include <asm/bootinfo.h>
> @@ -250,6 +251,35 @@ disable:
>   	return 0;
>   }
>
> +/* In some conditions (e.g. big endian bootloader with a little endian
> +   kernel), the initrd might appear byte swapped.  Try to detect this and
> +   byte swap it if needed.  */
> +static void __init maybe_bswap_initrd(void)
> +{
> +#if defined(CONFIG_CPU_CAVIUM_OCTEON)
> +	u64 buf;
> +
> +	/* Check for CPIO signature */
> +	if (!memcmp((void *)initrd_start, "070701", 6))
> +		return;
> +
> +	/* Check for compressed initrd */
> +	if (decompress_method((unsigned char *)initrd_start, 8, NULL))
> +		return;
> +
> +	/* Try again with a byte swapped header */
> +	buf = swab64p((u64 *)initrd_start);
> +	if (!memcmp(&buf, "070701", 6) ||
> +	    decompress_method((unsigned char *)(&buf), 8, NULL)) {
> +		unsigned long i;
> +
> +		pr_info("Byteswapped initrd detected\n");
> +		for (i = initrd_start; i < ALIGN(initrd_end, 8); i += 8)
> +			swab64s((u64 *)i);
> +	}
> +#endif
> +}
> +
>   static void __init finalize_initrd(void)
>   {
>   	unsigned long size = initrd_end - initrd_start;
> @@ -263,6 +293,8 @@ static void __init finalize_initrd(void)
>   		goto disable;
>   	}
>
> +	maybe_bswap_initrd();
> +
>   	reserve_bootmem(__pa(initrd_start), size, BOOTMEM_DEFAULT);
>   	initrd_below_start_ok = 1;
>
>
