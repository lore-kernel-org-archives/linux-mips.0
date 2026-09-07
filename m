Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B534B8DE6;
	Mon,  7 Sep 2026 12:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788785243; cv=none; b=WVxnXIUhL0j1wgYfX5Pvj7az4kIIOHzfab5/HvrSmcyjwWQIhPLcDXwt8n5xrGIVqHQekTZUDoVnfbqaba2eRcz12EMxXryMYegpA0Vj7BMCJein+DR+wH/5EU+UWlxleZ2C08wpomd3ZlGDcup7TKTGtA3pt4Teoyw3tGV2sRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788785243; c=relaxed/simple;
	bh=Wf+QbgdgWkQe3JNnFVvRLyHOwahdjGfq+ZuBa5Qlu6A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y9KS39MHzp+iWrKqW5jAgZXBVfYcEVTTRsIb7WMtEdNTu92Wboh2lXPf1QXWeGb2LZowPNuBWnZRJ7ZGUrCw0vkDqg/Z2Z/fbrNXYmUqWJjD3l+K6CsO04CWGBP7+byJTjgbpRru/zFzD/HAs3opFdRYs7jZOaB0w16+2F7W/yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JICAoHPi; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JICAoHPi"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D05551A1A33;
	Mon,  7 Sep 2026 12:47:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A468E60383;
	Mon,  7 Sep 2026 12:47:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 793BC11C7AF1D;
	Mon,  7 Sep 2026 14:47:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788785239; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ew1QXNv1E3Xm6+feIsK83rNyoslxYmVUO+n/IV7SqNw=;
	b=JICAoHPiTZ/QblDsUau1a5K5GRNjskhifboDKXYf/KTO86w+aWiYWVSRcYCgnlceDPXDzM
	bJfnKV3MnNCxgY39soL6Idnx8qc8dv0tXZHAisiH+kAaj3aXHfHGX2/hASpP6lz5q+JrHS
	8PFxhgiNMN6h/GSnepEL8AQWcC+ExAOo/OjxgKaelSVZCcx2mL06hbo8VjcZgqpv072MsU
	CrCNdPatUwjg/UoUoOsQr5ZmA7uuJOQl2EaQVd2oSuY8EjzDRrmK7Uoxqc0MZysHuAQo0W
	vU65WB/yEuj5SIAZ1wSiIlPob10lNn0aGSQrGXuZ8ZcQ7pbiRwspSrVnvJ7/cw==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Mon, 07 Sep 2026 14:46:37 +0200
Subject: [PATCH v3 3/5] irqchip/mips-gic: Enable interrupt when moving
 affinity across clusters
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260907-sync-gic-counters-v3-3-3d891ddabdaf@bootlin.com>
References: <20260907-sync-gic-counters-v3-0-3d891ddabdaf@bootlin.com>
In-Reply-To: <20260907-sync-gic-counters-v3-0-3d891ddabdaf@bootlin.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>, 
 Chao-ying Fu <cfu@wavecomp.com>, Aleksandar Rikalo <arikalo@gmail.com>, 
 Paul Burton <paulburton@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
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

