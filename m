Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792823893;
	b=B30HoSb5vz9jrbJ+RZXs99lezyKmz6wY2hib56EvE2SwxOkx+cqIQV3Q6bIlCJrSczE4
	 pO+GJSO4AcGSy3Fj3m2S/q/nVes0SqLFth5xPidaJ9j0+Yq+OC0uGY91fqnMPab7pJvyG
	 sRGXFzN4oXKDFTema8+0EfCWwuR1RTiTSWzVio62zILcAVzGZUhytau0LhoJ9fU4JA76W
	 Dc+pQuz1Rke2Coc3QCHEPyVWRev6ZeNj7lfc1LsFJ1DBu4tSQHTg9xoA2VbuW8v7QIqLd
	 1iTLs0dJs09V6Yvngtv9y3Ix0KV542zmt3qrsMGznrmyG8LiJV+tGYoV6I0VqL/pkgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792823893;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Eo/uDup4KcaVJ1mR+rT1i9h2PRHKpBooRZboT0Neq5k=;
	b=uceFIG2OxLHwnXtgVJk3odMtKedKa6MXSybcVXN2J0wvS2sWrQyttsb2pleQYQ/oRFk/
	 Np0G6EVEl55Y3W08uBxt1XPRDU/pOJIIwJjiws112QVTZ4A6pQQNSMdD+N2BqOAMCJzl6
	 a8KZwJo1V1pNByM4nvPhsU+LVm8imclGvzpzaXWsa2bsp6y9oJwYnJiXFhjJ9BamS+ca5
	 r5r7jLQp+pSYVQ1DtFm5+yH7KtKq/X7bBbG9U/Cf8OurKGMc17yYkozxarSATjLIoyoxC
	 GZf5jgWn3hOChFFSpv+ipRAty2RPRgpYyGrkD+fUV5D+ru4GZ6oSVgy1PdRxu+GAK8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JSq5usht;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DB6606A320
	for <linux-mips@vger.kernel.org>; Sat, 24 Oct 2026 06:38:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2DB6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JSq5usht
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so9680205e9.0
        for <linux-mips@vger.kernel.org>; Fri, 23 Oct 2026 23:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792823891; x=1793428691; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Eo/uDup4KcaVJ1mR+rT1i9h2PRHKpBooRZboT0Neq5k=;
        b=JSq5ushtKCOp88C6tHvh//K5tNcwrAAwAHXEk/x9OnSeJ/X9kmdoR7O5qQ51NAbMXf
         PDaoU5tQ3bQOy7RkA2Xe7tSu0TgTxjIWtZtnmhxMaxVIaDhauDuYTTPB2D18kW6LOa3a
         copeaz0+6y2herGTsVGoBl7nU6YdW+c7qmbS+/scTzCXantPYa/AvOTu/rTxxN54c4qE
         snedA8EKU068xKbI0cT9dOgtk8ora/IKMl1pQ4flfYz4RbMahCMzNBarV6gMV4Ykz0ML
         4HPLYq1EZhhqGGrzUvGIvCDclZGXCB3FeqgdzY8PTbLg491oCK9Z7fai5d1OPScoiC1j
         2m8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792823891; x=1793428691;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Eo/uDup4KcaVJ1mR+rT1i9h2PRHKpBooRZboT0Neq5k=;
        b=uDSfYee+v67jwNcgwc6Suxee9OsFc+a52Kot8xqLTlZirBge38Q12/Yg7g2x18CJpW
         1Z18tjmmR6ijQlETI8etqJz1vL5E+kgUJitppzgjbBLIThuQV9c9glXFQjusZEbIuT1p
         BivtmAq9AVipaXEBhbdWM8yfYYLXG4Fvvxuz2HJoF6rVkAlaYOu6xJxQxwwmyhT+dDqS
         T8gZWov/t5Py3I8O/p1HQHPXza7ObiIRfrNhwQvcdJpztjXGywi4d3eAlgJIAjz4fLr2
         YgV7LEDTaTb/HWjARHyUjH1JX9LIi1Mis14crnggqTPyXlrGU2AME5WwpXWpfsg9P8uz
         L84Q==
