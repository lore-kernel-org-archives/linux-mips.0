Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793984429;
	b=EoZhBTwryhAwc4Bbspjo/OQXCQc/yjgGv2tdCxoc3Uhdx6JhVjqjc0g9hJVGaDJxov4M
	 1nsB6b3m0V4pG9GHZdGYRbwnaAQtRuD244jUxuC01Rqg+DOjuMH1M13KD1XWybdU40fJQ
	 gBkf5vo15cAvsis7/y/BaESSUyPgECosWiEH7CEAadqz4Vg8hTPFLoKJrMM8W/irYdqtU
	 eNft57q95tKyeoarvatywpnIY7SvL+yEnaiqdJyh2Q0IqmcTrXj7h52BHfqHyeZC6tbuN
	 FaB4D05eyu/BkzikxcD16mUlKqgTvXyfPRkINE8WnneHNtGjAlIeTrtpMnE/Ogg5r+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793984429;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=jFUBP+/4oDZDg3dkMLyOSSMyY5qeYxFYJPP06gApAfM=;
	b=rOCHH/DWhBfR5+8Q2ax2B7bo3sqPEUlKl2jkzC+HH4sQmhjC4xBG07dj643UmfduuYDk
	 Ke6zE92Ado+AWIo38WdXoPCjI2ActZuIfxrjAiBrL974LrYUWiuGWLx19O9ZnlxQ2n38j
	 UP1OMenGFGnwPOIcai/0eHsHgLWPNzT6dFyXbbiJGw8S2ZjPniBe1qSXQjw3Fe+16t6qV
	 NEDTjVGAygiwO8x93vcFd23qGJ2NOvz4xDvukmyMAk51vjbYu3G3MHFSSAXGdCOSBE9Je
	 Vc/6aC/BrBGX5gmiH4bVr+UBP2gXPI27f2HleuMBOOJOgJ7tAZGmezdo4ExpUBbXOVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MRPFEpLM;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1ED606A330
	for <linux-mips@vger.kernel.org>; Fri,  6 Nov 2026 17:00:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA1ED606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MRPFEpLM
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-492fcbfaa87so498677f8f.3
        for <linux-mips@vger.kernel.org>; Fri, 06 Nov 2026 09:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793984427; x=1794589227; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jFUBP+/4oDZDg3dkMLyOSSMyY5qeYxFYJPP06gApAfM=;
        b=MRPFEpLMHBiOhevWNNFBWNmChmSf9amwu9QOajBFX+0euSNnRYDCXlICEjk/SuLhs3
         NFK0ucD7IEzaiwwvD/bsceRIiiqnY2kquXNffVws1stKsQzqZ3CtCWQqiRg6VfazVwMH
         ZNe7sPwfjBakP8bL4YWXAoqj3lCYXv8+ZMeAXUkp9uLUyfCO8Akh8ZnLtaN0Ldj/lXkx
         AktNUSoS9425652OCNe6JlohitzRbL/4fjeLLtVREhFVQmMl4je7LqUdfd6QoMD/tkJt
         bHuQeK3c0DbcoU7MjsDywS6xGrfQzh2PVe/OlIWsbjmVaqUtOXi2v4/2NukMjJwKW6Ch
         EAJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793984427; x=1794589227;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jFUBP+/4oDZDg3dkMLyOSSMyY5qeYxFYJPP06gApAfM=;
        b=ss7JeBqjXgzBGUuIH1eWI+xunxQdLcgeKoQGspa2UXSunVUxPWg5rd49tZ8URbqTvz
         kepxVCLG9ohsg/F077NwN5sPIUoJDa2VC+cfdJgNfB5522t2OkHI1ImmPQ8sezbeEbiT
         mKcKPP6fW50hDki+XQoGZeNhZ5iu9nHr/D3jvI+yQ1MQp19bkjGx8sK9GLvhOZquR5nj
         vaf5kzEYXl05KEdL0wi08dM6LkdfMrzArha+54MUannc5QzYlWm2jBhbK0/gb+0fHvYI
         OL7L6M7oga/E/sIzAXtFLNyuEKc2zFT/mulyuSpz3OEkO5LW5CWRpcbMKWvhFnZe+8v9
         U8Gw==
X-Forwarded-Encrypted: i=1; AL+hErHkVe1ZHWxP9LYmpKBRSE8CCQOFGV/Af/ZR0ZdfXDZu+HqhkwBYAr/2xh5upiE1G0gViNXhxFHJrwyW@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ta9fPurqpnqgiJiKPG5MdPo0G0Zzp+3sK3BzeH5SwYFSgX+Jq
	bSwMwNTeGk9/iHKXazXRaurzHlfOvANDo3cjqSHQp/38KIue5VpwdjO/PVbZVaMyHCI=
