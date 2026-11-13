Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794583387;
	b=q5P5tWCgiUda5qCtWGsUaf8TzOaRVgKTGVhxb8g4460FdHqNgIfohsqOxIi4LSKMNcPn
	 rY69x131o7eqH3q8najbxaXDJI5R6DiEoVjxCZJ3NOlw1yv6fne3OWTVME4sUosk8OFaJ
	 /UBj3x6XmKBlLmMNJrlzscWfUlOOopju0eR6Yl9/nPtnkA2995vxzdFAQDuA7MoK7wRrw
	 8+K9W7uZwzIEuQE4o+ZiGQQfre1NwBJP/8P7yp8e2hiFt2Xp8L0KmvA7x+cluFAhQ4aWw
	 xy09W9J0l12ydrLf4IDhD3cICSxgtbhJPF5uwSF/guIolqr9hAer4vqFOCjDt4ckoMQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794583387;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=96d7rXyRoBWG/8fCv9Y/Bl4rLafDhcPE/agEQqITANg=;
	b=jLe43SKZbid965kDSxEBsimrLO19q5ZCISRPM+EPHHYGjJYsk1E5TP+IYFc7uafCWXh6
	 +JbJlINTw5UPfMLcOddMVEbp+b3T2xrnLuTLSM5Ur9jnJbtIDACN0SsG3PI9EhUdydrbO
	 AiYXw2+OCiHsIh/Mv/cDluuCzRcK3fkmK1mbDC/TFwhfeAMkHLTugAO43AhR7p3+OF7uM
	 vY+NXyWrDR3rPAwUX5iFykCMqi6ZdtO4GSK7H9J5Y+cHVRWiEeK5x4ws9TYwl04OGhxpr
	 HuGaNJjbqGMlh0LZP/N/F/wKYdEifslBIcodJLHSH1eBvg97mHUDs4HMLq1GBxOojyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=XjKpJXXj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9945F606A895;
	Fri, 13 Nov 2026 15:23:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9945F606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=XjKpJXXj
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 8934520215A;
	Fri, 13 Nov 2026 16:22:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794583374;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=96d7rXyRoBWG/8fCv9Y/Bl4rLafDhcPE/agEQqITANg=;
	b=XjKpJXXjyICTClmTDekFig7pk7sXE8Ln8nC5rPnkE/jXN/q8or26hgleNdx+7KmNHXBcoq
	ZtaPj+v9sGI1n6fSA8p0WqsNCoAjAZeguuN+5WmCKjMktODRKi4oGQGD4aeiMR9puQTWqM
	JYBrXNQHxU3am3lmP38F+vcP7Q6evson1xSbdm2gWZfj4R0Jp59Z58J278w5QCP2706kwx
	tpCrIPo7N+gQ9KIvZuP8+ijGqW13Q6xtbyCrubt9vdh7NpaTjLRbqQSEpGGnoCbM9x9raU
	wumR6oEp2GZ0DE1UE3gwhctm1uj5E+9iT1kT5hT0OIhSlG1SzR13g7dzkK/3Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794583374;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=96d7rXyRoBWG/8fCv9Y/Bl4rLafDhcPE/agEQqITANg=;
	b=JDWV+fP3hzmzv/V0oew3qal05UUmfLCXfHvPSTapnHfmokx/Uxg3RfFhFbCt6skyC2Td2m
	YHFXHST/RM0hRc0zazl2NvZuIcGeVmw3sRY0NNggqMwiVf+Vuq7YnTmBUVtZhOEZPqHxrG
	W68lUzGZbf9QzhX0/4sy5jGlLVjealMaVs6W3sfgg7pdIgGBGOnsMfIyIzLzDD/u5f+vdX
	2ei9YvTK37c+q/h1q2pcefzmWba8K74OqJhOH7ySbn5+6FGb1o2Ew89gDMV3AqiFQ7P6bb
	3Egsu2hiHmtW89u8mjQatDo/DFlC+4ixBNa+hiiexLbQMw6peQrNzXZaxLESpg==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794583374; a=rsa-sha256;
	cv=none;
	b=Y93HUGG9IIGXbhDVKXGZLgfbhIoON9AbJNL7AS7vMgwaVjpN36B9te8I6kxWebjqG0zoUn
	KwhNIILKG33jur6V8RXREN4K6MmRZeXvVnIBobPeWNvz4BSo/Cu6nCcKSphLozpAUYRKHL
	mnXCLYtDg+VpOvU0+4pHuCB3Aob3dFYMG3cs5hNb938TzXUpCBqxmj+Y52b36RrLy7ShtP
	D6PSWrQC/Yqh/vOtk3OCFIkORpa+bRYTm3RzxmGvK4c6FRTS1KCE/M0q+D40+V4P+u5zjM
	fzo8qK4U+5eAXLdbRMbXGbWYx7XAY+HK3oSaBEDwSPl4hw1p6CaHecRWDZDGfg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Message-ID: <7baedb8836f538707d008b03e259780bc4fc8bd9.camel@pengutronix.de>
