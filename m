Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795701006;
	b=WfQW0ytXPKvZx0l8ZeF9S8qw6TwmxMDfh97yw82WNMBMTrFCTzkybZ09WqW02llM0Uic
	 ntkqRvDZQ5XhApnP85sRwtnpo+8k3rvGd9J+Ae0kaNQef6ZhI9lpp3dAl+FXdAaecqA2z
	 L/Rf1EVdJ/brsAmOk8HHYY7FO+fqe9VDQBo0Vnh+GG6WFVsqwgCe8EgN/YgxnGf8RhGaM
	 rMPFmZtcL8s5hJWSXVLuOKxi642yffNbh2nAg3oWHcKtsXoiJ1E+mf+FqSfkbGtudkxup
	 FkgMw2lErFmqprriPvn5pt68eWby3omxOooZoqmW7GDuCdjzOd/F6ahCwftKyGhp7+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795701006;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ayDmQOMbnPDID0tnpH0Cz9zV9aQl1tR/L4IizHW7J4A=;
	b=rCGWtMBOvflZDB4/gHv4Qjx1bZXXwFWUDoxZE+om0oYHu5ZnmJ222k0WbTNI+CTuww6d
	 5R4DjxIld00JlgHOE+jf6oFq+oFxfMG3QFfACCZCBhpdhMxJIRNnCv2Vt1XpnpRu4k8jY
	 RBgkX3g09FAsyKrClzrxRpDd4t0ntDUoBJAj8gqdbNfd4dG89c9q95Pdpto9AnqAtK/vy
	 H+H3LSMv18DrP/rwSFtrjbCLpHmDALOjEx4Pb3g2u4rSTMaL4ohlcCZ8NSJtXH8HTbQL4
	 X85i/donofgO8kXFYbs/E+Yr664nRZkARIRIFc3t/i2+9GKu+D2K6M7LYST20byZwDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=HEwQyzgC;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71831606A331
	for <linux-mips@vger.kernel.org>; Thu, 26 Nov 2026 13:50:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71831606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=HEwQyzgC
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-49465892f7bso5136850f8f.1
        for <linux-mips@vger.kernel.org>; Thu, 26 Nov 2026 05:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795701004; x=1796305804; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ayDmQOMbnPDID0tnpH0Cz9zV9aQl1tR/L4IizHW7J4A=;
        b=HEwQyzgCCIfsVYHkVbmM+YTPRxGBrue358ebBtB9RAGDX1yeSFqL2CvlCqbKGnV3vy
         lL1uCOOh+auuhxJbFVCmuSHE+kVsL4z8vg7BoAZpdK8JvhZYaYrljBmF8sN/Z0SaRGgy
         iSDCDSsvbQ+1VV8q9NV5yhQOBr3/yiWFjsOqATFT6Wh+bRB/hyqItyURAzZBC/xVHmqN
         pGRbUTF1Aj9FMR3lIK7FDVXVpbfiB+yA/HqBV0H9oTSP5fQOt9w4xpZogiQ6nyvyXGNF
         mpRdJGoQWeHhkGroE06n7RKJyykiXFC14T0p42YH11syijtZFmxZ2byyL3cTqmgaFtd/
         KtEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795701004; x=1796305804;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ayDmQOMbnPDID0tnpH0Cz9zV9aQl1tR/L4IizHW7J4A=;
        b=HcwqLdLTlEG0AsXI6oNc3N5zojTnw1My5J23lszc+IAHOIakezlQlKaBb7XzY+IljE
         VW0awQzESQmg0L8mAMebNuAeBg4pw95hwD+0nk39cM5WS14F6ctUc0NpAavGsLAQoL95
         drZ4E/L/lnC6UvCM6h/JV8W4UkysczYqwSwJUmCzFWiDR3egkb/A5slrNlEDx3dFLJzU
         4jyrKuxOt7XDZuRbomyemXdDN0KiSOBwGpAhLnMP3zX+LrqVziBptq8ho/6PPMmwCAab
         KA1DZD5y/4XYLAjhAwHvY4CZGZSkq3O13jMza/pW5IUv7eTWNP3ez5kbqOmrP7wTa+aW
         e1aQ==
X-Forwarded-Encrypted: i=1; AL+hErFFuDMfVsQ+yYi1xNhKxF0iRi2LP8ZysD5P78dprP/ISZI/a3eN4NHQMKqbyYo8cQ9TJj1qaOe1idWq@vger.kernel.org
X-Gm-Message-State: APuU4Z8z+YPW1cH8TcMB9lJE7xJNBhENhOrL3fOuyFWTG6aHI58UVAcs
	uEc/2aQHUu6tfeWC4b8jj4QtTdAHug+Pg5N6YEA0mgmbAGSr6Q2W9ilXZca4c0uj2Ew=
