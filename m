Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794597587;
	b=oeuFNP/Cn+A6lJe72IXc/5SgdAC7xeZh66lPswt4SyHSTm6aMtCU0sPTmD9meeqtVXlT
	 0P7SDiv7PXITO3mqiSWkYhG4HvrbRFsIBBiLgyKyg1q8flLW1RmF1t9q9Ldypkdgj8iW6
	 DIbZdO8T3YgPJjOLpkUGWTXMlmHanHb9bi0kvqapx4QDAbmRzAfVjgpODr+kQIns20p2D
	 z22MGQBFcpKMYkIztTHYxSSHqxJ9Hc6WgOlyCSD/Ktrr7sRPWa6rvU797T9yJ+dzdW0iO
	 lwst431Hp699tVUnXpcayI7wQeVeY6XUS/Lmt0CS+Av0drNltc+UaZWcm3Jtp7gimug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794597587;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=JIdyVUUoBkth+M+cx5jVMKNmaLvwy5ueEkwAsdvKPlg=;
	b=H3kpWCxbISlyarCXXeqSt9l1xTC0qiNGW2PqOQ1RK1TCV5KO+e23vn3+pwSpvlX2JPmx
	 C2StoZwb4VOcaOWtMiSW6aFtB6pGUtVz7rIWLb400Hj8TIwdlMcgg1dmRDoL4zCRQ4NXJ
	 Bmh5L3L2FCQMrE+R+uGkJepsTWEsnjnuUHgmM7gQM3m7mZkirz73ykCVpL9Ujdwvn1Zg2
	 ZJOuSPjoIbrNaxAs5BxvBhjNbr6LIW9U9ssNgtqi9M6VZdBje9tfHtVMqCR82kBLXKglu
	 aDgNdAuDKNHIUj4gJc3xWkPTuroCsxg9740oNYH0BPYeAaYPmRwLFxwCz3J0tsU7Arg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="QfL5VWA/";
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D08606A32E
	for <linux-mips@vger.kernel.org>; Fri, 13 Nov 2026 19:19:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56D08606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QfL5VWA/
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-37600b0db49so2131020eec.1
        for <linux-mips@vger.kernel.org>; Fri, 13 Nov 2026 11:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794597586; x=1795202386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JIdyVUUoBkth+M+cx5jVMKNmaLvwy5ueEkwAsdvKPlg=;
        b=QfL5VWA/nL0RQ2xzGEmq7QPpQdiNu3GFP8kHjLbveC/iK8iJj4xQ3GcH7XhRjpNH+X
         IvXTHms9Nu75NgiRFsSKmsrmdoaf+Ulyyls5wR910QieBP10L1evwBUQuMGSGt4vbl7f
         oP9auovrHLGFx/LD413AGNnInlQ2OzhCBnzPG5IBKXDkhRBTGLOw+M3BSZsBmBqRPzVI
         phk6QNFzPDlKMgLCWCvFbe4Gc8GBqqToSQk9vIlZQXOWj7df4G7nWs4P/LpYXGikUfES
         cG3JZftDnV+ZWihFOf+LYeSXJ6lg3HIHVBrhZw0EsE561ERa8WFGIy2JLY+72Ot3LF0a
         L4VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794597586; x=1795202386;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JIdyVUUoBkth+M+cx5jVMKNmaLvwy5ueEkwAsdvKPlg=;
        b=2vptKoepFKkV5e/TySL8vh0gDQsNM0neGdSgkjRRS0LFaEfVSb9Od/tE3fpDYpQ7sW
         F94DKdkkJWjVRjffSi7m49yVhH53K8k5ydABsXDGWNXtva00wAzHJH+30bCoi/0HN+Ap
         5NKF7xOVwfcJKid44xx2IiBpMBiWKJavfQcL9I2iniBQJPFDV4blQUeF9LB5OrMHuuUh
         DAYPt6A4SU3nKzq7aGAx0D3rsdZHhS8+W1w/wCczdht3sr6DW9UikdOxEwjcHM0G01bC
         /gCRL3w/z72JJdZE5HgKufARBUA+SrPUsV1ewzhB/fzUeSP22wi+cbCRTP7Cba3U5T0+
         EdUg==
