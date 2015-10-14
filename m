Received: from mail-bn1bon0055.outbound.protection.outlook.com ([157.56.111.55]:33477
        "EHLO na01-bn1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S27010053AbbJNPSWHELbs (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 14 Oct 2015 17:18:22 +0200
Date: Wed, 14 Oct 2015 08:18:13 -0700
From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH 2/5] gpio/xilinx: enable for MIPS
Message-ID: <20151014151813.GL15287@xsjsorenbubuntu>
References: <1444827117-10939-1-git-send-email-Zubair.Kakakhel@imgtec.com>
 <1444827117-10939-3-git-send-email-Zubair.Kakakhel@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1444827117-10939-3-git-send-email-Zubair.Kakakhel@imgtec.com>
Return-Path: <soren.brinkmann@xilinx.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Cc: ralf@linux-mips.org, robh+dt@kernel.org, linus.walleij@linaro.org, linux-mips@linux-mips.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <20151014151813.MA_DgLRLH1YkaJxOLZPt5wJ-MZmdwJkyud27Mrpiyv8@z>

On Wed, 2015-10-14 at 01:51PM +0100, Zubair Lutfullah Kakakhel wrote:
> MIPSfpga uses the axi gpio controller. Enable the driver for MIPS.
> 
> Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> ---
>  drivers/gpio/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 8949b3f..58e9afd 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -508,7 +508,7 @@ config GPIO_XGENE_SB
>  
>  config GPIO_XILINX
>  	tristate "Xilinx GPIO support"
> -	depends on OF_GPIO && (PPC || MICROBLAZE || ARCH_ZYNQ || X86)
> +	depends on OF_GPIO && (PPC || MICROBLAZE || ARCH_ZYNQ || X86 || MIPS)

Hmm, in general, this driver is hopefully generic enough that it doesn't
have any real architecture dependencies. And I suspect, we want to
enable this driver for ARM64 for ZynqMP soon too. Should we probably
drop these arch dependencies completely? It seems to become quite a long list.

	Sören
