Received: from mailapp01.imgtec.com ([195.59.15.196]:17592 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6861332AbaFXM41Bx1dO (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 24 Jun 2014 14:56:27 +0200
Message-ID: <53A9755F.9000403@imgtec.com>
Date: Tue, 24 Jun 2014 13:55:59 +0100
From: James Hogan <james.hogan@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH v3] arch/mips/rb532: replace mac_addr parsing
References: <20140624111426.GA15160@google.com>
In-Reply-To: <20140624111426.GA15160@google.com>
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
To: Daniel Walter <dwalter@google.com>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20140624125559.I0pC84zHfmRW9ZvCVTwJBbJquFMAwav2l0hPNpy0SHE@z>

On 24/06/14 12:14, Daniel Walter wrote:
> Replace parse_mac_addr with mac_pton().
> 
> 
> Signed-off-by: Daniel Walter <dwalter@google.com>

Reviewed-by: James Hogan <james.hogan@imgtec.com>

Cheers
James

> ---
> Changes since v2
>   Use mac_pton() instead of sscanf()
>   added error handling in case could not be parsed
> ---
> Patch applies against current linux-git
> ---
>  arch/mips/rb532/devices.c | 27 ++++-----------------------
>  1 file changed, 4 insertions(+), 23 deletions(-)
> ---
> diff --git a/arch/mips/rb532/devices.c b/arch/mips/rb532/devices.c
> index 3af00b2..03a4cdc 100644
> --- a/arch/mips/rb532/devices.c
> +++ b/arch/mips/rb532/devices.c
> @@ -250,28 +250,6 @@ static struct platform_device *rb532_devs[] = {
>  	&rb532_wdt
>  };
>  
> -static void __init parse_mac_addr(char *macstr)
> -{
> -	int i, h, l;
> -
> -	for (i = 0; i < 6; i++) {
> -		if (i != 5 && *(macstr + 2) != ':')
> -			return;
> -
> -		h = hex_to_bin(*macstr++);
> -		if (h == -1)
> -			return;
> -
> -		l = hex_to_bin(*macstr++);
> -		if (l == -1)
> -			return;
> -
> -		macstr++;
> -		korina_dev0_data.mac[i] = (h << 4) + l;
> -	}
> -}
> -
> -
>  /* NAND definitions */
>  #define NAND_CHIP_DELAY 25
>  
> @@ -333,7 +311,10 @@ static int __init plat_setup_devices(void)
>  static int __init setup_kmac(char *s)
>  {
>  	printk(KERN_INFO "korina mac = %s\n", s);
> -	parse_mac_addr(s);
> +	if (!mac_pton(s, korina_dev0_data.mac)) {
> +		printk(KERN_ERR "Invalid mac\n");
> +		return -EINVAL;
> +	}
>  	return 0;
>  }
>  
> 
