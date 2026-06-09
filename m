Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1473FE348
	for <linux-mips@vger.kernel.org>; Tue,  9 Jun 2026 22:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781043958; cv=none; b=t5aG4B4PeIKDeXgM6rbBXF0gkhr0+LMh85WdNLhk6PyQYYKWG11tgvdgv090COOt2WFlWeEFVnEBjcP5NeB2Q027W3eiV2vj0G+5CHfU2eqkCN/a7CdYh8jvX+equ4Kefb4R5DqUgYPqF9pU6xrZaTrNRHQ5uVutVC5F/rUQ/rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781043958; c=relaxed/simple;
	bh=gC5RijoMreJ37E+ZXnO6sSCfWOZUThbmrEidBKcTv9A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=O6mw5X9aQkNIQ3AMWtSm71yMIj3+5VaX4tZrLiGYNgZdiYFgDGP7b9AjDycIJxzjonwIJtRX2CBpo6TPck1BiJDCT4RJEarSKvWSyICbo88eZAsnjyp+LfJ3cGb7zYFD/a9eAIN5y/hJdjdg/QuHIT4nqVgBMaVFvttE9jlqTpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Ckt5g5mh; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Ckt5g5mh"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-36bdda53d99so2639957a91.0
        for <linux-mips@vger.kernel.org>; Tue, 09 Jun 2026 15:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781043956; x=1781648756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6D7duqRcD3fdsTRow2UhPRWiLjw5TIDW3U11ZLjAtzg=;
        b=Ckt5g5mhS8YR2cizTWbJ5Fwk8gGj6VebB+0OEJgvf02706OxaHIh/MLoWUZkdc8W2v
         tDVO9ou14uqgirHWrZKF4TT22SL8Kw6c9cIfwgHoNv09ym9tEccqMSP/b5lQeWoqDES9
         4Y/1fE4bs5q1c26wMjvtkzwBbmD6R5ZssJo+Ql4XeIs+Yw9IhdJtj3WObSFvTKV2NsRh
         KdAHyJOP9ZzIAXpBIl9bEt8fkARYApQC8HuCBb+LFcyPHM7jM2nhfg7jU3w/egVF/fFg
         eqBE7VWfKHsswmA0XGrVNRgAu6OAU+Z/4WuvEPeIm2Pew6bt4mI47RFHA/Njj5qWoKdw
         N24g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781043956; x=1781648756;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6D7duqRcD3fdsTRow2UhPRWiLjw5TIDW3U11ZLjAtzg=;
        b=s2s9xpNInJQBVUFZP5mallNPvhu+COL7lwrRJwd/JSJ4zbcf4LijQVQmDKm/k1v89B
         n0vhR+X6BggydO85YrO78AxUJBeqo0LnNaC+Sw3t+YYr467J5HOwPvJ/Zjuo3qVaCgID
         3gcNuNJ+MJstDeBYzqSh7OibZQJUmI1CmOjGwTyLpSzhWRv01pnamZNAjCLia1cCilV5
         NME5C1IOA0mysLAPJvkRNBhNJpyuew8DTfSc5M4JkUSbRI7kNei8fb8K1GqFFo53yL77
         6Nh3SDDTP9wlrNsJ0m3MhIJbT22BF8RiYMZh1ugw+2kY+djdzdam6xK1xNh2mHVNM12v
         zXtw==
X-Forwarded-Encrypted: i=1; AFNElJ/QUJlC8i/nXyNxUIUFAQddVKQAv/U0pf6ZC11mKNlH7LE8uOsTbVQGcedpjR/L31FJKZtZJ7Gog9vm@vger.kernel.org
X-Gm-Message-State: AOJu0YxSfHTl4WyrdVME7nCIUuGi/WuX6lJCZGbos/PVhL3OnzIkWzij
	SeWzv++ElPLfLInmfb4AgZNQ384xasQ4TblR2AXY3S59FMMrFlJ6t/3Df5CEP7JWgl0=
X-Gm-Gg: Acq92OHSpkhtCuv+vWB61ceKuluCdN2axFLVG2vekD2lRdwSACmknQfcLfML9H/+6dP
	VJlxp7f6S2eg45ldMO/brB70gk8q4bDvxC3x+i51p3VQxkPWPN0XmtNq3nrpz8s+o4ToaGjEGUW
	SBn3Daa5tXQgMrH4AI3IZqoOAW3h16Qrk14+r1Ek4rFevvcIIsoZjFPC9tIggev7b+if2Eb6udu
	TJy9FdOfRRAsiiulGfFGZEK7i7NicMtmYAfp7VQU2wSb37IdDR/Up+ieriiySOJbC6qdFQh883P
	KNm1YHlcDBp/FaGHoGxlKCsOZ4VCbmsowmfl9qQ7vf35j7tekk9mMLTG+3+r467024WJcbj2t2t
	OoVrBtMpGppqNJnvGfx4x5lNisvuPKoeTqcTuv0k3OaCISCX+q+NU2fcLvhuei44/YREDedn9VO
	9IChi+A1iLkVQzeQXpCUBR7Eg0WvSPz3c=
X-Received: by 2002:a17:903:2381:b0:2c2:27be:39a7 with SMTP id d9443c01a7336-2c2a1c9ac2emr57718625ad.29.1781043956535;
        Tue, 09 Jun 2026 15:25:56 -0700 (PDT)
Received: from localhost ([71.212.202.210])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2c164f6e2adsm238181875ad.5.2026.06.09.15.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 15:25:56 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
 Christian Lamparter <chunkeey@googlemail.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Matti Vaittinen <mazziesaccount@gmail.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Jonas Gorski <jonas.gorski@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 linux-wireless@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-sh@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-leds@vger.kernel.org, netdev@vger.kernel.org
In-Reply-To: <20260520183815.2510387-1-arnd@kernel.org>
References: <20260520183815.2510387-1-arnd@kernel.org>
Subject: Re: (subset) [PATCH v2 00/10] gpiolib: fence off legacy interfaces
Message-Id: <178104395573.234140.4413143072350533512.b4-ty@b4>
Date: Tue, 09 Jun 2026 15:25:55 -0700
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Wed, 20 May 2026 20:38:05 +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> This is an update of all the patches that are still required before
> we can actually turn off CONFIG_GPIOLIB_LEGACY for most platforms
> in the final patch of this series.
> 
> I originally posted this as a series in
> https://lore.kernel.org/all/20250808151822.536879-1-arnd@kernel.org/
> 
> [...]

Applied, thanks!

[09/10] ARM: dts: omap2: add stlc4560 spi-wireless node
        commit: c5a0ac76b364bbd1d4fb7e440edabcd2a369343c

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>