X-Forwarded-Encrypted: i=1; AKwUvBzLsRoYe8ddkthneS5bOPO/Xy91ev8a/uRD8T29pkwM6L7fc0f0O1zIY6sSW2nkvB2hwoMt9iIkAmre@vger.kernel.org
X-Gm-Message-State: AFq9FYJDuHbE3fxJxYcwuwS9KUVsjO+n+BK4iGJQPYUUdCOOUDSL76pD
	9feGyyeaqZcAHPoj4sTgUW9MPfjquXZplofQ7JD3hNGCFLwH+vM10gHM3YH3hg==
X-Gm-Gg: AYBFou1/7eoNZ+qNWhiAh8JAs0ZcmpYR06V0Yuw5713zC9KMTSJfu9XHo+3fzX0OOfW
	PcuT/wBvR2W8A6y4Sqa0t93NWGsv8DGR9jCEXZyMLLkJJICKOZs0Wf6PLMi0KKg97j5OWajzF/G
	u6eEmR9pacwkubbMgty4Up+qvOF3eL5B5ia/FRg+OdtCPkI9qXPpuC5xgnCkutB0pIzRjXYIdFx
	YupoCkJWZy5ajWjgbUSeNgLCddbHIGtmpKTvKfagwj+IEWH0+E12Z/HEW9KkA08C25lrvd4Y33V
	raS+SuVbxvuU8fIPX3SdgC36wAN0KGrmX8/YUJQ8vMTvGt5j9oPel4PJX5WH9Rm++Qyk44uUQ75
	+MrI1XjJsnQ2yrjhHd+oLN0DsKXmm3szoXW4d4G1QFu9ZOKrWVK1dWlGmhlLulraG05NZOuQ2cw
	Vn9JPEeUChant67B3NOJgoDsM6s2KD2eF9M9f6zg6nVMEzXH1DVMk62EP85qDigJHj557XgBpaB
	pTmJ+71dnLwoXlKZsUTP4NylbYBhTHESHVTwLf3ybZQJrFEwL0IrDcE0KKW0U7aE7sk42tnssxP
	+Y3VeoXAv/CV9n2nl9P0F4qO1UMsXA7eKSAOlgt9a/pyi2JtCeGeTD44DveQFxwfbb0OhzsVoxI
	mZ2abRd9aLl7jKdWOniT7EjtVvmCbshgqsLzT+Dvd+NY3YRgAklV5VdxvsAoarvFWrFciVrqfup
	gSTYMWAKlgf32ye3dh1d8oVdFsf/Kp
X-Received: by 2002:a05:600c:5308:b0:4a2:86b8:7e9 with SMTP id 5b1f17b1804b1-4a35ac9d077mr14744425e9.16.1792823890868;
        Fri, 23 Oct 2026 23:38:10 -0700 (PDT)
Received: from localhost ([2001:718:1202:45:44bf:6db8:6c32:23e1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0bdd59sm22278075e9.4.2026.10.23.23.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 23:38:10 -0700 (PDT)
Date: Sat, 24 Oct 2026 08:38:09 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Olivier Louvignes <olivier@mgcrea.io>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul
 Cercueil <paul@crapouillou.net>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: adc: Add the Ingenic X1600 ADC
Message-ID: <20261024083809.000026e5@gmail.com>
In-Reply-To: <20261024041357.34346-1-olivier@mgcrea.io>
References: <20261024041357.34346-1-olivier@mgcrea.io>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 24 Oct 2026 06:13:56 +0200
Olivier Louvignes <olivier@mgcrea.io> wrote:

> The X1600's SAR ADC has four auxiliary channels and none of the
> touchscreen or battery engines of the JZ47xx ADCs in
> ingenic,adc.yaml, so it gets a binding of its own.
> 
> Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
> ---

Please use a cover letter when submitting a patch series.

-- 
Kind regards,
Joshua Crofts
