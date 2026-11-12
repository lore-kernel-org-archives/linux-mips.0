Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.165
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794497482;
	b=qyx6Z8f6mFoLlFCYVNdkH/+gxmR93AOck8ii+POjqSL0k27SK6/PryCBunqE5Dtm003T
	 jQuiPfxVRaBwFnCqW7E1FGNmdUYJeNlnwVz4w+h9OAmu6TI8jUkAJ+4Tggi3AnE1RAnS7
	 kgyu2evpNp4wphYQ7BOxRcXHYXkFyfE0P9yn55O9CT00GbY9LaGbWuEUD3HNMyiVirdQb
	 +NcsE8faRtnSbc+K8h+P0B8i/8IUhgYPR9iSuzJViKpgNjyGVHrgywCADk+ZE1A8XS6hJ
	 zGwSmKSAoHBzNRIVoC3eewtfqVDj8ZiexlZZ6AhSTq+OR4Bq7RHPx+rdDgcAZ3pfIfQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794497482;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=JiUdlztTgwfgz4kTNoOU7bID6o8XA6OtahvyNjj86zc=;
	b=Rcmi77SjInF+qfeSBSZv0GJMqfQvR28AmiSoGFkP+eLsjIVJoJNAGIrSFMc8CiP505ub
	 FTf+TwLsCh2rna9JywM/Pj2voHAHOeMvICaX2HiQqIz41Fi8+14tNcHP2uvVhUEc53H9u
	 w7z273otGPkBqdWX2C3HnKAhlWr1Y7JYuUzZiPtuMVGIiEi9gOxr3rIuGp+2bZ8TRKKUZ
	 i8raX6/XRI06i6SF3siJo7/3U0P7/RmbKTgDX1xwRCZxYmDo0cvnjknGDHgcAVd+SLoa7
	 /U/7vkFhvzt0XgBjVw4NPiXOMg/isNTv6cEx14+rItagQL+dy5H0NOdJvMfT7r/E/qg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=bJ9RZw5o;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=k1oLV9xI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.165
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E9F606A327;
	Thu, 12 Nov 2026 15:31:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03E9F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=bJ9RZw5o;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=k1oLV9xI
ARC-Seal: i=1; a=rsa-sha256; t=1794497469; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=MwnkW/s360eymkZGmjmIKEbcp0yPKN6Z5n7bppd8g1mywyFc2LAnQ8VhfuDuydC8ND
    SnuYa4LnRiPRnRAp440FksfGinWMvLoN3i7Yz/i30K5jMVyBHquglxs8qe+J19t0kWTM
    Eez65qgRW7K/GmPD7J4mjKFVaIKOyYU2JhXQSXhmztLp88bZgznkidihVzQvoZLZsXvd
    1SIWaFRk5Fd78nmmttqUiLULBUz9whVOYoq+Mfqv1z1fhqSs+RXdqlMXirNiOTc0xhDn
    mMzlmkACUNlET3NbqmFPZ60qvJASIb/2+dBcdLMLhJPzVbxu3tuRgtgpzaDL3mw2Pp5k
    H3SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1794497469;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=JiUdlztTgwfgz4kTNoOU7bID6o8XA6OtahvyNjj86zc=;
    b=nKbhoakE1USwo/lRXMNy/28+w9+dovhVDGQ9sGVa880ZWQv7qYXIDLLnFCZOumP+3w
    hNu/JafmnXb7mHVIs6nut13JG761egJwiLKlpvkz8FFsfP0T60+cABVrPwgkNzDO2FdH
    aFJeAnOL/zb+QqA6UwRwHeGrRiouU43TWckk4qmZEW18n9VA3vLQ36Ibou4Z50f+ueBP
    PIJ3oxhQt2XitNdUcba20WXz2s8WLjsQDnhC79pqMwGp16gWr9+ZeA0VGTRQX/63Wu1d
    Ma7bgP8GeABA0NssNjyk04XdhlRVzgsNjkoVNU6bwGs90rLfT3c6LJpFcSlIp/iH/LI0
    l3cA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1794497469;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=JiUdlztTgwfgz4kTNoOU7bID6o8XA6OtahvyNjj86zc=;
    b=bJ9RZw5opWeDWEs8zlBolp+l6mbTEbfAOWAS6Kwq1wNcsyneeTCmHc3cqMYbVFDSye
    mNocUUSerfQjRdGaIeipymNlpQEjWNpd/ZpAORRXgn2F1629yZs44QgUW4WzBkZoY6EX
    wWDCEFFnWcCjvIRi0GbQsEQERvj/DGGC3KlXvSje3uO9Lm6h7rOZCnGAjT3Ys1Pfjj8Z
    83bU6YOm+jYhKII0kQkralVsXDQNQBRYFHv3rWLwjpQsHrCPREozD/iVqoxkOTmQTVLp
    9Y3mtcJFOJewizopqsK4CLmM0RCLPDYbbb+bgIW3kEtHbkl1zePu7utlRBdvAP7oPVjw
    Nz2A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1794497469;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=JiUdlztTgwfgz4kTNoOU7bID6o8XA6OtahvyNjj86zc=;
    b=k1oLV9xIllWbhSMmtd+XlONXBisAjzC4Pk4Ryho2PtPOQjDHrZ9Kk8zA6wcVf4OYI4
    44Vm9660Ah+PsOFchHAQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrV35pZz8iNKp1rK7chac7b5mVucO+Qp4KTQNe8"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22ACFV7CzT
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Thu, 12 Nov 2026 16:31:07 +0100 (CET)
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.10\))
Subject: Re: [PATCH v2 3/9] MIPS: Ingenic: Do not force BUILTIN_DTB in Kconfig
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <60065a2feb73f81a8e9e919940e0a96b18bc0423.camel@crapouillou.net>
Date: Thu, 12 Nov 2026 16:30:36 +0100
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Paul Burton <paulburton@kernel.org>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>,
 Pengpeng Hou <pengpeng@iscas.ac.cn>,
 "Christophe Leroy, David Heidelberg" <david@ixit.cz>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Takashi Iwai <tiwai@suse.de>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 Paul Boddie <paul@boddie.org.uk>,
 Olivier Louvignes <olivier@mgcrea.io>,
 linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 letux-kernel@openphoenux.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <32650B9F-1A4E-4DB1-9109-E7804B04CE14@goldelico.com>
