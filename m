Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792955935;
	b=UWS9dLR5j+rxTgnVurFeGIHn7SLT2HOd9fWW3bkkghbbbnjGJ1OMM4yPjP17npiCX+v3
	 jsNug+unKAfp1k1dXi1GIT7EMasD22b3l/4j8frNQyspJ762luplYYg093oxnpqwAkxG9
	 uCWqmmG01CH5YIxsmIR5jb7/BKLcKKbL4fQn+s11NE0eje7Pz6YdQMRDoarXj7et2/3xF
	 amtInSneT0+iVhVN4ABBVbwG1ijWizZ+6XUVawT6OMtpJdGyQJd6GQm9Ipcpb9BB7UE+/
	 VvndC6+FjgoNbBEX9ZFMwpZqxYIzOEuo0g1zVUqvaQB6r2VtHy3xjWI10HoWxhLGOjg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792955935;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=w6uDrMg1SblksEId3NgX6hIaSXp3takMz6Z3EAPSHto=;
	b=XBe/rh+3tXf4lAto22dPobotMh03XtefvzS44bmJCqd2irCyAyDjlaDZ1SVYx+QYSjlL
	 E0pz0H/mbZQC9sAF9Glv+SaP+Ccjk5KTHE2sWLzUKOJlGyvNK2eRWisJVY8FMwJIDMtLr
	 zhqvxczrdqUl/WhXxJRp9HP+4AcAx1hcunEZixE2CPrv1opyUWEPxMUw1zNvrfub/wLGx
	 1bbqVrdvmGN9HRcsYoFO87R0ZLarDMmk6jltIbCXhOO4A2WOZ8x5d+KkkHn+zYsAEvsjc
	 5m5xcU3yrPx2zbo3kj2H0Gt/CjPeXkJ3vvZmWqQirohP5Nfxaif/iwKzTonyF2CMKBw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=Ogq6AmzH;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=9oxDkwzA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.170
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [81.169.146.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5565F606A31A;
	Sun, 25 Oct 2026 19:18:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5565F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=Ogq6AmzH;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=9oxDkwzA
ARC-Seal: i=1; a=rsa-sha256; t=1792955917; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=mqWynaoOaLkuViaaiskG+Dk76BiydMQybb4JHkjNxzRuy4LEFXadAqqAGkSu2g+miP
    fNpitHPUlHbZraVzVa/mWA9CcKkIepY7+6gA0BFRgLX+6lsbYG+PT48hKaouWJdbq2UE
    F4OvsKtXT1U0B6huLmVnRCwRuTPtompbcqpG9ljl6WcImjSXWXUwfaTK7PbmfvmmCInB
    viLYyklYc3Yshkp4VVJXg/1w/u4+a5TE43Y2/RM3xnGZjmWuZ/KLutwVT/+e/aMbuo6G
    wrt6EUYiKPet+uVEogcqkzxY54SUfO/5QREBtlGH0lLQD16+3S3shPqQIAmNZAD14AJX
    b7dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1792955917;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=w6uDrMg1SblksEId3NgX6hIaSXp3takMz6Z3EAPSHto=;
    b=Wd3LeI24kZOizVif0MpAtqBOhw2Lma2nmLnfyHMDXeMjoGk4R7YQMDNeuxUkqN4KO/
    4DbP9v3SFg7SFgu/UcHRUSjRNla+jC3la0AEvoxrIx8xceXrOSew0tywVYAvnZF9IJ3r
    bmS7MAJ+BL4rMjHn3Y9/2ZioMMoYqn+2aGsx7PZ/iDVxTbW3a2+fqczZbux9ZnLo2J3A
    9YCOSdvqdPZfy1K7cbsigy4piDTo0zQfnA+kEAi1zIq1/NwgQD21dfMePBCZMEk1J8wx
    UL9VAegh2Uj9fL1rZ6bYEQYoPJIf7CTXVVjutWhe6JY3Dxmb2WuBQH/b7PN+QiDl5qWd
    4liw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1792955917;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=w6uDrMg1SblksEId3NgX6hIaSXp3takMz6Z3EAPSHto=;
    b=Ogq6AmzHR6/3rDMz/M2tis/qYOzbCexza0TvVjJxVB1st3YsI3myEAYkAu6zB26mbL
    +plK+TSdE6pDBZAQ6VU6UY4Y6xbN1z1FpybzYxB7Cm0Q2Oq4B2Twm0qM1k3mi7rdkNTo
    Hh3TDTdBLOvPzkiCE2OSQu6g/brf6V0CndlzxnQoiqfvkgxja5a5JLa4ZEnPdSi6YQcM
    wCJCdIA+LnS2ItvajQG15C71MYh+qHBCCnH7wTX5G64GpjlXEOlWNhNHqdMfGwhgbdJ3
    liieVYJN9lmqDByPAMCAIPHKaKy/cBkwA/tWYghYNo9nPTKFxDH/AJZYegyB8SrRVrjI
    d+yw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1792955917;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=w6uDrMg1SblksEId3NgX6hIaSXp3takMz6Z3EAPSHto=;
    b=9oxDkwzAg1Ss4fn4wY2MixwFR+oxpxJCglhA7MK0T+tE2sDLtBs9jI/1jntvaeyaLo
    jui0r/VN7WFe+SwlQwAg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrS2poNy8iNoc+LWkugLIF0fnfvFgpgbBBt2w=="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a229PJIbzQs
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Sun, 25 Oct 2026 20:18:37 +0100 (CET)
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
In-Reply-To: <7611B8A4-4CC4-43CA-B8D5-FCEA2F74FA72@goldelico.com>
Date: Sun, 25 Oct 2026 20:18:06 +0100
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 linux-phy@lists.infradead.org,
 linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Paul Boddie <paul@boddie.org.uk>,
 Andreas Kemnade <akemnade@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <896398A4-264F-4D8C-A60D-0F1ADED6CC67@goldelico.com>
References: <20261024051756.79342-1-olivier@mgcrea.io>
 <7611B8A4-4CC4-43CA-B8D5-FCEA2F74FA72@goldelico.com>
To: Olivier Louvignes <olivier@mgcrea.io>,
 Vinod Koul <vkoul@kernel.org>,
 Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3826.700.81.1.10)

