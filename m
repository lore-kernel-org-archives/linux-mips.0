Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E727E792
	for <linux-mips@vger.kernel.org>; Mon, 10 Aug 2026 14:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786371962; cv=none; b=rQOSGgmSlu+JXWN3uip6XsVhkBxQYzvxgaTbrjAZatY4cuaWUlkxzbdsNWYE35wNkW3MINzC4bc0gKD0Iygfib8/H8OhevCvowpae9uvNT6BdpI/QdlIEdh4p7xGQ8H0+uTxeTKbRHtTHAW/w4E9XCo99Jnguopi6qzAa8H2hR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786371962; c=relaxed/simple;
	bh=UgqDmnOVqopm2mbDfHXbWFiQUAGdMzePQRCHXpsq6lA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kO5aLINQgu88oTVvr6XQ6WsMzhbqz5gY1vosXNm6L+8Hym4ZFB30QtyYSAhmwECfXo51YUWwUwFlebWyV33ZT6TYcIkQnvtoyizNPl6gzPwIKRrR7VgTEsFFzfzxnnyOYGa67/2H5aG8XFzEZrrruJDuT8Hl/3F/8MjqvL0Dt+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Tr/IB5+e; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Tr/IB5+e"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4DCF41A153D;
	Mon, 10 Aug 2026 14:25:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2279A6033B;
	Mon, 10 Aug 2026 14:25:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 48EDE11C4A8B3;
	Mon, 10 Aug 2026 16:25:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786371957; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=szJ77LlzQz7Ivcsto15zZ6XkZ55IboGYb8ikcqOxE5w=;
	b=Tr/IB5+eXvP9dEhFskzSgH8Mv2VCq6hiCcRd+vJIT6jR4p9rH52o9ZaIaInGeVjhNIZzY2
	hmXfJvGRvZnbU64egcXG8ua8K8ifBCd9aCTDX5sTb+d4co4oK9D8eBd0DEZuozKyJYIQbg
	NH96fj+Vf09KRNVYLgFUPmZt9hUSrVAisdKdJ+L/Zd8/+JwtzMDY0ThPKLVNZx9DUQ3hPs
	rwK34S9pEXkLGTrTfYYgP6kCOc81ykx2Bov2Tugwj7YDeX7N9mqK0UAMjKarx5mdHwnk/T
	w6uVdwuHIYeiXcCtXHeBF90qiLgXzYJdpWsDaab7AXrBj9jrjkhAUztb5qkmiA==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Mon, 10 Aug 2026 16:25:38 +0200
Subject: [PATCH v2 1/5] irqchip/mips-gic: Fix unbalanced cm_core_lock in
 for_each_online_cpu_gic()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260810-sync-gic-counters-v2-1-dfe8b2c376b0@bootlin.com>
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

