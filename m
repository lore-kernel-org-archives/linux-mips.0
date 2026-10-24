Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.84
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792863366;
	b=e9DFVHP7kzlo0RZYumoL7brB6if7g6jcCBQVVePu1I6FyJ9cugTPAia9RS0Bopn9s5CT
	 3bhRnvuArSkonZ6+BM9Vi/iIJu8Hn7f31V1XtsuG+ZvEkofzvbq8pq3Ds3jg81P1QT47z
	 G9r6Ph/swy5vQQlUV0bxd8H/bZ9pNIy/qNgS4bK/cQD9SXBvGK2+5bFMCjY1IatohHruN
	 4086evSnQKNjRN3kBKntXitgipFCkuxWYYGwSlB4c1otDuZB/I4k7ZqKGbeWUro8SFuck
	 ey35dZpgAGQyDI6hKTrLqXsXy2r4Pz85ta8yDeSlC2TFoMNotyTNamGVVLHrVG9Wzcg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792863366;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=p5jayUxTP7IY8XdUHRGrcXP101RoUTE+t/udRo6ELVE=;
	b=zn01lRjdr6Ijmdni37PIRGzPlX0Zg909alJnYwc2ykkVEi65R0InCMg261gwTZv7wEuS
	 T3Onn79mn/isao9gb6PZgEDYEE8QzX7QAz890FIJVu3k7eHV4+iNDD0Yl578Lt9j3skmU
	 DAfwet7/bWKVbo/g05y1/MkiE2UOss1DPu28DA7k64rUUhj0P6kiArMGrpPCHebjPM0vO
	 h2j1U92cil8pnkz2Ew5DzUvZr1zc9XOa6r6O/r6VD4AGdbKpIxAHL6zqydjLZP+3jBE6G
	 03gSLk8ddEfCYDQZp8D9Bbh97IUTPWxFwijyy41srhSyqOfNbpLr37F1bK47aY8+kaw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=LcYwIb+J;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=65wHernY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.84
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7BD606A31A;
	Sat, 24 Oct 2026 17:36:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE7BD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=LcYwIb+J;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=65wHernY
ARC-Seal: i=1; a=rsa-sha256; t=1792863353; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Dgzug3TYpPnYdMxgGoiR1tl4HMjQQvtjgq7Twa6BM0f8HMM8KxHJ5V8LsmqnGEq9XY
    etB9K/HEV9AR8PjLYBb2NnSD0W2BLXAkB0pN3Irc2yTZXEbS0UUPxFFDE+G1cqXNdO5n
    zzP5Z+erwesur7q7nmtrNcqqnor5ygBSoU+0t91zvhhAF4ct8yk29JBDBcV5heQt87hX
    xYaQtiAOd5JGry6J9vF50OHsDgrxPKxFRsdCx7rXvGhr6/0DSRQcx6GAk8VP0w68EuEC
    6IomIeS75DjpVA5UHf2pGO5TWYiZUJRQDmFsoRektam7PTzIXbLT2i53LExAFYlEg5dW
    vZbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1792863353;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=p5jayUxTP7IY8XdUHRGrcXP101RoUTE+t/udRo6ELVE=;
    b=BVXotKZ6CtPjoRg3MP4OaRsrNuHAEtqZqoqAe7zlgumxVu2n+kxe3MpeqRmGN+0SW/
    SmAmahlttuzZGaGrza1K0QiLY2bMbr2PRdOD1+r4E+i4jt7PHRdW3Mtgeg6yMyHe1+T3
    ny+sAx6dNDcSawfpobIWH/dsW8EDkhPZNoPBp5w4sR34V9s/ixdq2+j+gP/5OhCGKjbO
    jXfaThmJL86nwcvCDTTEMMF4Epp+AQ9zmVvSGopg49qQUJ9nUgzN9uJYAmD7rUwuv1Pc
    6L7OsYdTJEJIZSkojMNAxoWuXDtN69rvkoIzRts+YfSI2eQfsgSgiCDOMunqSDeTznbh
    yD2g==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1792863353;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=p5jayUxTP7IY8XdUHRGrcXP101RoUTE+t/udRo6ELVE=;
    b=LcYwIb+JMfRRZRmedpi7S/auFrF7n7sVKylvRxDRkHeSfQOYjqROOQ4xQHattlLVXM
    eo/KRVt6feJr0iasmU/rjhN3BQ1kY7hRllD7LIlZwk+xCu+k56LzWtSmZ0gAWvbX5Ftd
    8eztPHRTuBVbk4/1UGcE6HPU/AGS37pT2WTHIcZhIyq3z7H28YICAZzZpmzSG2/MKZor
    GLLBySZfY9INh3n17dzak5PAVGb4jHcpA3kXEWe0PMArMD+XG8L4n7Pu6TlBWCVgJgNm
    hAO2vhVRw3YaaBh2i6dSoqPzZoVpmTzsNRAMz73ht4bm5+o9UroxezGoaQ1euChdpCs9
    i8DA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1792863353;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=p5jayUxTP7IY8XdUHRGrcXP101RoUTE+t/udRo6ELVE=;
    b=65wHernYSL2srwhbKeT4YHpRWezbl0wQUU+oVaEPcCxWlAucPGI7M8BnSYzxezjhHc
    Y1r3LFzmQvBg0tA5lJCA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrV2poKzsiNzptYNlV1C1yk7253raiyx+O3Hxli"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a229OHZqwrP
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Sat, 24 Oct 2026 19:35:52 +0200 (CEST)
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
Subject: Re: [PATCH] phy: ingenic: Don't disable the supply in exit
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20261024051756.79342-1-olivier@mgcrea.io>
Date: Sat, 24 Oct 2026 19:35:21 +0200
Cc: Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Paul Cercueil <paul@crapouillou.net>,
 linux-phy@lists.infradead.org,
 linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Paul Boddie <paul@boddie.org.uk>,
 Andreas Kemnade <akemnade@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <7611B8A4-4CC4-43CA-B8D5-FCEA2F74FA72@goldelico.com>
