Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795123876;
	b=GDM5HImfCv0lW51oucQjzNKi6qREml3yhCtb61/BTaYPEtwHTTITvopqGFEHzBYZt1DJ
	 OL65PfScZ0K0JoUt83iKQmUJdVp9Qvl0jwTzwSG84NKjxrcDfNg6oX5Zi+lUruiBeX9Me
	 bJWIh6p+PCRzFdkE4UbVDKGGV4MfjAndBvd0X+jG2hrDrObglm0GXofB3aUuaT4q3AXVI
	 FARIvRioQoIrn1VnOq2Vy98BdsqaAzzPURLdt1qnLHgVtkC4DuvgFZG4dOK7shkIGEbK4
	 13nv03Ib6jrGDn9oaYya3jnXYbtY1rVT7m7xMcXnzVlYlTGgU7XAUbKYeeG5O54v7uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795123876;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=hruHLRUy8gnh1Vnhks0wNz1gcOtf8ACiLDMpD5iWNyE=;
	b=IqhR5VfBpBUrwMgJtTrupOs3Gff5nLArzO28g4J/guQ2Sp1LSlpBhxg1a39fNigiS/B+
	 3BnBjYqj+UDg3Xow1GmMIgHoyP4WUFJEKDk7Md4EsQy5Py6wX7qQy70hsWbEu27GP2FUQ
	 2f1YEG/JiBKphjpfcVU9PwlXI63PklverpgNNKXF2Dr5waFtGD3zOdXVdvHGJpMZjEpla
	 e+dTd1VsBu4yVse+oINuUxr7L6VcupEBljPlnXZ6FRTK7w7CHVzYSOcnf9qu2sXYgUIDl
	 mJmW8I8c4mzIBJsXKWROnVZaUkikpJsYULMcVcmKwzM/ZzzX+5E97nrl4TrphWj+OTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092A8606A326
	for <linux-mips@vger.kernel.org>; Thu, 19 Nov 2026 21:31:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 092A8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cde1479f76fso153749a12.0
        for <linux-mips@vger.kernel.org>; Thu, 19 Nov 2026 13:31:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795123875; x=1795728675;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hruHLRUy8gnh1Vnhks0wNz1gcOtf8ACiLDMpD5iWNyE=;
        b=pcx3+31JJiG36cFNZZW6E38Rf6DJcParPHfAaJUCHP4EtNE2PYcsW5r8hWkbmg1mVG
         DrZdK7UrmeWSzK2jL3tDC6yKipHi5+feae0HL4t0FYmXV6LF5VHDe50e3qWkTAQXhI3V
         tM8oXzhGrPzOD3I8UzMg4sonq2TVvywqDpJdJOEnqJKnCn4DvkPzLEGCeTQNRc6MAS9r
         A4ukrG8r4IowYvXDteKLomCx2fh6dZXxeXEDkNIHZdCwRh1o9bxW/dTwl+PFLOL5uudo
         HgTsidT86wIXKNvEb3xF3d51bh7LO5Mv4x21YKwzmPjgoUKYz1g3vS8lYfDvFjWZteUN
         hTaQ==
X-Forwarded-Encrypted: i=1; AL+hErHqYWjVyDDdmyCoF07L6ZrxrxSrhhle13IilbUUcihLYTFEzIa5q3pzG1TOEnInx9uIVmCWGgMw6AHl@vger.kernel.org
X-Gm-Message-State: APuU4Z+gsLqL0iRf1IYaEXCc3G0ztQ9AcmAATLX+TR07pxVDV16yUQA8
	1k+7MXqc8DXRFasLY3OHg9ANw6r7S/WoDrpNyYB39/RgWxdx+EFuFy+qpPEz7NeT
