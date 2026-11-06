Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793925262;
	b=Y/KrWc3pmgvh/msIv2KX2ZbJRfl8QK06VevImx6h8PWRgx9uh+Yq/FnbYZMDtENtUH/C
	 zpX0KWYlUVjeHkWkIJhWUsX7cQl6MiHQXOBqlwA22wWDEtN0Sb5ztD2WCfuIKq3q+rgMs
	 7igfaXHR6nZF2F+h7/bSz8hKzLEyS76Zbk8Oq4CIqcDRDDFN1+VsmoJfd0knaDIpk6JTn
	 jvJK6vhvWZJcT47ENc3+iJ1rHUu5Hrek5F0ctGpAPslzjRGd0TVOMQkas7gVMRzxVzHvk
	 mHcoUbM82TYPinUAlIBU9NuIwCK+GIjdBdeZTD7wvJa9/BivwZ8nZWPtIXD8skNWcew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793925262;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=OVyjMpKLjhA1Rj6kFt39fijzgKw1bkGZMKnXsd9NG1I=;
	b=0KQhnzheW7nWYgJYCu1ggWaxI6U4VmpATbNLCmlfZK4EbTRHbYluNy+CmqZTiGgzHcOU
	 uNSQec7seQ7nBwLrtTyR0lTI6hDXK/zkQbDij9QpXGS+aVNIP8bwR4yGLYVL54P6bPa0n
	 HXjt5RJqCkI2QrBMrgQT+TpvXH7vvkVV2X2X117OeIcfpuPmxYsfyQNJGBPJEoAn6ZRIC
	 k5Zec3GeikK9fGYmXScKUigR7j4cLpcijB3AD4/7NngqyHNfYUL9NuheWKRvtd3DzI1eg
	 rlbb5Y5gg80y2+9V1YhqfO0KRLmzLR46yzQ27VZzNg3bxUX6hJKV8NbNuVNNfuG5cwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7AC2606A32E
	for <linux-mips@vger.kernel.org>; Fri,  6 Nov 2026 00:34:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7AC2606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8a07078200fso17824b3a.2
        for <linux-mips@vger.kernel.org>; Thu, 05 Nov 2026 16:34:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793925261; x=1794530061;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OVyjMpKLjhA1Rj6kFt39fijzgKw1bkGZMKnXsd9NG1I=;
        b=s5jUhin5T3ED+TMSMBu+U3N5HZ9tVI7RJb+/0IGAZtlMMAS6SNcZRIdbZ1YTQkRy9A
         YauMlyPQ+tHVrO8HP5pDImnONafB/yIUsx64Y8MOt2sG/okqiGgufgsH45GMJScafqc8
         kvc0tx6+2C3PT2lhS2A9c+ur8kmokBRGMUJCAHnIPYN216FArktDEcuxxCyDgwl5531K
         ml7pxK0jnFNwlWSaReI2SpozsLSMGE5i39tK01czVe6Clps1r+bHUS03aGIo8AxwVleT
         L8QmS+N/b9t7CxHDT4Oemgur9ZTponPcu+sCjbVGgPzmfsTP9dP2imD4PfHoon2Jj2V+
         B/Rw==
X-Forwarded-Encrypted: i=1; AKwUvBwennx7xVB4/hGZ3An0ROL26CW0Nrt45QxiGGoMw1d4qT5QlfQKT0xW8XVzos/83qzfdwyZeiBh3t7B@vger.kernel.org
X-Gm-Message-State: APuU4Z/rZjhouUSL+fM2cJfYIbMHh5k+QD+1YNblc+ibp37TFDTJums+
	41Fur0icLzBi5gOmrrJjVj2iynX8gtINW5fCidf5/713+WUYA0l4Mm11UrJuerFE
