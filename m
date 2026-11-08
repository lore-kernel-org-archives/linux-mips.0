Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794175500;
	b=yhKxcZ6b+rqz/ZaArv/OT1XqIOqI/oY4jeGs622cI4kcavR2WZQKN3rxDJMuiRKLRhKy
	 JfSmLcZffjjQ79yEi2GglRWTeHkmXD3kTtAds0uQXKQiY+yz0P0hkncA6nS7aYMjcA4e9
	 4n8ty60zEC5vhRm+xx0I7cT4+kCAV2aLyE1bPeSR3G5bpePhjWodFWufZiv4a/Iz1ZG2J
	 xhvK87HypA2HvOgiW/VSOcXsJpvBaPARoZ4BGerr1133sa82g2WJScKuEvk65ek/sGB+g
	 ouj6wbSaNW9CuxjMLU+2xUtF6vwYtzBPTBhL6MZLWxB+bshTmvz/Lv9gVF5kbf/wgAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794175500;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=H/CcamKTQfMjaSJiajoERENx/3ROWxMLBiv4UmCbwv0=;
	b=w+V5q3nKC+11n6z3zFMPIPWiAJ2nZDTTLT3+ZeYcrEL5Sv9lQ15dSbmxMQWlKakK/SAF
	 psYymQNo1jQy+zWICQCTXp44eO34tmo8tuh4r9QnFzBGi7a7hgTIXnk72uqlmLdbpJhYA
	 r5kPRkSoRxVQvQFFti1GSLHtTULhaBKvMkEgshWtJ9LdZOFbKV6aswfaGVeT52ts+ba4d
	 Lqh2ukUtD0kUYRBNZ6BhAg0qHE3aMEdX/lqNzl1YeZwxZvtE0WZPmrDItqU2hInYHFWUF
	 w4zI2RGyPHMUv9Aa4IsQzUz9nEounDdoa5VAoZL31pmghSysTaUmI4mJ8ztHNud+Zaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CD3606A320
	for <linux-mips@vger.kernel.org>; Sun,  8 Nov 2026 22:04:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9CD3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso114262a91.1
        for <linux-mips@vger.kernel.org>; Sun, 08 Nov 2026 14:04:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794175499; x=1794780299;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=H/CcamKTQfMjaSJiajoERENx/3ROWxMLBiv4UmCbwv0=;
        b=DfxvJjUT0Dd1Y7FWMRoHPFgx5c2PU2nTA1UNNVMBOpyzgDHYCw94PImuFkYlojmuqT
         8d6b1BmeFXUv6o0gOqn9uIucYT5M0gBkPov6eUhHMa0N30X3Ljf+olJPTgVgOWmLwuCa
         yQ7wVoRzLocz3wi2HmBymS+kcxWkpiS1Pp4clBcZ6/SItJg2p+k4oX+QT2d1TTURHCQM
         Ob8HwnUFtC30BspmNaFO3c8hKS+vGtOo83UsgdMllmzZGgKG0MhRDT63LaYRuqCQrnea
         tTu3iCZSzYo2ZI4BvTWEmZGMdxTPUdZoeSV6vse0BgLZfldkNnYTi8piII551AsjV9Ts
         M0gQ==
X-Forwarded-Encrypted: i=1; AL+hErFhGzyCdDxXhKWXT2ZB5uxI+gYZTyhVL3q8AIZGdMof9orqGyMrGEzTFxH4Ewmuw2Fd/Sekrl5GN5xC@vger.kernel.org
X-Gm-Message-State: APuU4Z/3tSMhLGxe9zl3PPUxACsJ6YYNlPOSLyvsssX/jRWjAmfwda0D
	eGfEcHQFNwq6+kswjWKcYQtzqVLgBcVwhuZ8CtazYy/yVvLVr/RfhrxjzfJrpL9e
