Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795714833;
	b=rNQTSPEneKKIpNKM3guGqZ41Trc2srA3/HWA8kE+IHyRN1hdMvTXIkYKp6RN/VjjnJoc
	 tLQsAWlJG7z3/4EUzwLuZAYc/V4JvUOcTboQ8OjL2XZ5h7/aeCNAkb36svcNCafidvrqW
	 OYIcqvaWhcHEXvgJkv0fSCUh5ZPuY1pbtU9DDY6rLq0/RTVV2Ykjo6mINHIojJ0DJMN7h
	 q1JsD9FR1dJNLn5Jt5XagEts4Jp5RX9xku+gQ+mfKvPCLZmNcYBIfPS9GDe3y5oJ8euCy
	 DZOIscc3yccPhARSeRUNmIwTqeTZlP1m5Apk5Il1kj+sOle9PnpUPI90Vlju3XIEqaA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795714833;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=WnUI0hkBPpSkdO9GvSJqBbk00QrZu2iiDVFhG7JTP+o=;
	b=uakhrZBj16Owo8+ehVeVxLz8kHAAvvq3lqKh+Ldpy7X7sZvWvILIPa1+WGxy3VQmfIey
	 F+Ve+bNlIxnmDh/rfAgJYkvJrYL07+byunYTKN1HwmpaOMkSUsna0ztlGW9upoDTLE7Mx
	 1IyPwLiPUwl9ldL01LZOk0/3AK6gA4l/ZKrvXpxckYcvPCOctJ4SJw5ZVAcFM/r4wsYil
	 09gr+8umV0D1kzQmUQDNrbHN+pU13jYJyN8hk2n26FAKs0PjJ9+sku3zSU9uubXLGoKqa
	 4Dp+zNmR9hZcee0nSjb2HD6pCV9xMpheqwfOi+NCYZM+jrbeQsbOcaImUIuaKz1QXSQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=thegoodpenguin.co.uk;
	spf=pass smtp.mailfrom=thegoodpenguin.co.uk;
	dkim=pass header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=koJgtQ0K;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.53
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBA5606A32A
	for <linux-mips@vger.kernel.org>; Thu, 26 Nov 2026 17:40:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDBA5606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=koJgtQ0K
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-9213eb1f3a7so61608086d6.0
        for <linux-mips@vger.kernel.org>; Thu, 26 Nov 2026 09:40:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795714832; cv=none;
        d=google.com; s=arc-20260327;
        b=ZorGmtUGlm86u/QXjmP2kBXDyoEcxq20VXD5BGo1QXu7+QnDoqWoBzJFu8VuPsnFeI
         WwefTsOxllkTDu5nA/2NRoyAzzLSxgjUq6DcOhF8SY9IcQpcvuB/T8RL9hrQFtiXmXbB
         UyUK3eypqKjUSVKY7EBkaBqq+kD6kBbaGoyJZ0fOYgsc/1ZZOySBroeigPtetQS+bxHm
         DJC37eNSZBNCedfM4VtKxLb2Yn5TyCfdG7vjvjckUPEx0kkqHa628nETN/uD3f5Dx1lw
         GGNNQpzUxbglQOlXpl2B6OBl/U/zBw1JXhxRV9feaiugmwa0a+sWT0rXqFJnYOjcKQkX
         LfZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WnUI0hkBPpSkdO9GvSJqBbk00QrZu2iiDVFhG7JTP+o=;
        fh=XR3u4zcRNOvwgEMVfSaFGFlnkmLp9W6LD+Iiwn7qL9E=;
        b=Vs5dxCdOy6g57OFIpXiFB9G9jjehssNjtUweXcEDnpDEAf7dpBX+j/vduMsolLFfbL
         woYVaErxOiVsUAdmTSVzQ9WztynrNNu1lo4wy/5c5ONAgl7hAsrkS+G2mN4cjma4IrXy
         gpoaAeVwr70WNuAJ1+Gg8XM/7IrQmpF9cXf3TUC/AJKekJV6ov4RclAVOKxKNTDWo1Po
         kdu+xB57CDSMRQR3RF9sCtkwyvwv346TdiOgBVzm0ba+/oZj/XGz2jzKWaJrTdsIixV6
         KyqIt54itcdSOSlKcPnz88r1Hg7xstYDCaVZzUkQ4uh0dUahZZY4yEudpkT4OXRVt/xf
         S1lQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1795714832; x=1796319632; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WnUI0hkBPpSkdO9GvSJqBbk00QrZu2iiDVFhG7JTP+o=;
        b=koJgtQ0KLWRudibXdRD3TYnXWWnPf7e0C8y5LTWdUuaKVIfZqQoTaOdUn1Q0V76OEc
         E3aYd1F2yhIuzNlsvoWrs6e/LPwSAbflsD6MAzyPXGkPGcTXl26Rt952VWmm3H06B5K9
         buCKiCA7oBahEH6yVxnaY8L+g6mcbdys0Kr4faC4ajE/s0HZLcM0U2m3U5ndNylxobp3
         3LYeL4V5xVaJ/edeh9xQ7/OMq6rU6mJZd/KyInScBCCzq8vV/RTojclmchkwYwXz32F7
         G8pPnhgThJNOd9AtGm4q71iInfNGJMfgp9Xx2ihWTPfcThxxatadk2gNQV6VvMhVuJNS
         0Fqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795714832; x=1796319632;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WnUI0hkBPpSkdO9GvSJqBbk00QrZu2iiDVFhG7JTP+o=;
        b=2Qr2PruF1eyRRLIBhtyOxs70CWvakNmUlCJaf6wtcC2JvXvmm+375llyTI4IvZC/mH
         RUvo+UDNCPv1HDjTlz3RVPy/ztBApZ+u78m71PEFv6sEv0Mw18Wf5xadsqlJ6H4+S/79
         t1GXMrzF2aMzi5l9QZIWhBqLbyeaGSdk30yZrJr9npAj3Azx7UHtIyqsOuhZUZjhNT28
         z3gp3E6fyuUpLpxGWSo4HTXDNs45KM84HPt+wy33oX6zhJ4GEPTkvWF5Oj0FQe32LtiY
         KlndjePsnIZTxnDvamFbAOVd75h4ZFdKQdeBTIzeIZ00lt9CNU5Nyfxif7zhfnn8g8Vu
         zRoQ==
