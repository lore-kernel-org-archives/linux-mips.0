Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50ED95476EA;
	Thu, 15 Oct 2026 16:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792083280; cv=none; b=msAVURWg1XAIOa4BQg6sUAjFn0sBMiSayWoMBfu+ey+cnCOhU0amp0b9NAgdnrU+MkgjsheZYAfZ/C4KTWghKwbsCfmO9P92jGo94d6qRK5F9hYUkCSEZMNbwh2yx5+U93uSYUwGGHSsdaEePooMJWDbpQDcGFEH+Vf4uQomB28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792083280; c=relaxed/simple;
	bh=8B/xTP972nIvHtcMSPD8tKL/H9idus5A5CGIIMszGO4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cQoXyI0IbhJVVRkyzsMDIJTpfrHg8+oZakuxWMJASd4xKAqN27wd+gtZMyVm58mxFsgPMLsxlZJ/c3rMFXRsX6buHBrjT7i08ARqkHNvtI3lC7/9yFDsIuIVmhZi2+ReCtJ7lLrUi+FxVg11YxUUMindIAeGSTDaBKd/PuMsLmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=fVpB/Lsz; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="fVpB/Lsz"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7BD2C5B2CF1;
	Thu, 15 Oct 2026 18:54:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1792083259; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Bo4Pkqkj8MYnxBK3j+0sK35BN5q+7GSDcZpoAAftl5U=;
	b=fVpB/LszLupa0Oa0/xT5FAbaNNLAJji3h7oL3PBfRdyF5rUtZPDtlAxzKbDLPJdfe9VfVY
	HFmN1brZkpDE2VijaH9QIy4dFGCH3BRCvx8LjAc2vCMq2oYZPYfLyQbX9o+q+R+PoMtOZc
	VbiIcj6QXpEzSBiBMbgulnGpxefEGl99LHd6FmO8/KiVmNjPDYkuSEhoWj0oiMG4lHuvJP
	8vmqWtg7n7nnB9p26gHpkHhSkBTyhcvkXun01eTlGqI745YL6k4WVWQTadfHR3NdvZng5j
	YmELPV5+rh3UEN3jLjDzgxKU0+ehNrm9dXC+bhVKLjfgzCtNI+AGFtb0pY+SlQ==
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
Subject: [PATCH v11 5/5] clocksource/timer-econet-en751221: Do not use NR_CPUS for resource array size
Date: Thu, 15 Oct 2026 16:54:04 +0000
Message-Id: <20261015165404.519741-6-cjd@cjdns.fr>
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

Each pair of VPEs has one timer block, so the number of blocks is half
the number of CPUs on the hardware. However, since NR_CPUS is a
configuration, it is possible that it will be less than the number of
actual CPUs on the hardware which will cause the array to be too small
for the specified DT.

Switch to an allocated buffer for storing the iomem resources, as is
done for the IRQs.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 drivers/clocksource/timer-econet-en751221.c | 29 ++++++++++++++-------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocksource/timer-econet-en751221.c
index edb3db3125ce..9f28cc238372 100644
--- a/drivers/clocksource/timer-econet-en751221.c
+++ b/drivers/clocksource/timer-econet-en751221.c
@@ -19,11 +19,10 @@
 #define ECONET_BITS			32
 #define ECONET_MIN_DELTA		0x00001000
 #define ECONET_MAX_DELTA		GENMASK(ECONET_BITS - 2, 0)
-/* 34Kc hardware has 1 block and 1004Kc has 2. */
-#define ECONET_NUM_BLOCKS		DIV_ROUND_UP(NR_CPUS, 2)
 
 static struct {
-	void __iomem	*membase[ECONET_NUM_BLOCKS];
+	void __iomem	**membase;
+	int		num_membase;
 	int		*irqs;
 	int		num_irqs;
 	bool		is_percpu;
@@ -37,6 +36,10 @@ static DEFINE_PER_CPU(struct clock_event_device, econet_timer_pcpu);
  */
 static inline void __iomem *reg_ctl(u32 timer_n)
 {
+	/* reg_ctl() is used to check if a clock exists */
+	if (timer_n >> 1 >= econet_timer.num_membase)
+		return NULL;
+
 	return econet_timer.membase[timer_n >> 1];
 }
 
@@ -202,11 +205,6 @@ static int __init timer_init(struct device_node *np)
 		       num_irqs);
 		return -EINVAL;
 	}
-	if (num_blocks > ARRAY_SIZE(econet_timer.membase)) {
-		pr_err("%pOFn: Too many regs: max %zd got %d\n", np,
-		       ARRAY_SIZE(econet_timer.membase), num_blocks);
-		return -EINVAL;
-	}
 	if (num_blocks == 0) {
 		pr_err("%pOFn: At least one reg block must be provided\n", np);
 		return -EINVAL;
@@ -227,6 +225,15 @@ static int __init timer_init(struct device_node *np)
 	if (!econet_timer.irqs)
 		return -ENOMEM;
 
+	econet_timer.num_membase = num_blocks;
+	econet_timer.membase = kcalloc(num_blocks,
+				       sizeof(*econet_timer.membase),
+				       GFP_KERNEL);
+	if (!econet_timer.membase) {
+		ret = -ENOMEM;
+		goto out_kfree_irqs;
+	}
+
 	for (i = 0; i < num_blocks; i++) {
 		econet_timer.membase[i] = of_iomap(np, i);
 		if (!econet_timer.membase[i]) {
@@ -305,13 +312,17 @@ static int __init timer_init(struct device_node *np)
 			irq_dispose_mapping(econet_timer.irqs[i]);
 	}
 out_membase:
-	for (int i = 0; i < ARRAY_SIZE(econet_timer.membase); i++) {
+	for (int i = 0; i < num_blocks; i++) {
 		if (econet_timer.membase[i]) {
 			iounmap(econet_timer.membase[i]);
 			econet_timer.membase[i] = NULL;
 		}
 	}
 
+	kfree(econet_timer.membase);
+	econet_timer.membase = NULL;
+
+out_kfree_irqs:
 	kfree(econet_timer.irqs);
 	econet_timer.irqs = NULL;
 
-- 
2.39.5

