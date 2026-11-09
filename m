Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794218604;
	b=Esf5Cw9TrfF0QFTyDDzRj/xeAfSnBykAdcckgUD10UVAZH5K0lpNSYBkbA87iIMRSCua
	 yvv17rVevjsq1HaU8dSguVZiEFUYtXe9kJUo3XuYRiKfElWjEu/QgVGOqD62BxP4nVsma
	 IhfiEkogqWcHTdIynzIHqxfmEF5rdR5K9HwOvB5rDUfcALkVXCd59JgZntHTjSXg2CwZq
	 MWzF0Dy5ZcHNPNcYoo/nhRETVSsCyIyQPH1GCIQS8Umc5AZPgg6q/+NJP8jGb0Q+GsZnf
	 j6rpO29cY/hx/xn4kEoB6lrTB5lxh94+Y7aBlzfLRoKRpr5a6kHDax2hQLrykZxClhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218604;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VUWZyQ9ve/eAObcSYNBMb39AkC213KV5VaBWYN1kEHA=;
	b=S5f35Bs1EnvGCB3nLIdYC96coTYD8hy42QgDJZwcuBlL02TeoZZrrrGK1smdorMTYicy
	 kOYWEd5SS7Jx4tOXnygbTVeHI6Lax1eHJAboF4EjNlP8cPP4etX6ceQhnHlO2jmN+02nv
	 L2hCza7nIZbHOvIsODt+YVSs3hqDIhtSlkOMd+34Uqwe+jZOVwGsYJEsOPt5NlW4B21cK
	 dts/v1d2glRrZ2OVXqsHMpuS+mMhWv23H2CtOsDX1iOAVoKfwkDOzQ/bnexGACv+xVATY
	 5VdrPShMC4k+VHfMifa/oYvgZkJ6Ym75fL2MhG+ZfXKEX/g5XQmXaeOPqtcrNwPAIsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FQ2hdhMZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93576606A321
	for <linux-mips@vger.kernel.org>; Mon,  9 Nov 2026 10:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FQ2hdhMZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6561F1F008A6
	for <linux-mips@vger.kernel.org>; Mon,  9 Nov 2026 10:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794218604;
	bh=VUWZyQ9ve/eAObcSYNBMb39AkC213KV5VaBWYN1kEHA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=FQ2hdhMZcO6AGFgMNJp/lVLguvcvHaZa3uXWT7s5DsP1SttkW9dE5QpKsoTek5aaP
	 RULhUZmZ3WDFpqr11avePvyRG9n5GwiC9E4h1PjYQwKWbnksZ9K4DiB2nuSzXdgDLR
	 AOBFdMhtPYZbd2fN57nU8B/BYh810KkOFIKcB+bg25NvYzxXUeStnBF8MoIWqzJXz1
	 UnHS3xJ1K1nKQHj7rOwBw2cKRQEzu5r0ptuj5xbLSWdTH/XWXSEy4QzHYdeTh3yQiW
	 L+q7geLr/1AMV+3vkA0t7HXQjEIoeU98uVpdN3TJtN4Hr015oWFPOy1LRA1GrMVM2f
	 Uxl8u8NUE7v3A==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5c1465bbbdaso399241e87.3
        for <linux-mips@vger.kernel.org>; Mon, 09 Nov 2026 02:03:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFlm1LmAkPln5982uCa8QUThN4UWwqqWLlxMNLCvJZXFFjuGLWJR2y+2kdyi5+mToAjPRsTfF+24XBL@vger.kernel.org
X-Gm-Message-State: APuU4Z/ML8A1fWRumAPuef94oVoL83B4no7YRTSwRCTPGAKjgSFzxKX6
	ZjzIkoG+5ZuG4y615EG6cECie+VlrLv55t78m3plXjtBowsWmII3bUZdZrwMQKgKO0C4E87xeQL
	d7aPW0N9+4vM9gcfxShernLKHk6XWN+I=
X-Received: by 2002:a05:6512:10c9:b0:5c1:4bbc:45cf with SMTP id
 2adb3069b0e04-5c14c025163mr1024453e87.48.1794218603167; Mon, 09 Nov 2026
 02:03:23 -0800 (PST)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106-pinctrl-subsys-v1-0-f17582f32aaf@redhat.com> <20261106-pinctrl-subsys-v1-1-f17582f32aaf@redhat.com>
In-Reply-To: <20261106-pinctrl-subsys-v1-1-f17582f32aaf@redhat.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 9 Nov 2026 11:03:10 +0100
X-Gmail-Original-Message-ID: <CAD++jLmQg3sj1az-+79c4uBHkphotjcEYynSR4=7+cwOWw7rKw@mail.gmail.com>
X-Gm-Features: AclHuK9wM-_UwMl9vBffN1vrF8BaWOktYDbxaBWF1nkFxTvrjySApEcGDJHKmVE
Message-ID: <CAD++jLmQg3sj1az-+79c4uBHkphotjcEYynSR4=7+cwOWw7rKw@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: ingenic: convert to subsys_platform_driver_probe()
To: Brian Masney <bmasney@redhat.com>
Cc: Paul Cercueil <paul@crapouillou.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 7, 2026 at 1:27=E2=80=AFAM Brian Masney <bmasney@redhat.com> wr=
ote:

> Reduce boilerplate code in this driver and convert it over to use the
> macro subsys_platform_driver_probe().
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Patch applied, catenated statement to one line as requested by Andy
while applying.

Andy will deal with patch 2/2!

Yours,
Linus Walleij
