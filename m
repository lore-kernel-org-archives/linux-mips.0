Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793024292;
	b=aePXPMtbbmx9VYFBle7mzjXXGV1MGrBQ4arQtqvGEkCeKkVm7nYu67rWGlvrQy/XfMuh
	 NlFJRpRYG0fSUk3jUdWbxl28ELnw3k45XawLSzDSKU5KOyQBsnbGfAV4dNyJJXnKqiFgT
	 75+FN1tDp1ys1tvUJZGpqyF7OvQyebi4E7AnLdQPdnmAAy3TqgPJjn2QX3I27/9gMJPHv
	 U2Z2j5qG3V51X9VWtVSZC9T4Wt3oOATUUItqY4xrUIgYTP0PmiiUswlomPRas3i7MOxx+
	 dxmHZAFT8C2jFg3Vchm1YY4plawsMIcS2RdtZUwdxXt8Yy+fdvL3nEIufNZrsKL37fg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793024292;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=N3edpSA7ySWIQbLtFKdR2LcNzow3X8EUsLtkx2rpILw=;
	b=NBHxvPX0FC3f4aydkEXfRV3kTw3ZPnK1DF2YlCpzTi4KwZ8hPk79ttWauGcO27CLiklF
	 OLQTAkMCvZRViAyQ27qNPwA2EAmU3ipbdk8pcLfo3UoDDH9rH7pkgQErnVVKQnEwSYcwa
	 iy+qR+0wwqL++6WiO5FB7+xzWrDCHEkZjQPJlYbimsol/wHQOXZsCbhB3/P8ljUmhBByu
	 xeaNfN1Cvh97QGMUfGAz0wHcZxRypIHb7jntpJRG7cN4W741bAT3liukW+KEYO9i9v/pr
	 JGgPhk5EWF4WoffOzEJJ8ApUuCO6oRd8kbo694vzqGsAnkRtk20lsbyn3z8NG/Bt1oQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=PRYQRpDE;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=tCpwcUEk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.51
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041FB606A31A;
	Mon, 26 Oct 2026 14:18:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 041FB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=PRYQRpDE;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=tCpwcUEk
