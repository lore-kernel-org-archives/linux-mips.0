Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F96523785;
	Thu,  1 Oct 2026 16:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790871227; cv=none; b=bzByD9IDgi51GB7Wz8E8kxlfmHSPv04218ogfvzAR0fR8cuqn06pH9N9J6XUJnJpvOTsMYUcoBAqd04PbsxH6y4NfG5VIrnbfBp1ZclL1D68aqnmoRKmBBOs14g4LJk7JkjV1P8viuHkz50cfBeIt7kz2IfQTNngwnsJ/Wub/H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790871227; c=relaxed/simple;
	bh=PH8OwZN/aakY2K2zcSUrh8w5XO+nFZ1XtvNenZgUVvY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qpPHmcDuAj9SbVcNTtAXODwc7QYgkedH3k2WZpRQCas1EHPCG4EKNU75cgsGVwLTqj0hxib1IbwdFaBAQ/9DmSK1CTMKcEtt4rvU2Sy7Ibab0VQGLO1yM4gjxoye2Ayk+0YIF886CBtnHJjP+71hmPAiI67yN2xRuzT3aKabVwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N/0B1jgO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N/0B1jgO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 238161F000FF;
	Thu,  1 Oct 2026 16:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790871226;
	bh=Om0zPmfcD16McftxiSRMXlG1iNliCeFQ7uvZ0Lg5r8I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=N/0B1jgOu2bhlsilLHrm+EmP64ZvCMKkw0fjVXT9eG52VdScaOyu8+Q/ThETSjyUo
	 BZGCKx7S3OXb92HfiGrZAUSYh3ILQa44x4+oIZ7uoOGnl0sZ7Hugzac11Fo1P+KGv4
	 RBeVLCtuw0j8C0QW3oXQ4NUS8gVBRw68x7L9pdBBJN2iwI/8cEtTBl+RDXJdC8QckI
	 RZk3ne8ydooAwkG1kN09LraiVinqNHNGZaYOcn1itpEVtYH3JYPp91nXwNQOZWWU/s
	 5zDu8dnEHpWXzs+6N8rKg9PZeQwrFnKxAnqxdeMxYH6vEtOpKL83+fE0Up7eNUF6BF
	 lXAHs1QRlMLFw==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 13/38] MIPS: SGI-IP27: route interrupt masks and slices through both PIs
Date: Thu,  1 Oct 2026 18:11:48 +0200
Message-ID: <731d55b6d7e53bcc48a9271dc0fb57ecbae571d3.1790857966.git.kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790857966.git.kaloz@kernel.org>
References: <cover.1790857966.git.kaloz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cputoslice() and PI_CPU_NUM return a physid, 0-3 across a Bedrock hub's
two PIs, where a Hub has a plain A/B bit. Add helpers splitting it into
A/B slot and PI block, and give every remote access the slice's PI
block. Local accesses already reach the running CPU's own PI.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/include/asm/sn/arch.h |  8 ++++++++
 arch/mips/include/asm/sn/intr.h | 10 ++++++----
 arch/mips/sgi-ip27/ip27-berr.c  |  4 ++--
 arch/mips/sgi-ip27/ip27-irq.c   | 17 +++++++++--------
 arch/mips/sgi-ip27/ip27-smp.c   | 16 +++++++++-------
 arch/mips/sgi-ip27/ip27-timer.c |  4 ++--
 6 files changed, 36 insertions(+), 23 deletions(-)

diff --git a/arch/mips/include/asm/sn/arch.h b/arch/mips/include/asm/sn/arch.h
index 9a9682543e89..602219f98b04 100644
--- a/arch/mips/include/asm/sn/arch.h
+++ b/arch/mips/include/asm/sn/arch.h
@@ -18,7 +18,15 @@
 #endif
 
 #define cputonasid(cpu)		(sn_cpu_info[(cpu)].p_nasid)
+/*
+ * The slice is the CPU's physid: on a Bedrock hub 0-3 across two PI blocks,
+ * bit 0 selecting a PI's A/B register slot and bit 1 the PI block.
+ */
 #define cputoslice(cpu)		(sn_cpu_info[(cpu)].p_slice)
+#define slicetoab(slice)	((slice) & 1)
+#define slicetosubnode(slice)	(((slice) >> 1) & 1)
+#define cputoab(cpu)		slicetoab(cputoslice(cpu))
+#define cputosubnode(cpu)	slicetosubnode(cputoslice(cpu))
 
 #define INVALID_NASID		(nasid_t)-1
 #define INVALID_PNODEID		(pnodeid_t)-1