X-Gm-Gg: AYBFou3uU85nnz5PvauSDaQNfhePPnRzR6YG1+sYcYYR58TPhHNZw9Q9wR47D96zXy9
	KjRLeT6R6zh8P4AYDv2h1OA4l2z6C1hZAqdRfKxD9I6+Y5Iehy7r86txbZmwG7KvVY2im+uJ39T
	iVAUWGLdbZroV6wE47GSIJVKfOnUTmAOvX2PZsHLVinRV/nezAfC4pRybysEL7KJVaRk2Emk74B
	Yhw2uTZB9+wshgYrRiBqiQ7tL4/cb5V7rpUdGtwqvdWZs6yN0LM/r4lczcgwHoCQnMNfzfzkyHP
	/2EGxejGFm7UElMLWE7Jk9iYgaNaXjH+PZ2qZM1szeLumgmfJUfA0F16CGXbr5hp7MBh8Tysq0/
	IyXo6TC9Qi7oOhQ2LbrVoGolhm/KUuvkycfddz1PqzufOtBPWTu5Mbzk446SW64L6MbXBcZq2M3
	oUboyvwBlj4tVaoCBea/OjXnT4IO+fchv8d6LALbnkHXu6bWHw4d/KiI+2CycSyocC6k8eb77z3
	JgIs4wYiE/CTvH5MRuXonAXNRqA3yd8f36enD1ZMdVHCf3BC8kFDRhmDfM3DfcCz1/mksJxolVE
	GF7G2+b2BTfY/NYaHCcAfAGITMzeLKEexVVh5IV61YLKjpdXDRTwA4YOGy/FgvedKz+i5GW9XzQ
	Dlw6+wM9WrohMLiZulZVoPL0ubxtX+SHnem8P3D4R
X-Received: by 2002:a05:6300:8188:b0:3eb:a961:e31c with SMTP id adf61e73a8af0-40148dca22dmr691021637.10.1795123875308;
        Thu, 19 Nov 2026 13:31:15 -0800 (PST)
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com. [74.125.82.53])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d0285c3sm316163a12.20.2026.11.19.13.31.13
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 13:31:14 -0800 (PST)
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1a8cc11ac42so325837c88.0
        for <linux-mips@vger.kernel.org>; Thu, 19 Nov 2026 13:31:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHJo8hCnAnlL9y4YRRA+eROPnp4FCeWMMmpls/6AfqJZO8k1qiViywR42IcD8mJZE6wUcosALFzcCC1@vger.kernel.org
X-Received: by 2002:a05:701b:2514:b0:16a:c6f2:60c2 with SMTP id
 a92af1059eb24-1b55689fcb2mr692433c88.12.1795123873153; Thu, 19 Nov 2026
 13:31:13 -0800 (PST)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-sf19a2890-sysm-v3-0-b07bc7833a87@telaak.dev>
 <20261116-sf19a2890-sysm-v3-2-b07bc7833a87@telaak.dev> <179511480695.279474.4521829214953240997.b4-review@b4>
In-Reply-To: <179511480695.279474.4521829214953240997.b4-review@b4>
From: Joseph Telaak <joseph@telaak.dev>
Date: Thu, 19 Nov 2026 16:31:01 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ6DjoKi9v3Bk0Pt7ePRW_yiNiUzfX1id7efK8i8cUWFaw@mail.gmail.com>
X-Gm-Features: AclHuK9xGZquR5VLNTlBltqHkPsM6MviyjZztqAp_KfvV7PyzlZVlXCSmeqvUUs
Message-ID: <CAPY4CJ6DjoKi9v3Bk0Pt7ePRW_yiNiUzfX1id7efK8i8cUWFaw@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] clk: siflower: Add SF19A2890 clock manager driver
To: Brian Masney <masneyb@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chuanhong Guo <gch981213@gmail.com>, Yao Zi <me@ziyao.cc>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 19, 2026 at 02:00:06PM -0500, Brian Masney wrote:
> Can this declared as a regular platform driver? We are trying to
> minimize the use of CLK_OF_DECLARE.

The MIPS GIC timer runs from CLK_MUXDIV_CPU, and it probes from
TIMER_OF_DECLARE in time_init(), before any platform driver. As a
platform driver, the clock would not exist yet when the timer calls
of_clk_get(), and with no clock-frequency to fall back on, the SoC would
have no clocksource. I'll say that in a comment above CLK_OF_DECLARE in
v4.

Joseph
