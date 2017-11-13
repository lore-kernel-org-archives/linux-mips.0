Received: from 19pmail.ess.barracuda.com ([64.235.154.231]:54363 "EHLO
        19pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990427AbdKMSSlFSiSR (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 13 Nov 2017 19:18:41 +0100
Date: Mon, 13 Nov 2017 18:18:29 +0000
From: James Hogan <james.hogan@mips.com>
Subject: Re: [PATCH 1/1] BMIPS: Enable HARDIRQS_SW_RESEND
Message-ID: <20171113181829.GB31917@jhogan-linux.mipstec.com>
References: <20170524175516.13849-1-justinpopo6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20170524175516.13849-1-justinpopo6@gmail.com>
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
To: justinpopo6@gmail.com
Cc: linux-mips@linux-mips.org, bcm-kernel-feedback-list@broadcom.com, f.fainelli@gmail.com, Justin Chen <justin.chen@broadcom.com>
Message-ID: <20171113181829.YWHTyjMdSxTz7luKNow3v6ucmqL2rt5Q_swUBiF5S5o@z>

On Wed, May 24, 2017 at 10:55:16AM -0700, justinpopo6@gmail.com wrote:
> From: Justin Chen <justin.chen@broadcom.com>
> 
> HW interrupts triggered when irq_disable() were being ignored. Enable
> resending HW interrupts as SW interrupts.
> 
> This was causing an issue where the interrupts waking the system up from
> a suspend state were not calling their interrupt handlers.
> 
> Signed-off-by: Justin Chen <justinpopo6@gmail.com>

Applied, thanks

Cheers
James

> ---
>  arch/mips/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 2828ecde133d..349f9bdb655b 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -230,6 +230,7 @@ config BMIPS_GENERIC
>  	select USB_EHCI_BIG_ENDIAN_MMIO if CPU_BIG_ENDIAN
>  	select USB_OHCI_BIG_ENDIAN_DESC if CPU_BIG_ENDIAN
>  	select USB_OHCI_BIG_ENDIAN_MMIO if CPU_BIG_ENDIAN
> +	select HARDIRQS_SW_RESEND
>  	help
>  	  Build a generic DT-based kernel image that boots on select
>  	  BCM33xx cable modem chips, BCM63xx DSL chips, and BCM7xxx set-top
> -- 
> 2.12.2
> 
> 