diff --git a/arch/mips/include/asm/sn/intr.h b/arch/mips/include/asm/sn/intr.h
index 3d6954d370dc..90b613f68623 100644
--- a/arch/mips/include/asm/sn/intr.h
+++ b/arch/mips/include/asm/sn/intr.h
@@ -29,13 +29,15 @@ do {								\
 	LOCAL_HUB_L(PI_INT_PEND0);				\
 } while (0);
 
-#define REMOTE_HUB_CLR_INTR(hub, level)				\
+/* An interrupt is pending in the PI block of the CPU it is routed to. */
+#define REMOTE_HUB_PI_CLR_INTR(hub, sn, level)			\
 do {								\
 	nasid_t	 __hub = (hub);					\
+	int __sn = (sn);					\
 								\
-	REMOTE_HUB_S(__hub, PI_INT_PEND_MOD, (level));		\
-	REMOTE_HUB_L(__hub, PI_INT_PEND0);			\
-} while (0);
+	REMOTE_HUB_PI_S(__hub, __sn, PI_INT_PEND_MOD, (level));	\
+	REMOTE_HUB_PI_L(__hub, __sn, PI_INT_PEND0);		\
+} while (0)
 
 /*
  * Hard-coded interrupt levels:
diff --git a/arch/mips/sgi-ip27/ip27-berr.c b/arch/mips/sgi-ip27/ip27-berr.c
index 9eb497cb5d52..b176856aa77c 100644
--- a/arch/mips/sgi-ip27/ip27-berr.c
+++ b/arch/mips/sgi-ip27/ip27-berr.c
@@ -63,7 +63,7 @@ static int ip27_be_handler(struct pt_regs *regs, int is_fixup)
 {
 	unsigned long errst0, errst1;
 	int data = regs->cp0_cause & 4;
-	int cpu = LOCAL_HUB_L(PI_CPU_NUM);
+	int cpu = slicetoab(LOCAL_HUB_L(PI_CPU_NUM));
 
 	if (is_fixup)
 		return MIPS_BE_FIXUP;
@@ -84,7 +84,7 @@ static int ip27_be_handler(struct pt_regs *regs, int is_fixup)
 void __init ip27_be_init(void)
 {
 	/* XXX Initialize all the Hub & Bridge error handling here.  */
-	int cpu = LOCAL_HUB_L(PI_CPU_NUM);
+	int cpu = slicetoab(LOCAL_HUB_L(PI_CPU_NUM));
 	int cpuoff = cpu << 8;
 
 	mips_set_be_handler(ip27_be_handler);
