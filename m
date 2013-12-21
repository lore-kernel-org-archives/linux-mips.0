Received: from mail-gw1-out.broadcom.com ([216.31.210.62]:23520 "EHLO
        mail-gw1-out.broadcom.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6823991Ab3LULK5WUENd (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 21 Dec 2013 12:10:57 +0100
From: Jayachandran C <jchandra@broadcom.com>
Subject: [PATCH 08/18] MIPS: Netlogic: Identify XLP 9XX chip
Date: Sat, 21 Dec 2013 16:52:20 +0530
Message-ID: <1387624950-31297-9-git-send-email-jchandra@broadcom.com>
In-Reply-To: <1387624950-31297-1-git-send-email-jchandra@broadcom.com>
References: <1387624950-31297-1-git-send-email-jchandra@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <jchandra@broadcom.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org
Cc: Jayachandran C <jchandra@broadcom.com>, ralf@linux-mips.org
Message-ID: <20131221112220.GObgTWxm2rufTMwKEwgR3eSn9dj31s8Zan755bd0PlU@z>

Adds processor ID of XLP 9XX to asm/cpu.h.  Update netlogic/xlp-hal/xlp.h
to add cpu_is_xlp9xx() and to update cpu_is_xlpii() to support XLP 9XX.

Signed-off-by: Jayachandran C <jchandra@broadcom.com>
---
 arch/mips/include/asm/cpu.h                  |    1 +
 arch/mips/include/asm/netlogic/xlp-hal/xlp.h |    9 ++++++++-
 arch/mips/kernel/cpu-probe.c                 |    1 +
 arch/mips/netlogic/xlp/setup.c               |    1 +
 4 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
index d2035e1..40727e2 100644
--- a/arch/mips/include/asm/cpu.h
+++ b/arch/mips/include/asm/cpu.h
@@ -194,6 +194,7 @@
 #define PRID_IMP_NETLOGIC_XLP8XX	0x1000
 #define PRID_IMP_NETLOGIC_XLP3XX	0x1100
 #define PRID_IMP_NETLOGIC_XLP2XX	0x1200
+#define PRID_IMP_NETLOGIC_XLP9XX	0x1500
 
 /*
  * Particular Revision values for bits 7:0 of the PRId register.
diff --git a/arch/mips/include/asm/netlogic/xlp-hal/xlp.h b/arch/mips/include/asm/netlogic/xlp-hal/xlp.h
index e62e7be..9ccdb7d 100644
--- a/arch/mips/include/asm/netlogic/xlp-hal/xlp.h
+++ b/arch/mips/include/asm/netlogic/xlp-hal/xlp.h
@@ -92,8 +92,15 @@ static inline int cpu_is_xlpii(void)
 {
 	int chip = read_c0_prid() & 0xff00;
 
-	return chip == PRID_IMP_NETLOGIC_XLP2XX;
+	return chip == PRID_IMP_NETLOGIC_XLP2XX ||
+		chip == PRID_IMP_NETLOGIC_XLP9XX;
 }
 
+static inline int cpu_is_xlp9xx(void)
+{
+	int chip = read_c0_prid() & 0xff00;
+
+	return chip == PRID_IMP_NETLOGIC_XLP9XX;
+}
 #endif /* !__ASSEMBLY__ */
 #endif /* _ASM_NLM_XLP_H */
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index c814287..7adffbf 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -943,6 +943,7 @@ static inline void cpu_probe_netlogic(struct cpuinfo_mips *c, int cpu)
 
 	switch (c->processor_id & PRID_IMP_MASK) {
 	case PRID_IMP_NETLOGIC_XLP2XX:
+	case PRID_IMP_NETLOGIC_XLP9XX:
 		c->cputype = CPU_XLP;
 		__cpu_name[cpu] = "Broadcom XLPII";
 		break;
diff --git a/arch/mips/netlogic/xlp/setup.c b/arch/mips/netlogic/xlp/setup.c
index a31296f..d1057bd 100644
--- a/arch/mips/netlogic/xlp/setup.c
+++ b/arch/mips/netlogic/xlp/setup.c
@@ -119,6 +119,7 @@ void __init plat_mem_setup(void)
 const char *get_system_type(void)
 {
 	switch (read_c0_prid() & 0xff00) {
+	case PRID_IMP_NETLOGIC_XLP9XX:
 	case PRID_IMP_NETLOGIC_XLP2XX:
 		return "Broadcom XLPII Series";
 	default:
-- 
1.7.9.5
