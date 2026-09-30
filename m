Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5801F37CD22;
	Wed, 30 Sep 2026 15:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790783378; cv=none; b=OY4wbzLLfEOGQBT73Mn9V0iIW2GOmCEovdXC3MNuBdkOPeR4284K38OcoN02709D9pMUkJQrv99XjWYIUiB9SEt68ieW22XSRAawSUfAg3d71szGEHWlCub41kQHYYcMaTNe9Z5Ws15rz3faHIgUZ+IE9yr9Xsp+fo4xlhiNnRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790783378; c=relaxed/simple;
	bh=BZkNu09Lfo6E+PsCpkCvwK4EEJPyrX4CAGS3ahr7LG8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e8WMdZSxUy8nZ/z5ZBaAf9l/F8qnFty35sUIRTmwCMGlhQynDGH86riqoThCMoS3BB0xIGrYqRdBVhVE5VxvQEmw54L3V77uowBv6RLWjtU+CDc4Q2owLU32fZVsyfjygd+ndkAnnYEzR+jeVXUN9bCWK3/ul6doftgHQ8n+9tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=dWbqTVIG; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="dWbqTVIG"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 68D421A1072;
	Wed, 30 Sep 2026 15:49:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3B3F060749;
	Wed, 30 Sep 2026 15:49:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9F1B81032982E;
	Wed, 30 Sep 2026 17:49:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790783362; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ugAZhI+twJwNfbo6mFa57skyyDPMFQpEayEsyi2uEZc=;
	b=dWbqTVIGz2+RpQy77T547XaL0yN4tBM/cauDoqWYCYcTn7sAUqzs+q3xYeFHdynGA7DN1B
	VrdJ1rmL5GYiBiZUy1iMA21YdlI9fzE8jdU2qJJOV18lA2UCw6EUkCyFPFfxsEnN+YzHTo
	pIIlBmPW8m6/0sHj0tKsWhhwuL8HEb4TxFogctwfKkyvL7ALA+AqK3EDSR6BBNUOhHSL83
	Esnc//5dx+6eSWVKppS5NhuQPCubrJXxCfwpaCKrflwrEB7S8CZdAKB66/PLt1dXD/4GQJ
	fJaXB07SPafcKgotLQ54wGZEUimkgGnm3IVWntCSaHfzFybLbSaV/mFrSkbSgg==
From: =?UTF-8?B?QmVub8OudA==?= Monin <benoit.monin@bootlin.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
 Aleksandar Rikalo <arikalo@gmail.com>, Paul Burton <paulburton@kernel.org>,
 Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>,
 Chao-ying Fu <cfu@wavecomp.com>, Daniel Lezcano <daniel.lezcano@kernel.org>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 =?UTF-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v4 5/5] clocksource: mips-gic-timer: Use local counter on synced
 multi-cluster systems
Date: Wed, 30 Sep 2026 17:49:17 +0200
Message-ID: <3hJ3aZuPRWSZSVZ0yXJIXA@bootlin.com>
In-Reply-To: <arvuZDCu_1vp4Yw5@alpha.franken.de>
References:
 <20260929-sync-gic-counters-v4-0-ec70c4b60434@bootlin.com>
 <20260929-sync-gic-counters-v4-5-ec70c4b60434@bootlin.com>
 <arvuZDCu_1vp4Yw5@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3

On Tuesday, 29 September 2026 at 18:59:16 CEST, Thomas Bogendoerfer wrote:
> >  static int gic_starting_cpu(unsigned int cpu)
> >  {
> > -      /* Ensure the GIC counter is running */
> > -      clear_gic_config(GIC_CONFIG_COUNTSTOP);
> > +      unsigned int cluster =3D cpu_cluster(&cpu_data[cpu]);
> > +
> > +      if (read_gic_config() & GIC_CONFIG_COUNTSTOP) {
> > +              clear_gic_config(GIC_CONFIG_COUNTSTOP);
> > +
> > +              if (cluster && mips_cm_is64 && !gic_clock_unstable)
> > +                      gic_sync_counter_64(cluster);
> > +
> > +              if (gic_synced_cl_map &&
> > +                  bitmap_full(gic_synced_cl_map, mips_cps_numclusters(=
)))
> > +                      schedule_work(&gic_promote_work);
>=20
> do we really need the workqueue ? As far as I understand
> sched_clock_register() doesn't use the clocksource mutex, so we should
> be able to directly call gic_promote() again.

With CONFIG_IRQ_TIME_ACCOUNTING=3Dy, calling sched_clock_register() from the
CPU hotplug STARTING callback leads to a deadlock. We also need the
workqueue to call it.

Best regards,
=2D-=20
Beno=C3=AEt Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



