Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.135.140.105
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794909091;
	b=g3gqu3U5kjKwQ5GliGBEkRPsg0bCyWYIX0qaNO0JtSSOKn21UP147GhRNaDtFmEVx/JJ
	 Z+A4SCuceOAGS52C52PAUeoW49eWsXgJ9CiTK2IlVlgqqwKVQaEiG3E9D/aibFG93o/FM
	 YkfsoPTjiKQP2dlPf7H01dezM38u31b4ZopfZLY/acDL2RXWd5oDQB2hufCQ+Bsm1XRXd
	 izIU7CzBqcqcf+Ap4OBANw/t2No7KTatYOIX91ptYRtw62m9SkkBBC/rgkreF3fvvt4ot
	 fI54uJQCAfW6fFWhkJu8pDsQfUUEJSvyZouGJm3TO3yOPhX1mXLzeV31UKu5nUV1b7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794909091;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-Id:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=5S49agrrdRdFjaIYgnVtJdcSozvn6OBmzUxnGJiDdhs=;
	b=Gpe9tioy04m6tqo4U0K+B1iZAVA6admYgDjRpuq9kfR/iGOSZ3iU7BHdyKr89ZT+vURy
	 AGqE5+xu6ZbKKsBr5tFEM3B1mUJ1koZtXseXw6acp8VHV8ITydC2Eznrs8oqKjZoYYGA/
	 0vE2VePiCcAwpmYKaYeqIWTTFrLYJvs4KIELyYOHcSn5xx3Tok9aoqiPgLl7Z2wlmpaVj
	 +cF1Z5aeW+kiXUpfCxcOm+gM7NgYpw2rpJIHP09jj2znFjBAP2iZwJFRSRCfx6Rao91Br
	 ZVo5ury+bs+Sp9s3g0bV7nwAucxyHssmXHqmNziRIJPR+TbdZFPVJizX4KItuT2MCsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cjdns.fr;
	spf=pass smtp.mailfrom=cjdns.fr;
	dkim=pass header.d=cjdns.fr header.i=@cjdns.fr header.a=rsa-sha256 header.s=dkim header.b=wEpZzhuj;
	arc=none smtp.remote-ip=5.135.140.105
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40EA606A32C;
	Tue, 17 Nov 2026 09:51:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E40EA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.a=rsa-sha256 header.s=dkim header.b=wEpZzhuj
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C2C69518E08;
	Tue, 17 Nov 2026 10:51:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1794909089; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=5S49agrrdRdFjaIYgnVtJdcSozvn6OBmzUxnGJiDdhs=;
	b=wEpZzhuj3iekDn+lBtfOyDhd5oAfT0fFMv1LPRP9HqKLEtPjdhWOulGbBF8Kzq6YiQXbwW
	YLZfpXkkzcsN/ibgvsPQKsWY18OVkXPX1aibmMASc7F+36te88ftUY+lUz30GJqVCF1m9f
	vQgyoKGl6mt7Lfztpz167GSgWNTKjXRzmAd/toP8KR2LSwXorSYSUmBBab2lkpnoebDmjH
	7C3tLOSA+Lt/TgkaVcu1NRTGi3aZc/XRxbw3U6hdfU6RtrwFgQYlWMrMWHec0SdYpgJ7zR
	L9IQ8YV+QheqG/DkmtPTZSLa9kRcS4/yAkCGRUEzbwsxulOASX1z8XzFY05dCA==
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
Subject: [PATCH v12 4/5] clocksource/timer-econet-en751221: Support EN751627 without percpu IRQ
Date: Tue, 17 Nov 2026 09:51:16 +0000
Message-Id: <20261117095117.173316-5-cjd@cjdns.fr>
In-Reply-To: <20261117095117.173316-1-cjd@cjdns.fr>
References: <20261117095117.173316-1-cjd@cjdns.fr>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

EN751627 is based on the 1004Kc which uses a different interrupt number
for each CPU timer. Support both this and the EN751221 which uses a
single percpu interrupt.

CPU hotplug path is intentionally unsupported because this CPU timer
is part of a legacy MIPS CPU which never had support for it.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 drivers/clocksource/timer-econet-en751221.c | 131 ++++++++++++++++----
 1 file changed, 108 insertions(+), 23 deletions(-)

diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocksource/timer-econet-en751221.c
index f2c4c1ee0a56..edb3db3125ce 100644
--- a/drivers/clocksource/timer-econet-en751221.c
+++ b/drivers/clocksource/timer-econet-en751221.c
@@ -24,7 +24,9 @@
 
 static struct {
 	void __iomem	*membase[ECONET_NUM_BLOCKS];
-	int		irq;
+	int		*irqs;
+	int		num_irqs;
+	bool		is_percpu;
 	u32		freq_hz;
 } econet_timer __ro_after_init;
 
@@ -102,6 +104,25 @@ static int cevt_init_cpu(uint cpu)
 	struct clock_event_device *cd = &per_cpu(econet_timer_pcpu, cpu);
 	u32 reg;
 
+	if (!reg_ctl(cpu)) {
+		pr_err("%s: missing address resource for CPU %d\n", cd->name,
+		       cpu);
+		return -EINVAL;
+	}
+	if (cd->irq <= 0) {
+		pr_err("%s: missing IRQ for CPU %d\n", cd->name, cpu);
+		return -EINVAL;
+	}
+	if (!econet_timer.is_percpu) {
+		int ret = irq_force_affinity(cd->irq, cpumask_of(cpu));
+
+		if (ret) {
+			pr_err("%s: failed to set IRQ affinity to CPU %d: %pe\n",
+			       cd->name, cpu, ERR_PTR(ret));
+			return ret;
+		}
+	}
+
 	pr_debug("%s: Setting up clockevent for CPU %d\n", cd->name, cpu);
 
 	reg = ioread32(reg_ctl(cpu)) | ctl_bit_enabled(cpu);
@@ -110,7 +131,10 @@ static int cevt_init_cpu(uint cpu)
 	clockevents_config_and_register(cd, econet_timer.freq_hz,
 					ECONET_MIN_DELTA, ECONET_MAX_DELTA);
 
-	enable_percpu_irq(cd->irq, IRQ_TYPE_NONE);
+	if (econet_timer.is_percpu)
+		enable_percpu_irq(cd->irq, IRQ_TYPE_NONE);
+	else
+		enable_irq(cd->irq);
 
 	return 0;
 }
@@ -141,19 +165,52 @@ static void __init cevt_init(struct device_node *np)
 					  CLOCK_EVT_FEAT_C3STOP |
 					  CLOCK_EVT_FEAT_PERCPU;
 		cd->set_next_event	= cevt_set_next_event;
-		cd->irq			= econet_timer.irq;
 		cd->cpumask		= cpumask_of(i);
 		cd->name		= np->name;
 
