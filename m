Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C606F50257A;
	Fri, 18 Sep 2026 15:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789745324; cv=none; b=Q6qDXt7pua5J+xz9nybtx4IDQrAgkBIakEdre2FKOo8oX5q4EHwVyx8l11BvNAQGrJonEcb0xFjoq7bWcf+JhaSKkvrpHBHhMXpz3TVRbTdQT0xWyVn1yFIKZ/9sb73lND97tkXRpz59DNPkOwXHHVPnwGsZak60eq6nNSh8jVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789745324; c=relaxed/simple;
	bh=xkU7FTh2Qx1l444kXVxCZ72X6BDvMmnbijkDMtD0tYY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ue90KqBA1vChYWbyR9FrOgR8Zg5hPQB4uNDMIySQnA5mKYmPCwhTDjQbi3bxBxcaT23ahzlyZ4l4V01oabgwR1h5M3nH6VmxsdDN8udSSaygdUdzTZi9QWRRnwCImy+M673A2ivVxRvQ4DOABNT2irOiSMqcFbPtdmmi1EWLhBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=pass smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=B8jRmNLn; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="B8jRmNLn"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1175D4DDE60;
	Fri, 18 Sep 2026 17:28:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1789745315; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=B1OV7lBJrmDaac8ePy8dHk2DEYoP6HJXQm0PFK+z8S0=;
	b=B8jRmNLnJH4sy0mcIqB5I3sMtwTDxWNXbSb//s7U/qCXPr39ZSeBURPoAueszan2sX8ay/
	3P6VZGNFSGy6ZwUxrfbX2fuK4EoMurcRcGKJIle5tIFhzlxGhe7uhyQ4pka0Sx6HERtLJ8
	35CcLjLUc35orsQiaDXc5YFEYj9jLptWvLxmFLnGQKk1nY9Tx1pjedfJLSTp1Ab/89C8TV
	nn+I+xgG1mJxFg7WAYqUg8i+gjwTWT2XJf8fv74szgpHSbxn6+/eLAPZAuavjj4kCcUgc3
	l0IFmIX/EklhNsDTgOTgfTos7CpfsLrP32Ya/ErUQRTLoFGpxpiw6WGkqj0HIQ==
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
Subject: [PATCH v8 3/5] clocksource/timer-econet-en751221: Init teardown on error if possible
Date: Fri, 18 Sep 2026 15:28:20 +0000
Message-Id: <20260918152822.343811-4-cjd@cjdns.fr>
In-Reply-To: <20260918152822.343811-1-cjd@cjdns.fr>
References: <20260918152822.343811-1-cjd@cjdns.fr>
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

