Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795652336;
	b=u0wMIk6rNtMdO2214DgQ7gONRsPl4o8T7hPJWQs9A++tcOZKXpuopVrKsx0BCJdAPgs5
	 gkYmJ5I2575K4HqFB9AW/UUHD8E8vluss25Wx802YoMZgWah3p920ErP9PU8V/ulpJ+c9
	 4Otn/XfC3jkOANraIm3Jlk38nq9ZhbFwvm1aQII/BdqfOvJ3tyHKzb0eGYSTfgW7QHFMT
	 BORTuIGlOHAyZFVNAfv6jyRgHIJadkR7+y2PRARBI39RlJ7WheT4cJS3lmKuIWWWxbVTp
	 LWc4fpAIyUVRMhdmn8uKVAa8J59I3JGlT7+mO83YSTj3IKePCnfyugDRP6ukgB46gfQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795652336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=hs+NtO3DvgsubFp6mHbpOQTQRimp/H6VNRhIAEyqZUM=;
	b=r3ZVk9Fux6Ny+zoq9aBkDfKLymHeYsAvbFxRmDZ9hOyQlKuAO8e/EkppB0GsH17RpLCG
	 XJ6vzywqhSdOT3taKEb04BINjr5zAl/uiKb5uhl96MHgm7J+MphgD/mNsMDW4DAVCRcPe
	 3CKHKBH15DO3kuwLqNX4suHmKMIDbEY86wHng8lK5s6NZg5SxiAK4g7JNLFaG4gQanA/D
	 fXs/gQlE0hxgJ/W3m6jyRNzbGetuysgfRwbTNW4qW52xoGvkWnLJVX1qRZynlMaz75r/C
	 DsYRtgw24ykqubzVNrbzHz0DGqsiNHiT0qtfjA9zVD+Gxvs/IvNf4YCnyiEvJVtELuw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UycSEH8Z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328D4606A323
	for <linux-mips@vger.kernel.org>; Thu, 26 Nov 2026 00:18:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 328D4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UycSEH8Z
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3869f03af6aso5596598eec.1
        for <linux-mips@vger.kernel.org>; Wed, 25 Nov 2026 16:18:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795652335; cv=none;
        d=google.com; s=arc-20260327;
        b=sRe6broopnHVtMrjkkwLyYulvRHYYXBA4nNkx3PrtMJ4kZjmo5g+QxMy2OfOmMxxAL
         vTxoKLM7aPpwqnFdhaZ777NcDdcFQC5uYjydWF/HEVvAloc4vdZylh76a9wSEHxkzj4b
         XIlbn/53BpXfOOmLRmhbGN5LoahuwsyTpgDa9Ih/4YbuoLYFSqRcnGA0eX9LMPVKgon/
         h2GGSmSOx78f4w07FeZcwo/tjEDBdPqytGEio4gi+iOD60j7y745qJ5ZeCS5ZpSnsePK
         NA4C60Ncn52PCMj34quH9IGdOP+ow5+qf1sVv08BiIn7F+ICaDY5g9O2ZCiNkHXbdBxK
         A/6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hs+NtO3DvgsubFp6mHbpOQTQRimp/H6VNRhIAEyqZUM=;
        fh=j6O/pioXqb5RZldSo5gacLyoxgkhthqE2CVVerRyTGw=;
        b=RL/r5ue1X08v10sS/s8kQIBd4evROKvSitVwtPvdANUlB50Gp+1BrZ/OZNlzaK+Y8Y
         NpnURxgwiDlWsbkJfpNoBW4KZ6M2Suu4UBRJmi5XtfJWyPt09hzMLGi7Ij1E68Ti5ZpD
         oIpVr/ODiyUOsn35S5pfl/1DxfbEG3Z5EFzHtj1vyFuzObKhDq0xv/tlCl6NaYCaKcZN
         4mxS+d3VLahLGlzEMTEQlrt8JTauW03ityKeA+eAUDbXURexJFHeLJe7YPbVXwNMiMGe
         TMyjcKJoTz2zTUHxTxeQB/J4Dz+MnUJbV8UGJ+ECqh35l2omC6J0fGKnhyIHE9x58FIE
         h87w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795652335; x=1796257135; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hs+NtO3DvgsubFp6mHbpOQTQRimp/H6VNRhIAEyqZUM=;
        b=UycSEH8ZwEGmtjAiiKZzzKPXsvhkj19uhXggKtWFXyWu2vMQo/JLUIKlQXD5cthNlO
         yEXLjbJv6yoeAFGBm9yrdDkeTw80TluMS8qeQq/+4Y/doq1Zhy3mLG+G/7vKG/i1QMxm
         a60S+vfnU9kGJgD6aGyUWUIkDYgtH1FdaBtK26wX9GPDx2TyU6LnDiMqXFngG6YHIfnf
         aEM0+bzuM4kym/1WgUUX+UGk8aot6GJXfeG6H1oxiKeeKUQ7WS6seKR4HU0DJbV5OyG1
         6fcMNAmWFPOPbFYJNshMHcz8S6u2AtwGpOOh8eoj6drSkdutfnIOOOZBGwJMfG0+KR7G
         7E3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795652335; x=1796257135;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hs+NtO3DvgsubFp6mHbpOQTQRimp/H6VNRhIAEyqZUM=;
        b=iOM8hvDk+6fsIwzNKzc6VIqC2uYRQ1XWEZ4DLfc3gZiah46AFAWmrWUehN9qFlyz7U
         DEWx/4onuqwHcpQQK9bPYWkVrYFK1Mr7ZiAGvlTFpQKfuwdP+AMkNxVnIv+Wjlko7mAr
         4CYXjl6jdB3GnAMYUtmffToOz/IE5Uq/8g7kA5cIwV+D2itqW+PHm1+vaal4vj+oG8JL
         qtjwtb3u7xW+CXJ09+u2+rWbH7zyD8nue2s9uGevGbF4eaK9BCpdwHmsL9KWjWfPjEEU
         DRoMnxon8s8vop6/6Lrornlejm7XCnsUUVXFJAVaOBuYJqVnFZBEMV8yQ22zHw0vLwB/
         //Zg==