X-Forwarded-Encrypted: i=1; AL+hErHJETIcUBvenMQh/ciE53mTIasaFjWUj3Chh9FxY2nTE14hKoI2gZrmOhEMt8tVeHvRt4B3jpa57dOr@vger.kernel.org
X-Gm-Message-State: APuU4Z/wWC3uyRadzW9ZkNa8boXGE7IGKuEwLH/60v8xhZV2lVD3Patu
	Uh/4WvWTAVCF3bG8WLta+u/yNr5nCt3yYWl8g+CPYcgNP5bVc2QHx1bfEMKuIjxyQbidvpwLReg
	pJbuYVWwe8le6AmrfL7StPOaWmm0ayYqlnSmBIZWr9A==
X-Gm-Gg: AZFdTZcPYNM34+vsfjpUyY6pDGAq8a3mKgpg2z86sdnAAuSpU8j0cTWAtfHvKNdAhjZ
	7sdqDR8Kjw2rfH4JVGNb09Y1pzzX6WlOQxKJoDT21/yB2r92wOTyMdkGEOhk0O+o4FcMnF67Zml
	oL6HnkuLng/qNnBjK9rAQC6StohU+qxSaA9Wt3L1BfWnUli+720hWgTpjErfjWSGGGi8bCAYaEj
	FIZsYhT2nJ872R6VNgbaEkjRnhju/akSYbMIgDL5c7cKB1wBRLprwWsSJNXNhQ/2Jo1tETQmQBP
	/anRrvWNBQ2TwZSCuc5q18PSMRHTyaLIcxuIhuRibVUDoxEf0ubmSLaFBKhTUGnl/LeYpggsSdC
	IjBj24cgVq/Y3GbUFbh/WXM3AjhfrwUN6RtBHwOgU3rWZURBJz3eCqr9Av6O/h5XFmt4zB+A=
X-Received: by 2002:a05:6214:3c9d:b0:91c:9316:f4e8 with SMTP id
 6a1803df08f44-92134baab8amr374316166d6.54.1795714831544; Thu, 26 Nov 2026
 09:40:31 -0800 (PST)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125-acpi-mtd-v1-0-42ad2f645bee@thegoodpenguin.co.uk>
 <awcZcuSbse5g3FWK@monoceros> <87v75jyiw2.fsf@bootlin.com> <awg4ubbFu0FksThB@monoceros>
 <87a4mvwv1b.fsf@bootlin.com>
In-Reply-To: <87a4mvwv1b.fsf@bootlin.com>
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Thu, 26 Nov 2026 17:40:20 +0000
X-Gm-Features: Aa3M54pTYXahjqTv7_MT1I1wEAeHDvmXQpnCEn41MhhclxuSVrfOIbrke1NKz3k
Message-ID: <CAA6zWZKPY-wjq_sbheLBK-k1b6rCdXs353b7j-fTYB6vTGLmGA@mail.gmail.com>
Subject: Re: [PATCH 00/10] mtd: use desginated initializers in *_device_id arrays
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Michael Walle <mwalle@kernel.org>, Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Alexander Usyskin <alexander.usyskin@intel.com>, Joern Engel <joern@lazybastard.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	Michal Simek <michal.simek@amd.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Brian Norris <computersforpeace@gmail.com>, Kamal Dasu <kamal.dasu@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	William Zhang <william.zhang@broadcom.com>, Anand Gore <anand.gore@broadcom.com>, 
	Kursad Oney <kursad.oney@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Han Xu <han.xu@nxp.com>, 
	Paul Cercueil <paul@crapouillou.net>, Harvey Hunt <harveyhuntnexus@gmail.com>, 
	Keguang Zhang <keguang.zhang@gmail.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Liang Yang <liang.yang@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Linus Walleij <linusw@kernel.org>, 
	Kyungmin Park <kyungmin.park@samsung.com>, linux-mtd@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	imx@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Let me know what you intend to do.
I might as well address the nitpick since we are refactoring already,
so please wait for v2.

> Not related but since you were removing the /* sentinel */ comment
> sometimes, when do we get rid of those extra entries entirely?
I don't really know if there are any plans for that, I certainly will
not attempt that anytime soon.

Thanks,
Pawel
