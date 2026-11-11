Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794424116;
	b=GGE5VLiwzc1VidX1vAPC+1zmMDTb7FUqh2BWXIlfiz1PNBEgBhmVgMcUyiHdHsiuJ49z
	 z4z1YXnIde6dz4bKkfLBGqo8lizcK6ebZTyLbRk0vhXGmQSjqtKoJ7olrhThM3tgzNkTn
	 BzpWQo1twDBVH+l3lpD25AQbxRgU6URppfrTUHMKbchMN6Ojd+IZ9ju1Q79aKKZgTx87C
	 wsj9PNcBOpuSId04Y5GeLhqYWzG9UiehPgjZuS3Or4NEWhx0qOSD59yxUR2NySq1BRHjl
	 Hcs+PA5yWEZ93e8EGJ+6rKXywsCJG/w5bZntenhVZY5FLSwzPZTXYa5yZk5/CZWpf2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794424116;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=1u1FmtDlq9fLUJ7TofIm7s6Ux5ZyHgM1hXjsasoL1Tg=;
	b=yFOpXZIQsEGTt3BB8NUHRGpCs13i6ayxEZC1L94ecYjz/ZZVF/pBqrEN2IiLCrqAoCJX
	 Wd4ibbicchFmwOf+Ltg9dYP5kEAuegofmydoN7viB+zafqxhwjU96vBHeuIZGUvLckwoP
	 joPeJUovP9HDY3A5Hj+IISPlUTDmtsFBlTry8q1oUlVGKbs1N9pFUCabNWSqtZXFVwg8S
	 y+0ZkgS5izfuUOBhe85qN1IK7GP0jlKpVQMkgaXwY4e4BWzBRPgTvF7KxkZxSM55kYvtu
	 1aDqDGR6gDewSYB0WVxNuu255atIASmDgigx4Mv3LlkL+w/7GGhUv6OiNM0kBZx6PPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC147606A321
	for <linux-mips@vger.kernel.org>; Wed, 11 Nov 2026 19:08:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC147606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ed28bac8d7so889635ad.0
        for <linux-mips@vger.kernel.org>; Wed, 11 Nov 2026 11:08:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794424115; x=1795028915;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1u1FmtDlq9fLUJ7TofIm7s6Ux5ZyHgM1hXjsasoL1Tg=;
        b=CUWS6n5/1lpWugAYazarV35PHWByx3861ipzx+T+kJm13rTWARYqvKKFWuA5dbnbEa
         iqSEmXW30rrgCYA9I2ovMhl/qQNIKkfDXtQbnMDVZxlUm0hAI+7ReVDFcbtOhcddNpOA
         igdTIyqFFM2SoEs0FjRIxn62jWKggBhiohb7gOwv8S06MWsreETwexkLgr4QSeuURt6x
         SLAT1gQTwALpwe0ssLGNWjHWwyPDqY7gQ57ILawqs3nYI4YoU2OBpdMaGIlxnwTLyK7v
         EJhMYlL0QWblYKDuyG5jIQfBrUvwlnXGkfRmd9SpRdWKw2qNbYcYItC9oX6c5TOpZ7c3
         JZrw==
X-Forwarded-Encrypted: i=1; AL+hErGiCtiu8Q1VtldEeZtPtTqpELjqmC37QYatmJLLUUrI/xZxqcSj/8ZMFwukmUs8ZlJ9GqHvvTwx+f+2@vger.kernel.org
X-Gm-Message-State: APuU4Z9L+83eqX2MnGZc2DV/DdTd02mnK7+PSuMn+moKuE2vZqJqiNrW
	a7T56dFRMdnYpXHspn0QaPlagTv9VThau/4YSGjuG+R/1oKy7yIZCy33G88nRwk/
X-Gm-Gg: AYBFou1z7V5YfosXmUYfuyH7r7q/pO+GL9p/MtN0QLwXLAnYhFHIpa+oq6mDlkQJiAK
	1fosM/skmmmudoS8DJuvtQAECn2xyebMqt1W1maYC2wtNlKo6YoiPQvCnuNb/OGimJWIfNH1WxK
	qSAAizZtkEld6Nlmm7zB5+9ej74SV2686AIrSozoMUPoBexyBcUofcz9zAsEP6xwRlbm244HaGS
	elE3a0Okiqo7G7cEhKuho/ZTn/DfO5hKSV5avl3x9rqJB0Dv5QZKkQE6tSsBMjz2nyaBHRMFq2y
	j+69HRqaKSJ2ySdS3uGCzpgfWvYnUEpKxKqfXwgXBFx23w31oScvW2s2byBu0a+FznFMA8WckmH
	2xsgGVLNSaahCAOUO+DzPJQgrj9QU0+6pKTcHkPMNWpffjMw6SDyEPysZtAqVJEmJBP/710g7KG
	AWDNg5ZMQJzksQnESSfe9rvHAoWUtkhyEyDMXWEdqFVkUxFaPaWmf9vHExsFHqn2DvdNAS/sOFv
	l5P99UllTlT1x992ipW+RvLXi3t686VioFmApYnviBTaYJWi+yCDJs9efBf2ab0abHuceMMFKQs
	z5qsqNfKNnIWAGsFT9DsAnLglTydJSZWC7jfeK3savyjPrkd0ZWyZoRqU3PVZz1zVvjeoyPKnnh
	HQnLmNVJW1y1703yRg4WeP9vuYPFMZd1aeEoT6M93fBfy
