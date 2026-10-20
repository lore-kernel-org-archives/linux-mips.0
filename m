Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792458072;
	b=Y4bnNlAgfEiHkzz2fpkPdsRe1tNqR3wm/7mM8Vr6i5ydRfvDcIrQwPA7ZLCIk6pUMPkt
	 FO19hmLfEDUSI7qbzrJwF0sGobRWKOHnlzeYsLQvuMhveFSJC2ShzGGxWSJIpRAFNuQZ3
	 bcRdU3ZkglL86mK+8IT2fBPIKz8876HURlANkg5Lpd/uMDFco6yhH+V9f5+EGC1M1Bll6
	 M4eSwtcT+5TZpYj1PwVor4HgrouPUDqAgBq59YZXNdF2CacTFvf5DLsaujoUBLlzlWaam
	 HXnLQ1auUsxLDmKuSJQHLmxMrseF0+rjaG+av9GgeKEe4v4ktC+O5RxeV+MvJl3Ro8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792458072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=R1s7MEiNk3YEdNy8JitFCBfRyq5B3y/z+JpJ2i0d7u0=;
	b=PHu/ukJAgtnkkWxQp1nSdTs0LxZ7zi9+D7ZWrHj5V/h2GSGmrzRRJsxK+4HtJAvKfkas
	 J/56TVmMflVwN1V9Oxv7GGJaUopMT+2DQ06y5JLKts2zlZDEk0s5A+2CUBhA3NlKohU5K
	 mHggHwHbg9+xAL2Tuf1VD341ZVIpQ9VYk4eWK5Xg/dpQanVyyN9/1tf/D2ejj95AZz5UX
	 Phq5w4jm7Y1jVfAkAsSH2aziFKDEXy8Gm4AboOoUlHNPjo3GWFbOLpKsN/1xLcj2h7drS
	 fCpv3ExPAtK9ycfwAuy5+FDAqzrfGCzH7uryTsLao+h/TMyzYY+kl9Ll6+YJwRfWSAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Xu0J4k5h;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B79D606A31C
	for <linux-mips@vger.kernel.org>; Tue, 20 Oct 2026 01:01:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B79D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Xu0J4k5h
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e7e742a2c7so1371065ad.0
        for <linux-mips@vger.kernel.org>; Mon, 19 Oct 2026 18:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792458071; x=1793062871; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R1s7MEiNk3YEdNy8JitFCBfRyq5B3y/z+JpJ2i0d7u0=;
        b=Xu0J4k5hM2EawMwY962trFJpQtyvGlZpuyCsaUUhwF7+hGQwGnZct6T+z/AYgWF5UF
         3qp/Xhegtz34ZSBba72MGGzV9rJNmmCeAYZqO8dkExio2cwSJ3Ja6icVoNyRirnInhjH
         6fgHQaqEPla06e6ARO8cbgw1WjR5x6kQtNVU19ekHl3+xupIPNVkykdvbwYtV1QP49XM
         3NeXuirVyWUpREFxqQ15tuMftouXJDKjkVQmFK0FwYpjs8+VpE0JvcCB9sRzkxOtpJvt
         OQodju21KcepV0jaHxa8IEQ/cZvBv+d/trWZf718v+zwT5LA8aRgkQZhkCT6Odcv3y4n
         lwcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792458071; x=1793062871;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R1s7MEiNk3YEdNy8JitFCBfRyq5B3y/z+JpJ2i0d7u0=;
        b=MyG8vZFLca5Xv7AcoqRudkxk5qxkLqWZXrhRa27PWb7TyerMOIxkeEzP0Djsfx+dRU
         o9h9av9XGlWk+TRNf4F5ozppx9zj9DCGIFrGLAb8VIhdspdPg40GvODm1syfO/7zfojO
         +3rujVRFa2FlgDxY1WwViFwx3BuvWxlUoGd9fiS5ED34AXeBQXnWT/kjR/KY3GqNKZpY
         nUaieNZ/OxcStAqra/srTnIzfeCwYSuZYWLlsxw4kDNSTX71yMUw7ywjv3Lb8KDuH3rY
         LYjcR7hws8ro1fNEZAYJ8jLNU3K/sRO7FFiAtYW88VldQl0gH3f2Vn5dlsB3yJ7G70fD
         lqfg==
