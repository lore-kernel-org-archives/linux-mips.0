Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9308B33E35B;
	Mon, 15 Jun 2026 10:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781520244; cv=none; b=amppFmIUsP2l16YXZ9QkPhm4ztxiQxNaU08hyDh5MDEXfaNfQDaNq+castPoSMYiHWldVZ5U69ihfNXGGu93uXP2D0cCXy4Jff7tsPRlblbRWl+GmEmMtsfFUA1vFNXowchoBkGPapgD4QFpQhSZg57U6uzVFyXnn35i/koxUQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781520244; c=relaxed/simple;
	bh=sSTFhO2YnsKMCD/YvKWjIpD8RLkxXQ1D4msQjuxjj3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dw9c8n1WruZfKNhtD5f5HLWsFfNhZBqJRLSv5mTktD9n+UD8F/w1NPFes+t+M/7VN+a68/b1C1YHf/noK/IDi2wrmPuOrp7IpFqUjVeC29tlKUdaAjBXvL9hHWNADAGjr9NM8kfzd+bE/rmkadtPbbMQfGAF9/rixtD7q1kkkt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1wZ4ey-0000JX-00; Mon, 15 Jun 2026 12:35:16 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 53967C068C; Mon, 15 Jun 2026 12:28:29 +0200 (CEST)
Date: Mon, 15 Jun 2026 12:28:29 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-mips@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mips: dts: ar9132: fix wdt node name
Message-ID: <ai_TzYPvnOU7Pgt1@alpha.franken.de>
References: <20260608053202.12004-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608053202.12004-1-rosenp@gmail.com>

On Sun, Jun 07, 2026 at 10:32:02PM -0700, Rosen Penev wrote:
> Fixes the following warning:
> 
> $nodename:0: 'wdt@18060008' does not match
> '^(timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
> from schema $id: http://devicetree.org/schemas/watchdog/qca,ar7130-wdt.yaml#
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  arch/mips/boot/dts/qca/ar9132.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/boot/dts/qca/ar9132.dtsi b/arch/mips/boot/dts/qca/ar9132.dtsi
> index 4d3c48a9f9fd..77225ed459cb 100644
> --- a/arch/mips/boot/dts/qca/ar9132.dtsi
> +++ b/arch/mips/boot/dts/qca/ar9132.dtsi
> @@ -98,7 +98,7 @@ pll: pll-controller@18050000 {
>  				clock-output-names = "cpu", "ddr", "ahb";
>  			};
>  
> -			wdt: wdt@18060008 {
> +			wdt: watchdog@18060008 {
>  				compatible = "qca,ar7130-wdt";
>  				reg = <0x18060008 0x8>;
>  
> -- 
> 2.54.0

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
