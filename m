Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3071137F72F;
	Thu, 15 Oct 2026 16:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792083269; cv=none; b=Wy7hcrUyQZsPeH62oNcanWHXKUXI+astkmVBJPHoMfU+HoryV49O3zdgUJXMpVD+lf8p6IuKqVQUUOOf5HqTeQWyDorBInv/2O9r2SVjaokvW0r0pHtGJ+UMh46FQgPJTvL2uOzWq49sE3pLRWJJNItwItd1FsvoBsiKAtae2pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792083269; c=relaxed/simple;
	bh=xkU7FTh2Qx1l444kXVxCZ72X6BDvMmnbijkDMtD0tYY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bBBRm4gCkAvy7CaIR5TNtH/WqMz+prZZmZ0nl+IOsV++Wn6sp+mRRi7STeqJH/gG9Uek0JmkbBrGLPQmma034WGNfysmlR0NC8VKXmYftSFwntDQMA7fEdcldOVs5Wv3qHk2xkAtfz3fdf9m/loSY376+/yTTale+SCx/YhyXbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=o2/bqiwY; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="o2/bqiwY"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 201985B2177;
	Thu, 15 Oct 2026 18:54:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1792083254; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=B1OV7lBJrmDaac8ePy8dHk2DEYoP6HJXQm0PFK+z8S0=;
	b=o2/bqiwYFoQukh7daTnuMvtpICDH7iJx6/jBpaH5AWDeomi1y/qqQkbEDL9iYONx6xlVMx
	CwkXC6cpG//dZ+NKRgnmyrwkKyrYmeuRGrYTxZxVNt2b+Q9qvxDgU+Bdlo9mTehjDkO7dn
	4dMRHJ64D469r+RkLibhRicJI7DRKhoYdUoJxwgzdPTU1ZxQv3YDAMEUzzKooes4Ef06Xd
	yJBu+PWDxrpd7YqZk3ArUD6KAx9hMez3osMLpCsGwlIV2xzIXpOP4zytByvfEu+s2gSjUu
	qQiP+jZhPWyLmUB59WeusFYpmWuwNAs+tClU6HiwPPsPcSpSSh2VkLarWrBrPA==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-mips@vger.kernel.org
Cc: conor+dt@kernel.org,
	daniel.lezcano@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	naseefkm@gmail.com,
	robh@kernel.org,
	tglx@kernel.org,
	grandmaster@al2klimov.de,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH v11 2/5] clocksource/timer-econet-en751221: Init teardown on error if possible
Date: Thu, 15 Oct 2026 16:54:01 +0000
Message-Id: <20261015165404.519741-3-cjd@cjdns.fr>
In-Reply-To: <20261015165404.519741-1-cjd@cjdns.fr>
References: <20261015165404.519741-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

As a clocksource, much of the initialization process is irreversible
and the impact of a failure to initialize is a failure to boot.
That said, good practice is to attempt a clean exit if probing fails,
and supporting this pattern will reduce the likelihood that future
contributions introduce a bug by trying to teardown after it is no
longer possible to do so.

Convert the init process into two clearly delineated phases, one
which is reverted in case of error, and the other which can't be.
Move all IRQ and address resource mapping before that point, and add
teardown logic in case of error before the point of no return.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 drivers/clocksource/timer-econet-en751221.c | 84 ++++++++++++---------
 1 file changed, 50 insertions(+), 34 deletions(-)

diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocksource/timer-econet-en751221.c
index 1859335345b5..714702b9ef12 100644
--- a/drivers/clocksource/timer-econet-en751221.c
+++ b/drivers/clocksource/timer-econet-en751221.c
@@ -24,6 +24,7 @@
 
 static struct {
 	void __iomem	*membase[ECONET_NUM_BLOCKS];
+	int		irq;
 	u32		freq_hz;
 } econet_timer __ro_after_init;
 
@@ -126,22 +127,9 @@ static void __init cevt_dev_init(uint cpu)
 	iowrite32(U32_MAX, reg_compare(cpu));
 }
 
