Received: from mail-pa0-f47.google.com ([209.85.220.47]:35164 "EHLO
        mail-pa0-f47.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27011617AbcAZTQRAV2Wc (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 26 Jan 2016 20:16:17 +0100
Date: Tue, 26 Jan 2016 11:16:07 -0800
From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH linux-next v4 07/11] MIPS: bcm63xx: nvram: Remove unused
 bcm63xx_nvram_get_psi_size() function
Message-ID: <20160126191607.GA111152@google.com>
References: <566DF43B.5010400@simon.arlott.org.uk>
 <566DF625.3060801@simon.arlott.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <566DF625.3060801@simon.arlott.org.uk>
Return-Path: <computersforpeace@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Simon Arlott <simon@fire.lp0.eu>, Ralf Baechle <ralf@linux-mips.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Kevin Cernekee <cernekee@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Jonas Gorski <jogo@openwrt.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, MIPS Mailing List <linux-mips@linux-mips.org>, MTD Maling List <linux-mtd@lists.infradead.org>, sfr@canb.auug.org.au
Message-ID: <20160126191607.2j6CA_uZp2p5oRjT5hSygAOHgnVc9zu3D7j2BYdlBGc@z>

On Sun, Dec 13, 2015 at 10:50:13PM +0000, Simon Arlott wrote:
> Remove bcm63xx_nvram_get_psi_size() as it now has no users.
> 
> Signed-off-by: Simon Arlott <simon@fire.lp0.eu>
> ---
> v4: New patch.

Ralf,

Please revert this and send it to Linus (or else, I can send it myself).
This is causing build failures, because I didn't take the rest of
Simon's series yet.

drivers/mtd/bcm63xxpart.c: In function 'bcm63xx_parse_cfe_partitions':
drivers/mtd/bcm63xxpart.c:93:2: error: implicit declaration of function 'bcm63xx_nvram_get_psi_size' [-Werror=implicit-function-declaration]

I will reply to the series if/when I accept any patches from it. I would
appreciate it if you would do the same.

Also...did this ever make it to linux-next? I'd think somebody's build
bots would have complained about the build failure.

Regards,
Brian

>  arch/mips/bcm63xx/nvram.c                          | 11 -----------
>  arch/mips/include/asm/mach-bcm63xx/bcm63xx_nvram.h |  2 --
>  2 files changed, 13 deletions(-)
> 
> diff --git a/arch/mips/bcm63xx/nvram.c b/arch/mips/bcm63xx/nvram.c
> index 05757ae..5f2bc1e 100644
> --- a/arch/mips/bcm63xx/nvram.c
> +++ b/arch/mips/bcm63xx/nvram.c
> @@ -19,8 +19,6 @@
>  
>  #include <bcm63xx_nvram.h>
>  
> -#define BCM63XX_DEFAULT_PSI_SIZE	64
> -
>  static struct bcm963xx_nvram nvram;
>  static int mac_addr_used;
>  
> @@ -87,12 +85,3 @@ int bcm63xx_nvram_get_mac_address(u8 *mac)
>  	return 0;
>  }
>  EXPORT_SYMBOL(bcm63xx_nvram_get_mac_address);
> -
> -int bcm63xx_nvram_get_psi_size(void)
> -{
> -	if (nvram.psi_size > 0)
> -		return nvram.psi_size;
> -
> -	return BCM63XX_DEFAULT_PSI_SIZE;
> -}
> -EXPORT_SYMBOL(bcm63xx_nvram_get_psi_size);
> diff --git a/arch/mips/include/asm/mach-bcm63xx/bcm63xx_nvram.h b/arch/mips/include/asm/mach-bcm63xx/bcm63xx_nvram.h
> index 348df49..4e0b6bc 100644
> --- a/arch/mips/include/asm/mach-bcm63xx/bcm63xx_nvram.h
> +++ b/arch/mips/include/asm/mach-bcm63xx/bcm63xx_nvram.h
> @@ -30,6 +30,4 @@ u8 *bcm63xx_nvram_get_name(void);
>   */
>  int bcm63xx_nvram_get_mac_address(u8 *mac);
>  
> -int bcm63xx_nvram_get_psi_size(void);
> -
>  #endif /* BCM63XX_NVRAM_H */
> -- 
> 2.1.4
> 
> -- 
> Simon Arlott
