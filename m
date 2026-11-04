Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793823392;
	b=bjvWCwP20AJWdHetVt6DuEY+FBbQzyEIf6U7uO+MxgJRlk/VNh/hHVABmuHsJieAu1ok
	 00Eko2GiP9WvfQq12YkOPAFmKEmCqZlODejxpkMvOcveylORdV8VwWPaTe9236GpgplA7
	 JkkX/RH41szdkwTcY4NhnhasRa2ukIU1GoswnUxQat8Th3JcZEJ5LYucm3r1IBL+SLmd2
	 qpIxr++f3lhpIq1kKAgvWvkRD79YYAjfGs0rIdV0+K9TzevMAIOx2ja1U2Ew0bVaEUo9Z
	 l4P/Bkd2JMRJ2tfwhMgXNmBvFyI/DRUIFbs1A41FRPawAELxrQRMvzduZ5y0350JUtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793823392;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=foLRpBa47s9ruCMxuyoA6DXIF2wwXVPMOzwICiq0ito=;
	b=q0aWJQSef3mJOPFAW4b06khO0TNmOeoys5Yi9Pgc88DXosqk9HoHeK9q3lpUoHGGj0WX
	 B3UKDrIQxWfwU4kWOi9gAyq5NZquqgaj3m4hQqHIOsIJonbWifyG2QxQy2N5zaDrqzQ9a
	 lobxN7WVuDmDxiQtfbglzFKFQdev+TA55TLjqE19Mw1x5ONpUOu8V1SPKe/hmLOWMeLCQ
	 imcIjG31hTvK1Jg9wB0ChoGB6ll5KnIc/9C0mjtHP6RaPWpUXqPooi3/fNKvHtHWw0l5H
	 yLxWj/7bStDEt6zCDeuywDJjJ7UkkVa2mktV5Ptxp7re1+Kuy/8mT7NZo5g0JHXEn/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709946071A07
	for <linux-mips@vger.kernel.org>; Wed,  4 Nov 2026 20:16:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 709946071A07
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ae691283ecso543345a91.0
        for <linux-mips@vger.kernel.org>; Wed, 04 Nov 2026 12:16:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793823392; x=1794428192;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=foLRpBa47s9ruCMxuyoA6DXIF2wwXVPMOzwICiq0ito=;
        b=cRO+CoPMehOammincws+eESbi5N8cZXOLZjK5zX4rTKzBSgs0SbtWjRzPgVPS1LWZh
         obMQNkXLjP8NnDSbtG5HEfvVce1GQbVU1eTUzPJk+xWgPDO472futzUPft1h1eUtok3R
         q0dQUb7iSvGrK6t3Snc63j/wO4cdU4w4aYD2QR7cemOD1P8z8aS0lkA04EnKLzRDmyOK
         JF0Wxmiofk5j3y1B3D/EXrspiOvTXg+OYkP4k9rmycDv/EVEVkI+p9CRe2M9Gxa6yHuq
         vKLj5fU9GU8IrWSxoqr36+C5QOiL81P45nNi1gemXBP296rR+tWVzrrsFGy8com21i2V
         CgcQ==
X-Forwarded-Encrypted: i=1; AKwUvBz6a3yau32FO/cUmYqAco0kt9vSrKZiCNKsU/pUdr2q9Y91NBBP0rGMdEoC6xkK1RYg32JMr6Tx6kuZ@vger.kernel.org
X-Gm-Message-State: APuU4Z+PgwiHDBsFpHU6wLvBuNoRnLHmkalpKBt+3mf8I7vN+QwAtDDM
	XZ4mJd4+srBbqrUPmE4r7W/YOk7VW72A5eU1EYbWdvs7198uRkH3twNNTof83aG1