References: <cover.1794471031.git.hns@goldelico.com>
 <fdc48b799f3c2f43a70236ef4d68bf1527facc9c.1794471031.git.hns@goldelico.com>
 <60065a2feb73f81a8e9e919940e0a96b18bc0423.camel@crapouillou.net>
To: Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3826.700.81.1.10)



> Am 12.11.2026 um 14:57 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Hi Nikolaus,
>=20
> Le jeudi 12 novembre 2026 =C3=A0 09:10 +0100, H. Nikolaus Schaller a =
=C3=A9crit :
>> Remove the unconditional selection of BUILTIN_DTB for MACH_INGENIC
>> when MIPS_NO_APPENDED_DTB is enabled.
>>=20
>> The current Kconfig logic selects BUILTIN_DTB when
>> MIPS_NO_APPENDED_DTB is set, although this configuration is intended
>> to prevent the kernel from appending a DTB to the kernel image.
>>=20
>> While the kernel gives precedence to a DTB supplied by the boot =
loader,
>> selecting BUILTIN_DTB still triggers additional build steps and may
>> add unnecessary code to the resulting uImage.
>>=20
>> Note that BUILTIN_DTB controls the build process, not necessarily
>> whether a DTB is actually embedded in the kernel image. For example,
>> CONFIG_BUILTIN_DTB=3Dy with CONFIG_BUILTIN_DTB_NAME=3D"" still =
triggers
>> the generation of .builtin-dtbs.S, but does not embed a DTB.
>>=20
>> The goal is to allow a configuration in which no .builtin-dtbs.S
>> is generated and no DTB is appended to or built into the =
zImage/uImage.
>>=20
>> Fixes: f0f4a753079c ("MIPS: generic: Add support for Ingenic SoCs")
>> Fixes: 15205fc05482 ("MIPS: ingenic: Add support for appended =
devicetree")
>=20
> I don't think you can have two Fixes: tags...

Oops. Must be the result of mechanically squashing commits...

Will be fixed for V3.
>=20
> Cheers,
> -Paul

Same to you :)
Nikolaus

>=20
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> ---
>>  arch/mips/Kconfig | 1 -
>>  1 file changed, 1 deletion(-)
>>=20
>> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
>> index 92bca520cd5ae..2135a69f9962c 100644
>> --- a/arch/mips/Kconfig
>> +++ b/arch/mips/Kconfig
>> @@ -127,7 +127,6 @@ config MACH_INGENIC
>>   select GPIOLIB
>>   select COMMON_CLK
>>   select GENERIC_IRQ_CHIP
>> - select BUILTIN_DTB if MIPS_NO_APPENDED_DTB
>>   select USE_OF
>>   select CPU_SUPPORTS_CPUFREQ
>>   select MIPS_EXTERNAL_TIMER