X-Forwarded-Encrypted: i=1; AL+hErHakEBsJOxmkZS0U709NfY83FLibzchNh8yhV/Fy6HBfc10GBSkPoy/9DdbtqVTpcf1L6/D4nt+Gkk9@vger.kernel.org
X-Gm-Message-State: APuU4Z8oXB6MNi+HjEZOZDTTBenAjDtTxvtv0bl5EllBL1yfKld+JtH+
	GDy16DYrQIyF8LgPik/38fZldKWo6zo67g9Ib+h5LnIklBIr983MWbNv1rAO+lSabIL441zixq6
	O+I18bVdE5wcVZZiakEALZuo/lN1grLc=
X-Gm-Gg: AZFdTZcFiYiu+c2xpxGQF9ub54zt+lIrxT2nOSZftxVzjkL0Fh1bSZtt+HPOSBbOyVF
	mj388QV+gl/WyUPLwackFpKBqx4cqDa6/lZ9seVTvnIrZT6ZCW8/3a6rL/L/hhPRzPbGEUybzOX
	GJxl9/HkAuiHeHm8JuVy7KxSdFDWGS3wQXMOaJ8zOXOKVzSoGPVjt65w9FUkfzRBR0/vRHEaMjg
	2NXD5Ia/ICJvM4HtBbpLzcxIinORzFtQxjkbWmqxU2ycaNQxf/Oya6S9sYLgz2fHA4UObwoKbnO
	8/CvFekD3VBEY9JO4rXMu8PiyfY6DlD1fQDNPtM1F7kJBCnLIl5j5HGTySKYFPThOeeMU6z8RYD
	UmXMse6ZjuHLDkJASy+rjkfzrTj79kY0UQT/aB4U=
X-Received: by 2002:a05:7301:4283:b0:386:96fb:28c with SMTP id
 5a478bee46e88-38696fb2022mr18962402eec.18.1795652335244; Wed, 25 Nov 2026
 16:18:55 -0800 (PST)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125072026.2997493-1-prasanth.r@lineo.co.jp>
 <20261125072026.2997493-9-prasanth.r@lineo.co.jp> <84e1cc8b3977f011950e68ca69c46dff1a395175.camel@crapouillou.net>
In-Reply-To: <84e1cc8b3977f011950e68ca69c46dff1a395175.camel@crapouillou.net>
From: Prasanth Ramesh <ragaprasanth@gmail.com>
Date: Thu, 26 Nov 2026 09:18:19 +0900
X-Gm-Features: Aa3M54qYngOgeBcgTcKEBPIYWY5OQaxOihLdYD94YpYTWZ1b5b1X3H2CZvSNV8c
Message-ID: <CAG7eodE36AzthJZmMhTTPn5BHjD_PFAabBn=yiyVU++gAbDEXg@mail.gmail.com>
Subject: Re: [PATCH 08/12] rtc: jz4740: clear the wake IRQ on unbind
To: Paul Cercueil <paul@crapouillou.net>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Support Opensource <support.opensource@diasemi.com>, CL Wang <cl634@andestech.com>, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, Prasanth R <prasanth.r@lineo.co.jp>
Content-Type: text/plain; charset="UTF-8"

> Should probably Cc: stable@vger.kernel.org then.

Will add it in v2.

> (Your family name is R?)

R is an initial from my father's name (Rameshbabu), "Prasanth R" is
how my name is written officially.

> I see devm_device_init_wakeup() can return an error, which should be handled.

Working in v2, it now fails the probe with dev_err_probe() suggested by Marco.

Thanks & Regards,
Prasanth
