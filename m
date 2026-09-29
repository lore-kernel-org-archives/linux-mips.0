Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D2751AFF5;
	Tue, 29 Sep 2026 12:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790684061; cv=none; b=JDOfTp83uAT6nhtQcVXFzJuapb2I6iGw2TbjjX3j/qtJtQjzseR51p8t+uzqFwubky19a33ILa9R/UudKLxuEc2vD7aK7ffclwcQXfkHkSZmyjMRStnb/gueiS0ZH3IPjypvtXhvAaTow+hBVIb/BsEFUdO+sIPERWsc+gm42oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790684061; c=relaxed/simple;
	bh=sUsxY7+TaUUsXnFemphP4sfuf0/NNkCe0s/kpfyOSdI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kiASYzRfPHHvcdS69u8KnofokjGWGygm3Gp4qQwpntKKJtyeihtmD/5aLC6Cb0HfTP4tA//kswAXCif1G1d8O/O3H5Ut3nuLmvE8dqgby6VQHzao2Tho5lRiOHUaR3ikWe9QqYv/4rdZIPqhbNPRxL8nQXmTlB4jx5QrXRTHyZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bzfwiQ0g; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bzfwiQ0g"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 59D8D4E410BE;
	Tue, 29 Sep 2026 12:14:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2E2CF601BD;
	Tue, 29 Sep 2026 12:14:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E2DE810329529;
	Tue, 29 Sep 2026 14:14:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790684055; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=aEEYPj79EMPUCoBxaARpFVNacfnVg40ZfaAXzWDux54=;
	b=bzfwiQ0gqRcRSSXbhjrlH8ttnZICRwdVn72xn7OKFUuLsIrZkLPx4/OVOZ1JUBFKexaP8u
	ALbdpcF8vNrrsGhfEI2+MTu544BaGqc8asA0wUXMCOnQMEvNinTFVIToAXRa0qy8vOaPAy
	Khv/ywzq6OiuxjCIMm2bTb2HIHGICtel0dx/+0EHy2KA2TTtjhlLQ27RaMcZWciTvWy+jU
	kMbpr/OnP0GJpyN8b+od4aTVJ3CMuM1MxdDmAt9aFklbOlqFIwQfo3dpb5THDJC0yU7gcW
	0yXQcr/LnGgPaQtEMlrD0qJRm7gbWoC1IpFXcZV81nlxh622dWzYNesdBNoFTA==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Tue, 29 Sep 2026 14:14:08 +0200
Subject: [PATCH v4 1/5] irqchip/mips-gic: Fix unbalanced cm_core_lock in
 for_each_online_cpu_gic()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260929-sync-gic-counters-v4-1-ec70c4b60434@bootlin.com>
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

Commit d9e2ed610a60 ("irqchip/mips-gic: Support multi-cluster in
for_each_online_cpu_gic()") added a gic_unlock_cluster() call to the
macro's loop increment, which unconditionally invokes
mips_cm_unlock_other() on multi-cluster systems. However nothing in the
loop ever acquires the corresponding mips_cm_lock_other(), so on
multi-cluster hardware every invocation of for_each_online_cpu_gic()
releases an unheld per-CPU cm_core_lock.

With CONFIG_PROVE_LOCKING this triggers a "bad unlock balance detected"
warning at boot, e.g. from gic_irq_domain_map() while mapping local
interrupts. Only the first occurrence is reported, since the first
warning permanently disables lockdep (debug_locks = 0); the unbalanced
release itself silently persists.

Fix this by moving both the acquire and release into
__gic_with_next_online_cpu() so they stay balanced. When advancing to a
CPU in a remote cluster, lock the CM redirect block for that cluster via
mips_cm_lock_other(); when leaving a remote cluster (or finishing the
iteration) release it with mips_cm_unlock_other(). Local-cluster CPUs
require no locking, so single-cluster systems are unaffected. This also
makes the redirect region behave correctly when accessing local register
blocks of CPUs in other clusters.

Drop the now-unused gic_unlock_cluster() helper and its call from the
for_each_online_cpu_gic() increment.

Fixes: d9e2ed610a60 ("irqchip/mips-gic: Support multi-cluster in for_each_online_cpu_gic()")
Reviewed-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/irqchip/irq-mips-gic.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index 19a57c5e2b2e..3b31cbcbed6f 100644
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -70,6 +70,10 @@ static int __gic_with_next_online_cpu(int prev)
 {
 	unsigned int cpu;
 
+	/* Release the redirect/other region lock to the previous CPU, if any. */
+	if (prev >= 0)
+		mips_cm_unlock_other();
+
 	/* Discover the next online CPU */
 	cpu = cpumask_next(prev, cpu_online_mask);
 
@@ -77,23 +81,12 @@ static int __gic_with_next_online_cpu(int prev)
 	if (cpu >= nr_cpu_ids)
 		return cpu;
 
-	/*
-	 * Move the access lock to the next CPU's GIC local register block.
-	 *
-	 * Set GIC_VL_OTHER. Since the caller holds gic_lock nothing can
-	 * clobber the written value.
-	 */
-	write_gic_vl_other(mips_cm_vp_id(cpu));
+	/* Lock access to redirect/other region to the next CPU */
+	mips_cm_lock_other_cpu(cpu, CM_GCR_Cx_OTHER_BLOCK_LOCAL);
 
 	return cpu;
 }
 
-static inline void gic_unlock_cluster(void)
-{
-	if (mips_cps_multicluster_cpus())
-		mips_cm_unlock_other();
-}
-
 /**
  * for_each_online_cpu_gic() - Iterate over online CPUs, access local registers
  * @cpu: An integer variable to hold the current CPU number
@@ -108,7 +101,6 @@ static inline void gic_unlock_cluster(void)
 	guard(raw_spinlock_irqsave)(gic_lock);		\
 	for ((cpu) = __gic_with_next_online_cpu(-1);	\
 	     (cpu) < nr_cpu_ids;			\
-	     gic_unlock_cluster(),			\
 	     (cpu) = __gic_with_next_online_cpu(cpu))
 
 /**

-- 
2.55.0