X-Gm-Message-State: APuU4Z+Zkv5MRZMFvVV1z5L0WajBF2k3njqEWbm+p80gJvBBl7sRdm0T
	SfsrcE9yFyqbY/I4AP4Ft4pg40hSr+ll4ydRxdiGs+Xm+q7Kzgd4i+YUyuQshw==
X-Gm-Gg: AYBFou1okeIdOpqy0jRU8/qSlIpPrhRUorg/AXBeGnYY48s+1HDu1xzG+++cS9p6C/q
	eet+POW/n8h9o3AhHU9x4cq/DGd3VnEpfv5ZEZVgpl7V3a2Lv9Y451SXg8RFF9D3IU6Q6ddv2Qv
	oQAdHZymy7nVq4VBzSC4auNnCWbDvxG8K42HOKo2yPOI75fkAIE+WaLNSAtD1xvl/Rb3b2rCpLZ
	Ei8iWTggVtfxtLYE2sngKv6dykbIXfP+gInnSW321ZVp3pZrUY/D2PHMk8lCCd+FNXZvxSa6vdM
	L0KL6gQx62gussibM9vZlK4QhzsCt9aU/qwPBAePLuH23MrJGOIPPNS2WSs61u4QzV5ydLVQdiW
	s2lTUwPSpHEbYqR9L5QjgJXHaaDB2UlW5s2DzTXOYB7Q9qTRjPDVHpkA/dyTkt4QI5xAbFx6ch5
	SFNcEtWcb1DYtIoDfAbrmIRRfCsmW36BMRwtLMArNCtRy7jYjvS5MI+fcECGW3QcY7F7jpBZaDB
	9Qn7UMtylikMNlFs8WUyJTK+oXY+HKYmWq8ncSqe/LSKEz9XicU0h0/JhbNLcLC2cZgoSk1PY1e
	765fjnt/NRTHP3eI4vIlZasi6wG3Qrs=
X-Received: by 2002:a05:693c:60cd:b0:376:fa06:573e with SMTP id 5a478bee46e88-379658c795emr3191436eec.5.1794597586075;
        Fri, 13 Nov 2026 11:19:46 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3797f98b9b2sm9084971eec.6.2026.11.13.11.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:19:45 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: macro@orcam.me.uk,
	Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] MIPS: SiByte: Fix missing function prototypes
Date: Fri, 13 Nov 2026 11:19:02 -0800
Message-ID: <20261113191933.477395-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The SB1250 SWARM build reports missing prototypes for platform time
initialization, SoC setup, IRQ and SMP helpers, and both RTC backends.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
Changes in v2:

- corrected warning reported by kbuild test robot by gating the
  inclusion of sb1250.h to avoid warnings on bcm63xx_defconfig

 arch/mips/include/asm/sibyte/sb1250.h  | 17 +++++++++++++++++
 arch/mips/mm/cerr-sb1.c                |  2 --
 arch/mips/mm/tlbex.c                   | 11 +++++++----
 arch/mips/sibyte/bcm1480/irq.c         |  4 +---
 arch/mips/sibyte/bcm1480/smp.c         |  6 +-----
 arch/mips/sibyte/bcm1480/time.c        |  4 ++--
 arch/mips/sibyte/common/bus_watcher.c  |  2 +-
 arch/mips/sibyte/sb1250/irq.c          |  4 +---
 arch/mips/sibyte/sb1250/smp.c          |  6 +-----
 arch/mips/sibyte/sb1250/time.c         |  4 ++--
 arch/mips/sibyte/swarm/rtc.h           | 15 +++++++++++++++
 arch/mips/sibyte/swarm/rtc_m41t81.c    |  1 +
 arch/mips/sibyte/swarm/rtc_xicor1241.c |  1 +
 arch/mips/sibyte/swarm/setup.c         | 18 ++----------------
 14 files changed, 52 insertions(+), 43 deletions(-)
 create mode 100644 arch/mips/sibyte/swarm/rtc.h