References: <20261024051756.79342-1-olivier@mgcrea.io>
To: Olivier Louvignes <olivier@mgcrea.io>
X-Mailer: Apple Mail (2.3826.700.81.1.10)

Hi,

> Am 24.10.2026 um 07:17 schrieb Olivier Louvignes <olivier@mgcrea.io>:
>=20
> The supply is enabled in power_on() and disabled in power_off(); =
exit()
> disabling it again unbalances it. dwc2 powers its PHY off before =
exiting
> it, which warns at every probe on an Ingenic X1600:
>=20
>  WARNING: ... _regulator_disable
>  ...
>  ingenic_usb_phy_exit
>  phy_exit
>  dwc2_lowlevel_hw_disable
>  dwc2_driver_probe

Yes, I can confirm this problem and the solution:

https://github.com/goldelico/letux-kernel/commit/e757fd47d006b

>=20
> Fixes: 31de313dfdcf ("PHY: Ingenic: Add USB PHY driver using generic =
PHY framework.")
> Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
> ---
> Tested on v7.3 on a HiBy R1 (X1600), whose PHY supply is a dummy
> regulator: without this the warning above came at every probe, with it
> there is none and USB still enumerates at high speed. Build-tested =
with
> W=3D1 on phy next.
>=20
> drivers/phy/ingenic/phy-ingenic-usb.c | 1 -
> 1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/phy/ingenic/phy-ingenic-usb.c =
b/drivers/phy/ingenic/phy-ingenic-usb.c
> index 7e62d46850fd..d8e5ef302b74 100644
> --- a/drivers/phy/ingenic/phy-ingenic-usb.c
> +++ b/drivers/phy/ingenic/phy-ingenic-usb.c
> @@ -124,7 +124,6 @@ static int ingenic_usb_phy_exit(struct phy *phy)
> struct ingenic_usb_phy *priv =3D phy_get_drvdata(phy);
>=20
> clk_disable_unprepare(priv->clk);
> - regulator_disable(priv->vcc_supply);
>=20
> return 0;
> }
>=20
> base-commit: 8f56fdf3d8cb9f1dbdc93bf9ac816698aa6f70b7
> --=20
> 2.39.5
>=20
>=20

Reviewed-By: H. Nikolaus Schaller <hns@goldelico.com>=
