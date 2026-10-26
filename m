Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793024296;
	b=3fKiiQt0A6oS/mPE/+MC70AlV0lK/OU9alFc5N7Z7j/HCEp+DSdcCfROcD+Ah/nrFh/z
	 6VPrnZNX6QS7mTpHPV9Q/vWqEaI7eWaarxdcqEgQTKo07wEnyhNmbvFAET1Tq0+c4Euyp
	 xCcO7UzlloBtnMRBBZPvfMQdq7pntIRHhcM8xDPGBUkTUegp3c20xUtIj9kw9L+XzGyCa
	 8PyXVKlgPp/wMHSejSrSFzO1jjR0fbF9LcnGab95DIB5t/vAhGOGqea/3Ysi3UqdTeRCN
	 lxZc1GN6mSN+hcUnyOncqRrMAYX3bnx6JZKW2ayo2UrcV42WTEqGsY9RriI/tmKHfoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793024296;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ifM+PXldux5sH2cm3CGnH/RRo/Iq9tlkwFAZTBnx4+Q=;
	b=VsCxjjMoX+DIQ+TfGUBeIM9et/MSXzf5a4+QMfD6lgSWNJR7R239RRkts4SfNn3xMfxo
	 W9gADjLOWQhQq3Y0tUvcLLLXmS706lyEjdgQndH3ydvemxKBgAOI7Lt92TCZI3CAP0XbC
	 dQD11FEOqRVVF5osD7s6Hg7OLsROTrSpXAiti59R3nLAjm5hteYm6UPfso/R/TPG/Px7K
	 xT7ACST0YsTbdEyxjHzSv6decLeY7mMZZviJlAH5c8ofL+/mWaTCjFDDRT3xotmI20eVD
	 1fpDcVD3Ey4MT+ucIZOwTUAl2hVjt9yWkCjIeMsT947M8wyRNdXFJw6rLufV/o3tv7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=arAe2ryG;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45C6606A322
	for <linux-mips@vger.kernel.org>; Mon, 26 Oct 2026 14:18:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B45C6606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=arAe2ryG
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so11480715e9.0
        for <linux-mips@vger.kernel.org>; Mon, 26 Oct 2026 07:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793024294; x=1793629094; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ifM+PXldux5sH2cm3CGnH/RRo/Iq9tlkwFAZTBnx4+Q=;
        b=arAe2ryGITQNaEOL6zbSb3LMwQmpaYIjaYHVlzJt+RwVkXz+ibO9s+qLO7YT1Dexse
         wjEb/ve7fTopNBXX3YVni2GCZ+uWleeRmGhQOxUpH0OpM9W+4VuvjPijH+D66GQeaCKl
         trLGCt7AqToC4FKcJ5oXvR4QIrkTuGShxtajFOcIIVcNVL0KlAw3RsgRa20lHE7EMgA+
         pDpSpHcxEMQvzDhCfFJDZ5IP45budIblqKHrLqt9Fj8lrT/GY0hw7SfxT1pBYhc+6BRk
         wZ1KYLk53bpOQLyS3knUrpi7z2H9z66bVOjWZg97H07dhGu531lOyOGQ571VIaKoWRSY
         ImOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793024294; x=1793629094;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ifM+PXldux5sH2cm3CGnH/RRo/Iq9tlkwFAZTBnx4+Q=;
        b=XBzjzgx3TWwAJxO7kBFc6qmCgS32agmFlu4CIF7r70YGmSQbMIe4WYi8dRObjFcQnr
         C//HNeT7+IEFYawWF+W+sBg4AlDzGyEwJk9c4fL5MU6tzE9f38PP1HGGtBREtHgAj7QQ
         vA+lz/9NLHNb2S4R+DT+/kERlOP+ROF6H0O0FVvdkqCOCSjk2wjLNhEtHOeL3Ru0Hw0r
         b9sF2i9Rp4tRHf6QWnj6LwgwfAvt9UXsLhLOnlju7TMUJbrwZwm3vZEuNuxxlY67gD14
         Cs8D//dlOH8BL0YD2yk7zcKCsXnXCJyyV1qqy/EmyIqb2Ukxt+41NY0FnxexYzp9qbEC
         mYqQ==
