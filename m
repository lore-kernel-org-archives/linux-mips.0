Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.82
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794479123;
	b=3E8Ls5H4r658vN0vB7OKN0oxKODBUoDZ1ybThjGWM6Bkah8F9lKJdz5GYn98heX3886A
	 w49rWWrsZ7B1F3ffzu26gxtEyz72CdtflmO9W4lXdk+73R0wxdq1fF9uDitjJuZ8qb7OB
	 gF8tzFWQoUmRO3XqbpTHh3mJEnuC85eSIxzMlnISf41uAa2TT2Ewkkvuq26qY4l2nnjpP
	 BNnVrN3eEbHin0TxFfAwCScOa1zF+EK/gsjYQsgU1tgNME4vkZ7xeabdzZ6yj9TFEdaFj
	 uAN2eVkj8gIW2vBMwOtONy9nntXWVQwFN0d0lKock/AFIUTkV+uZtTFFHsyr8NY4DBw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794479123;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=0zYpYSMRsVntsBsFlDrFrATUIagdvLEMofpH6gktL0U=;
	b=0AdXHjW+VprgEnVi7nvswQoH6uzJfXtPSGbcRWgnxyQ20sH2DKWQAuyUVgFOnmnUzKZv
	 zfjrcDKKy4WqLTlOSuMsN9Lic38tjdYTtCsnWjPTAIiUD9x+rTq3RGn4Lw6q5PsaKMso7
	 /i163pf+dDHybmKzysX72OwZuE9Q8klGOtm9VBD3iXT+hGGdLMU4z0vdON9gYoLaRoOOm
	 7qDQGX2MRAFSDBF1BUJxNHjdnOY1H+HsnIBTAUh3NQuNisZwRPbCzX2y51AHOSRjH9CWz
	 dzPZxjLJ5AS5sfCL87GIbxRE0vsJUGtFjPQb62v9b7ET0ob/s4AONnRJZwwxh3Dw66g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=ihUoYa7v;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=H518bIu4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.82
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BD6606A31C;
	Thu, 12 Nov 2026 10:25:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5BD6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=ihUoYa7v;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=H518bIu4
ARC-Seal: i=1; a=rsa-sha256; t=1794479111; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=biyMaYFdU/J5OVUP2rEWr239Aj5Al9+I+EdoY0pg2kypyKFReTY/KBTKQ0ZhKIw1lS
    5jZbdfqncxZuDmPELPczjrx0q+1JiBqkfCfJ15xBk8r4NkrNs+nbHTaZIbwvKsCsxbeW
    JbpUBu0WIYIfH1L6XfkqjUFL4EQ/RzhLLj+wkfAnJhFZkvCO7X/lf681t92ExbHdH9Hd
    yhzf14mkffSvFwn4BFDAtnIoeZj1oCy/JP7urDwR7xLEq6xBM3Dpag3ZrbmDPPbhhuXr
    x4epeGBezztLxiVjJ19h+rwuHEzBeEky5N3a97J5CjHFH7fbaBfr/fPvCVZJEOyaRgIZ
    KIvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1794479111;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=0zYpYSMRsVntsBsFlDrFrATUIagdvLEMofpH6gktL0U=;
    b=RCfpdf9XNJ94BfalP55cqT32NOzIstJu6BnzmRDDYmcM9GLEerl1pyKGKd05+f4zBV
    IPLOujJsTEwufCisWbuuutGOmvpQpH4ZF86//46Lea4stUb+0UZ8IkvmgJusD5eEN4/B
    7RftbYv3TipiW00QCq8c0CvHuyTtzwwVILXshSk1ATjcrXP15vrjRywW+K55ROGJmLG5
    uatS8jFKpIYY3gN1fJFdHgo0pDtTeNvdECIfBiE57dxNGmCqktHIRzhtbL+FeR5NV5cG
    6XNZzr1zo7vgPpPcajKnt3/wwjaPXiUuobBKfLAzHqTcAyzgO8M5o68R3B1/6OSjXSF3
    /HAw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1794479111;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=0zYpYSMRsVntsBsFlDrFrATUIagdvLEMofpH6gktL0U=;
    b=ihUoYa7vNCDtX8fXJae8w8rV88ECl4SKrGvJUdDTPIYQYZAiUrI47ld6PTgC9zOjAH
    gm9oNhmIOxVt0NLIDUdLZ2tSOmDaD7cCvsdUv+4XIOJL3obGSuzyf34AJQs8JIIVfKNf
    LwpzMfEHiI/rp97HQhRNA+xVR9YnoVWlswXWjA5KTYvopt7C85csa5yVmRjAgSCiCQQa
    RqHmVqcawvh8awzK9ZKdGN1PVzbOLJv37R5QSCafsKnW7Zs6RRRppB/1BmOxZlKz76Yx
    9hQ/zaUlGta/TwmGkt44iaKfyzIajhCkViYVbS275w+1Sn2AhU++TLxUUZ27aI6QJLC9
    NTTA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1794479111;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=0zYpYSMRsVntsBsFlDrFrATUIagdvLEMofpH6gktL0U=;
    b=H518bIu4BwFVb7wZMRJPtSWVSWr4YeVz9MmwEzx3Uujyn0PHk1oSDegKW54vb0U5Lx
    tU7lsri7AMHawkW+PmAg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrV35pZz8iNKp1rK7chac7b5mVucO+Qp4KTQNe8"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22ACAPBBL9
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Thu, 12 Nov 2026 11:25:11 +0100 (CET)
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
Subject: Re: [PATCH] MIPS: ingenic: Work around stale L2 data after DMA on
 XBurst II
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20261111-mips-ingenic-l2-war-v1-1-0d9dec232a7a@gmail.com>
Date: Thu, 12 Nov 2026 11:24:40 +0100
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <988F3625-C300-4C68-AC70-E371E5D9A496@goldelico.com>
References: <20261111-mips-ingenic-l2-war-v1-1-0d9dec232a7a@gmail.com>
To: Hunter Laux <hunterlaux@gmail.com>,
 Olivier Louvignes <olivier@mgcrea.io>,
 Paul Cercueil <paul@crapouillou.net>,
 Paul Boddie <paul@boddie.org.uk>
X-Mailer: Apple Mail (2.3826.700.81.1.10)

Hi Hunter,

> Am 11.11.2026 um 21:47 schrieb Hunter Laux <hunterlaux@gmail.com>:
>=20
> No XBurst II SoC is in mainline yet; this came up on the X2600, whose
> support I'm preparing.

Well we are also preparing x2600 support...

Maybe the individuals and teams working on the XBurst devices should =
coordinate somehow
to avoid double work and potentially incompatible fragments?

E.g. by describing which hardware is available, which topics/code =
patches are in the queue etc.

Maybe for me:
- LX16 board with X1600
- LX20 board with X2000
- LX26 board with X2600 (isn't running stable for unknown reasons and
                        sometimes damages the =C2=B5SD contents but your
                        patch didn't help to solve)

In queue:
- fixes to build a generic kernel that is differentiated to hardware by =
different device tree binaries
- full CGU support for x1600, x2000, x2600 including jz4730 and fixes =
for jz4780
- full dtsi for x1600, x2000, x2600, jz4730
- TCU and OST fixes
- x1600: USB/OTG/PHY
- and more peripheral driver fixes for x2600: USB/OTG/PHY, sdhci, =
irqchip, pinctrl

Public kernel repository and (almost) latest code:
- https://github.com/goldelico/letux-kernel/tree/letux-7.4-rc2

BR and thanks,
Nikolaus