X-Gm-Gg: AYBFou1kx5KWRaEMYTb92KisNptuC2GISAX5nHpkhtTeJoR+Ykg5xBUz3qvn8EbhbGO
	6ZsLdLFY+/ZjdfkaU+RBh6IC1hgpqEaCc7zZUEnc8I4ehFH1DcdjKY2RsJxSpmNkw3XCmcVz1Q2
	JsfHRv0lRTHo80dGOa5JIoyvyCr9DZNQbvwdwIfiIE9J5B6X02eWhgdUbjrlE8PdJv7zm+VJw98
	0Ugkdp9M1AI/3Ll5G0dNa0BMj7Bk63S5PkZEkKXJQQTVuQMwjsXCK8+W+9m4UDfpnbNK4N1lEy4
	GhQqJ/lCfrh+XCWQChU4u6mKCNG+Bw+mhnCZqrDPZRulMABaXKsat5DOr+ZtBOVYEd1hJktlWY9
	oIg+5VB5BUhdLrWs2cI3zhbBi0OdP3YWBjgF3r2j8ADMkdxg9bJ6FtxYBiie+KUqhd3GD73zTtg
	KJ9UvU7fxHKbMecekFJHDWyQ6IrsSGehOLw+QTlisyinzB2VTdrwyURj6a/UC/GJNAdWXDk5uvo
	flrsRgqrQjuHMOqOXCKXmXV7EuBMNDBDQ5iXlFuiRvQKTcS0epvEnncOkK4zpUEwpGxCthU/wvz
	PgLmyQivzo37R19yjYH7Mf5w4mq/5rlG7mb4KrFqNp4j7nXXc9WVP3lO3Bg/9miTqxOPbFxYvsr
	1vxSKk6GuxgVEGMdfdflEN33AChMFtyDlz5JvAOP31u4=
X-Received: by 2002:a17:90b:3b8b:b0:3ac:b3c7:de04 with SMTP id 98e67ed59e1d1-3b0afc7c71amr341392a91.34.1793823391798;
        Wed, 04 Nov 2026 12:16:31 -0800 (PST)
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com. [74.125.82.177])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b31d2b5esm430140a91.15.2026.11.04.12.16.31
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 12:16:31 -0800 (PST)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36c9a93a1abso1049821eec.1
        for <linux-mips@vger.kernel.org>; Wed, 04 Nov 2026 12:16:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByw7d/i6pKe/E+ztzJN6PIm8P9nvLeO48h+FXWZp11X65UvChYugxehA7s6/nk9WNBlCUzPvgnKvhdl@vger.kernel.org
X-Received: by 2002:a05:7300:dc10:b0:36c:a1bc:6102 with SMTP id
 5a478bee46e88-36de0488bc8mr1203042eec.0.1793823390961; Wed, 04 Nov 2026
 12:16:30 -0800 (PST)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-gpio-v1-0-45e463c48728@telaak.dev>
 <20261104-sf19a2890-gpio-v1-2-45e463c48728@telaak.dev> <bd0d89d16c9effa60088131aa81b6d5786738c0c.camel@pengutronix.de>
In-Reply-To: <bd0d89d16c9effa60088131aa81b6d5786738c0c.camel@pengutronix.de>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 15:16:19 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ76e+ij8zPg3kEi_1qNt1gqh2PuJRCTcvQghsAHr2Ft2A@mail.gmail.com>
X-Gm-Features: AclHuK_OSxtEYlXiOHps7a-cMZJsR_Cw4vnjS7VT6Pg5ApAUwbgB-aNStGUXOis
Message-ID: <CAPY4CJ76e+ij8zPg3kEi_1qNt1gqh2PuJRCTcvQghsAHr2Ft2A@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: Add Siflower GPIO controller driver
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chuanhong Guo <gch981213@gmail.com>, Qingfang Deng <dqfext@gmail.com>, linux-mips@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Qingfang Deng <qingfang.deng@siflower.com.cn>
Content-Type: text/plain; charset="UTF-8"

> Consider replacing this with
> devm_reset_control_get_optional_exclusive_deasserted().
> rstc can be a local variable then.
>
> Don't use devm_reset_control_get_optional().

Thanks, v2 will do this. The binding makes resets required, so it will
use devm_reset_control_get_exclusive_deasserted(), with rstc as a local
in probe.
