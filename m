Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0E152189F;
	Tue, 13 Oct 2026 13:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897549; cv=none; b=IT5BBWTWpqBLSazNy0xa7lTx3AAi9aCdYt9ZUgqcFsDnsnnvaFZ97OUSzs+TYOkJLYOF8L4eybatVmQeP/1i+mkwykcc69y57xZtvdH2DPVCX3XA+NkhtG/8LSjmRwaVSrzj0K63atHFzULr0f7nbijlU6O5nojVnbE41ixwiGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897549; c=relaxed/simple;
	bh=18OmgowSD1a5FaZzu+dgXXbOdH6g7LQ2Sw03zZg6tO4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JsaXEWGSTMEEILNtmF/RPAeVj9qJy+7jwD0SnMJkyURI78yVu/5G6F5Rhose2OFBhWrSuMzuxD/T0eUk5oJ+2VkRSZmx4qM1lBj30Ge7UWJLMcKjB3Fp5kkRiex1ef5UrnKx89pVYByuTlyL3PlK548BtbYkREVS7gVTulRetjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CAJbywGy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CAJbywGy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E423D1F000FF;
	Tue, 13 Oct 2026 13:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791897548;
	bh=GUSR4G9TgqMZWSAoSCl1R5rma1HPyFzgrZD/ZhJ/3jw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CAJbywGyJ2ms+xZ8siXBN9GWTZMwCVkv7BPKZOCAeu1zgd3qYdUfwZKCXCmoezE9l
	 Kw5sofelVJFtRbhiiI3VhOl2aYMUiNfGfG7AOw8ptBKCdCeoPopGKFXEQJwnmB6Cp8
	 1Mxo2Pl6JZhQaVO6pUTWR7iHIEn5Q/FHlBSvtXOm1YQPnTfvciTibYk7Dj88bAEcF7
	 Zg9FBCc0HrYAMsbKuz9cczc877VrlBUgdNlOTOYkmXttV8zENOTHHBaWBOgpJkcfQo
	 IX+aQSI/kaNOF2qW/ZRY1U4rZQIsySsY+J9VwPRce+ZbSChUe16HY9A9NnAvZ5JD1n
	 oJrLBivVj2z4w==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>
Subject: [PATCH v2 19/53] MIPS: SGI-IP27: address a CPU's own PI for NMI, IPI and RT counter
Date: Tue, 13 Oct 2026 15:16:39 +0200
Message-ID: <a0627fb66a405ec4b515670ca673fa2036140ad6.1791890466.git.kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1791890466.git.kaloz@kernel.org>
References: <cover.1791890466.git.kaloz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

REMOTE_HUB_SEND_INTR(), SEND_NMI() and nmi_dump_hub_irq() reach the first
PI only; address a CPU's own PI. Call hub_rtc_init() once per PI; its
LOCAL_HUB writes reach the calling CPU's own PI. Read the clocksource from
the boot CPU's PI and enable the Bedrock NI reset for NMI.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/include/asm/sn/intr.h      |  4 +--
 arch/mips/include/asm/sn/kldir.h     |  1 +
 arch/mips/include/asm/sn/sn1/hub.h   | 11 ++++++++
 arch/mips/include/asm/sn/sn1/kldir.h | 14 ++++++++++
 arch/mips/sgi-ip27/ip27-init.c       | 14 +++++++---
 arch/mips/sgi-ip27/ip27-nmi.c        | 38 +++++++++++++++++++---------
 arch/mips/sgi-ip27/ip27-smp.c        |  4 +--
 arch/mips/sgi-ip27/ip27-timer.c      |  8 ++++--
 8 files changed, 73 insertions(+), 21 deletions(-)
 create mode 100644 arch/mips/include/asm/sn/sn1/kldir.h

diff --git a/arch/mips/include/asm/sn/intr.h b/arch/mips/include/asm/sn/intr.h
index 90b613f68623..4927232fafc3 100644
--- a/arch/mips/include/asm/sn/intr.h
+++ b/arch/mips/include/asm/sn/intr.h
@@ -14,8 +14,8 @@
 
 #define LOCAL_HUB_SEND_INTR(level)				\
 	LOCAL_HUB_S(PI_INT_PEND_MOD, (0x100 | (level)))
