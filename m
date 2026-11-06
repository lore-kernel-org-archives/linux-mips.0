Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.165
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793966913;
	b=gDcSH1ZIRj68GzxvqcfF6sxjb0NyQNWhmYiyQvqv/ET32Yp7kWXSTe3WkVZCNd8kDX+k
	 qU5vrWy9Kv+s6wXdBsrExHPH+D1WTG1vcqmO1Dug0V8PdFNtuZf68u1ikAef6sDxLNA9C
	 Y+PJ4z11NS9EGeiv1HM0uVq+6SfmVeXUTmsaccaLFTrtIx782XJtqRmMWkrZEA3M1FOYe
	 HrrTS8QRfNSSJqOrwtWkMpElbUAEEe33wJciCEGCpYNX+qUJ7WlgK+W9/6ovbhpvwK/M0
	 iw81RCqnnjqqToIRc+H5xyeHIRWWcnVOQpxhYBmGK+HDRKPc61oL+ZozttKqkMo1Xzg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793966913;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=E9DyaOqiw31jn8Ne81wrLsB3uIQ8LtKMZtFF5QEWE+M=;
	b=X8QDHgZqRE/m/pIvAjYCsgNVlrg5BPnsCsXdbFNTteWt4qv69YpzsnTOxGzpVBOaNdEq
	 +GKOHvslhzCO2y4hzdGuGMrkOoFrIhYek87i8Qm7D9B+ydVycDc6mZ0RTAVI3tRhIdXfK
	 ccc5g5j42Bs/YTPQ6VkF7UREo6HUpI5XtkMXGZt5ShNBuBe3131JyJu9FHwDfpdmPXrag
	 osYYZ1qfijrQqmQ7uJ0hmCWa1Lr574Vq5tdJ5wFdY54IDUxMcIp4SC2gGQbJ9q+KcGPWR
	 qIL35Ey+ZuWRHq16fdtAfJEFF0ylfGrLqaU2IUa9IdOCLzeNBP/2lVDHehVOaDq7v/w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=o9rmqepd;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=qS28xxyN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.165
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE6A606A32E;
	Fri,  6 Nov 2026 12:08:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDE6A606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=o9rmqepd;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=qS28xxyN
ARC-Seal: i=1; a=rsa-sha256; t=1793966901; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=JDAPGUGRPdUSvJn4Wu8v0f1eTCPjRVx2NF6ILteEuirA9XncE3YverJYaLCxiZCysp
    32mAUqyi7VPMeiEvulp38kOKprTPOGwXfsQxvf5K17qlZ923Uo0hehkalFYDrb8b6YTk
    ecnI8J5jYhfuLLg1yKC4mrXTn3PJT7nG8VhPwMcDKP2vjGNt4wIRiQwmkGTkIzU3ynOy
    X3itaWFFY4+IvKbUqYn8EK/Xghl23VW24Ud2ZOBU4vhikXLy92ppq7EtnF5L0B/YfBaj
    9yeEQM1ylOY3cUG/v49cLodxlNIHzlsZW0MYbDfD/hcsbs2DzN2CaTxJhdUWCZJ0MLMa
    R9zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1793966901;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=E9DyaOqiw31jn8Ne81wrLsB3uIQ8LtKMZtFF5QEWE+M=;
    b=lNGqd9gz1manGZIRqWmVtVCwxatG0vUQWNVJqKdx5KuHf9Gg2UAN8xkP4kSjPLfS6C
    VIXfFuiebt4U6UoytOV7e8+/X4JRAp1hojpCW5rtD7xUqsNEIueaiSUzDwERWSPp08Pp
    i4JYqffktuPZ/Nn+D+GHRW6gi0pQldlW+bPeS4XsvEoJkVz2So1F2RVnsmuy02KCr4vr
    XtP7JXQiKBZcvbY5wgoYDhAQvkW5ezHEbdPXgbZC0A0G3FWCFEx0TtL/GUe4uu5nR2KY
    5XsglSPH2NTYWtI6Brpw0vhH0IKJtjZpEVdVC++v4TruF/pylSw+MdTrn8K8vsEjGnyO
    gbrA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1793966901;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=E9DyaOqiw31jn8Ne81wrLsB3uIQ8LtKMZtFF5QEWE+M=;
    b=o9rmqepdfAPTt8aI0tMoKKkAJ6J2ZVGfy7Nhbyx0MZAgWIwN/Y69GeDXez64nSlhTJ
    WIU+Nd2Gh5Ipjtganfk1jOQq1OwR3f0OkrnnHdbWSgQHcfHQo46eBAqyqod4ZeEKrzsI
    mD1Nbr/AjwL3nAEaAUT8SVbYmFSqYE0fep2nJ3RFkZZ0jY3RIHGKIfxvbJfuS2O0Y92o
    HDBcmMRcaFFc3e73OZ3HtnHn3ULMGopNM9Z4MvCMjHDYjwTvLE/tiBnXDDYfn9JbU+2b
    PgitfGbDGVw6OxG2uW0N6Zs/i5Hn026p9DlLRTGfvRAcOnsX3CyiHLJTnbo7De+NRdub
    /5BQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1793966900;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=E9DyaOqiw31jn8Ne81wrLsB3uIQ8LtKMZtFF5QEWE+M=;
    b=qS28xxyN+IL3tnsQy1w6FGAyEUpwJI9p/qJtcOtFTfgvZhggwms4zIPfuApSsFmYQT
    oLQdge3SQG9uufzZbbDw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrVjZoMy8iN4frnsPsBQ4l+mfK4O7kvgww6TmAq"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22A6C8JnIv
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Fri, 6 Nov 2026 13:08:19 +0100 (CET)
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
Subject: Re: [PATCH v2 2/5] dt-bindings: display: Add the Ingenic X1600 LCD
 controller
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20261106112128.14213-1-olivier@mgcrea.io>
Date: Fri, 6 Nov 2026 13:07:48 +0100
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Paul Cercueil <paul@crapouillou.net>,
 dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org,
 linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <875B7793-58C3-4659-B115-1B759D4F8C50@goldelico.com>
