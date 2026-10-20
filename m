Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792460290;
	b=44YsLd2DhFKgdJauQD/rMwQbJb4NMwGyXxa/50jKGRQ95JdS53nbBY6zCU95M9FLxeS/
	 txgX7Uoxc7yMmCrxmmF8qQRyoBVCcwpsdPC9sA/bfCC+aSZBrWYGUi/e6fgY4GLIqoVzb
	 /o23sIy8NiR1QHUdLdXC2BW0LVkzYDW5YNbJKmJiJCwH2WSR9Pc6ujUuyxSM7BC8R7F8U
	 cztvOgnp3nAjhU7zTb5mjxsDCKo45Uy7m1mw3VHLqHxYf/2A7fk9x7rVAq8LCQHmuPC81
	 XtbbG42LzNF8SZFbVH8YFKgNMJfh5stQ/ExbhzD6M3Snz4n+eVaQYKSXDUM2Y/koZGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792460290;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Sender:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=8Vg2HGC9f0RLK6KKMp0Lu8393a2H674YghRuAU4vlpU=;
	b=x6dOtCsbINozlyOEFDa2uCbPsz5YHcCaMQt14zNQFlWa5FowfHskA8hDRhkTO2umSXsO
	 RYlUqCUr+EgQDijQbgO4OfvbgYtj84Yg50OMcPrk5HwlnE2dZ8UD4KP0QKy4V+Qc+Th5d
	 CFa//yCjjDaBbkQPSqaMxEpghK71KherYhjvIyMxFKE6DCu2VjSTS5YwDvI/14XX6cfgf
	 Z7yHC5G86SMwTq5ueNDNylwhQVi9f1GLxnOKDMwqugTwN0Aloa8ovE0SzRPHtF/yOes8d
	 JiHwb6gf4VGNDVaoQbQcHLipGfydpIXQwJuRzv0e52f6zR7iYXPHRrp0wHCjfRymPJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=P8ClSeiq;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13F8606A31A
	for <linux-mips@vger.kernel.org>; Tue, 20 Oct 2026 01:38:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B13F8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=P8ClSeiq
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-15354aa70e8so3037717c88.1
        for <linux-mips@vger.kernel.org>; Mon, 19 Oct 2026 18:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792460289; x=1793065089; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8Vg2HGC9f0RLK6KKMp0Lu8393a2H674YghRuAU4vlpU=;
        b=P8ClSeiq8iS2sLn5peXIWUrqLR8crS2ZbRIPFQ5r3UJoEOAy3kjbeUGU26ax0TW2vq
         M/VWc0S7TLRXwewbaBB0KXRODfGmMO4tM4luke2JHR2duix4LJ77dgPVxn/Fqq+WGYu4
         i2YLNUi/tFcRHmZtyqtwLpHEcMqeOyGD6igSrZ1Tki41ViKJ2IpD6nKi30soM30Co+vc
         3tZ48V/eBWE//1mWWvEH20OsbxLQ93KVy5A3pfmEWQaqv2RcbICpMieGwdqcsaIShX+2
         X39+mSi7/W0HTIMuO9ZGpGWzpFboaZzULMxmZp1zJAf0Fc6flUVOcpBqZHePvRvLvaFS
         +Gfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792460289; x=1793065089;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Vg2HGC9f0RLK6KKMp0Lu8393a2H674YghRuAU4vlpU=;
        b=hp8tX6FWEjcPZtE0Br+GKXvI17JTeM7NBT5BB2O18GnXQ7UNbdwWr4NB1uyOTVO/EX
         3fOg+v0Eyqvqb4XALXa1G1j7KIuyOdtLhsAwgZAUvR5GMC0aPMUTCjQUg0Xubu7VxldL
         pp8WQt6EbLDQdaBYKZPRvLkxqMy95K4W3bojdXWThdmc9mSAKV9Mi8aUA2sDC6uwK7ze
         /yucW1DlaNNOkP6+g36Eo0moaIWt0QkF9BFPFgfsBrPduM5gxaL+FyeEkgGbhq1aeCcl
         RHNqEpEJ7h1Ju8fcZVvme1wEMsrjO/yxgJzKt2x32H/FOUyWlgnO8yBsuzeffJKiGYPl
         S27w==
X-Gm-Message-State: AFq9FYJ1jJEFpH4o+IXk5SpdjozFwFLK4zn20PA5fk5NOqLUD7awXUgm
	ASv11J3CSSJK4dHeH/1HeMyDN1vQD+zVYBDuwXZXw9g3Yp3n8pBGUSjcJkm+ZA==
X-Gm-Gg: AYBFou1LLHRolUuiHDdRqk8Az6etDmhq4MmgKJLI9uZ0dbAyBF4kXX7iDYHQ05/b484
	4H3iS5SyPXNb+5eMgskM8nmAGsetmOzuGECBw8YukAGfQyMoSy2MGs47wOnwG8FKaVBSGrkgB0m
	nMfhKs7NC7IWXPAq9f9FoJtmIxVbezGEtWB3m6O1wykRA8fRl2M9VLfroOrnVvdMYARwpJ2frpQ
	Be6XfAnfi+Hie4kTMPC26Q8RR0icTfIhBhRtz2iHmejNm5nmPX3jgr/RAh08l/b7s+Cv8trZ1KT
	5YBmJ1eQQplONe4mhf4cwyfn4MHdZovN7Xhy7vvkavkCRtWkGOWLH8mfeWh8t5QJQKkQvWr0Izp
	mRfrbuxUfSgTfP0BEfQD/rgSyNDfK0gRo0Hmmbsd2HcVNOIh5tCB2tR2fCrq4ApWrf2kv40skIv
	2KlY/zvIACFKw2gHPwwFg2lIURlOFxNtg7X7apm+t0cy74qdTW67OVIvkHxvz+frL5qkfuF2B2G
	8Up4+aHvAsL
X-Received: by 2002:a05:701b:418a:20b0:187:eb7f:bb4 with SMTP id a92af1059eb24-187eb7f0d0amr9277157c88.46.1792460288841;
        Mon, 19 Oct 2026 18:38:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1830f213ba7sm37629861c88.0.2026.10.19.18.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:38:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 19 Oct 2026 18:38:07 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-mips@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mingyu Wang <25181214217@stu.xidian.edu.cn>,
	Robert Marko <robert.marko@sartura.hr>,
	"open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, manuel.lauss@gmail.com
Subject: Re: [PATCH 1/5] watchdog: gpio: Allow devices described by software
 nodes
Message-ID: <74cb726a-b36c-437f-988f-c4f3bfa0a7b4@roeck-us.net>
References: <20261016221617.2223004-1-f.fainelli@gmail.com>
 <20261016221617.2223004-2-f.fainelli@gmail.com>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016221617.2223004-2-f.fainelli@gmail.com>

On Fri, Oct 16, 2026 at 03:16:13PM -0700, Florian Fainelli wrote:
> The driver reads its configuration through device properties and obtains
> its GPIO with the descriptor API. Neither operation requires ACPI or OF,
> so allow the driver to be selected on platforms using software nodes.
> 
> Add a platform module alias so a non-OF platform device can also load the
> driver when it is built as a module.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Applied.

Thanks,
Guenter
