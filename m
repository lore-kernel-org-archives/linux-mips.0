Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7F64E06C3;
	Mon, 28 Sep 2026 14:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790607425; cv=none; b=Y03UH+AUtWyTJldgYTMYhP59hvY6TpWOpYYI44VmbdyVZjaMAyy/Ms1AS4fdr/lxD1S0UnokvH25iyKie3uZB4hGONZQrQP/GJAlCMpzF76KLZuwL1g7sf9URFiWhD0WTqSk4ATIr79rv2wTC4W0j78RtNnUVgGqA6+yLpL90J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790607425; c=relaxed/simple;
	bh=iu767C7oazdHg6rnAn10xIcDqxsT1uqznpbmhJfHWN0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TDnS8a4xBI93hnGwqp3aSo23roHU1XdAk7gH8NpfUIDfDS2MpYhwJNMCpIQP5Bwc73M/AK1yUlbHp2FLy4PKFap4WR96W+ISfD7ze0zF13bTVJKeo4pWvcfh+RCRfBV8PMIns/qPjV2yMclR4JLVZ8kRy04WlOaJp6lmo71iHz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=P15vfzzp; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="P15vfzzp"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9A9384E4109C;
	Mon, 28 Sep 2026 14:57:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 662BD601BD;
	Mon, 28 Sep 2026 14:57:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 29042103294FE;
	Mon, 28 Sep 2026 16:56:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790607420; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9SG6HnjJMbiEd3rQZfoD2aJu/0ofPFvh5TTaAom7dws=;
	b=P15vfzzp+DIrxPF+QOubpZv+RLOaHOj1mhwj7ZYio+KIJ6qitrtjChugc61wG6lsLzig5p
	TpldYBLLdgOxhhRKiVUJ9DC87lQGR7qiocjLASsy/RVbG4wsnKLRvRIhFSdxCIKuwcRFsl
	t+YNjn2kIlUspWFH8Qdo3Xh2TApHuyJZj/INx0N+MG5K6Z2x2mp+r/+fQdi2FIgOu300Ec
	sX3MAKKTS5KngugYwS8+JRy1I5dMf81PWJddSe4Ha7eW/Ug//Um63FZBTVibzLLFLrSOYz
	8+IGIYwot3Ft9S9Yd7yoYfGBSt6V/t6j7h/20AupJRM0fhHKvdO2N9drd0baZQ==
From: =?UTF-8?B?QmVub8OudA==?= Monin <benoit.monin@bootlin.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>,
 Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>,
 Chao-ying Fu <cfu@wavecomp.com>, Aleksandar Rikalo <arikalo@gmail.com>,
 Paul Burton <paulburton@kernel.org>, Radu Rendec <radu@rendec.net>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 =?UTF-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v3 5/5] clocksource: mips-gic-timer: Use local counter on synced
 multi-cluster systems
Date: Mon, 28 Sep 2026 16:56:56 +0200
Message-ID: <VWJi1WtNRXGGDz_FRKyR5Q@bootlin.com>
In-Reply-To: <arpA1BHikxF0Zrlb@alpha.franken.de>
References:
 <20260907-sync-gic-counters-v3-0-3d891ddabdaf@bootlin.com>
 <20260907-sync-gic-counters-v3-5-3d891ddabdaf@bootlin.com>
 <arpA1BHikxF0Zrlb@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3

On Monday, 28 September 2026 at 12:26:28 CEST, Thomas Bogendoerfer wrote:
> > [...]
> > +static void gic_clocksource_promote(struct work_struct *work)
> > +{
> > +      if (gic_clock_unstable || gic_clocksource.read =3D=3D &gic_hpt_r=
ead)
> > +              return;
> > +
> > +      if (clocksource_unregister(&gic_clocksource) < 0)
> > +              return;
> > +
> > +      gic_clocksource.read =3D &gic_hpt_read;
> > +#ifdef CONFIG_GENERIC_GETTIMEOFDAY
> > +      gic_clocksource.vdso_clock_mode =3D VDSO_CLOCKMODE_GIC;
> > +#endif
> > +
> > +      if (clocksource_register_hz(&gic_clocksource, gic_frequency) < 0)
> > +              return;
> > +
> > +      if (mips_cm_revision() >=3D CM_REV_CM3 || !IS_ENABLED(CONFIG_CPU=
_FREQ)) {
> > +              sched_clock_register(mips_cm_is64 ?
> > +                                   gic_read_count_64 : gic_read_count_=
2x32,
> > +                                   gic_count_width, gic_frequency);
> > +      }
>=20
> this feels like a lot of work for just replacing the read method.
>=20
> Why not introduce a flag in gic_hpt_read(), which indicates whether
> it can read the counter directly or need to do it via
> gpt_hpt_read_multicluster() ?

Yes, this way I can avoid the clocksource_unregister()/register(). I'll do
that.

Best regards,
=2D-=20
Beno=C3=AEt Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