X-Gm-Gg: AZFdTZcAY31SlmCK2B46gbCAF5fffl7IXuHofmudR23EtTxlWT5EpIwS5MYYs3LDPML
	wn3YS9MynTzQUabivuj5gbH5p7iDJZMNa3WvAr20XU/uTUEZY+/3e914Hd6e4eXQ77qJOKT2Adf
	hnp3uf4ZX5FnqxKyXjqm1MDkK62BQTtTMRR7Iz5a1/27gMBOzDVadlaEVSm9163C+jkZPMD3ZyC
	olzbxB9LhkywNqh5jdosC28XPysq8o7kvUFhYfc9f3Nr++QJ0U7bNyFhL2Tdf4QRD17g3CbOHyP
	k1vUpRZoKuvN0bCFF60bVEwdyISYIpzzXDpW/oiT9ogpMPiWZleECiB96lvZNakN/a1suVZ5MjF
	mHEf39DoDjvAIn2xupIOOM7UjS+KSkFptTEZmEjHB2hyrhtDIWSnoqsBlfvlPj4xO2JwZuBXr5H
	vM+MUTD3B2P0alVNiSjCVObpFphRz+k8o0VWyXYlggOQ3Nvy3zQlXSlmi/k8ZRGhE2o/m3YUzuz
	/bhsnUGv4hYzCLmQAXSGfiuySXpR+DJWc8QBvUuh99z7U6iBhcKAcKRosGUrwyVyTYUk+9A4OCL
	cGuibK6iCxQ00+0btkR6e0T/+DIJJAFF/HKS6h+2XMFftdhli//x+drT48WFKfSxZ0g3cJiZduc
	zBD08aokS52doCa2jbgk/nNvAcIxJIr0IAje2
X-Received: by 2002:a05:6000:4b17:b0:48e:f47:273c with SMTP id ffacd0b85a97d-4abaac57a40mr41489070f8f.8.1795701003612;
        Thu, 26 Nov 2026 05:50:03 -0800 (PST)
Received: from localhost (p200300f65f19a904aae808b8a2e91502.dip0.t-ipconnect.de. [2003:f6:5f19:a904:aae8:8b8:a2e9:1502])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab6ae2dcf9sm40247966f8f.32.2026.11.26.05.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 05:50:02 -0800 (PST)
Date: Thu, 26 Nov 2026 14:50:01 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
	Takahiro Kuwano <takahiro.kuwano@infineon.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Alexander Usyskin <alexander.usyskin@intel.com>, 
	Joern Engel <joern@lazybastard.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, Michal Simek <michal.simek@amd.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Brian Norris <computersforpeace@gmail.com>, 
	Kamal Dasu <kamal.dasu@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, William Zhang <william.zhang@broadcom.com>, 
	Anand Gore <anand.gore@broadcom.com>, Kursad Oney <kursad.oney@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Han Xu <han.xu@nxp.com>, 
	Paul Cercueil <paul@crapouillou.net>, Harvey Hunt <harveyhuntnexus@gmail.com>, 
	Keguang Zhang <keguang.zhang@gmail.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Liang Yang <liang.yang@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Linus Walleij <linusw@kernel.org>, 
	Kyungmin Park <kyungmin.park@samsung.com>, linux-mtd@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 00/10] mtd: use desginated initializers in *_device_id
 arrays
Message-ID: <awg4ubbFu0FksThB@monoceros>
References: <20261125-acpi-mtd-v1-0-42ad2f645bee@thegoodpenguin.co.uk>
 <awcZcuSbse5g3FWK@monoceros>
 <87v75jyiw2.fsf@bootlin.com>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fjhsfzw7maxs7oq6"
Content-Disposition: inline
In-Reply-To: <87v75jyiw2.fsf@bootlin.com>


--fjhsfzw7maxs7oq6
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 00/10] mtd: use desginated initializers in *_device_id
 arrays
MIME-Version: 1.0

Hey Miquel,

On Thu, Nov 26, 2026 at 11:41:33AM +0100, Miquel Raynal wrote:
> >> Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
> >
> > Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> >
> > with or without addressing the nitpick I had for one of the patches.
>=20
> Let me know what you intend to do.

Your mail was sent To: me, but that was directed to Pawel, right? (FTR:
I intend to do nothing here ;-)

Best regards
Uwe

--fjhsfzw7maxs7oq6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsIOQcACgkQj4D7WH0S
/k7VGwf+JohDT6rUS7ETNio1M8Z7P9mW/dw41gur3gOUE8OBNxOfsasQ0n/riOvo
4sT4fsGJWgm+ezHKcYcrXNknVg5Hmfpk4HeA47K1y+P9G6LhwsBLtqRGMM/7dCMd
nWmBVR77ExMyThLv6M2Li7HrkLHKSnuq7/HXqOD93OrqD6YYrrRBvTsBklbEdhWB
wm40UJgQd+3R2Lwq+CSDVUYqVGj8LP+XGj2vNoHXEfGlk93ZED7JguilGU62561G
N5qNDGfQC+CzqYC7tQ2tj0TNnOK6kYXrK6jxThQovh4ubLadqtHT7mVLa3qbS36h
iO7uFgMsn6ww6nNgTXKWH62VZzkJPg==
=6HjX
-----END PGP SIGNATURE-----

--fjhsfzw7maxs7oq6--
