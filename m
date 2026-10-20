Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792458102;
	b=j7cVDcmn3E3b1Zzc9TuZYRAnzU1VAH5cxMc/vJQNCqs6FQB0VHR5rkGbsuKaLNd6B5Az
	 Y3/Kurc3BGV5YNIG8wivIBYpCu4ga4WNGO0Oslr6HOaB0UcajDHl1xQvYchgRlDpgE5i1
	 PyH44biZ3HiR1I01SLcrKFbPShwVI+RS20qQvPHHxFI+Nl6+owlNgcyV48PKJXeJwvRaM
	 tjbR5PADM7UmIWC5gd+l61r+H3mEkJ2px3cyccdXBf9+ywKaCSf45oK1rWzgkPTQ9K3F9
	 THbnFC0D4t0r1JL6RCVTnS5aVyK0n0XcY4pvJRPn9XNEXX0QYznhSXmwCim7kfWXVQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792458102;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=FK8OjXvCaQjXVUd2PCHr3RPKmKfwRrKtAbES1NRfsvs=;
	b=ynQa8lkzXLorFgPrTxGEMj7HF/ZJvJYitZr1kPlcdm8ebI5vN/KGwdBiHpfYbLh9KV33
	 5SA70BYSOeVFnsDPPi7vHiaf6vp10GwfFs0hTY5daSHoLynvl6W3fQDwly5zNDRw2+UIf
	 5XjQRPGo1QMQU2sgBRWJAXYpQjw7AoqFS4LGd7ONZUZ97Dn1GHWPJE0NzUmfd0CMv/ehS
	 lB53N0oYk5CtsUsxjGRzZvd+Ea3vDAV/Q204CWqtaCDnb4LWzMgZitmzBTH0qsLdNsA6q
	 8a3pvALWcq4HOPaSJO3vcSaaGXIgAmPD0P4VwU4xHhSD5ZmR701HL3f4ZcYWIoERKng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ErOz3YhK;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DEC0606A320
	for <linux-mips@vger.kernel.org>; Tue, 20 Oct 2026 01:01:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DEC0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ErOz3YhK
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so1298002a12.0
        for <linux-mips@vger.kernel.org>; Mon, 19 Oct 2026 18:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792458101; x=1793062901; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FK8OjXvCaQjXVUd2PCHr3RPKmKfwRrKtAbES1NRfsvs=;
        b=ErOz3YhKVZcSWXMrFWtgaTsRfJspK71A6rRjCFuHZhY4fzwr+kxUG5f07KQ0QySBH1
         8dwQFZXCqQpE761fKbUvvcNB+ORBELzZa81SREU5h4zmt4gH8KEWIbpMNyGcrP2+L110
         b+PI/YgV40CvhvAtGmTVquRmYpIvVow1NAh8XRZ26hp4rRPt/LCASFQmh7C0KV3efl/Y
         1fnH0P94Z0m4Qd+1RyE6nB0zGNRwLbwBFu1MnfhZYTOvU+Faqv/eRa8P2LarntY5K6Fh
         SHju2Rrlj/lei5Qx10mInFLAXVqyGqW9PD3z74KKyLK4no5E9wfPUl996q/6PwJlwHw2
         9cgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792458101; x=1793062901;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FK8OjXvCaQjXVUd2PCHr3RPKmKfwRrKtAbES1NRfsvs=;
        b=Cr0nqrPoarmcu/7ugJM4mbR6Va9BfLSKOFx89avFX5wo2R1jZZVTs7qowBWnoIJYvm
         LyccgOlv0D8+J1/KasCzqOWxBsHy0A3TvRywha4zYvmVtfR0hj9f4PPv3HYX0dJS6oWi
         4Elg0yN1Z9RF9mn3Aw8kJxHu5NUZcR4/zhzNiEz5ZAanS+iA09fjkZqHkM9q55dKGzFB
         r/gF6uCu4wJ3oOYqK6jR9KTsueZ7WLzC0109Xa9HHN12fK+YdA7m2p2qP6ntfJvLuOJR
         C7WEK8QAQ4n0Yspji15Vr0xfvBSSg0sxAUjERxCQ+3+TMLWW7bOJRlHdo4aD/bg0EzYH
         7k3w==
X-Forwarded-Encrypted: i=1; AKwUvBwG+yPrY7/0Xs3yx41H2Y5wBUabPsAo/PCbHaHJPoABMOOn28TNJg85/vXHUcywWEdep7AR7vHKy5ra@vger.kernel.org
X-Gm-Message-State: AFq9FYIGEUWqKHY5Ko9LJ61bxGusAPoZD2nvI0isEXBZNtpZdWMgCpRG
	ubNZIPVeqIReaLp6rR+JObJ/G8hsF5DB9ZPq/LL5KDchhmP+Pa8ymm+h