By the way it turns out that this patch by Olivier duplicates my 2 years =
old submission:

=
https://patchew.org/linux/96da5fe557f3b2501447358895bd78decc4633ef.1735482=
146.git.hns@goldelico.com/
https://lkml.iu.edu/hypermail/linux/kernel/2503.2/00226.html
=
https://lists.goldelico.com/pipermail/letux-kernel/2024-December/009881.ht=
ml

where there was never a feedback or merge and despite a resend it was =
still lost again.

BR and thanks,
Nikolaus

> Am 24.10.2026 um 19:35 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>=20
> Hi,
>=20
>> Am 24.10.2026 um 07:17 schrieb Olivier Louvignes <olivier@mgcrea.io>:
>>=20
>> The supply is enabled in power_on() and disabled in power_off(); =
exit()
>> disabling it again unbalances it. dwc2 powers its PHY off before =
exiting
>> it, which warns at every probe on an Ingenic X1600:
>>=20
>> WARNING: ... _regulator_disable
>> ...
>> ingenic_usb_phy_exit
>> phy_exit
>> dwc2_lowlevel_hw_disable
>> dwc2_driver_probe
>=20
> Yes, I can confirm this problem and the solution:
>=20
> https://github.com/goldelico/letux-kernel/commit/e757fd47d006b
>=20
>>=20
>> Fixes: 31de313dfdcf ("PHY: Ingenic: Add USB PHY driver using generic =
PHY framework.")
>> Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
>> ---
>> Tested on v7.3 on a HiBy R1 (X1600), whose PHY supply is a dummy
>> regulator: without this the warning above came at every probe, with =
it
>> there is none and USB still enumerates at high speed. Build-tested =
with
>> W=3D1 on phy next.
>>=20
>> drivers/phy/ingenic/phy-ingenic-usb.c | 1 -
>> 1 file changed, 1 deletion(-)
>>=20
>> diff --git a/drivers/phy/ingenic/phy-ingenic-usb.c =
b/drivers/phy/ingenic/phy-ingenic-usb.c
>> index 7e62d46850fd..d8e5ef302b74 100644
>> --- a/drivers/phy/ingenic/phy-ingenic-usb.c
>> +++ b/drivers/phy/ingenic/phy-ingenic-usb.c
>> @@ -124,7 +124,6 @@ static int ingenic_usb_phy_exit(struct phy *phy)
>> struct ingenic_usb_phy *priv =3D phy_get_drvdata(phy);
>>=20
>> clk_disable_unprepare(priv->clk);
>> - regulator_disable(priv->vcc_supply);
>>=20
>> return 0;
>> }
>>=20
>> base-commit: 8f56fdf3d8cb9f1dbdc93bf9ac816698aa6f70b7
>> --=20
>> 2.39.5
>>=20
>>=20
>=20
> Reviewed-By: H. Nikolaus Schaller <hns@goldelico.com>