-		cevt_dev_init(i);
+		/*
+		 * If not enough IRQs were specified for the CPUs, leave IRQ -1
+		 * and error in cevt_init_cpu
+		 */
+		if (econet_timer.is_percpu)
+			cd->irq = econet_timer.irqs[0];
+		else if (i < econet_timer.num_irqs)
+			cd->irq = econet_timer.irqs[i];
+		else
+			cd->irq = -1;
+
+		/*
+		 * Tolerate CPUs that could exist but don't.
+		 * Fail in cevt_init_cpu when they try to start.
+		 */
+		if (reg_ctl(i) && cd->irq > -1)
+			cevt_dev_init(i);
 	}
 }
 
 static int __init timer_init(struct device_node *np)
 {
-	int num_blocks = DIV_ROUND_UP(num_possible_cpus(), 2);
+	int num_blocks = of_address_count(np);
+	int num_irqs = of_irq_count(np);
 	struct clk *clk;
-	int ret;
+	int ret, i;
+
+	econet_timer.is_percpu = of_device_is_compatible(np, "econet,en751221-timer");
+
+	if (econet_timer.is_percpu && num_irqs != 1) {
+		pr_err("%pOFn: EN751221 clock must have 1 IRQ not %d\n", np,
+		       num_irqs);
+		return -EINVAL;
+	}
+	if (num_blocks > ARRAY_SIZE(econet_timer.membase)) {
+		pr_err("%pOFn: Too many regs: max %zd got %d\n", np,
+		       ARRAY_SIZE(econet_timer.membase), num_blocks);
+		return -EINVAL;
+	}
+	if (num_blocks == 0) {
+		pr_err("%pOFn: At least one reg block must be provided\n", np);
+		return -EINVAL;
+	}
 
 	clk = of_clk_get(np, 0);
 	if (IS_ERR(clk)) {
@@ -164,7 +221,13 @@ static int __init timer_init(struct device_node *np)
 	econet_timer.freq_hz = clk_get_rate(clk);
 	clk_put(clk);
 
-	for (int i = 0; i < num_blocks; i++) {
+	econet_timer.num_irqs = num_irqs;
+	econet_timer.irqs = kcalloc(num_irqs, sizeof(*econet_timer.irqs),
+				    GFP_KERNEL);
+	if (!econet_timer.irqs)
+		return -ENOMEM;
+
+	for (i = 0; i < num_blocks; i++) {
 		econet_timer.membase[i] = of_iomap(np, i);
 		if (!econet_timer.membase[i]) {
 			pr_err("%pOFn: failed to map register [%d]\n", np, i);
@@ -173,22 +236,32 @@ static int __init timer_init(struct device_node *np)
 		}
 	}
 
-	econet_timer.irq = irq_of_parse_and_map(np, 0);
-	if (econet_timer.irq <= 0) {
-		pr_err("%pOFn: irq_of_parse_and_map failed\n", np);
-		ret = -EINVAL;
-		goto out_membase;
+	for (i = 0; i < num_irqs; i++) {
+		econet_timer.irqs[i] = irq_of_parse_and_map(np, i);
+		if (econet_timer.irqs[i] <= 0) {
+			pr_err("%pOFn: failed mapping irq %d\n", np, i);
+			ret = -EINVAL;
+			goto out_irq_mapping;
+		}
 	}
 
-	irq_set_status_flags(econet_timer.irq, IRQ_NOAUTOEN);
-
-	ret = request_percpu_irq(econet_timer.irq, cevt_interrupt, np->name,
-				 &econet_timer_pcpu);
-
-	if (ret < 0) {
-		pr_err("%pOFn: IRQ %d setup failed (%d)\n", np,
-		       econet_timer.irq, ret);
-		goto out_irq_mapping;
+	for (i = 0; i < num_irqs; i++) {
+		irq_set_status_flags(econet_timer.irqs[i], IRQ_NOAUTOEN);
+
+		if (econet_timer.is_percpu)
+			ret = request_percpu_irq(econet_timer.irqs[i],
+						 cevt_interrupt, np->name,
+						 &econet_timer_pcpu);
+		else
+			ret = request_irq(econet_timer.irqs[i], cevt_interrupt,
+					  IRQF_TIMER | IRQF_NOBALANCING,
+					  np->name, NULL);
+
+		if (ret < 0) {
+			pr_err("%pOFn: IRQ %d setup failed: %pe\n", np,
+			       i, ERR_PTR(ret));
+			goto out_irq_free;
+		}
 	}
 
 	cevt_init(np);
@@ -220,9 +293,17 @@ static int __init timer_init(struct device_node *np)
 	return 0;
 
 out_irq_free:
-	free_percpu_irq(econet_timer.irq, &econet_timer_pcpu);
+	while (--i >= 0) {
+		if (econet_timer.is_percpu)
+			free_percpu_irq(econet_timer.irqs[i], &econet_timer_pcpu);
+		else
+			free_irq(econet_timer.irqs[i], NULL);
+	}
 out_irq_mapping:
-	irq_dispose_mapping(econet_timer.irq);
+	for (i = 0; i < num_irqs; i++) {
+		if (econet_timer.irqs[i] > 0)
+			irq_dispose_mapping(econet_timer.irqs[i]);
+	}
 out_membase:
 	for (int i = 0; i < ARRAY_SIZE(econet_timer.membase); i++) {
 		if (econet_timer.membase[i]) {
@@ -231,7 +312,11 @@ static int __init timer_init(struct device_node *np)
 		}
 	}
 
+	kfree(econet_timer.irqs);
+	econet_timer.irqs = NULL;
+
 	return ret;
 }
 
 TIMER_OF_DECLARE(econet_timer_hpt, "econet,en751221-timer", timer_init);
+TIMER_OF_DECLARE(econet_timer_en751627, "econet,en751627-timer", timer_init);
-- 
2.39.5