-#define REMOTE_HUB_SEND_INTR(hub, level)			\
-	REMOTE_HUB_S((hub), PI_INT_PEND_MOD, (0x100 | (level)))
+#define REMOTE_HUB_PI_SEND_INTR(hub, sn, level)			\
+	REMOTE_HUB_PI_S((hub), (sn), PI_INT_PEND_MOD, (0x100 | (level)))
 
 /*
  * When clearing the interrupt, make sure this clear does make it
diff --git a/arch/mips/include/asm/sn/kldir.h b/arch/mips/include/asm/sn/kldir.h
index f394b1e0c956..23999dd43eb2 100644
--- a/arch/mips/include/asm/sn/kldir.h
+++ b/arch/mips/include/asm/sn/kldir.h
@@ -31,6 +31,7 @@ typedef struct kldir_ent_s {
 
 #ifdef CONFIG_SGI_IP27
 #include <asm/sn/sn0/kldir.h>
+#include <asm/sn/sn1/kldir.h>
 #endif
 
 #endif /* _ASM_SN_KLDIR_H */
diff --git a/arch/mips/include/asm/sn/sn1/hub.h b/arch/mips/include/asm/sn/sn1/hub.h
index 71ccd2ba3698..60e0f249852f 100644
--- a/arch/mips/include/asm/sn/sn1/hub.h
+++ b/arch/mips/include/asm/sn/sn1/hub.h
@@ -26,4 +26,15 @@
 #define LRI_SYSTEM_SIZE_IP35(id)	(((id) >> 46) & 0x3)
 #define LRI_SYSTEM_SIZE_NMODE_IP35	2
 
+/*
+ * Network interface port reset: bit 0 sends a link reset, bit 2 resets
+ * the local Bedrock.  Bit 0 of the reset enable register lets a reset
+ * arriving over the link reset this Bedrock.
+ */
+#define NI_PORT_RESET_IP35	(HUBNIBASE_IP35 + 0x000008)
+#define NI_RESET_ACTION_IP35	0x01
+#define NI_RESET_LOCAL_IP35	0x04
+#define NI_RESET_ENABLE_IP35	(HUBNIBASE_IP35 + 0x000010)
+#define NI_RESET_OK_IP35	0x01
+
 #endif /* _ASM_SN_SN1_HUB_H */
diff --git a/arch/mips/include/asm/sn/sn1/kldir.h b/arch/mips/include/asm/sn/sn1/kldir.h
new file mode 100644
index 000000000000..c95dccb3ce55
--- /dev/null
+++ b/arch/mips/include/asm/sn/sn1/kldir.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * SN1 (Bedrock) kldir constants.
+ *
+ * Copyright (C) 2026 Imre Kaloz <kaloz@kernel.org>
+ */
+#ifndef _ASM_SN_SN1_KLDIR_H
+#define _ASM_SN_SN1_KLDIR_H
+
+/* Save area of kernel NMI regs in the PROM format. */
+#define IP35_NMI_KREGS_OFFSET		0x9000
+#define IP35_NMI_KREGS_CPU_SIZE	0x400
+
+#endif /* _ASM_SN_SN1_KLDIR_H */
diff --git a/arch/mips/sgi-ip27/ip27-init.c b/arch/mips/sgi-ip27/ip27-init.c
index 108d90908763..88d79c50d9a7 100644
--- a/arch/mips/sgi-ip27/ip27-init.c
+++ b/arch/mips/sgi-ip27/ip27-init.c
@@ -37,7 +37,11 @@
 
 #define CPU_NONE		(cpuid_t)-1
 
+/* A Bedrock hub has two PI register blocks; a Hub has one. */
+#define PIS_PER_HUB		2
+
 static DECLARE_BITMAP(hub_init_mask, MAX_NUMNODES);
+static DECLARE_BITMAP(pi_init_mask, MAX_NUMNODES * PIS_PER_HUB);
 nasid_t master_nasid = INVALID_NASID;
 bool system_is_ip35;
 
