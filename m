Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF59851D519
	for <linux-mips@vger.kernel.org>; Tue, 29 Sep 2026 12:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790684062; cv=none; b=p35YmITyA+8fk/QPEHFWwAisVDgIvLInKJDHLk0CCroVRqy8piBd10UsA/4Ngg6TAa8nFjPlVCc7FQ87pdPpUwF8we1d9K8zDUx8+wYEw2pjY1L/k6X1a50yNYCgIc/7OHn1XhdnzAdZDxstBX2ai/1k9XQGJL01422DU3wFgW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790684062; c=relaxed/simple;
	bh=KhIh8jDxxMaEfdAZOhh4x2gtTHWj4TUwZhIeZD3Oj0U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DatTTU02P3T+cz3/YYmQO6UFPTV7KCr8hjvAop5EiJiDPAxisCORIBXPdoIFo6JHPOG4oRo2cSzT6eitUZHlLXR9FYhR1z/VDmWw3BAUA4xRuwZOuI7ICu9ciUfgoCv/jZ8Rp5t8q6hEgFvI80dwGYuYAlg+YtqZ/YFMxtEHgHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Yrwutb1I; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Yrwutb1I"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2D6B74E410BF;
	Tue, 29 Sep 2026 12:14:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 02592601BD;
	Tue, 29 Sep 2026 12:14:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 38B8510328BE8;
	Tue, 29 Sep 2026 14:14:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790684058; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dsP4s3v9O03dMEBTTcYVgfqzV12BCg/27SQrLcTF6Wg=;
	b=Yrwutb1Ij8v6spYiaOjZ1TcZ1gdM8ntNDZROD/SEP2nKPJQL0TKejjMFEwS61RVFm8Q+X2
	G/8F7sCRDze8MbjQEbQFzA3Nywq6gWgnJ+0RMde5FINHBvpj+Eejkikuk61DLMWust5Y7d
	vGeOQNBTZofEbxF2l5fPNRQ7Np5gNTY15Pm0IxG1rO/rCUyBA1BF02JZp7sP3q1ydTQsIc
	ymWPsuXmjUykiA3M7163Vnz3cmDp0UmAuDiUO5R6ZpWF2HzZDosqMVbPtp8xGoii9UU4lg
	LnmS6/pbSNV38uJ8Ce7xdGDtWcfZ5aN36D8kJ0OJV6JRLH+FynunNi/SJgRhjQ==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Tue, 29 Sep 2026 14:14:09 +0200
Subject: [PATCH v4 2/5] irqchip/mips-gic: Fix recursive acquisition of
 gic_lock in gic_set_affinity()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260929-sync-gic-counters-v4-2-ec70c4b60434@bootlin.com>
References: <20260929-sync-gic-counters-v4-0-ec70c4b60434@bootlin.com>
In-Reply-To: <20260929-sync-gic-counters-v4-0-ec70c4b60434@bootlin.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Aleksandar Rikalo <arikalo@gmail.com>, Paul Burton <paulburton@kernel.org>, 
 Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>, 
 Chao-ying Fu <cfu@wavecomp.com>, Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Commit 322a90638768 ("irqchip/mips-gic: Multi-cluster support")
made gic_set_affinity() call gic_set_type() when an interrupt's
affinity is moved between clusters. gic_set_type() takes gic_lock with
raw_spin_lock_irqsave(), but gic_set_affinity() holds gic_lock at that
point, so the same raw spinlock is acquired twice, triggering a deadlock.

Split gic_set_type() into a gic_set_type_locked() helper that assumes
gic_lock is already held. gic_set_type() takes gic_lock and calls the
helper, and gic_set_affinity() calls gic_set_type_locked() directly,
since it already holds gic_lock.

Fixes: 322a90638768 ("irqchip/mips-gic: Multi-cluster support")
Reviewed-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/irqchip/irq-mips-gic.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index 3b31cbcbed6f..f2ae60d39d66 100644
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -297,14 +297,14 @@ static void gic_ack_irq(struct irq_data *d)
 	}
 }
 
-static int gic_set_type(struct irq_data *d, unsigned int type)
+static int gic_set_type_locked(struct irq_data *d, unsigned int type)
 {
 	unsigned int irq, pol, trig, dual;
-	unsigned long flags;
+
+	lockdep_assert_held(&gic_lock);
 
 	irq = GIC_HWIRQ_TO_SHARED(d->hwirq);
 
-	raw_spin_lock_irqsave(&gic_lock, flags);
 	switch (type & IRQ_TYPE_SENSE_MASK) {
 	case IRQ_TYPE_EDGE_FALLING:
 		pol = GIC_POL_FALLING_EDGE;
@@ -351,11 +351,16 @@ static int gic_set_type(struct irq_data *d, unsigned int type)
 	else
 		irq_set_chip_handler_name_locked(d, &gic_level_irq_controller,
 						 handle_level_irq, NULL);
-	raw_spin_unlock_irqrestore(&gic_lock, flags);
 
 	return 0;
 }
 
+static int gic_set_type(struct irq_data *d, unsigned int type)
+{
+	guard(raw_spinlock_irqsave)(&gic_lock);
+	return gic_set_type_locked(d, type);
+}
+
 #ifdef CONFIG_SMP
 static int gic_set_affinity(struct irq_data *d, const struct cpumask *cpumask,
 			    bool force)
@@ -407,7 +412,7 @@ static int gic_set_affinity(struct irq_data *d, const struct cpumask *cpumask,
 	 * trigger type in the new cluster.
 	 */
 	if (cl != old_cl)
-		gic_set_type(d, irqd_get_trigger_type(d));
+		gic_set_type_locked(d, irqd_get_trigger_type(d));
 
 	/* Route the interrupt to its new VP(E) */
 	if (gic_irq_lock_cluster(d)) {

-- 
2.55.0