X-Gm-Gg: AYBFou1INnE36fVgNhN6XaMRZQbvcSH1fyiSd0FnT6WGpHZHeUC8GCshz+WjIiME63x
	Xv3RkatY6zDql+NtfOE+V9zaAUsZ105s/+u1e9CjSk3Ni9R3Z5w98T3NIPFO+tE0T7Nws3Jl7CK
	TyAmm/kMZZV7jQHiZXAqPiXpttDIFKJazGVKIvEHZxBeW+jJNer9OnwE9XBcFOCZg3unPCGNvQq
	H0Zq8QPSJYoQmkvLgOwmz4qj5SbS7j6l/yDceI+jb1T1uN0XQ3Pva2uVvf8nCqL7hb8DDEQ+bHP
	EatEPIR7TvXAJLLnQ6duHpNX7Fhg/IXm1Fnb/RHzShQgY+G9dbeCrJVxkbkM+pdMNIbIKFLWl5V
	IU3URdRMMI9rIvw98AnUPUqa/Y3f4ED1kKT9lDj2/u3MMeabESTgs1Cgis+ap2pb5xLK01Xm6Dx
	lWXrcPT48PffjLPL6x/4iIHcF/kkI0NEssiRMhHtfnnEGZsfHkRlJ4FImhD204nS/b0z6Piq0Ds
	zUzf7MB9FhwzENuQk7rbp61+uP9BFxK+vNEziKsPm2gEsAAsxFEDAOUc8AXsEUVng/ahzZZoNLy
	Rkczu4KUtUDQ1J4LeoWnuShMb9uKO5vF5A==
X-Received: by 2002:a05:6000:41c2:b0:492:c53e:2ea8 with SMTP id ffacd0b85a97d-492c53e3120mr4511725f8f.49.1793984426953;
        Fri, 06 Nov 2026 09:00:26 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-492d8472969sm4866752f8f.58.2026.11.06.09.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:00:26 -0800 (PST)
Date: Fri, 6 Nov 2026 18:00:25 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Joseph Telaak <joseph@telaak.dev>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chuanhong Guo <gch981213@gmail.com>, Yao Zi <me@ziyao.cc>, 
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] clk: siflower: Add SF19A2890 peripheral clock and
 reset manager driver
Message-ID: <au4Hc7LAXH-ujDPj@monoceros>
References: <20261104-sf19a2890-sysm-v1-0-a4fac07df823@telaak.dev>
 <20261104-sf19a2890-sysm-v1-4-a4fac07df823@telaak.dev>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t4rhlzyxszxfhcxv"
Content-Disposition: inline
In-Reply-To: <20261104-sf19a2890-sysm-v1-4-a4fac07df823@telaak.dev>


--t4rhlzyxszxfhcxv
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 4/4] clk: siflower: Add SF19A2890 peripheral clock and
 reset manager driver
MIME-Version: 1.0

On Wed, Nov 04, 2026 at 02:21:01AM -0500, Joseph Telaak wrote:
> +#include <linux/mod_devicetable.h>
> +#include <linux/platform_device.h>

Please don't use <linux/mod_devicetable.h>. <linux/platform_device.h> is
good enough to provide of_device_id already. If you insist on full iwyu,
please use <linux/device-id/of.h> instead.

> +static const struct of_device_id sf19a2890_periphcrm_dt_ids[] = {
> +	{ .compatible = "siflower,sf19a2890-gmac-crm", .data = &sf19a2890_gmac_crm },
> +	{ .compatible = "siflower,sf19a2890-gpio-crm", .data = &sf19a2890_gpio_crm },
> +	{ .compatible = "siflower,sf19a2890-i2c-crm", .data = &sf19a2890_i2c0_crm },
> +	{ .compatible = "siflower,sf19a2890-pwm-crm", .data = &sf19a2890_pwm_crm },
> +	{ .compatible = "siflower,sf19a2890-rf-crm", .data = &sf19a2890_rf_crm },
> +	{ .compatible = "siflower,sf19a2890-spi-crm", .data = &sf19a2890_spi_crm },
> +	{ .compatible = "siflower,sf19a2890-timer-crm", .data = &sf19a2890_timer_crm },
> +	{ .compatible = "siflower,sf19a2890-uart-crm", .data = &sf19a2890_uart_crm },
> +	{ .compatible = "siflower,sf19a2890-usb-crm", .data = &sf19a2890_usb_crm },
> +	{ .compatible = "siflower,sf19a2890-wdt-crm", .data = &sf19a2890_wdt_crm },
> +	{ .compatible = "siflower,sf19a2890-wlan24-crm", .data = &sf19a2890_wlan24_crm },
> +	{ .compatible = "siflower,sf19a2890-wlan5-crm", .data = &sf19a2890_wlan5_crm },
> +	{ /* sentinel */ },

Please drop the trailing , after the list terminator.

> +};
> +
> +static struct platform_driver sf19a2890_periphcrm_driver = {
> +	.probe	= sf19a2890_periphcrm_probe,
> +	.driver = {
> +		.name		= "sf19a2890-periph-crm",
> +		.of_match_table	= sf19a2890_periphcrm_dt_ids,
> +	},
> +};
> +builtin_platform_driver(sf19a2890_periphcrm_driver);

--t4rhlzyxszxfhcxv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmruB6YACgkQj4D7WH0S
/k7+kQf7Bfwba+pB8VQAImJsoI9nkvjYio2wmtjnDf+tDu84xWgQjB1NbQpNvz5V
3y7UDyK2deoH4CY8KBCBTRT7cDaxITXkF1a0HhwFJjQzDdqTdHEY4A8Y2+kwtaFE
XtG+i/38jjNC4FlZcl5XsIWsdXDJdmBVAQKyUIcufiTuxj7l++dfH+kC6Ex1M06H
ScbOsMnUQvQkOWUgbwbEI3sNWya0aIIYp10+UtnzXQTaMbZhUSviiwshdzpvF+We
ph8X0cK0eb1Xzob0dAIaL/GXyoeOmriWS7iJsLMed0+8cgUxySH9/PS2BUvFBWRt
gsqT7bKiL8d2E9MAbWotEFMpAA8JNw==
=PDSn
-----END PGP SIGNATURE-----

--t4rhlzyxszxfhcxv--