diff --git a/arch/mips/sgi-ip27/ip27-irq.c b/arch/mips/sgi-ip27/ip27-irq.c
index 7e5aa04c6695..02a49bb8529d 100644
--- a/arch/mips/sgi-ip27/ip27-irq.c
+++ b/arch/mips/sgi-ip27/ip27-irq.c
@@ -72,7 +72,7 @@ static void disable_hub_irq(struct irq_data *d)
 static void setup_hub_mask(struct hub_irq_data *hd, const struct cpumask *mask)
 {
 	nasid_t nasid;
-	int cpu;
+	int cpu, sn;
 
 	cpu = cpumask_first_and(mask, cpu_online_mask);
 	if (cpu >= nr_cpu_ids)
@@ -80,12 +80,13 @@ static void setup_hub_mask(struct hub_irq_data *hd, const struct cpumask *mask)
 
 	nasid = cpu_to_node(cpu);
 	hd->cpu = cpu;
-	if (!cputoslice(cpu)) {
-		hd->irq_mask[0] = REMOTE_HUB_PTR(nasid, PI_INT_MASK0_A);
-		hd->irq_mask[1] = REMOTE_HUB_PTR(nasid, PI_INT_MASK1_A);
+	sn = cputosubnode(cpu);
+	if (!cputoab(cpu)) {
+		hd->irq_mask[0] = REMOTE_HUB_PI_PTR(nasid, sn, PI_INT_MASK0_A);
+		hd->irq_mask[1] = REMOTE_HUB_PI_PTR(nasid, sn, PI_INT_MASK1_A);
 	} else {
-		hd->irq_mask[0] = REMOTE_HUB_PTR(nasid, PI_INT_MASK0_B);
-		hd->irq_mask[1] = REMOTE_HUB_PTR(nasid, PI_INT_MASK1_B);
+		hd->irq_mask[0] = REMOTE_HUB_PI_PTR(nasid, sn, PI_INT_MASK0_B);
+		hd->irq_mask[1] = REMOTE_HUB_PI_PTR(nasid, sn, PI_INT_MASK1_B);
 	}
 }
 
@@ -147,7 +148,7 @@ static int hub_domain_alloc(struct irq_domain *domain, unsigned int virq,
 	info->nasid = cpu_to_node(hd->cpu);
 
 	/* Make sure it's not already pending when we connect it. */
-	REMOTE_HUB_CLR_INTR(info->nasid, swlevel);
+	REMOTE_HUB_PI_CLR_INTR(info->nasid, cputosubnode(hd->cpu), swlevel);
 
 	desc = irq_to_desc(virq);
 	desc->irq_common_data.node = info->nasid;
@@ -253,7 +254,7 @@ void install_ipi(void)
 {
 	int cpu = smp_processor_id();
 	unsigned long *mask = per_cpu(irq_enable_mask, cpu);
-	int slice = LOCAL_HUB_L(PI_CPU_NUM);
+	int slice = slicetoab(LOCAL_HUB_L(PI_CPU_NUM));
 	int resched, call;
 
 	resched = CPU_RESCHED_A_IRQ + slice;
diff --git a/arch/mips/sgi-ip27/ip27-smp.c b/arch/mips/sgi-ip27/ip27-smp.c
index 159dbd6ddda8..ac960023d334 100644
--- a/arch/mips/sgi-ip27/ip27-smp.c
+++ b/arch/mips/sgi-ip27/ip27-smp.c
@@ -94,15 +94,17 @@ void cpu_node_probe(void)
 
 static __init void intr_clear_all(nasid_t nasid)
 {
-	int i;
+	int i, sn, pis = system_is_ip35 ? 2 : 1;
 
-	REMOTE_HUB_S(nasid, PI_INT_MASK0_A, 0);
-	REMOTE_HUB_S(nasid, PI_INT_MASK0_B, 0);
-	REMOTE_HUB_S(nasid, PI_INT_MASK1_A, 0);
-	REMOTE_HUB_S(nasid, PI_INT_MASK1_B, 0);
+	for (sn = 0; sn < pis; sn++) {
+		REMOTE_HUB_PI_S(nasid, sn, PI_INT_MASK0_A, 0);
+		REMOTE_HUB_PI_S(nasid, sn, PI_INT_MASK0_B, 0);
+		REMOTE_HUB_PI_S(nasid, sn, PI_INT_MASK1_A, 0);
+		REMOTE_HUB_PI_S(nasid, sn, PI_INT_MASK1_B, 0);
 
-	for (i = 0; i < 128; i++)
-		REMOTE_HUB_CLR_INTR(nasid, i);
+		for (i = 0; i < 128; i++)
+			REMOTE_HUB_PI_CLR_INTR(nasid, sn, i);
+	}
 }
 
 static void ip27_send_ipi_single(int destid, unsigned int action)
diff --git a/arch/mips/sgi-ip27/ip27-timer.c b/arch/mips/sgi-ip27/ip27-timer.c
index 5f4da05cb2c9..aee14a7aad8a 100644
--- a/arch/mips/sgi-ip27/ip27-timer.c
+++ b/arch/mips/sgi-ip27/ip27-timer.c
@@ -30,7 +30,7 @@
 static int rt_next_event(unsigned long delta, struct clock_event_device *evt)
 {
 	unsigned int cpu = smp_processor_id();
-	int slice = cputoslice(cpu);
+	int slice = cputoab(cpu);
 	unsigned long cnt;
 
 	cnt = LOCAL_HUB_L(PI_RT_COUNT);
@@ -47,7 +47,7 @@ static irqreturn_t hub_rt_counter_handler(int irq, void *dev_id)
 {
 	unsigned int cpu = smp_processor_id();
 	struct clock_event_device *cd = &per_cpu(hub_rt_clockevent, cpu);
-	int slice = cputoslice(cpu);
+	int slice = cputoab(cpu);
 
 	/*
 	 * Ack
-- 
2.47.3