X-Gm-Gg: AYBFou3pV0g+yf7Kiaohey2dyDBNCIfBOZGMWIl6F0dkCX4zX9p/I89/ISeC2Tvmjkj
	1z0B2ag7YDFcJbpUIpGFi3IWn9PBv/trkxGZdbDjQA1CtBQSH9zWpDVIkX/umw0ScTcERyiehui
	Z+rQYqu7dB1T6wbyx3iN4pDZ5hshKksONCchxCWRsZtaOaR2S2nnXvDXGaWaKKNB0X7kKHGdoGP
	dF2dwUf3xNpF7KTIIB9edq1ppaz0qYfxjLcnVGkRQCYpPKPcyOXMVQYVKFdRpbrw+snli6Qbjxu
	Rj3c+bEXzTLFipZYjCbYaAysDCxV8tYCey7P1xHiqMnXWK8ey6WK6Xi1J//eq8/zXPdwqGomX8G
	4JoYacYqQGZXeGivF9TQHdEDAwnble6P5CvmRJLn+QvdMO7x6rGitm9vNEUHLtuL+HiB6VuWwwl
	q0i3OxVjBWDiar+txWPKTj3+jWJnG8Zz8p6wGJb5UwWqLGtckWA1+E0Ir4+iJAstNDWvedYeajP
	aHeJLz+hfb+/efDRuWPJqNumnu/8+CCIUBfZnpFSewp2QULhFNmAuREA8KLqHPkmqOTbMUO2a+c
	2ebiYWBHESPFSkCNLrmx/+wcqusHfA==
X-Received: by 2002:a17:90a:3885:b0:3ad:3938:4444 with SMTP id 98e67ed59e1d1-3ad3938460fmr2410631a91.62.1792458101396;
        Mon, 19 Oct 2026 18:01:41 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad5d4005b1sm1814815a91.6.2026.10.19.18.01.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 18:01:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <8752c2d9-6b75-4793-8aeb-7d6f4a844d9c@roeck-us.net>
Date: Mon, 19 Oct 2026 18:01:39 -0700
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
Subject: Re: [PATCH 3/5] watchdog: gpio: Support watchdogs with a minimum
 heartbeat interval
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
 <20261016221617.2223004-4-f.fainelli@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20261016221617.2223004-4-f.fainelli@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/16/26 15:16, Florian Fainelli wrote:
> Read the optional hw-min-interval-ms property into min_hw_heartbeat_ms so
> the watchdog core defers keepalives that would toggle the GPIO too soon.
> Reject zero intervals and intervals at or above the hardware margin.
> Devices without the property retain their existing behavior.
> 
> Remove the arbitrary 65535 ms upper bound on hw_margin_ms as well. There
> is no register width to constrain this software interval, and the MTX-1
> watchdog needs a larger margin with a 1600 ms minimum ping interval.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

For my reference:

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/gpio_wdt.c | 14 ++++++++++++--
>   1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/gpio_wdt.c b/drivers/watchdog/gpio_wdt.c
> index ff323d6e692e..a431c77fa179 100644
> --- a/drivers/watchdog/gpio_wdt.c
> +++ b/drivers/watchdog/gpio_wdt.c
> @@ -138,10 +138,20 @@ static int gpio_wdt_probe(struct platform_device *pdev)
>   	ret = device_property_read_u32(dev, "hw_margin_ms", &hw_margin);
>   	if (ret)
>   		return ret;
> -	/* Disallow values lower than 2 and higher than 65535 ms */
> -	if (hw_margin < 2 || hw_margin > 65535)
> +	/* The core feeds the watchdog at half the hardware margin. */
> +	if (hw_margin < 2)
>   		return -EINVAL;
>   
> +	if (device_property_present(dev, "hw-min-interval-ms")) {
> +		ret = device_property_read_u32(dev, "hw-min-interval-ms",
> +					      &priv->wdd.min_hw_heartbeat_ms);
> +		if (ret)
> +			return ret;
> +		if (!priv->wdd.min_hw_heartbeat_ms ||
> +		    priv->wdd.min_hw_heartbeat_ms >= hw_margin)
> +			return -EINVAL;
> +	}
> +
>   	priv->always_running = device_property_read_bool(dev, "always-running");
>   
>   	watchdog_set_drvdata(&priv->wdd, priv);