X-Gm-Gg: AYBFou0y+5AUCUFCgXjCszU28BpyjbtocZx4k/OJC6KBKs+oLirCIWjOrCzhpcBR1+K
	4wHBOLOnAn+8qyZrKgECVxHNzgKxHaG+9sSeMQty3EZywQjxV5ROKga7SlrfrGggKzAfPePaQt6
	J/h8AEildaI70DOM0dvpjuxXPmeDFod+MiYPVFFFijP3Jfp/Ebo4afjyVt1JGUWI4diPqgAOUlN
	2A96wVXG+PAMt1fyw1AAKgalFPlrMPQGOc88F2BzDhxz55m352ZaZGol9rKErxxlbWaozUTjxw1
	dKgzh/rinlqdUd6+gVAt18CU8FGcnQk/ayJ0UFUGSTBScgqDnp1FNjNo9c6GH+f7sI6MlsfaaRE
	yTOsxIK8Bf5tJFsMEpteXLOk2ajtuhMzn7i5kBG59ppMeSr09cwmfSFonqYqAJTDb5x5rzg7IO+
	+/8Ev8dGEXpADeFvmCjCUrZiK0ILIh582WN7Gh+a+npNt0vEpyFQN/ZSGIDKh5S5O5Q9swCbG+V
	BVr5aaOvSuoXcHbWghpH+NEHkaiMexTQ6fxgifO+VM8mkh36EnYA0MRbr1njCTsa1tKfORlNCfd
	DJy6jDRrbfeuaLw55Qy9wvOjjFbay0TSppU53GRLTDpDc19W9HL0vGVLQhb/cnaIlu0ey21dISS
	qMizEuJoCKzidM+40uGwqAAtRnQHNLxZYEaXWJNP6pqcTMilNwEbf3QO7Gn5Buqo6
X-Received: by 2002:a17:90b:3b4c:b0:3a4:e735:b39d with SMTP id 98e67ed59e1d1-3b12d57457cmr1955077a91.64.1794175499187;
        Sun, 08 Nov 2026 14:04:59 -0800 (PST)
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com. [74.125.82.176])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b126385c62sm4312595a91.8.2026.11.08.14.04.57
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 14:04:58 -0800 (PST)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36dbde64409so517750eec.0
        for <linux-mips@vger.kernel.org>; Sun, 08 Nov 2026 14:04:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE4kIC+Im+5cATt0jnGI09ERpzQSHSSTWUBmsrU6gO92IQ7jpdG1liiTSTYY+oo/eCOBKIYekbkRA7t@vger.kernel.org
X-Received: by 2002:a05:7301:9f03:b0:370:cc56:b61a with SMTP id
 5a478bee46e88-37258c2acefmr5845036eec.39.1794175497365; Sun, 08 Nov 2026
 14:04:57 -0800 (PST)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-sysm-v1-0-a4fac07df823@telaak.dev>
 <20261104-sf19a2890-sysm-v1-4-a4fac07df823@telaak.dev> <au4Hc7LAXH-ujDPj@monoceros>
In-Reply-To: <au4Hc7LAXH-ujDPj@monoceros>
From: Joseph Telaak <joseph@telaak.dev>
Date: Sun, 8 Nov 2026 17:04:45 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ6PzrCkNuHEib8WrYoYw3eeUuK6rCeBYPQg+iPzbVEECQ@mail.gmail.com>
X-Gm-Features: AclHuK94cu5PMN_CR3MHF5B50stfHn_PtAIMtZ8wHEf1hN8qZJlhM6zrg1Ysdd0
Message-ID: <CAPY4CJ6PzrCkNuHEib8WrYoYw3eeUuK6rCeBYPQg+iPzbVEECQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: siflower: Add SF19A2890 peripheral clock and
 reset manager driver
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chuanhong Guo <gch981213@gmail.com>, Yao Zi <me@ziyao.cc>, 
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Please don't use <linux/mod_devicetable.h>. <linux/platform_device.h> is
> good enough to provide of_device_id already. If you insist on full iwyu,
> please use <linux/device-id/of.h> instead.

v2 includes <linux/device-id/of.h> instead.

> Please drop the trailing , after the list terminator.

Will do in v2, and in the gpio driver, which has the same.

Thanks for the review.