X-Received: by 2002:a17:902:f705:b0:2df:98a1:d0a7 with SMTP id d9443c01a7336-2edf21a4d30mr2117565ad.33.1794424115104;
        Wed, 11 Nov 2026 11:08:35 -0800 (PST)
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com. [74.125.82.174])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d7bb64sm23965235ad.28.2026.11.11.11.08.34
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 11:08:34 -0800 (PST)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36a315ed211so154300eec.0
        for <linux-mips@vger.kernel.org>; Wed, 11 Nov 2026 11:08:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErELerVKrJDXzDFtvFRPuYNKvddshTM6JLUM7NLkJLMGC8Sjxc55wxOZINd5hnmAMldLcsnG8FxkOI0b@vger.kernel.org
X-Received: by 2002:a05:7300:c7c4:b0:377:3984:5cb with SMTP id
 5a478bee46e88-377e15ef441mr284775eec.17.1794424113527; Wed, 11 Nov 2026
 11:08:33 -0800 (PST)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-sf19a2890-sysm-v2-0-d2fcb723e4f1@telaak.dev>
 <20261111-sf19a2890-sysm-v2-4-d2fcb723e4f1@telaak.dev> <d59f52d1466c515f574be1e9eb127ca3e43d155b.camel@pengutronix.de>
In-Reply-To: <d59f52d1466c515f574be1e9eb127ca3e43d155b.camel@pengutronix.de>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 11 Nov 2026 14:08:22 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ5_Qa2vf7_GiFU-T92HDkA3mdY_x2Dt5DXZ5dMfS-oUwQ@mail.gmail.com>
X-Gm-Features: AclHuK9zvtdVIUhueVUtW3uifqySWqzLz4GA6zOccXJAOROeptCP5K7cJXQAOv4
Message-ID: <CAPY4CJ5_Qa2vf7_GiFU-T92HDkA3mdY_x2Dt5DXZ5dMfS-oUwQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] clk: siflower: Add SF19A2890 peripheral clock and
 reset manager driver
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chuanhong Guo <gch981213@gmail.com>, Yao Zi <me@ziyao.cc>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 11, 2026 at 10:56:47AM +0100, Philipp Zabel wrote:
> > + spin_lock_irqsave(&crm->lock, flags);
>
> Could be simplified with guard(spinlock)(&crm->lock);

Will do in v3, as guard(spinlock_irqsave)(), since the clock gates take
the same lock from clk_enable(), which can run in interrupt context. I'll
convert the gate enable and disable paths as well.

> > +static const u32 sf19a2890_usb_resets[] = {
> > + [RST_USB] = GENMASK(2, 0),
>
> Do these three bits control separate reset lines?
> Does the hardware require them to be changed together?

Yes, they are separate lines, one per clock domain of the DWC2
controller. Bit 0 matches the controller's gate and bit 2 its AXI
master's (usb_axim). Bit 1 has no gate, so it is probably the PHY clock
domain, whose clock comes from the PHY rather than from this block.

There is no public documentation for this block. Chuanhong explained in
v1 that the lines of one IP's clock domains have to be asserted together
[1], the same as the GMAC's. The dwc2 binding also takes a single reset
for the controller.

> > +static const u32 sf19a2890_uart_resets[] = {
> > + [RST_UART0] = BIT(0) | BIT(4),
> > + [RST_UART1] = BIT(1) | BIT(5),
> > + [RST_UART2] = BIT(2) | BIT(6),
>
> Same question as above.

Yes, they are separate. Going by the gates at the same bit positions,
bits 0-2 are the UARTs' APB resets (PRESETn) and bits 4-6 their UART
clock domain resets (nUARTRST). The PL011 TRM (DDI 0183, section 2.4.1)
says the reset controller must use PRESETn to assert nUARTRST. This block
leaves both to software, so the driver asserts them together. The pl011
binding also allows a single reset.

The same goes for the other two groups. The SPI block's bits 4 and 5 are
the PL022's PRESETn and nSSPRST, which its TRM (DDI 0194) ties together in
the same way. The WLAN blocks' bits 0-2 match their AXI slave, AXI master
and platform gates.

v3 will explain each multi-bit group in the commit message, not just the
GMAC's.

[1] https://lore.kernel.org/all/CAJsYDV+PSoAU9qNyRoEKuFoc4oeBkw8b=vdcCap4Mx3dCA1kAw@mail.gmail.com/

Thanks,
Joseph