References: <20261025191640.13592-3-olivier@mgcrea.io>
 <09A3F895-9007-414E-8EE0-17BD18E63F53@goldelico.com>
 <20261106112128.14213-1-olivier@mgcrea.io>
To: Olivier Louvignes <olivier@mgcrea.io>
X-Mailer: Apple Mail (2.3826.700.81.1.10)

Hi Olivier,

> Am 06.11.2026 um 12:21 schrieb Olivier Louvignes <olivier@mgcrea.io>:
>=20
> Hi Nikolaus,
>=20
> On Thu, Nov 05, 2026 at 11:27:12AM +0100, H. Nikolaus Schaller wrote:
>> The manual for the x1600 is a bit ambiguous, but the x2000 and x2600
>> documentation identifies this block as the "DPU (Display Processing =
Unit)
>> Display Controller" (located at base address 0x13050000 on all three =
SoC).
> [...]
>> Please update the compatible string to "ingenic,x1600-dpu" (with =
"ingenic,dpu"
>> as the fallback) and rename the file to ingenic-dpu.c to reflect that =
this is
>> a scalable DPU driver not limited to "LCD".
>=20
> Agreed on the name, v3 uses ingenic,x1600-dpu. The X1600 manual says
> DPU too in its register and clock names, and when I checked the driver
> against the X2000 manual it came out as the X2000's DPU without the
> composer.
>=20
> No ingenic,dpu fallback though: writing-bindings.rst asks for SoC
> compatibles rather than family names, so an X2000 would be
> ingenic,x2000-dpu, with the X1600's as its fallback if its registers
> allow.
>=20
> The driver keeps its file name for now. It only drives what the X1600
> has and what I can test (parallel RGB from one plane), so the split
> between the core and the interfaces, and the X2600's rotation, is =
better
> shaped by whoever adds the X2000 with a board to test it on.

So we will have:

$ ls -1 drivers/gpu/drm/ingenic/*.c
drivers/gpu/drm/ingenic/ingenic-drm-drv.c
drivers/gpu/drm/ingenic/ingenic-drm.mod.c
drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c
drivers/gpu/drm/ingenic/ingenic-ipu.c
drivers/gpu/drm/ingenic/ingenic-x1600-drm.c

What about ingenic-dpu-x1600.c then? I.e. make the DPU variant a suffix?

>> However, this approach triggered a kernel lockup during boot
>> right after successfully running lg35583_get_modes().
>=20
> I can't reproduce it here, the R1 comes up with its panel at every =
boot
> (with v3 again today). With nothing on the pins I don't know yet where
> it would hang. If you get a log of it (the last lines with
> initcall_debug) I'll have a look.

Indeed. What I have done is to hack some return 0; into the driver =
because
probe fails without missing SPI client - as it should and likely does if
you disconnect the panel.

So I should try to locate a non-SPI panel and pretend in the device tree
it is connected...

>=20
> v3: https://lore.kernel.org/r/20261106112000.1612-1-olivier@mgcrea.io
>=20
> Thanks for the review,
> Olivier

You are welcome,
Nikolaus

