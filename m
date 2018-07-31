Received: from mail-ve1eur01on0120.outbound.protection.outlook.com ([104.47.1.120]:48599
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23993104AbeGaPK2gZizh (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 31 Jul 2018 17:10:28 +0200
Subject: Re: [RESEND PATCH 1/6] rapidio: define top Kconfig menu in driver
 subtree
References: <20180731142954.30345-1-acolin@isi.edu>
 <20180731142954.30345-2-acolin@isi.edu>
From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
Message-ID: <053432eb-1f24-a763-0bfe-e67373e7ea82@nokia.com>
Date: Tue, 31 Jul 2018 17:09:10 +0200
MIME-Version: 1.0
In-Reply-To: <20180731142954.30345-2-acolin@isi.edu>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Return-Path: <alexander.sverdlin@nokia.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Alexei Colin <acolin@isi.edu>, Alexandre Bounine <alex.bou9@gmail.com>, Matt Porter <mporter@kernel.crashing.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, John Paul Walters <jwalters@isi.edu>, Catalin Marinas <catalin.marinas@arm.com>, Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Will Deacon <will.deacon@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>, Peter Anvin <hpa@zytor.com>, x86@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-mips@linux-mips.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-ID: <20180731150910.HOSvppPFSgmbRpvBt1uhqYyXizLTI4ZDh7kxJGbqE34@z>

Hi!

On 31/07/18 16:29, Alexei Colin wrote:
> The top-level Kconfig entry for RapidIO subsystem is currently
> duplicated in several architecture-specific Kconfigs. This
> commit re-defines it in the driver subtree, and subsequent
> commits, one per architecture, will remove the duplicated
> definitions from respective per-architecture Kconfigs.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: John Paul Walters <jwalters@isi.edu>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Will Deacon <will.deacon@arm.com>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Paul Burton <paul.burton@mips.com>
> Cc: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Peter Anvin <hpa@zytor.com>
> Cc: x86@kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-mips@linux-mips.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Alexei Colin <acolin@isi.edu>

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>

> ---
>  drivers/rapidio/Kconfig | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/rapidio/Kconfig b/drivers/rapidio/Kconfig
> index d6d2f20c4597..98e301847584 100644
> --- a/drivers/rapidio/Kconfig
> +++ b/drivers/rapidio/Kconfig
> @@ -1,6 +1,21 @@
>  #
>  # RapidIO configuration
>  #
> +
> +config HAS_RAPIDIO
> +	bool
> +	default n
> +
> +config RAPIDIO
> +	tristate "RapidIO support"
> +	depends on HAS_RAPIDIO || PCI
> +	help
> +	  This feature enables support for RapidIO high-performance
> +	  packet-switched interconnect.
> +
> +	  If you say Y here, the kernel will include drivers and
> +	  infrastructure code to support RapidIO interconnect devices.
> +
>  source "drivers/rapidio/devices/Kconfig"
>  
>  config RAPIDIO_DISC_TIMEOUT

-- 
Best regards,
Alexander Sverdlin.
