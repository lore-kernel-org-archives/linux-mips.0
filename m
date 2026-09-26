Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3465D3E5578;
	Sat, 26 Sep 2026 10:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790418523; cv=none; b=WcVz89YFXV9rWsXOE8VthvO621N1MOum+ZzZmcprzZDEpx0q7FJMxzgLJKCDX/Tb8KyZHHIHk5KJzANtWRd8gHot5UgxuazEyftX1rYiQaEcEKi8yJObnIGLE3BJJMxFh5uBT8jE134ybAVPvo97wR4ilWilUM7VtZPlGTl4538=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790418523; c=relaxed/simple;
	bh=wyegZmQAupT04LbKSQlX2Eue2jfzPQBJugFkMtxdIfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lw/HfRB9HPKrT2M0yoyCP4tfCOguot4Xwf5EcQkSjaRa0SxMioYpk/G/UDVJXcMfhaDstN81il/L2sJYyTT19vVFzrvptgTD4/V4uo1PnVjV0kOG0Xh//jAJhYH0psYmetoMWHwJfHh7UgaKAg0OZtWxKIB5X26KszoTt1TJO/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xAP4O-0007Kg-00; Sat, 26 Sep 2026 11:51:48 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id D32EFC02BE; Sat, 26 Sep 2026 11:28:59 +0200 (CEST)
Date: Sat, 26 Sep 2026 11:28:59 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Udaya Kiran Challa <challauday369@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	skhan@linuxfoundation.org, me@brighamcampbell.com,
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] mips: dts: pic32: pic32mzda: Remove unused
 address-cells, size-cells property
Message-ID: <areQW4ZAc-rCbEm5@alpha.franken.de>
References: <20260731174751.86819-1-challauday369@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731174751.86819-1-challauday369@gmail.com>

On Fri, Jul 31, 2026 at 11:17:51PM +0530, Udaya Kiran Challa wrote:
> The #address-cells and #size-cells properties are not strictly
> needed since the child nodes don't have reg properties
> 
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
> ---
>  arch/mips/boot/dts/pic32/pic32mzda.dtsi | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/mips/boot/dts/pic32/pic32mzda.dtsi b/arch/mips/boot/dts/pic32/pic32mzda.dtsi
> index feca35ba56a4..433dff3cf14f 100644
> --- a/arch/mips/boot/dts/pic32/pic32mzda.dtsi
> +++ b/arch/mips/boot/dts/pic32/pic32mzda.dtsi
> @@ -76,8 +76,6 @@ evic: interrupt-controller@1f810000 {
>  	};
>  
>  	pic32_pinctrl: pinctrl@1f801400 {
> -		#address-cells = <1>;
> -		#size-cells = <1>;
>  		compatible = "microchip,pic32mzda-pinctrl";
>  		reg = <0x1f801400 0x400>;
>  		clocks = <&rootclk PB1CLK>;
> -- 
> 2.34.1

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
