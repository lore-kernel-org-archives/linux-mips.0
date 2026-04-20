Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BA23043CE
	for <linux-mips@vger.kernel.org>; Mon, 20 Apr 2026 08:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776675515; cv=none; b=Tmo9XmbaZq2TPwKlUPQI5Dfhn4OmIFMMOM/OLpz2oLH7w+mxN2OvpuFlk/yl2APFrzRVOc7Sv5XvFUS7oS4WF6RQ3CbZSnNbqveQykA/9Gtrpa7/DIsdVyMpTvIN3z4pNchpekvg/76aWezJ66Vt/3Fn9c6qbPFJb24b18+7X3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776675515; c=relaxed/simple;
	bh=Or1+nJ+H8BIA6mKXLHKIqdl0K6VpPrP5gFdQ1iG9bm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qWd6S/hB57NCXzsoplh0zkWVk/Bi61aEWIFPRjGR7up1wIfTcViSTGyuOJBeBYDkMOPmVl3C7vWwcl9xpp+u001Oxbl8gV2TUGL1sa3TMBMETWgmvvGjomDtsaW8n7c3FfkVDOoMC+i0SaGrXydq52AHYeNPey/1fkOuVz4Ynyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=lydNOFnc; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="lydNOFnc"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B3BD1C5C987;
	Mon, 20 Apr 2026 08:52:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DA41B5FFA5;
	Mon, 20 Apr 2026 08:51:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2F44C10460C14;
	Mon, 20 Apr 2026 10:51:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776675115; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GZF7yY8h18jYVbAu2nJP1WMNlmavcNiwsCRSo4plkLk=;
	b=lydNOFncyUr2rpEJO6J2mV856qqHNIvWuUYYVqU27mV1OEKFnbS16d5vk05UyI0i5k7ZkR
	Q82FG+1xS3vg+DNI8RHEb2CVxZqpFtT1p32+qMlS7qXRbKVDQr/G6PGgdMFv4N0jTMHk/i
	g+ON6QjKYOVNMkXpW0xl+EWVxB5pyjfSWYgSLyVxQgZjY4dFcssGYTq8h69HZ8gmiodzjO
	K0KgeOfO892+8489ziMkO1fm7lgaocmqqXLOqidy01eLfWcykDb1l9f5C7sz0/m4K2edvJ
	j7LtSj3BfGdxpEYEgJKtzxwAsgso1tIut7v2urOGeGWn5TjEcLnpkBlSnB2sZw==
From: =?UTF-8?B?QmVub8OudA==?= Monin <benoit.monin@bootlin.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 =?UTF-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>,
 linux-mips@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 =?UTF-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Subject:
 Re: [PATCH v7 0/3] clk: eyeq: instantiate generic PHY children auxiliary
 device
Date: Mon, 20 Apr 2026 10:51:52 +0200
Message-ID: <2591558.XAFRqVoOGU@benoit.monin>
In-Reply-To: <20260225-macb-phy-v7-0-665bd8619d51@bootlin.com>
References: <20260225-macb-phy-v7-0-665bd8619d51@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3

Hello Michael, Stephen,

On Wednesday, 25 February 2026 at 17:55:04 CEST, Th=C3=A9o Lebrun wrote:
> EyeQ5 SoCs integrate two GEM instances. A system-controller register
> region named "OLB" has some control over the Ethernet PHY integration.
>=20
> Extend the current OLB ecosystem with a new generic PHY driver.
>  - OLB is carried by one main platform driver: clk-eyeq.
>  - It instantiates auxiliary devices: reset-eyeq & pinctrl-eyeq5.
>  - We add a new one: phy-eyeq5-eth.
>=20
> Mainly we spawn a new auxdev from clk-eyeq. But alongside we use the
> newly introduced helper devm_auxiliary_device_create() that has the
> implication of setting child dev->of_node from parent. That implies we
> must drop the device_set_of_node_from_dev() at the same time.
>=20
> Philipp Zabel gave his ACK [2] for the reset patch to go into linux-clk.
>=20
Is there any way to move forward with this series?

With the latest changes merged in Linus' tree the Mobileye EyeQ SoCs fail to
boot. This series is needed to resolve the boot failures.

Best regards,
=2D-=20
Beno=C3=AEt Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