Subject: Re: [PATCH] reset: Remove ARCH_HAS_RESET_CONTROLLER Kconfig symbol
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Andrew Davis <afd@ti.com>, Russell King <linux@armlinux.org.uk>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Mark
 Rutland	 <mark.rutland@arm.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>,  Paul Walmsley	 <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou	 <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Arnd Bergmann	 <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 13 Nov 2026 16:22:54 +0100
In-Reply-To: <20261112214223.765100-1-afd@ti.com>
References: <20261112214223.765100-1-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Do, 2026-11-12 at 15:42 -0600, Andrew Davis wrote:
> Many ARCH_HAS_* symbols change some behavior based on what an ARCH
> supports, but ARCH_HAS_RESET_CONTROLLER is used only to set a default
> for RESET_CONTROLLER. Those ARCH symbols that select this can skip the
> middleman and directly select RESET_CONTROLLER, and many already do.
>=20
> Replace all selection of this symbol with a direct selection of
> RESET_CONTROLLER when it is not already in the selection list. In the
> latter case when RESET_CONTROLLER is also already selected we can simply

"In the latter case" and "when RESET_CONTROLLER is also already
selected" are saying the same thing. I'd choose one and drop the other.

> remove the ARCH_HAS_RESET_CONTROLLER without changing existing behavior.
>=20
> Some ARCHs "select" this symbol when they actually "depend on" the
> RESET_CONTROLLER framework to build, in those cases the indirect select
> could lead to broken randconfig builds. In cases when it is not needed
> for building the ARCH code, these selections can be switched to the weake=
r
> "imply" to allow it deselected for minimal builds without reset support.

Can't it just be dropped completely for those? See for example mach-
gemini below.

> Additional checking will be needed to find such cases.
>=20
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  arch/arm/Kconfig               | 2 +-
>  arch/arm/Kconfig.platforms     | 1 -
>  arch/arm/mach-bcm/Kconfig      | 4 ++--
>  arch/arm/mach-berlin/Kconfig   | 2 +-
>  arch/arm/mach-ep93xx/Kconfig   | 2 +-
>  arch/arm/mach-gemini/Kconfig   | 2 +-
>  arch/arm/mach-imx/Kconfig      | 2 +-
>  arch/arm/mach-keystone/Kconfig | 2 +-
>  arch/arm/mach-mmp/Kconfig      | 6 +++---
>  arch/arm/mach-omap2/Kconfig    | 1 -
>  arch/arm/mach-rockchip/Kconfig | 2 +-
>  arch/arm/mach-socfpga/Kconfig  | 1 -
>  arch/arm/mach-sti/Kconfig      | 1 -
>  arch/arm/mach-stm32/Kconfig    | 1 -
>  arch/arm/mach-sunxi/Kconfig    | 1 -
>  arch/arm/mach-tegra/Kconfig    | 1 -
>  arch/arm/mach-zynq/Kconfig     | 2 +-
>  arch/arm64/Kconfig.platforms   | 9 +++------
>  arch/mips/Kconfig              | 6 ++----
>  arch/riscv/Kconfig.socs        | 2 +-
>  drivers/reset/Kconfig          | 4 ----
>  21 files changed, 19 insertions(+), 35 deletions(-)
>=20
[...]
> diff --git a/arch/arm/mach-gemini/Kconfig b/arch/arm/mach-gemini/Kconfig
> index f436a2009eca3..11e0e966c3bb6 100644
> --- a/arch/arm/mach-gemini/Kconfig
> +++ b/arch/arm/mach-gemini/Kconfig
> @@ -3,7 +3,7 @@ menuconfig ARCH_GEMINI
>  	bool "Cortina Systems Gemini"
>  	depends on ARCH_MULTI_V4
>  	depends on CPU_LITTLE_ENDIAN
> -	select ARCH_HAS_RESET_CONTROLLER
> +	select RESET_CONTROLLER

I don't think this is required. There is no reset controller
implementation in arch/arm/mach-gemini ...

>  	select ARM_AMBA
>  	select ARM_APPENDED_DTB # Old Redboot bootloaders deployed
>  	select COMMON_CLK_GEMINI

... and COMMON_CLK_GEMINI already selects RESET_CONTROLLER in
drivers/clk/Kconfig.


regards
Philipp
