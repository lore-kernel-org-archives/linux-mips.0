Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774E94BE427;
	Mon, 28 Sep 2026 13:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790601701; cv=none; b=pq9zc4n3G6pV5PDbXXOTBeV2XdenTvpps6F1CEcBh1FEZFOVX9ad6ARNwymWRVen5+bImZP8n0dpEihPSqIlFoJhUCxDl+LvEWfAqfdLEpmZ5mSgJyArVyTG0xGFZAl4Q5NRmJex8tF35KKAP41w9EHFASkvZHBy59B52ltiPrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790601701; c=relaxed/simple;
	bh=x1D0QoufT72ejVGSPHgveKcSgWqUKenXwFbkS9dmLKE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QbEKwBIg9/RYYKQCaJwLkiJvbM4olY07I5vChKfkUahowcXSH2GbwV14AmmPITqwq2Gkwb7gEU1RBvcBINKRPxcrx6JGfVsuNkSHJM4ooGJkokrkJWgE/xVm8gBNY4DdbFJamIN4S9vVVC39IDmrxAZP8W5l0dyUFBsCG9gStsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=yE3CObL7; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="yE3CObL7"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C62BB4E4109B;
	Mon, 28 Sep 2026 13:21:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9914F601BD;
	Mon, 28 Sep 2026 13:21:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 354EB103295D0;
	Mon, 28 Sep 2026 15:21:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790601684; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3hra08UulIj1wErgEa497/4hZeQq76e9keVXjHYxarg=;
	b=yE3CObL7D81xrNCdPmuM7o6JMkXy0WnkkmHdixsAzv1AZKPg/lCo8b1UO1rOW4oFBq31UP
	quDRGgXDKo1FIuyCQvx9LIryfC/lC61WrsisfjbKlgoLfY2ct7P/ToJJoS1eKOqhMUQ+LJ
	/iajXdYI95CrOVLiv24nhrXLhDWmazKRQT9pmBkdosXbV0QuFHnd9snJRkRGjVBPAKvGSh
	9kpZFUQ4aWuXnhMghaheQh4G8sGgXqwITNrcj+KwQsndEQesu5barW6c68jVNglIFYb4uV
	K6IgKJcL/4lB680QySGY+WoG8wNFebZfRc+v4+DAyivjuhFD4lCIy1IC+UvlVw==
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
 Re: [PATCH v3 3/5] irqchip/mips-gic: Enable interrupt when moving affinity
 across clusters
Date: Mon, 28 Sep 2026 15:21:20 +0200
Message-ID: <y4vUShEoQtyRfhBov7prbw@bootlin.com>
In-Reply-To: <aromxuuQiPvajsEl@alpha.franken.de>
References:
 <20260907-sync-gic-counters-v3-0-3d891ddabdaf@bootlin.com>
 <20260907-sync-gic-counters-v3-3-3d891ddabdaf@bootlin.com>
 <aromxuuQiPvajsEl@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3

On Monday, 28 September 2026 at 10:35:18 CEST, Thomas Bogendoerfer wrote:
> >  drivers/irqchip/irq-mips-gic.c | 16 +++++++++++++---
> >  1 file changed, 13 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-=
gic.c
> > index f2ae60d39d66..4b76a65f12c9 100644
> > --- a/drivers/irqchip/irq-mips-gic.c
> > +++ b/drivers/irqchip/irq-mips-gic.c
> > @@ -390,14 +390,17 @@ static int gic_set_affinity(struct irq_data *d, c=
onst struct cpumask *cpumask,
> > =20
> >        /*
> >         * If we're moving affinity between clusters, stop routing the
> > -       * interrupt to any VP(E) in the old cluster.
> > +       * interrupt to any VP(E) in the old cluster and disable
> > +       * the interrupt in that cluster.
> >         */
> >        if (cl !=3D old_cl) {
> >                if (gic_irq_lock_cluster(d)) {
> >                        write_gic_redir_map_vp(irq, 0);
> > +                      write_gic_redir_rmask(irq);
> >                        mips_cm_unlock_other();
> >                } else {
> >                        write_gic_map_vp(irq, 0);
> > +                      write_gic_rmask(irq);
> >                }
> >        }
> > =20
> > @@ -409,10 +412,17 @@ static int gic_set_affinity(struct irq_data *d, c=
onst struct cpumask *cpumask,
> > =20
> >        /*
> >         * If we're moving affinity between clusters, configure the inte=
rrupt
> > -       * trigger type in the new cluster.
> > +       * trigger type and enable the interrupt in the new cluster.
> >         */
> > -      if (cl !=3D old_cl)
> > +      if (cl !=3D old_cl) {
> >                gic_set_type_locked(d, irqd_get_trigger_type(d));
> > +              if (gic_irq_lock_cluster(d)) {
> > +                      write_gic_redir_smask(irq);
> > +                      mips_cm_unlock_other();
> > +              } else {
> > +                      write_gic_smask(irq);
> > +              }
> > +      }
>=20
> shouldn't this be done depending on the mask state in the old cluster ?

Good point, the interrupt could be disabled when changing its affinity. I'll
fix that.

Best regards,
=2D-=20
Beno=C3=AEt Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



