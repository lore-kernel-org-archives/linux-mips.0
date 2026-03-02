Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E76338D006
	for <linux-mips@vger.kernel.org>; Mon,  2 Mar 2026 09:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772443180; cv=none; b=gt69IiZidRq+odg7QrQHDZa/ohv2wEX87i4HLH5hWBWq6YCo6b9Udrd7/99Du+Q+ecShLN4Fh2vREdB+zNI86fTYSA3LLcNJGOAeQ/meIzsnAtu+cqC/3kK2egLp/3g0ldkKfkNBodzHd+nFJ5wy62+M1mv/+r97lHj/Ig0NAdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772443180; c=relaxed/simple;
	bh=7ckUxNu6Er/vlKjRLTGYQicGp10gUC8i4ulwH0qnW6Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tiB6hG3YBX7qYO50wK0PPfuaPKVZEWrjiEPPH+GagZCvRM90N1QjV1pGmaiwCmnMNxgCXdrwW2qP1C9PTOrUC8TPHhNgiQ/48GdVuaSIBXmdre/bQXlNKx79aSrhDKs+opj2CdK0TQ14EC/eulqQR1gyONj1xcCsbTAdyp1S4Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NaSaYEwv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NaSaYEwv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1FFEC2BCB7
	for <linux-mips@vger.kernel.org>; Mon,  2 Mar 2026 09:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772443179;
	bh=7ckUxNu6Er/vlKjRLTGYQicGp10gUC8i4ulwH0qnW6Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NaSaYEwv6W5X/DgCkkxrsPmp/GhAulMTl+hZiRTxUxtDDakDwwhsiq+R5pTeHAsZM
	 OIbDNM1DveCGwTAONAxVOu/KcPk0lRkgP8WI72/xqx6lOfBbBbU7RSaOQijai8aXqE
	 Iph6v21mAHpkVFT2/v4EuO4Hhul4HjChQ0pU6S5v1tJDVMm/uPsy5B3zye42S5H+L/
	 zwlbLDCwfPC/QUd2hC418X1y4CHEeXuHxZmckZMzg2mhCGvn6A7YncTJHd8Xnsxo18
	 hpZQvhGk41Vg43V6LhnmHFk3tZjPopY4U+BtxJI2mm4cH+mtHH+mP3OJ27P/d5fZMb
	 f6zFXUS0FBF8g==
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7982c3b7da9so39310587b3.1
        for <linux-mips@vger.kernel.org>; Mon, 02 Mar 2026 01:19:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU1Obv6Chba5TVT1EwtULsIsmmcZu+TpubgyMwTsboRED6hPIP2sUKrF0g1VG4iU+rBFhia0Z1+ObmM@vger.kernel.org
X-Gm-Message-State: AOJu0YxNIc2cqDb7RrwZT3fpW/+BwZ1lt3/E5d2TeuHzVqWJM6JLFPAi
	45vvgDDAYeSAq36ZrLoWaxV3brs/SYvUzpWDTQVayRK9I0+dDZHWNeL6KwQqp7E6XoyLzaVJp1R
	egJ/LhwLlyUAhZN1X4Vz4H/BuAVEOe4Y=
X-Received: by 2002:a05:690c:385:b0:798:6c28:dd57 with SMTP id
 00721157ae682-7988554de07mr102205297b3.28.1772443179061; Mon, 02 Mar 2026
 01:19:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260226-eyeq6lplus-v3-0-9cbeb59268b0@bootlin.com>
 <CAD++jLmEU=PkmsPOksF9dtV5UpH3S9X=VJey8ZEf5wdsPbsNvg@mail.gmail.com> <5262868.Qq0lBPeGtt@benoit.monin>
In-Reply-To: <5262868.Qq0lBPeGtt@benoit.monin>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 2 Mar 2026 10:19:27 +0100
X-Gmail-Original-Message-ID: <CAD++jL=aQwj3vfGQcJQGoFGneKyDPTMWik1zVhhoH3BM42odug@mail.gmail.com>
X-Gm-Features: AaiRm52IPrnZjaOF5tFQCgs0uPwRGDpKCfSWJ4D7JFeg9UWmQRrGRVgXGFakAgc
Message-ID: <CAD++jL=aQwj3vfGQcJQGoFGneKyDPTMWik1zVhhoH3BM42odug@mail.gmail.com>
Subject: Re: [PATCH v3 00/13] Introducing the Mobileye EyeQ6Lplus SoC
To: =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-mips@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2026 at 2:54=E2=80=AFPM Beno=C3=AEt Monin <benoit.monin@boo=
tlin.com> wrote:
> On Friday, 27 February 2026 at 01:14:32 CET, Linus Walleij wrote:
> > Hi Benoit,
> >
> > On Thu, Feb 26, 2026 at 2:34=E2=80=AFPM Beno=C3=AEt Monin <benoit.monin=
@bootlin.com> wrote:
> >
> > >       pinctrl: eyeq5: Use match data
> > >       pinctrl: eyeq5: Add Mobileye EyeQ6Lplus OLB
> >
> > Can I just apply these two to the pinctrl tree?
> >
> > Yours,
> > Linus Walleij
> >
> Yes you can, they apply and build cleanly on their own.

I applied patches 5 & 6 to the pin control tree.

The corresponding DT binding is in patch 1, and since that
is already ACKed by Rob I positively expect it to be merged
for v7.1.

Yours,
Linus Walleij
