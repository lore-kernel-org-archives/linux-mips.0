Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794513539;
	b=1B6xrC7uuIGxx5Z/irC/f9G8q5ob+1BpUwPF/na7bfSOewsbaWX4VY5u5AGTTjD+SRM7
	 RwM+tqM76Gnae639Fv5xQxIL+OwxqJM4IEoMdX8dyvpYdxE8rgEJhIAKhBiYY9+jwkHty
	 KnCcUW0v42QoWfGWy107SKHyH1XuAsJMaxBGgBiWKZlv35erFZdKN+Ha60CNgVlVT4O/4
	 5Cf2gQCM9oKMto2m9Q0Z5ptHFnwAjJ4t7876Fc0/ZvDq14bXWKTYtHZQH+E9IoRrVoAiF
	 I/7lPieRISTO3waAKqUeFCytocA2EB0swNf0ZXS5e4FlH1aSP1dTmVtcW6i7b9bvxQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794513539;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Wbsijdun8X2c7X7cqmk6FaBlLT1QuRHEmkc3rgb9sXg=;
	b=L4XNM/Y1OARR/Gpf5kthNXflphqP1bV85HKtJuPrN7QaAWdMuueFoLWuq7jsWSF0oT7v
	 Fdm+pKaJCV5La2lc3s4zymWzV1Su/K12xmm13EMv2+S/ybOBKoMu3FhJWwy2Ayycnm0Aj
	 SF0lrES+avmsaYK9UqtZ7eOwrDmS0tUXW8pQk6l5tazgWZyS5I/ywa5gRJ0H0qKHLRg3w
	 TIX81J6dL0C9fDg8x72vBc4QHsbLE47boRPnFwccC3ddmI5o+mhnILK3xaQwb1BkKTmc2
	 0tt+y/Fk68UQtwPCz+dYd2655PW4RJdM1CZBueuCl9/C83bcQjK2MO/q2uFuPXrGBTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ygWK+BSz;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6770D606A31C
	for <linux-mips@vger.kernel.org>; Thu, 12 Nov 2026 19:58:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6770D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ygWK+BSz
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36dbde64409so393170eec.0
        for <linux-mips@vger.kernel.org>; Thu, 12 Nov 2026 11:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794513538; x=1795118338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wbsijdun8X2c7X7cqmk6FaBlLT1QuRHEmkc3rgb9sXg=;
        b=ygWK+BSzh5lyK/dHxqPkfK1LSvQlqsnnTXukwYLjuy04Zkvviz2V0AKPHfjCWZwpOg
         kUCrghj+8PnK35H/FunuAi0befEZ/LCaB+MlCPbIsTCDtZrePdc93dHysHmDWLsTenBN
         Ue0IICCavkRrpODDvBhrqPRn8zR0c2vmylJmMGj3AsLKSvXjEcxlCE0zdhYYdDur6ZVh
         Hxn9YoqzOgp2ty8Z8wiOLShdUPoBTcyQam+2xrteti3QqfCAknHVgTAIpeXe3btNmFnX
         UZUhQbBPRyF4HgLUHw4DK2iiQtTF8vbuKxSichaxivh66IAO1Rt3/aZ6zhyF69i7GKBT
         Ns7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794513538; x=1795118338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wbsijdun8X2c7X7cqmk6FaBlLT1QuRHEmkc3rgb9sXg=;
        b=bDBkRuJFS24EGxpzUvx2D8dwHkWd6eZZNP8T6rd1V52tNdDOYgOFrQU59zShHKeVm/
         hEdIvik0tnHOvxBpvfaQv9Z1zc5UJ0l1VhLTkzDxDMSej4AqjFjEmVkfbTD1LgCxV03u
         OQGJEnFPhsVpF5FHGVjfFzCRqLymqb3AOSMb1g5j+VpcVwRAloUTfly/TlWaL3j0cIdV
         jqA7N+CFeXLfSPFp+4PPYcJOzGtvB9qySzgswZ7Llq/I5cbSiuKCqkbAcrnTMQmCt6cP
         wcJ1rar3ZDIruAY+GqflvpWDa+WYoLR9paPTdayXDvnIuaXnBxhkfaoi1QkorzimuMs8
         zOdg==
X-Gm-Message-State: APuU4Z8p4xcco6Jai7MWS03W09kzf2aCbyCkoGyQk+xDsbbbqe0zuxNK
	XpLEPXUo66wRcjHsrNXQbD6ScGMmPBuiSVOESAC7FajrB9Z7+XDkBBTFsqnZNw==
X-Gm-Gg: AYBFou1BeJ+rDPMosxqDkWI072WaM5MBiDHq6xVnWPVTAVCXZS8pSU+ttTVOz/3lRVP
	iem09LSJsYBMPBVg87CuuPKg9N0Poz/5h48VC93H4HTqOfnMNR+qgXg1KSLHS7jliRTm30hCtrn
	BGm4SsmurQENA0hFEBdIQBkLypYIrVmST0KNPj/t0vlZ0XlBpxn9DHDZTzXiBNIfBTdcVSPYuyq
	NyQMJWhnSSjR/vd1GXzOgzsM48Wsk/qzukCbdgLcY1eCHn9bkxUM51iaidbJnNNQW9DpR7wYOcD
	ZS/7GsnChFiKD5mEeeZ3I7z1gs73yQrgGdG5rIpmdo3Ou+DNftBKEMjqvpE49T0hP02dpl4VtVj
	RcICtwE26N7PFk3vvZstXQcIRDfHm97S2LDN/i434CvjlfESYD9NwluA0pDud9Zf0KT/hkSayLx
	czDLQyaz3LZhblG1zDiH51Tgjz0UUmz1Jt4Vr3W/k3qyV1mdyWTKkDHnBCWSRoxi10twW0643mF
	9KVTZuNUp8MK28Z6t07KYq77wMmVPr5jcl71eaNPzUY1qQyobzSrf+DD+KMUzaFBpuRlNbs9U4W
	2UJin43e
X-Received: by 2002:a05:7301:c017:b0:36a:31b2:8643 with SMTP id 5a478bee46e88-37967dd4caamr165614eec.38.1794513538320;
        Thu, 12 Nov 2026 11:58:58 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f02ff0sm632902eec.16.2026.11.12.11.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 11:58:57 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: macro@orcam.me.uk,
	Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] MIPS: SiByte: Fix missing function prototypes
Date: Thu, 12 Nov 2026 11:57:39 -0800
Message-ID: <20261112195824.298915-1-f.fainelli@gmail.com>
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
 arch/mips/include/asm/sibyte/sb1250.h  | 17 +++++++++++++++++
 arch/mips/mm/cerr-sb1.c                |  2 --
 arch/mips/mm/tlbex.c                   |  3 +--
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
 14 files changed, 46 insertions(+), 41 deletions(-)
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
index 69ea54bdc0c3..6c7d2117141d 100644
--- a/arch/mips/mm/tlbex.c
+++ b/arch/mips/mm/tlbex.c
@@ -37,6 +37,7 @@
 #include <asm/regdef.h>
 #include <asm/uasm.h>
 #include <asm/setup.h>
+#include <asm/sibyte/sb1250.h>
 #include <asm/tlbex.h>
 
 static int mips_xpa_disabled;
@@ -84,8 +85,6 @@ static inline int r4k_250MHZhwbug(void)
 	return 0;
 }
 
-extern int sb1250_m3_workaround_needed(void);
-
 static inline int __maybe_unused bcm1250_m3_war(void)
 {
 	if (IS_ENABLED(CONFIG_SB1_PASS_2_WORKAROUNDS))
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

