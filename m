Received: from mail-gw2-out.broadcom.com ([216.31.210.63]:29457 "EHLO
        mail-gw2-out.broadcom.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6843088AbaD2OcBzHrQi (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 29 Apr 2014 16:32:01 +0200
From: Jayachandran C <jchandra@broadcom.com>
Subject: [PATCH 10/17] MIPS: Netlogic: Use PRID_IMP_MASK macro
Date: Tue, 29 Apr 2014 20:07:49 +0530
Message-ID: <ce4b87b8fccd93c350a803e9737d646e53c2c8c4.1398780013.git.jchandra@broadcom.com>
In-Reply-To: <cover.1398780013.git.jchandra@broadcom.com>
References: <cover.1398780013.git.jchandra@broadcom.com>
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
Message-ID: <20140429143749.bNup8PGc2DPBBFg-CKQ6HsXw-4oV3g9fBNr_QtBf1fI@z>

Use PRID_IMP_MASK macro instead of 0xff00 to extract the processor
type.

Signed-off-by: Jayachandran C <jchandra@broadcom.com>
---
 arch/mips/include/asm/netlogic/mips-extns.h  |    4 ++--
 arch/mips/include/asm/netlogic/xlp-hal/xlp.h |    4 ++--
 arch/mips/netlogic/common/reset.S            |    5 +++--
 arch/mips/netlogic/xlp/dt.c                  |    2 +-
 arch/mips/netlogic/xlp/setup.c               |    2 +-
 arch/mips/netlogic/xlp/wakeup.c              |    2 +-
 6 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/arch/mips/include/asm/netlogic/mips-extns.h b/arch/mips/include/asm/netlogic/mips-extns.h
index de9aada..38af905 100644
--- a/arch/mips/include/asm/netlogic/mips-extns.h
+++ b/arch/mips/include/asm/netlogic/mips-extns.h
@@ -146,9 +146,9 @@ static inline int hard_smp_processor_id(void)
 
 static inline int nlm_nodeid(void)
 {
-	uint32_t prid = read_c0_prid();
+	uint32_t prid = read_c0_prid() & PRID_IMP_MASK;
 
-	if ((prid & 0xff00) == PRID_IMP_NETLOGIC_XLP9XX)
+	if (prid == PRID_IMP_NETLOGIC_XLP9XX)
 		return (__read_32bit_c0_register($15, 1) >> 7) & 0x7;
 	else
 		return (__read_32bit_c0_register($15, 1) >> 5) & 0x3;
diff --git a/arch/mips/include/asm/netlogic/xlp-hal/xlp.h b/arch/mips/include/asm/netlogic/xlp-hal/xlp.h
index 488863e..f75014c 100644
--- a/arch/mips/include/asm/netlogic/xlp-hal/xlp.h
+++ b/arch/mips/include/asm/netlogic/xlp-hal/xlp.h
@@ -99,7 +99,7 @@ void *xlp_dt_init(void *fdtp);
 
 static inline int cpu_is_xlpii(void)
 {
-	int chip = read_c0_prid() & 0xff00;
+	int chip = read_c0_prid() & PRID_IMP_MASK;
 
 	return chip == PRID_IMP_NETLOGIC_XLP2XX ||
 		chip == PRID_IMP_NETLOGIC_XLP9XX;
@@ -107,7 +107,7 @@ static inline int cpu_is_xlpii(void)
 
 static inline int cpu_is_xlp9xx(void)
 {
-	int chip = read_c0_prid() & 0xff00;
+	int chip = read_c0_prid() & PRID_IMP_MASK;
 
 	return chip == PRID_IMP_NETLOGIC_XLP9XX;
 }
diff --git a/arch/mips/netlogic/common/reset.S b/arch/mips/netlogic/common/reset.S
index 13c1bc5..5b60b46 100644
--- a/arch/mips/netlogic/common/reset.S
+++ b/arch/mips/netlogic/common/reset.S
@@ -35,6 +35,7 @@
 
 #include <asm/asm.h>
 #include <asm/asm-offsets.h>
+#include <asm/cpu.h>
 #include <asm/cacheops.h>
 #include <asm/regdef.h>
 #include <asm/mipsregs.h>
@@ -92,7 +93,7 @@
  */
 .macro	xlp_flush_l1_dcache
 	mfc0	t0, CP0_EBASE, 0
-	andi	t0, t0, 0xff00
+	andi	t0, t0, PRID_IMP_MASK
 	slt	t1, t0, 0x1200
 	beqz	t1, 15f
 	nop
@@ -171,7 +172,7 @@ FEXPORT(nlm_reset_entry)
 
 1:	/* Entry point on core wakeup */
 	mfc0	t0, CP0_EBASE, 0	/* processor ID */
-	andi	t0, 0xff00
+	andi	t0, PRID_IMP_MASK
 	li	t1, 0x1500		/* XLP 9xx */
 	beq	t0, t1, 2f		/* does not need to set coherent */
 	nop
diff --git a/arch/mips/netlogic/xlp/dt.c b/arch/mips/netlogic/xlp/dt.c
index 5754097..0b36ac8 100644
--- a/arch/mips/netlogic/xlp/dt.c
+++ b/arch/mips/netlogic/xlp/dt.c
@@ -48,7 +48,7 @@ static void *xlp_fdt_blob;
 void __init *xlp_dt_init(void *fdtp)
 {
 	if (!fdtp) {
-		switch (current_cpu_data.processor_id & 0xff00) {
+		switch (current_cpu_data.processor_id & PRID_IMP_MASK) {
 #ifdef CONFIG_DT_XLP_GVP
 		case PRID_IMP_NETLOGIC_XLP9XX:
 			fdtp = __dtb_xlp_gvp_begin;
diff --git a/arch/mips/netlogic/xlp/setup.c b/arch/mips/netlogic/xlp/setup.c
index d1c9e88..3455e9f 100644
--- a/arch/mips/netlogic/xlp/setup.c
+++ b/arch/mips/netlogic/xlp/setup.c
@@ -121,7 +121,7 @@ void __init plat_mem_setup(void)
 
 const char *get_system_type(void)
 {
-	switch (read_c0_prid() & 0xff00) {
+	switch (read_c0_prid() & PRID_IMP_MASK) {
 	case PRID_IMP_NETLOGIC_XLP9XX:
 	case PRID_IMP_NETLOGIC_XLP2XX:
 		return "Broadcom XLPII Series";
diff --git a/arch/mips/netlogic/xlp/wakeup.c b/arch/mips/netlogic/xlp/wakeup.c
index 7589238..f4823ad 100644
--- a/arch/mips/netlogic/xlp/wakeup.c
+++ b/arch/mips/netlogic/xlp/wakeup.c
@@ -139,7 +139,7 @@ static void xlp_enable_secondary_cores(const cpumask_t *wakeup_mask)
 		} else {
 			fusemask = nlm_read_sys_reg(nodep->sysbase,
 						SYS_EFUSE_DEVICE_CFG_STATUS0);
-			switch (read_c0_prid() & 0xff00) {
+			switch (read_c0_prid() & PRID_IMP_MASK) {
 			case PRID_IMP_NETLOGIC_XLP3XX:
 				mask = 0xf;
 				break;
-- 
1.7.9.5