ARC-Seal: i=1; a=rsa-sha256; t=1793024270; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=hGp9mh23HEGuXtxC/BYxow6/izwgp6zajao0s5YE1thCklRmEmmMgEUSQgKKgK+g7h
    oXulEdqf9B4wPUh7SpXo4N68ZlnV7Hrd8alJT6gS9yOI/l4EBOUILcgzIUiLS7gx4BOZ
    SM5ZFoJI1H9y2YYCAaBPPtlOIl2sJNQ4I3NM/XbDQ0o6p6CzU9O+dU2MxhsExsnWN67I
    f5pRbNCbuR6o2QZAituocsW+2sTdEgBBro/gptuDgvvPkujEH8g3pIJ3oY7UiMdc1Hxc
    +a6xTYhW2v3a4hFv9HIg1BeeLfmqYOvN/j4QGtOP+P/GyJseXEniaJiLFZTU/mrU5IcH
    drcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1793024270;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=N3edpSA7ySWIQbLtFKdR2LcNzow3X8EUsLtkx2rpILw=;
    b=JPlXKmfxF1mMl20hYDwAXMf4lvix7/rP6y1pkjQh2bqSreDHeqSrA3rV2UiZCTOnxt
    ZgWhpVJY2CJLOtmpyetTrWNxdAsa1g9aMTQI8wspnEtUZXsC0ambNP862T3+v4KxNlD0
    uCxAVLpLqaukkMu7QqadfmFcKE5UyWuKvem0Le3Th2FdUIcIRImghx4j+E9rUIX3D2Xw
    ohBS+TnWJD83X9LS8nni5r/6Q9MvBxFiupt1K/5OnzqdmlJxw+Ms+Ps1Atc2ExJ2hmdK
    eoSqO3k/w7Rb28OEce+P9Y3Wp9aNKnlR/jV8uScs0bp5Gm0C87IriiWFciIbSa0cVJbx
    5o5A==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1793024270;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=N3edpSA7ySWIQbLtFKdR2LcNzow3X8EUsLtkx2rpILw=;
    b=PRYQRpDEUQ2CB3frxP9ntrh7Zhn1BYrH8gLi5KDhAnjxX7hEJGOhvjsZ2Z1Cv1Y0iv
    Wii3JWX2Vk0P4qC0c+oup9M6UWlmaQGyLBlhWc1wDRXkzkJ4JRURyqNsCFMm5nvel7iR
    hY+NUxck8e03QtzLrYU/df4n5uXrQYTcBn0ZQv8wuHITHjFjGWZYUEQGyq11z9QgS3Al
    tG/MrBhnyAWUBv9eWXYVfkDxobELinXVyasyuUb2ThHzG0FLUhLvfjkKXBybqjZTLfuv
    zqOg/9z40Vveqo62Q6SW6GrmeQIHi66MVNB6FX9BFt0QHb6Qdr6sLXBjvpqEZTZSobpk
    /ixA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1793024270;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=N3edpSA7ySWIQbLtFKdR2LcNzow3X8EUsLtkx2rpILw=;
    b=tCpwcUEknd/BQMAdiLLFfLOErE+dlBYlnmtrN7T+X9Hq4rs5xmE+0Oy9Hel1KDa+Xg
    DjNb+qeiMd1o66KyIyDg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrSipoGzMiNKtQhqZFV7uZXF4WZrMfjk54is0Ge"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a229QEHo30Y
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Mon, 26 Oct 2026 15:17:50 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.10\))
Subject: Re: [PATCH 1/6] MIPS: Ingenic: Fix inverted MIPS_NO_APPENDED_DTB
 logic in Kconfig
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <089587a1ac49395ef5d15b59c5ff5c9bf8ab68f6.camel@crapouillou.net>
Date: Mon, 26 Oct 2026 15:17:19 +0100
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Paul Burton <paulburton@kernel.org>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>,
 linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 letux-kernel@openphoenux.org,
 kernel@pyra-handheld.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <669B446E-0567-472B-B15F-ECF1EA49413D@goldelico.com>
References: <cover.1792956055.git.hns@goldelico.com>
 <7733ca05b6a245e5a9ad414cc754ccc9ece6dc85.1792956055.git.hns@goldelico.com>
 <089587a1ac49395ef5d15b59c5ff5c9bf8ab68f6.camel@crapouillou.net>
To: Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3826.700.81.1.10)

Hi Paul,

> Am 26.10.2026 um 00:41 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> The original code is not an 'unintended behaviour', it works as it was
> designed to work: if the kernel is not configured for an appended DTB,
> then a DTB should be built-in. This is because on Ingenic SoCs at
> least, at the time this code was written no bootloader was passing the
> DTB to the kernel.
>=20
> I understand your usecase (which is very reasonnable) but this fix as-
> is only fixes things for you, while breaking every other board.
>=20
> I'd suggest to fix it by adding a proper description to BUILTIN_DTB =
(so
> that it can be selected from the UI or a defconfig), then update all
> arch/mips/configs/ for Ingenic based boards to enable
> CONFIG_BUILTIN_DTB=3Dy unless they rely on the appended DTB
> functionality. Then this "select BUILTIN_DTB if MIPS_NO_APPENDED_DTB"
> Kconfig dependency can be retired.

Thank you for the detailed feedback and for explaining the historical
background. That makes perfect sense.

I will follow your suggestion and add split this in a V2 patch series so =
that:
- Adds a proper prompt/description to BUILTIN_DTB so it becomes =
user-selectable
- Update the existing Ingenic defconfigs to explicitly enable =
CONFIG_BUILTIN_DTB=3Dy
  where needed (I think there are just 4 cases)
- Remove the automatic select BUILTIN_DTB if MIPS_NO_APPENDED_DTB from =
MACH_INGENIC.

This should cleanly support my (and likely other's) use case of a
bootloader-provided DTB without breaking any existing board.

BTW: we have this working with U-Boot on CI20 as well. So a generic =
ingenic
kernel and all board specific cases in the DTB.

I'll update and also consider the feedback from Sashiko-bot and others =
for
the other patches in this series.

BR and thanks,
Nikolaus