-static int __init cevt_init(struct device_node *np)
+static void __init cevt_init(struct device_node *np)
 {
-	int i, irq, ret;
-
-	irq = irq_of_parse_and_map(np, 0);
-	if (irq <= 0) {
-		pr_err("%pOFn: irq_of_parse_and_map failed", np);
-		return -EINVAL;
-	}
-
-	ret = request_percpu_irq(irq, cevt_interrupt, np->name, &econet_timer_pcpu);
-
-	if (ret < 0) {
-		pr_err("%pOFn: IRQ %d setup failed (%d)\n", np, irq, ret);
-		goto err_unmap_irq;
-	}
+	int i;
 
 	for_each_possible_cpu(i) {
 		struct clock_event_device *cd = &per_cpu(econet_timer_pcpu, i);
@@ -151,21 +139,12 @@ static int __init cevt_init(struct device_node *np)
 					  CLOCK_EVT_FEAT_C3STOP |
 					  CLOCK_EVT_FEAT_PERCPU;
 		cd->set_next_event	= cevt_set_next_event;
-		cd->irq			= irq;
+		cd->irq			= econet_timer.irq;
 		cd->cpumask		= cpumask_of(i);
 		cd->name		= np->name;
 
 		cevt_dev_init(i);
 	}
-
-	cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
-			  "clockevents/econet/timer:starting",
-			  cevt_init_cpu, NULL);
-	return 0;
-
-err_unmap_irq:
-	irq_dispose_mapping(irq);
-	return ret;
 }
 
 static int __init timer_init(struct device_node *np)
@@ -187,22 +166,45 @@ static int __init timer_init(struct device_node *np)
 		econet_timer.membase[i] = of_iomap(np, i);
 		if (!econet_timer.membase[i]) {
 			pr_err("%pOFn: failed to map register [%d]\n", np, i);
-			return -ENXIO;
+			ret = -ENXIO;
+			goto out_membase;
 		}
 	}
 
+	econet_timer.irq = irq_of_parse_and_map(np, 0);
+	if (econet_timer.irq <= 0) {
+		pr_err("%pOFn: irq_of_parse_and_map failed\n", np);
+		ret = -EINVAL;
+		goto out_membase;
+	}
+
+	ret = request_percpu_irq(econet_timer.irq, cevt_interrupt, np->name,
+				 &econet_timer_pcpu);
+
+	if (ret < 0) {
+		pr_err("%pOFn: IRQ %d setup failed (%d)\n", np,
+		       econet_timer.irq, ret);
+		goto out_irq_mapping;
+	}
+
+	cevt_init(np);
+
+	ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
+				"clockevents/econet/timer:starting",
+				cevt_init_cpu, NULL);
+	if (ret < 0) {
+		pr_err("%pOFn: cpuhp setup failed (%d)\n", np, ret);
+		goto out_irq_free;
+	}
+
+	/* Point of no return, do not attempt to tear down after this. */
+
 	/* For clocksource purposes always read clock zero, whatever the CPU */
 	ret = clocksource_mmio_init(reg_count(0), np->name,
 				    econet_timer.freq_hz, 301, ECONET_BITS,
 				    clocksource_mmio_readl_up);
-	if (ret) {
-		pr_err("%pOFn: clocksource_mmio_init failed: %d", np, ret);
-		return ret;
-	}
-
-	ret = cevt_init(np);
-	if (ret < 0)
-		return ret;
+	if (ret)
+		pr_err("%pOFn: clocksource_mmio_init failed: %d\n", np, ret);
 
 	sched_clock_register(sched_clock_read, ECONET_BITS,
 			     econet_timer.freq_hz);
@@ -212,6 +214,20 @@ static int __init timer_init(struct device_node *np)
 		(econet_timer.freq_hz / 1000) % 1000);
 
 	return 0;
+
+out_irq_free:
+	free_percpu_irq(econet_timer.irq, &econet_timer_pcpu);
+out_irq_mapping:
+	irq_dispose_mapping(econet_timer.irq);
+out_membase:
+	for (int i = 0; i < ARRAY_SIZE(econet_timer.membase); i++) {
+		if (econet_timer.membase[i]) {
+			iounmap(econet_timer.membase[i]);
+			econet_timer.membase[i] = NULL;
+		}
+	}
+
+	return ret;
 }
 
 TIMER_OF_DECLARE(econet_timer_hpt, "econet,en751221-timer", timer_init);
-- 
2.39.5