X-Forwarded-Encrypted: i=1; AKwUvByCVu6M+7+K0IZ3BIT/AUIgtxU8f0He42DKZdeJoYwb0hB0fwAMOLDGfbyak0acgZcVEFqe7yBO0kPj@vger.kernel.org
X-Gm-Message-State: AFq9FYJl5wTlRdDl38RtXFveDw21htikhYn5UD3msvxMsh3on3+XdNed
	CFf467+xkhYIRbnN+JTBAiFLIv6gM5NCDF4HZsjZ6Dk285f8y5QudpzC
X-Gm-Gg: AYBFou2gJleUjJo9NanT3D4/zgtIGVykHlWbN57thBQMiSe8r0naNQmZxjxusWE1o31
	nCtVxg6eJUL/IicV8NHcc4iI8w9xH1MYqvQXYT3LDjfxqp8Ztz4j1BX1vUMuhdEdBDjEvH88NKP
	UBbWtF8XWm/NWFgEzGD83T9idXm1MBV2mYewpuwUiz2wdgyXdgGtSr1wZHQi6vERbdLSi4DEcEF
	eIDPAonwNPIz8JGO8C9uaL10Pk8ZsRQWHhUczfLs6ZrqZA6QArrk3Nbi9y6W218KmNj/39efFIX
	UqZRuquyT/RYCIU/4U/VvsnYLrqb+Y06gRgMNU47svyo4on+a/GgbuwOvTunqrjkhaKiEjvFWKM
	kGNcRRO5yOocltSmD5EGUkNUhRv2sEIMD1HoITdSM6AXKXiuxcW37PKPQv0S4QD2NeTueWgzjrk
	e5PI/OteJm4idA6FE1tOjvGtC3yIxq/XAN6HNLhm0+VEA7YltfJA4QmbOXNsZwhnhM5/qDfhZyx
	03HZmHqTbigdzxjJ2+J3rTwR/4Grn7EXy0gisja2UsPR+xoG9i98p22nQ/sB5ZaYqzX8nCBD9ui
	3ShrebFMwu+JabCPd5oH/WT+sktdJxggCHS8Qrqx+9e63xvJFPY/TAQWLYjGzKcfx7qB3L7S5X1
	12LTUB47sGlxoMLhffwCi7PqcZ67EvLz3lP5Hm57qoOtwDUrrSBd6sTdm+WV1QL9OiS2lU9JSqF
	6rWjxaNhvIJLnwLPZshYReNhquumZ6AASeqPXN4KwwKaGAoGD27YPXPFo0WL3+7mH3ksmsuLOy0
	/PIHoH+0As=
X-Received: by 2002:a05:600c:a318:b0:4a3:5aee:2c25 with SMTP id 5b1f17b1804b1-4a35aee2cfdmr95663085e9.31.1793024293964;
        Mon, 26 Oct 2026 07:18:13 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a58a0e2sm246428935e9.13.2026.10.26.07.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 07:18:13 -0700 (PDT)
Date: Mon, 26 Oct 2026 15:18:11 +0100
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Olivier Louvignes <olivier@mgcrea.io>, Jonathan Cameron
 <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno
 =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Andy Shevchenko
 <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Cercueil
 <paul@crapouillou.net>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: adc: Add the Ingenic X1600 ADC
Message-ID: <20261026151811.00002233@gmail.com>
In-Reply-To: <20261026-hungry-masked-anaconda-7fadb6@quoll>
References: <20261024041357.34346-1-olivier@mgcrea.io>
	<20261024083809.000026e5@gmail.com>
	<20261026-hungry-masked-anaconda-7fadb6@quoll>
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

On Mon, 26 Oct 2026 11:50:44 +0100
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On Sat, Oct 24, 2026 at 08:38:09AM +0200, Joshua Crofts wrote:
> > On Sat, 24 Oct 2026 06:13:56 +0200
> > Olivier Louvignes <olivier@mgcrea.io> wrote:
> >   
> > > The X1600's SAR ADC has four auxiliary channels and none of the
> > > touchscreen or battery engines of the JZ47xx ADCs in
> > > ingenic,adc.yaml, so it gets a binding of its own.
> > > 
> > > Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
> > > ---  
> > 
> > Please use a cover letter when submitting a patch series.  
> 
> It's fine for two patch series. Please do not make it more difficult,
> than necessary.

I'm not trying to make it difficult. The cover is usually a good place
where to describe your motivations for a new driver, plus with a cover
it's easier to pull via b4 and Sashiko will treat the two patches as
part of one series, not separately.

-- 
Kind regards,
Joshua Crofts