diff --git a/arch/mips/include/asm/sibyte/sb1250.h b/arch/mips/include/asm/sibyte/sb1250.h
index de4b352256c8..ff97e77d4fe7 100644
--- a/arch/mips/include/asm/sibyte/sb1250.h
+++ b/arch/mips/include/asm/sibyte/sb1250.h
@@ -32,9 +32,26 @@ extern unsigned int soc_type;
 extern unsigned int periph_rev;
 extern unsigned int zbbus_mhz;
 
+void sb1_cache_error(void);
+
+#ifdef CONFIG_SIBYTE_BUS_WATCHER
+void check_bus_watcher(void);
+#endif
+
+int sb1250_m3_workaround_needed(void);
+void sb1250_setup(void);
+void sb1250_clockevent_init(void);
+void sb1250_clocksource_init(void);
+void sb1250_mailbox_interrupt(void);
+
 extern void sb1250_mask_irq(int cpu, int irq);
 extern void sb1250_unmask_irq(int cpu, int irq);
 
+void bcm1480_setup(void);
+void sb1480_clockevent_init(void);
+void sb1480_clocksource_init(void);
+void bcm1480_mailbox_interrupt(void);
+
 extern void bcm1480_time_init(void);
 extern void bcm1480_mask_irq(int cpu, int irq);
 extern void bcm1480_unmask_irq(int cpu, int irq);
diff --git a/arch/mips/mm/cerr-sb1.c b/arch/mips/mm/cerr-sb1.c
index a3c02df19f6f..6842244ac85b 100644
--- a/arch/mips/mm/cerr-sb1.c
+++ b/arch/mips/mm/cerr-sb1.c
@@ -158,8 +158,6 @@ static void check_bus_watcher(void)
 		printk("Bus watcher indicates no error\n");
 	}
 }
-#else
-extern void check_bus_watcher(void);
 #endif
 
 asmlinkage void sb1_cache_error(void)
diff --git a/arch/mips/mm/tlbex.c b/arch/mips/mm/tlbex.c
index 69ea54bdc0c3..03a9b03c3d3a 100644
--- a/arch/mips/mm/tlbex.c
+++ b/arch/mips/mm/tlbex.c
@@ -37,6 +37,9 @@
 #include <asm/regdef.h>
 #include <asm/uasm.h>
 #include <asm/setup.h>
+#ifdef CONFIG_SB1_PASS_2_WORKAROUNDS
+#include <asm/sibyte/sb1250.h>
+#endif
 #include <asm/tlbex.h>
 
 static int mips_xpa_disabled;
@@ -84,13 +87,13 @@ static inline int r4k_250MHZhwbug(void)
 	return 0;
 }
 
-extern int sb1250_m3_workaround_needed(void);
-
 static inline int __maybe_unused bcm1250_m3_war(void)
 {
-	if (IS_ENABLED(CONFIG_SB1_PASS_2_WORKAROUNDS))
-		return sb1250_m3_workaround_needed();
+#ifdef CONFIG_SB1_PASS_2_WORKAROUNDS
+	return sb1250_m3_workaround_needed();
+#else
 	return 0;
+#endif
 }
 
 static inline int __maybe_unused r10000_llsc_war(void)
diff --git a/arch/mips/sibyte/bcm1480/irq.c b/arch/mips/sibyte/bcm1480/irq.c
index 4c18a2c755d2..ab329a15d690 100644
--- a/arch/mips/sibyte/bcm1480/irq.c
+++ b/arch/mips/sibyte/bcm1480/irq.c
@@ -198,7 +198,7 @@ static struct irq_chip bcm1480_irq_type = {
 #endif
 };
 
-void __init init_bcm1480_irqs(void)
+static void __init init_bcm1480_irqs(void)
 {
 	int i;
 
@@ -303,8 +303,6 @@ void __init arch_init_irq(void)
 	change_c0_status(ST0_IM, imask);
 }
 
