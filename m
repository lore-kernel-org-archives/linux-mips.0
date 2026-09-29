Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EE44E9C10
	for <linux-mips@vger.kernel.org>; Tue, 29 Sep 2026 12:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790684064; cv=none; b=XWd98egB7YL9Fra/b6r2GYE28UMnULJI3uM9tXe/zdhXwL2JOWsi7LsNA6Yfgv41eGBepi0aFbse/Y0IpQNIo/7rgL0kYdBDZHbARVoYflzg4dVTQhiA+cfi1dbecKwkmnwpfCf3TrXzg2bAyaqB/E3W08/jWmF7QVLI3btaykY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790684064; c=relaxed/simple;
	bh=KieOLW7RylFid5wyz+mz1b3HREYt00TuMlfsCAGftEw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OiIlNZRN33J/sv/63E4DjJtnQRoY/MnhJ8rUKGgIYm5UOjuSMtHTU38MEfiP6mz+S6yJdEKTEbI8oLlnBuR4jG3pF8wmWtv3PYU+9Alq5zKx7WdPbIZ+BqhTp4J/e6U8CS2eo1UEgBR9VFVXg2wS+O0He3enIloGr4nsMQADSbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pEsRLg5A; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="pEsRLg5A"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D8E8F1A105E;
	Tue, 29 Sep 2026 12:14:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AD2EF601BD;
	Tue, 29 Sep 2026 12:14:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 640181032904B;
	Tue, 29 Sep 2026 14:14:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790684059; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=s0+MWKDhP5HMmTuzdTX3ooN40b7v315Oz+r3MYIzcL8=;
	b=pEsRLg5AQfxYbENs8XH9BS8sH08MrzHXA1LwTCQQdyxnqFPuePzvPbPzuasGdkQwnB2Frv
	9sz5JuMeRmf645sw7GkJMttMv6sd9VAE00PudGlrK455bsaQ7uL5xITAxTKlu3mX6uJ15q
	/l7/rkeccXuERs5tgBzJwytYp1heE9mTq3x6G201WOkClINxCI7A7YAxmlUSCw7/TLpwBA
	9p63vUxVl2edqGaYnJi/m5rrW/8ob3+l2j8R9N7nEvWsvNfE7bTO7FKxk5NxBBxxgHfgF6
	y2lKEr87QaPP+KSHV8VYKkskSF3aIZvQA3edUyjygsfH4zAhja8Sm0BG7t+Qag==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Tue, 29 Sep 2026 14:14:10 +0200
Subject: [PATCH v4 3/5] irqchip/mips-gic: Transfer interrupt mask state
 across clusters
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260929-sync-gic-counters-v4-3-ec70c4b60434@bootlin.com>
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

When an interrupt's affinity is moved to a CPU in another cluster,
gic_set_affinity() updates the routing (GIC_SH_MAP_VP) and trigger type
in the destination cluster, but never touched the interrupt's mask state.

The interrupt mask is per-cluster. After such a move the interrupt may
be left disabled in the destination cluster, so it never fires despite
being correctly routed to its new VP.

Move the mask state along with the interrupt: disable it in the old
cluster while clearing the route so it is no longer delivered, then
configure the trigger type in the new cluster and re-enable it there
if it was enabled in the old cluster.

Fixes: 322a90638768 ("irqchip/mips-gic: Multi-cluster support")
Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/irqchip/irq-mips-gic.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index f2ae60d39d66..be38989d8e73 100644
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -368,6 +368,7 @@ static int gic_set_affinity(struct irq_data *d, const struct cpumask *cpumask,
 	unsigned int irq = GIC_HWIRQ_TO_SHARED(d->hwirq);
 	unsigned int cpu, cl, old_cpu, old_cl;
 	unsigned long flags;
+	bool enabled;
 
 	/*
 	 * The GIC specifies that we can only route an interrupt to one VP(E),
@@ -389,15 +390,20 @@ static int gic_set_affinity(struct irq_data *d, const struct cpumask *cpumask,
 	raw_spin_lock_irqsave(&gic_lock, flags);
 
 	/*
-	 * If we're moving affinity between clusters, stop routing the
-	 * interrupt to any VP(E) in the old cluster.
+	 * If we're moving affinity between clusters, save the interrupt's
+	 * mask state, stop routing it to any VP(E) in the old cluster and
+	 * disable it there so it is no longer delivered.
 	 */
 	if (cl != old_cl) {
 		if (gic_irq_lock_cluster(d)) {
+			enabled = read_gic_redir_mask(irq);
 			write_gic_redir_map_vp(irq, 0);
+			write_gic_redir_rmask(irq);
 			mips_cm_unlock_other();
 		} else {
+			enabled = read_gic_mask(irq);
 			write_gic_map_vp(irq, 0);
+			write_gic_rmask(irq);
 		}
 	}
 
@@ -409,10 +415,20 @@ static int gic_set_affinity(struct irq_data *d, const struct cpumask *cpumask,
 
 	/*
 	 * If we're moving affinity between clusters, configure the interrupt
-	 * trigger type in the new cluster.
+	 * trigger type and, if it was enabled in the old cluster, enable it
+	 * in the new one.
 	 */
-	if (cl != old_cl)
+	if (cl != old_cl) {
 		gic_set_type_locked(d, irqd_get_trigger_type(d));
+		if (enabled) {
+			if (gic_irq_lock_cluster(d)) {
+				write_gic_redir_smask(irq);
+				mips_cm_unlock_other();
+			} else {
+				write_gic_smask(irq);
+			}
+		}
+	}
 
 	/* Route the interrupt to its new VP(E) */
 	if (gic_irq_lock_cluster(d)) {

-- 
2.55.0

