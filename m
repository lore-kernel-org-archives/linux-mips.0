Received: from mail-db5eur01on0096.outbound.protection.outlook.com ([104.47.2.96]:37568
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23990946AbeGaIOepzQUa (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 31 Jul 2018 10:14:34 +0200
Subject: Re: [PATCH 4/6] mips: factor out RapidIO Kconfig entry
References: <20180730225035.28365-1-acolin@isi.edu>
 <20180730225035.28365-5-acolin@isi.edu>
From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
Message-ID: <7f7b9813-7e32-e42d-3f6b-f8e0af506d24@nokia.com>
Date: Tue, 31 Jul 2018 10:13:10 +0200
MIME-Version: 1.0
In-Reply-To: <20180730225035.28365-5-acolin@isi.edu>
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
To: Alexei Colin <acolin@isi.edu>, Alexandre Bounine <alex.bou9@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, John Paul Walters <jwalters@isi.edu>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20180731081310.Gx4YcNxdCcwpI1bt5vrQMy9Hzu_KO4SHZ-hRKTxCsvU@z>

Hi!

On 31/07/18 00:50, Alexei Colin wrote:
> The menu entry is now defined in the rapidio subtree.
> 
> Platforms with a PCI bus will be offered the RapidIO menu since they may
> be want support for a RapidIO PCI device. Platforms without a PCI bus
> that might include a RapidIO IP block will need to "select HAS_RAPIDIO"
> in the platform-/machine-specific "config ARCH_*" Kconfig entry.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> Cc: John Paul Walters <jwalters@isi.edu>
> Cc: linux-mips@linux-mips.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Alexei Colin <acolin@isi.edu>

With patch [1/6] together this looks fine to me.
Reviewed-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>

> ---
>  arch/mips/Kconfig | 11 -----------
>  1 file changed, 11 deletions(-)
> 
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 10256056647c..92b9262ee731 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -3106,17 +3106,6 @@ config ZONE_DMA32
>  
>  source "drivers/pcmcia/Kconfig"
>  
> -config HAS_RAPIDIO
> -	bool
> -	default n
> -
> -config RAPIDIO
> -	tristate "RapidIO support"
> -	depends on HAS_RAPIDIO || PCI
> -	help
> -	  If you say Y here, the kernel will include drivers and
> -	  infrastructure code to support RapidIO interconnect devices.
> -
>  source "drivers/rapidio/Kconfig"
>  
>  endmenu

-- 
Best regards,
Alexander Sverdlin.