@@ -46,9 +50,15 @@ EXPORT_SYMBOL_GPL(sn_cpu_info);
 
 static void per_hub_init(nasid_t nasid)
 {
+	int cpu = smp_processor_id();
 	struct hub_data *hub = hub_data(nasid);
+	int subnode = cputosubnode(cpu);
 
-	cpumask_set_cpu(smp_processor_id(), &hub->h_cpus);
+	cpumask_set_cpu(cpu, &hub->h_cpus);
+
+	/* A second pass would zero the counter under a CPU already ticking. */
+	if (!test_and_set_bit(nasid * PIS_PER_HUB + subnode, pi_init_mask))
+		hub_rtc_init(nasid);
 
 	if (test_and_set_bit(nasid, hub_init_mask))
 		return;
@@ -58,8 +68,6 @@ static void per_hub_init(nasid_t nasid)
 	REMOTE_HUB_S(nasid, IIO_ICTP, 0x800);
 	REMOTE_HUB_S(nasid, IIO_ICTO, 0xff);
 
-	hub_rtc_init(nasid);
-
 	if (nasid) {
 		/* copy exception handlers from first node to current node */
 		memcpy((void *)NODE_OFFSET_TO_K0(nasid, 0),
diff --git a/arch/mips/sgi-ip27/ip27-nmi.c b/arch/mips/sgi-ip27/ip27-nmi.c
index 2cb17f8c7bf3..627816d5bc6f 100644
--- a/arch/mips/sgi-ip27/ip27-nmi.c
+++ b/arch/mips/sgi-ip27/ip27-nmi.c
@@ -15,8 +15,9 @@
 
 #include "ip27-common.h"
 
-#define SEND_NMI(_nasid, _slice)	\
-	REMOTE_HUB_S((_nasid),  (PI_NMI_A + ((_slice) * PI_NMI_OFFSET)), 1)
+#define SEND_NMI(_nasid, _slice)					\
+	REMOTE_HUB_PI_S((_nasid), slicetosubnode(_slice),		\
+		(PI_NMI_A + (slicetoab(_slice) * PI_NMI_OFFSET)), 1)
 
 typedef unsigned long machreg_t;
 
@@ -45,12 +46,18 @@ void install_cpu_nmi_handler(int slice)
 static void nmi_cpu_eframe_save(nasid_t nasid, int slice)
 {
 	struct reg_struct *nr;
+	int kregs_offset, kregs_cpu_size;
 	int		i;
 
+	kregs_offset = system_is_ip35 ? IP35_NMI_KREGS_OFFSET :
+					  IP27_NMI_KREGS_OFFSET;
+	kregs_cpu_size = system_is_ip35 ? IP35_NMI_KREGS_CPU_SIZE :
+					    IP27_NMI_KREGS_CPU_SIZE;
+
 	/* Get the pointer to the current cpu's register set. */
 	nr = (struct reg_struct *)
-		(TO_UNCAC(TO_NODE(nasid, IP27_NMI_KREGS_OFFSET)) +
-		slice * IP27_NMI_KREGS_CPU_SIZE);
+		(TO_UNCAC(TO_NODE(nasid, kregs_offset)) +
+		slice * kregs_cpu_size);
 
 	pr_emerg("NMI nasid %d: slice %d\n", nasid, slice);
 
@@ -120,18 +127,19 @@ static void nmi_cpu_eframe_save(nasid_t nasid, int slice)
 
 static void nmi_dump_hub_irq(nasid_t nasid, int slice)
 {
+	int subnode = slicetosubnode(slice);
 	u64 mask0, mask1, pend0, pend1;
 
-	if (slice == 0) {				/* Slice A */
-		mask0 = REMOTE_HUB_L(nasid, PI_INT_MASK0_A);
-		mask1 = REMOTE_HUB_L(nasid, PI_INT_MASK1_A);
+	if (!slicetoab(slice)) {			/* Slice A */
+		mask0 = REMOTE_HUB_PI_L(nasid, subnode, PI_INT_MASK0_A);
+		mask1 = REMOTE_HUB_PI_L(nasid, subnode, PI_INT_MASK1_A);
 	} else {					/* Slice B */
-		mask0 = REMOTE_HUB_L(nasid, PI_INT_MASK0_B);
-		mask1 = REMOTE_HUB_L(nasid, PI_INT_MASK1_B);
+		mask0 = REMOTE_HUB_PI_L(nasid, subnode, PI_INT_MASK0_B);
+		mask1 = REMOTE_HUB_PI_L(nasid, subnode, PI_INT_MASK1_B);
 	}
 
-	pend0 = REMOTE_HUB_L(nasid, PI_INT_PEND0);
-	pend1 = REMOTE_HUB_L(nasid, PI_INT_PEND1);
+	pend0 = REMOTE_HUB_PI_L(nasid, subnode, PI_INT_PEND0);
+	pend1 = REMOTE_HUB_PI_L(nasid, subnode, PI_INT_PEND1);
 
 	pr_emerg("PI_INT_MASK0: %16llx PI_INT_MASK1: %16llx\n", mask0, mask1);
 	pr_emerg("PI_INT_PEND0: %16llx PI_INT_PEND1: %16llx\n", pend0, pend1);
@@ -235,5 +243,11 @@ static void nmi_dump(void)
 	 */
 	nmi_eframes_save();
 	printk_trigger_flush();
-	LOCAL_HUB_S(NI_PORT_RESET, NPR_PORTRESET | NPR_LOCALRESET);
+	if (system_is_ip35) {
+		LOCAL_HUB_S(NI_RESET_ENABLE_IP35, NI_RESET_OK_IP35);
+		LOCAL_HUB_S(NI_PORT_RESET_IP35,
+			    NI_RESET_ACTION_IP35 | NI_RESET_LOCAL_IP35);
+	} else {
+		LOCAL_HUB_S(NI_PORT_RESET, NPR_PORTRESET | NPR_LOCALRESET);
+	}
 }
diff --git a/arch/mips/sgi-ip27/ip27-smp.c b/arch/mips/sgi-ip27/ip27-smp.c
index 66c999a8b966..13b85e3ba311 100644
--- a/arch/mips/sgi-ip27/ip27-smp.c
+++ b/arch/mips/sgi-ip27/ip27-smp.c
@@ -122,13 +122,13 @@ static void ip27_send_ipi_single(int destid, unsigned int action)
 		panic("sendintr");
 	}
 
-	irq += cputoslice(destid);
+	irq += cputoab(destid);
 
 	/*
 	 * Set the interrupt bit associated with the CPU we want to
 	 * send the interrupt to.
 	 */
-	REMOTE_HUB_SEND_INTR(cpu_to_node(destid), irq);
+	REMOTE_HUB_PI_SEND_INTR(cpu_to_node(destid), cputosubnode(destid), irq);
 }
 
 static void ip27_send_ipi_mask(const struct cpumask *mask, unsigned int action)
diff --git a/arch/mips/sgi-ip27/ip27-timer.c b/arch/mips/sgi-ip27/ip27-timer.c
index aee14a7aad8a..14df8608b14b 100644
--- a/arch/mips/sgi-ip27/ip27-timer.c
+++ b/arch/mips/sgi-ip27/ip27-timer.c
@@ -100,9 +100,13 @@ static void __init hub_rt_clock_event_global_init(void)
 				   "hub-rt", &hub_rt_clockevent));
 }
 
+/*
+ * Each PI of a Bedrock hub has its own RT counter, zeroed when that PI's
+ * first CPU comes up; the timebase is the boot CPU's.
+ */
 static u64 hub_rt_read(struct clocksource *cs)
 {
-	return REMOTE_HUB_L(cputonasid(0), PI_RT_COUNT);
+	return REMOTE_HUB_PI_L(cputonasid(0), cputosubnode(0), PI_RT_COUNT);
 }
 
 struct clocksource hub_rt_clocksource = {
@@ -115,7 +119,7 @@ struct clocksource hub_rt_clocksource = {
 
 static u64 notrace hub_rt_read_sched_clock(void)
 {
-	return REMOTE_HUB_L(cputonasid(0), PI_RT_COUNT);
+	return REMOTE_HUB_PI_L(cputonasid(0), cputosubnode(0), PI_RT_COUNT);
 }
 
 static void __init hub_rt_clocksource_init(void)
-- 
2.47.3