X-Forwarded-Encrypted: i=1; AKwUvBxgqZJOsMENCnaZmdkc3+Fc0zYm95TXsn33rU8dbuGt0ygo8t0txiu7TDZ8Gn8agXLkuAxv/Z8zaN9M@vger.kernel.org
X-Gm-Message-State: AFq9FYKC3Rs5Jsp6xqWCgLGPaXzJep8N/C66UT6ZQrwM5j98Z0RwZeoQ
	Hw5rrzU+kYbDN/khdAp/zmUXz3QatzrK25KwgtFKG9brnTjcyXiGCJOX
X-Gm-Gg: AYBFou1nTYYxOXxe4XI9uvqg38Xzs8yAhuUQ97Z2byzdmTAEbmkUTKPX0Cv8kHc0nzR
	3IpS76xAj3/Lgxp23RPOflufmwiCJ19mxgd+qcfYoA8Nt6lHlgKQUpYM942eUWH1m93uFMBlyho
	F5z1aG8e8ldkTxbrSUlOexISIVdCAXC1GyzkhXyaSJG9TDgR8abpYms38H8afxsP5VQf12VCso6
	QST8t3TIfq3pOYT+lGf90J2jQVaLCqgqYBLsh9Nv6VrL8Ds8cUvDcrqC0yziLi46mcH3DwNwdN3
	+zGR/KSJS4R7iFmAcch00LtVBRfjoWRNiXADDcfEIat8Ml7ifqQLAe7AqbVUMz56fS62HNGdEdY
	BlGImatEbCrglHYZdtLVnn7HVmTqGmwqO6tejENHoI2EnoUrNH17SnVuzNBbvmtyiLj4LkT9oSR
	PsXrjN4JJbAV8tPvcxBozK38fZ+glSbai0xXpANZTmzOY9b8+E3NJkVfrfL5Zzy1+a3A4HTpSoL
	npr7qqCwXeWsO1qTsJOJ6ZdvWBdKj8oSbGiQStGZBIRcCNSA+5qHhh3avbf+cQM4k/6Wu3dp5b3
	gMENXd4OpBgJKop1FtGdB3VJcL4G/w==
X-Received: by 2002:a17:902:eb8b:b0:2e9:199c:f800 with SMTP id d9443c01a7336-2ea1dda3ad9mr4561775ad.37.1792458070568;
        Mon, 19 Oct 2026 18:01:10 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea145b5099sm7107725ad.6.2026.10.19.18.01.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 18:01:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <6991e32c-cc2f-44d0-a266-4e13e30916ba@roeck-us.net>
Date: Mon, 19 Oct 2026 18:01:07 -0700
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] watchdog: gpio: Allow devices described by software
 nodes
To: Florian Fainelli <f.fainelli@gmail.com>, linux-mips@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Ethan Nelson-Moore <enelsonmoore@gmail.com>,
 Eric Biggers <ebiggers@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mingyu Wang <25181214217@stu.xidian.edu.cn>,
 Robert Marko <robert.marko@sartura.hr>,
 "open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 manuel.lauss@gmail.com
References: <20261016221617.2223004-1-f.fainelli@gmail.com>
 <20261016221617.2223004-2-f.fainelli@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20261016221617.2223004-2-f.fainelli@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/16/26 15:16, Florian Fainelli wrote:
> The driver reads its configuration through device properties and obtains
> its GPIO with the descriptor API. Neither operation requires ACPI or OF,
> so allow the driver to be selected on platforms using software nodes.
> 
> Add a platform module alias so a non-OF platform device can also load the
> driver when it is built as a module.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

For my reference:

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/Kconfig    | 2 +-
>   drivers/watchdog/gpio_wdt.c | 1 +
>   2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index f7d0a0c2c0ef..f50709c635e5 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -267,7 +267,7 @@ config DA9062_WATCHDOG
>   
>   config GPIO_WATCHDOG
>   	tristate "Watchdog device controlled through GPIO-line"
> -	depends on GPIOLIB && (ACPI || OF)
> +	depends on GPIOLIB
>   	select WATCHDOG_CORE
>   	help
>   	  If you say yes here you get support for watchdog device
> diff --git a/drivers/watchdog/gpio_wdt.c b/drivers/watchdog/gpio_wdt.c
> index 1abc7d0b78a6..ff323d6e692e 100644
> --- a/drivers/watchdog/gpio_wdt.c
> +++ b/drivers/watchdog/gpio_wdt.c
> @@ -191,3 +191,4 @@ module_platform_driver(gpio_wdt_driver);
>   MODULE_AUTHOR("Alexander Shiyan <shc_work@mail.ru>");
>   MODULE_DESCRIPTION("GPIO Watchdog");
>   MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:gpio-wdt");

