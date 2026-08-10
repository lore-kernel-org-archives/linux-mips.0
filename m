Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AA73FE35A;
	Mon, 10 Aug 2026 14:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786371966; cv=none; b=t4x+yUbYbbG+dN2VF8pBg9XJbpJF27vMBayk855vkbwwzlCvHCbIVevFlymqhD2MDliOF10smufPZR8sTU5wxj3f8n+IjaN8GwnUnC/SHm+PlgKPzO5bClM3h57H+MkTD8oVMiwR1ywZKiFbGUn+q7v068qn0I3lKcBdUi9GVA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786371966; c=relaxed/simple;
	bh=Wf+QbgdgWkQe3JNnFVvRLyHOwahdjGfq+ZuBa5Qlu6A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h0WsUUizhIhfTAYbAboUpj3/c/y3Oo17nysbhhe+EN8cOnxqu18wUflJmD6QjpWTUtv+e+XpoEsCW9eS2SlW8JBNSODjZBjX8z+2Cx7qmVmZzTLF17pRObpIDaa+XOMSsq0NVkl37sli+rk5xWpD5KxSMRJSooElGE7nGo1Je40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VpuO+quB; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VpuO+quB"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6D95E4E411AD;
	Mon, 10 Aug 2026 14:26:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 42B1B6033B;
	Mon, 10 Aug 2026 14:26:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9DE4E11C4A8BB;
	Mon, 10 Aug 2026 16:26:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786371962; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ew1QXNv1E3Xm6+feIsK83rNyoslxYmVUO+n/IV7SqNw=;
	b=VpuO+quBxjUxSevEuBQlqmT9a2njkZrRjbpsJ7GNiTOQWb3b5hyxmKa+m18UPWl8PfVaM9
	8RRZCSKVN6+zzzP6anwwSkDHPGnIFJdI8uwXTdbIHt0zDlImo25ThBmRgNoYNaJVnA2R4T
	EjyLJNxPO8606Zv/FB11oUdAT3XK9iZwshExPLdyW+bZrSnC511lJRByq3lQHnuD0aUxLt
	6LW4rFyZxNpKn+T5xI9fyZNu5Z/L/es04Y/yeF9nRQhRYUAlPhFO0uj7QVOcjHpHNO4s5E
	+J3z7iE1oSgvRbk6//PNgxyymuC3mLWNKIHNj4d5E3Eo/5LXt9xJLS8kJCA6XA==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Mon, 10 Aug 2026 16:25:40 +0200
Subject: [PATCH v2 3/5] irqchip/mips-gic: Enable interrupt when moving
 affinity across clusters
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260810-sync-gic-counters-v2-3-dfe8b2c376b0@bootlin.com>
References: <20260810-sync-gic-counters-v2-0-dfe8b2c376b0@bootlin.com>
In-Reply-To: <20260810-sync-gic-counters-v2-0-dfe8b2c376b0@bootlin.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>, 
 Chao-ying Fu <cfu@wavecomp.com>, Aleksandar Rikalo <arikalo@gmail.com>, 
 Paul Burton <paulburton@kernel.org>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3

When an interrupt's affinity is moved to a CPU in another cluster,
gic_set_affinity() updates the routing (GIC_SH_MAP_VP) and trigger type
in the destination cluster, but never touched the interrupt's mask state.

The interrupt mask is per-cluster. After such a move the interrupt was
left disabled in the destination cluster, so it never fires despite
being correctly routed to its new VP.

Handle the mask explicitly on a cross-cluster affinity change: in the
old cluster, write GIC_SH_RMASK to disable the interrupt while clearing
the route so it is no longer delivered. And in the new cluster, set the
mask to enable the interrupt along with reconfiguring the trigger type.

Fixes: 322a90638768 ("irqchip/mips-gic: Multi-cluster support")
Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/irqchip/irq-mips-gic.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index f2ae60d39d66..4b76a65f12c9 100644
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -390,14 +390,17 @@ static int gic_set_affinity(struct irq_data *d, const struct cpumask *cpumask,
 
 	/*
 	 * If we're moving affinity between clusters, stop routing the
-	 * interrupt to any VP(E) in the old cluster.
+	 * interrupt to any VP(E) in the old cluster and disable
+	 * the interrupt in that cluster.
 	 */
 	if (cl != old_cl) {
 		if (gic_irq_lock_cluster(d)) {
 			write_gic_redir_map_vp(irq, 0);
+			write_gic_redir_rmask(irq);
 			mips_cm_unlock_other();
 		} else {
 			write_gic_map_vp(irq, 0);
+			write_gic_rmask(irq);
 		}
 	}
 
@@ -409,10 +412,17 @@ static int gic_set_affinity(struct irq_data *d, const struct cpumask *cpumask,
 
 	/*
 	 * If we're moving affinity between clusters, configure the interrupt
-	 * trigger type in the new cluster.
+	 * trigger type and enable the interrupt in the new cluster.
 	 */
-	if (cl != old_cl)
+	if (cl != old_cl) {
 		gic_set_type_locked(d, irqd_get_trigger_type(d));
+		if (gic_irq_lock_cluster(d)) {
+			write_gic_redir_smask(irq);
+			mips_cm_unlock_other();
+		} else {
+			write_gic_smask(irq);
+		}
+	}
 
 	/* Route the interrupt to its new VP(E) */
 	if (gic_irq_lock_cluster(d)) {

-- 
2.55.0