-extern void bcm1480_mailbox_interrupt(void);
-
 static inline void dispatch_ip2(void)
 {
 	unsigned long long mask_h, mask_l;
diff --git a/arch/mips/sibyte/bcm1480/smp.c b/arch/mips/sibyte/bcm1480/smp.c
index 5861e50255bf..ea491f45d9ac 100644
--- a/arch/mips/sibyte/bcm1480/smp.c
+++ b/arch/mips/sibyte/bcm1480/smp.c
@@ -46,7 +46,7 @@ static void *mailbox_0_regs[] = {
 /*
  * SMP init and finish on secondary CPUs
  */
-void bcm1480_smp_init(void)
+static void bcm1480_smp_init(void)
 {
 	unsigned int imask = STATUSF_IP4 | STATUSF_IP3 | STATUSF_IP2 |
 		STATUSF_IP1 | STATUSF_IP0;
@@ -83,8 +83,6 @@ static void bcm1480_send_ipi_mask(const struct cpumask *mask,
  */
 static void bcm1480_init_secondary(void)
 {
-	extern void bcm1480_smp_init(void);
-
 	bcm1480_smp_init();
 }
 
@@ -94,8 +92,6 @@ static void bcm1480_init_secondary(void)
  */
 static void bcm1480_smp_finish(void)
 {
-	extern void sb1480_clockevent_init(void);
-
 	sb1480_clockevent_init();
 	local_irq_enable();
 }
diff --git a/arch/mips/sibyte/bcm1480/time.c b/arch/mips/sibyte/bcm1480/time.c
index e6450d79fb4f..42db437af306 100644
--- a/arch/mips/sibyte/bcm1480/time.c
+++ b/arch/mips/sibyte/bcm1480/time.c
@@ -4,8 +4,8 @@
  */
 #include <linux/init.h>
 
-extern void sb1480_clockevent_init(void);
-extern void sb1480_clocksource_init(void);
+#include <asm/time.h>
+#include <asm/sibyte/sb1250.h>
 
 void __init plat_time_init(void)
 {
diff --git a/arch/mips/sibyte/common/bus_watcher.c b/arch/mips/sibyte/common/bus_watcher.c
index a296d2c51841..5df4c82ac2a5 100644
--- a/arch/mips/sibyte/common/bus_watcher.c
+++ b/arch/mips/sibyte/common/bus_watcher.c
@@ -189,7 +189,7 @@ static irqreturn_t sibyte_bw_int(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-int __init sibyte_bus_watcher(void)
+static int __init sibyte_bus_watcher(void)
 {
 	memset(&bw_stats, 0, sizeof(struct bw_stats_struct));
 	bw_stats.status_printed = 1;
diff --git a/arch/mips/sibyte/sb1250/irq.c b/arch/mips/sibyte/sb1250/irq.c
index 57943fe3ac03..8108ead0cea8 100644
--- a/arch/mips/sibyte/sb1250/irq.c
+++ b/arch/mips/sibyte/sb1250/irq.c
@@ -179,7 +179,7 @@ static struct irq_chip sb1250_irq_type = {
 #endif
 };
 
-void __init init_sb1250_irqs(void)
+static void __init init_sb1250_irqs(void)
 {
 	int i;
 
@@ -266,8 +266,6 @@ void __init arch_init_irq(void)
 	change_c0_status(ST0_IM, imask);
 }
 
-extern void sb1250_mailbox_interrupt(void);
-
 static inline void dispatch_ip2(void)
 {
 	unsigned int cpu = smp_processor_id();
diff --git a/arch/mips/sibyte/sb1250/smp.c b/arch/mips/sibyte/sb1250/smp.c
index 7a794234e3d7..950d2e1c0de7 100644
--- a/arch/mips/sibyte/sb1250/smp.c
+++ b/arch/mips/sibyte/sb1250/smp.c
@@ -35,7 +35,7 @@ static void *mailbox_regs[] = {
 /*
  * SMP init and finish on secondary CPUs
  */
-void sb1250_smp_init(void)
+static void sb1250_smp_init(void)
 {
 	unsigned int imask = STATUSF_IP4 | STATUSF_IP3 | STATUSF_IP2 |
 		STATUSF_IP1 | STATUSF_IP0;
@@ -72,8 +72,6 @@ static inline void sb1250_send_ipi_mask(const struct cpumask *mask,
  */
 static void sb1250_init_secondary(void)
 {
-	extern void sb1250_smp_init(void);
-
 	sb1250_smp_init();
 }
 
@@ -83,8 +81,6 @@ static void sb1250_init_secondary(void)
  */
 static void sb1250_smp_finish(void)
 {
-	extern void sb1250_clockevent_init(void);
-
 	sb1250_clockevent_init();
 	local_irq_enable();
 }
diff --git a/arch/mips/sibyte/sb1250/time.c b/arch/mips/sibyte/sb1250/time.c
index 8b63000a4dd5..3f7f64fe5690 100644
--- a/arch/mips/sibyte/sb1250/time.c
+++ b/arch/mips/sibyte/sb1250/time.c
@@ -4,8 +4,8 @@
  */
 #include <linux/init.h>
 
-extern void sb1250_clocksource_init(void);
-extern void sb1250_clockevent_init(void);
+#include <asm/time.h>
+#include <asm/sibyte/sb1250.h>
 
 void __init plat_time_init(void)
 {
diff --git a/arch/mips/sibyte/swarm/rtc.h b/arch/mips/sibyte/swarm/rtc.h
new file mode 100644
index 000000000000..64b8db786575
--- /dev/null
+++ b/arch/mips/sibyte/swarm/rtc.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef _SIBYTE_SWARM_RTC_H
+#define _SIBYTE_SWARM_RTC_H
+
+#include <linux/time64.h>
+
+int xicor_probe(void);
+int xicor_set_time(time64_t t);
+time64_t xicor_get_time(void);
+
+int m41t81_probe(void);
+int m41t81_set_time(time64_t t);
+time64_t m41t81_get_time(void);
+
+#endif /* _SIBYTE_SWARM_RTC_H */
diff --git a/arch/mips/sibyte/swarm/rtc_m41t81.c b/arch/mips/sibyte/swarm/rtc_m41t81.c
index afe1e3460bd4..e70ec1870674 100644
--- a/arch/mips/sibyte/swarm/rtc_m41t81.c
+++ b/arch/mips/sibyte/swarm/rtc_m41t81.c
@@ -17,6 +17,7 @@
 #include <asm/sibyte/sb1250_regs.h>
 #include <asm/sibyte/sb1250_smbus.h>
 
+#include "rtc.h"
 
 /* M41T81 definitions */
 
diff --git a/arch/mips/sibyte/swarm/rtc_xicor1241.c b/arch/mips/sibyte/swarm/rtc_xicor1241.c
index e2164200ceec..5bb2bc6a57d2 100644
--- a/arch/mips/sibyte/swarm/rtc_xicor1241.c
+++ b/arch/mips/sibyte/swarm/rtc_xicor1241.c
@@ -17,6 +17,7 @@
 #include <asm/sibyte/sb1250_regs.h>
 #include <asm/sibyte/sb1250_smbus.h>
 
+#include "rtc.h"
 
 /* Xicor 1241 definitions */
 
diff --git a/arch/mips/sibyte/swarm/setup.c b/arch/mips/sibyte/swarm/setup.c
index 38c90b5e8754..a910961ad967 100644
--- a/arch/mips/sibyte/swarm/setup.c
+++ b/arch/mips/sibyte/swarm/setup.c
@@ -35,28 +35,14 @@
 #include <asm/sibyte/sb1250_genbus.h>
 #include <asm/sibyte/board.h>
 
-#ifdef CONFIG_SIBYTE_BCM1x80
-extern void bcm1480_setup(void);
-#elif defined(CONFIG_SIBYTE_SB1250) || defined(CONFIG_SIBYTE_BCM112X)
-extern void sb1250_setup(void);
-#else
-#error invalid SiByte board configuration
-#endif
-
-extern int xicor_probe(void);
-extern int xicor_set_time(time64_t);
-extern time64_t xicor_get_time(void);
-
-extern int m41t81_probe(void);
-extern int m41t81_set_time(time64_t);
-extern time64_t m41t81_get_time(void);
+#include "rtc.h"
 
 const char *get_system_type(void)
 {
 	return "SiByte " SIBYTE_BOARD_NAME;
 }
 
-int swarm_be_handler(struct pt_regs *regs, int is_fixup)
+static int swarm_be_handler(struct pt_regs *regs, int is_fixup)
 {
 	if (!is_fixup && (regs->cp0_cause & 4)) {
 		/* Data bus error - print PA */
-- 
2.53.0

