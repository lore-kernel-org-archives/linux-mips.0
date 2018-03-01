Received: from smtp.codeaurora.org ([198.145.29.96]:53978 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992404AbeCAKqLpMYLD (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 1 Mar 2018 11:46:11 +0100
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v2] bcma: Prevent build of PCI host features in module
References: <1519898292-12155-1-git-send-email-matt.redfearn@mips.com>
Date: Thu, 01 Mar 2018 12:45:57 +0200
In-Reply-To: <1519898292-12155-1-git-send-email-matt.redfearn@mips.com> (Matt
        Redfearn's message of "Thu, 1 Mar 2018 09:58:12 +0000")
Message-ID: <87lgfcnkey.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <kvalo@codeaurora.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Matt Redfearn <matt.redfearn@mips.com>
Cc: zajec5@gmail.com, linux-wireless@vger.kernel.org, linux-mips@linux-mips.org, jhogan@kernel.org
Message-ID: <20180301104557.32Xe-Ea8r84SZC1sOboqZzFDmQK4TO5fzTqH3eHRjEo@z>

Matt Redfearn <matt.redfearn@mips.com> writes:

> Attempting to build bcma.ko with BCMA_DRIVER_PCI_HOSTMODE=y results in
> a build error due to use of symbols not exported from vmlinux:
>
> ERROR: "pcibios_enable_device" [drivers/bcma/bcma.ko] undefined!
> ERROR: "register_pci_controller" [drivers/bcma/bcma.ko] undefined!
> make[1]: *** [scripts/Makefile.modpost:92: __modpost] Error 1
>
> To prevent this, don't allow the host mode feature to be built if
> CONFIG_BCMA=m
>
> Signed-off-by: Matt Redfearn <matt.redfearn@mips.com>
>
> ---
>
> Changes in v2:
> Rebase on v4.16-rc1
>
>  drivers/bcma/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/bcma/Kconfig b/drivers/bcma/Kconfig
> index ba8acca036df..cb0f1aad20b7 100644
> --- a/drivers/bcma/Kconfig
> +++ b/drivers/bcma/Kconfig
> @@ -55,7 +55,7 @@ config BCMA_DRIVER_PCI
>  
>  config BCMA_DRIVER_PCI_HOSTMODE
>  	bool "Driver for PCI core working in hostmode"
> -	depends on MIPS && BCMA_DRIVER_PCI && PCI_DRIVERS_LEGACY
> +	depends on MIPS && BCMA_DRIVER_PCI && PCI_DRIVERS_LEGACY && BCMA = y

Due to the recent regression in bcma I would prefer extra careful review
before I apply this. So does this look ok to everyone?

-- 
Kalle Valo
