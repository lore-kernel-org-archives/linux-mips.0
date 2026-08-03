Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C50E3019AA;
	Mon,  3 Aug 2026 14:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785766371; cv=none; b=UfTlJQw09y35nXscVRKSpULUSeS8HvNeVrljpbw4iViTLEYSJ9nEOvBG7it/EDxfT9BxPrDH7BS3XV6Vkut8wzhuMhqNmla/YpnslcfTcR7qDP2Dz8AlJ4F2cqy5IG0p/DKDh25lP1UfuCjim5yfnCxJ8iZ9q1Rosm59dRa+JaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785766371; c=relaxed/simple;
	bh=WYad3NaiidPGY+tWiGsueAilWxVbwCxL2AHVs1ZnxcY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i/d48erpwkJNhrsfCbNjWUe/1avk5/pkLXtuBxqoWVcfjeICJzRcsJUiQj0vuSlKFe6Q7bWjqOB77IlpaqIdc/SHZGRbbul1bHIJvB4Ghhf+oPyx+23NkP2hRPYmmmK9LJzwKKrBvjAmgimyXho2a5P0fyH+DYTz4o43VZ10u8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1wqsTP-0002aC-00; Mon, 03 Aug 2026 15:12:55 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id A3BA3C0110; Mon,  3 Aug 2026 15:10:56 +0200 (CEST)
Date: Mon, 3 Aug 2026 15:10:56 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: Hauke Mehrtens <hauke@hauke-m.de>, kernel-janitors@vger.kernel.org,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: BCM47XX: drop unneeded semicolon
Message-ID: <anCTYCQoovqgSjLH@alpha.franken.de>
References: <20260801191002.1383835-16-Julia.Lawall@inria.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801191002.1383835-16-Julia.Lawall@inria.fr>

On Sat, Aug 01, 2026 at 09:10:02PM +0200, Julia Lawall wrote:
> When a function-like macro expands to an expression, that expression
> doesn't need a semicolon after it.  All uses have been verified to
> have their own semicolons.
> 
> This was found using the following Coccinelle semantic patch:
> 
> @r@
> identifier i : script:ocaml() { String.lowercase_ascii i = i };
> expression e;
> @@
> 
> *#define i(...) e;
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> 
> ---
>  arch/mips/bcm47xx/buttons.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/bcm47xx/buttons.c b/arch/mips/bcm47xx/buttons.c
> index 46994f9bb..e76ca34c8 100644
> --- a/arch/mips/bcm47xx/buttons.c
> +++ b/arch/mips/bcm47xx/buttons.c
> @@ -512,7 +512,7 @@ static int __init bcm47xx_buttons_copy(const struct gpio_keys_button *buttons,
>  }
>  
>  #define bcm47xx_copy_bdata(dev_buttons)					\
> -	bcm47xx_buttons_copy(dev_buttons, ARRAY_SIZE(dev_buttons));
> +	bcm47xx_buttons_copy(dev_buttons, ARRAY_SIZE(dev_buttons))

not applicable to mips-next, because commit 27c61f8565a4 ("MIPS: BCM47XX:
 Convert buttons to software nodes") removed it.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