X-Gm-Gg: AYBFou2Zalei4SzbrdMgZrCQaDK/0JisJHeTAEFOAeFSx7Efn0oh3YbQG/OVR7TjVSm
	KNDEh5PDKD6iwCZegrEQt7MjJlTcyDaMY0G6+KMnFiD7LLaLNHgeb/gS8+2ANGJJRwqCYCsiXPo
	xqOOTQnRE2rTDcvBEF+zaH31qmzUp9wzEz9Df3m5Qo5gtGq8r6EAYsVgWQuA1hrKYev0icum8Jp
	OfRCcnn4XnNKSNQzDEVA4Y6K6DU0HvEdSInBWvVyS+SZTXpecbDSA+VWS/L0TWH8QxzUFrL1fLJ
	yWuoFJNhHY3cYd6FVclLtFxhD604j/ZOnRTYO35ZA4wZm6wHLg89gYSKWWKvy7+yZZTZCP5Sq5D
	8jHVszdVUnxh830b4fuJgYDWStYxpnyAwLhihd/HLJDwYQWgCMiTrvI0dgwWJB+1egRfSOeQOw+
	E0CzTHDp5mfu6tnCJNLBIyc1U0+k9dHQs1v6u0AsbNy3t2zPrXxhgPMEQ1tYpb62k1URNX8aHQS
	e8FlLf+mdO4zOYDAUzCzo+6X2393Oy5VhamXWDzE4CYxmKnToEUKjw7GTHUfbP7qjFIRafgJ5Wb
	lEfBKAJMJQFBcQQh7NUsUfFRlyIHMlCbBN/cM18RNo7Day24Zi1XWs9RDlXl8bsvO39rj5ASAYg
	7b5ZfbdcNf/UbrGMm189FJgvBGPUkYAchHtic7I3PwVI=
X-Received: by 2002:a05:6a00:23d1:b0:886:3a6c:a9da with SMTP id d2e1a72fcca58-8b37b4773e2mr678316b3a.26.1793925261173;
        Thu, 05 Nov 2026 16:34:21 -0800 (PST)
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com. [74.125.82.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b35921db07sm128600b3a.15.2026.11.05.16.34.19
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 16:34:19 -0800 (PST)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso135321eec.0
        for <linux-mips@vger.kernel.org>; Thu, 05 Nov 2026 16:34:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByOfZaO+Fn5wHSZFAnXVl7CJYgoLn+ua3wcsInbDROzq2HcSW8yxzpTcNYCriEtlxvXIuzl6F8D1eNf@vger.kernel.org
X-Received: by 2002:a05:693c:68c6:b0:369:d84e:eba5 with SMTP id
 5a478bee46e88-36f75443f92mr1048026eec.11.1793925258726; Thu, 05 Nov 2026
 16:34:18 -0800 (PST)
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
 <20261104-sf19a2890-sysm-v1-3-a4fac07df823@telaak.dev> <20261105-upload-golf-40927e20b7b9@spud>
In-Reply-To: <20261105-upload-golf-40927e20b7b9@spud>
From: Joseph Telaak <joseph@telaak.dev>
Date: Thu, 5 Nov 2026 19:34:07 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ5B7YhuQtqvFanP5GpfK0YvJ27xcS68KtK_rZvbxYN6dA@mail.gmail.com>
X-Gm-Features: AclHuK-ZB6vwHbkhfZNFAAIsLQdK0ZMK7LE0zya9GH_XZ9poNQEbizkJmf2GZbE
Message-ID: <CAPY4CJ5B7YhuQtqvFanP5GpfK0YvJ27xcS68KtK_rZvbxYN6dA@mail.gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: clock: Add Siflower SF19A2890 peripheral
 clock/reset managers
To: Conor Dooley <conor@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chuanhong Guo <gch981213@gmail.com>, Yao Zi <me@ziyao.cc>, 
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> I think you should put these in a binding header file, rather than just
> put them in a description like this.
> I think you really need one for the clocks too, since you've got things
> like

Thanks, v2 will add include/dt-bindings/clock/siflower,sf19a2890-periph-crm.h,
naming the clocks and resets of each manager, and the driver and the dts
will use it.
