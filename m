Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9916E509EE7;
	Fri, 18 Sep 2026 15:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789745789; cv=none; b=o5zW91KkzqHRxyBSEBRkjhKLP+/awc8ZLzQRF+4Sjt6EdfPVvtWhb34snKao85nxSmNzRMBDNM3imfO8EUFYttJ6EcYTw8p4Ua9E6Fi1c3JKbbkAaPunFSgwskM71h8Jzj4jK3xAtU8PMKYhV8CnMbDo+XJQKfaIEgPfKHblIuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789745789; c=relaxed/simple;
	bh=xkU7FTh2Qx1l444kXVxCZ72X6BDvMmnbijkDMtD0tYY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EphCXa2YoW3a1R8j0gpCjGNtFN16srkCtKo/HS3RD1xLyJvFXGpjwlW9j3vJ8zBI5S3P/CVYZ9E3Pid1KzfWY9Ofa+aUp3aJEh+PWbbaBs7o8crmj1BpgZBumG1JLXB3s98LT2sTCP7E58UHFNQ4CzO4VZ9sQbxaRUKbnoLUGg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=pass smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=GRSz8Ncz; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="GRSz8Ncz"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 501784E0F8F;
	Fri, 18 Sep 2026 17:36:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1789745784; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=B1OV7lBJrmDaac8ePy8dHk2DEYoP6HJXQm0PFK+z8S0=;
	b=GRSz8Nczj8PSth2MjRMyLrh/0ZwPpRcGdNOvftdlLycQY5tzXAnUVy9fK+VZK7RMpib6KR
	FBdaGqaMW8t9mGNDLyGA6trpRW6SOuGHaxXNfnIWFwhxHOWi/dVgYFmK72+Ec1xVdhJMuw
	ab/+SX7Cka1iBecJqVjWVSBRJcsDkKqUB1J0ZVgjY9k+JsjeZmCbUSaQIBfxpaAPwmIaNl
	RSnUbhv/2CfRCGdr6KUH/Rqj3BnBfr7WhLHkDKnRkNUhZgNlJ6956zDm4PZADQBxR/8xVw
	CY0CmQDjD8h7Zx+4jAcUb4jK0hvvMCWrn+r7cukO3mZ60ifpjr7Qt6dMB1fCfg==
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
Subject: [PATCH v9 3/5] clocksource/timer-econet-en751221: Init teardown on error if possible
Date: Fri, 18 Sep 2026 15:36:04 +0000
Message-Id: <20260918153606.344143-4-cjd@cjdns.fr>
In-Reply-To: <20260918153606.344143-1-cjd@cjdns.fr>
References: <20260918153606.344143-1-cjd@cjdns.fr>
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

