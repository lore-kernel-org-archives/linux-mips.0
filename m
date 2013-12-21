Received: from mail-gw2-out.broadcom.com ([216.31.210.63]:33332 "EHLO
        mail-gw2-out.broadcom.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6827367Ab3LULK5nLOTn (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 21 Dec 2013 12:10:57 +0100
From: Jayachandran C <jchandra@broadcom.com>
Subject: [PATCH 06/18] MIPS: Netlogic: Get coremask from FUSE register
Date: Sat, 21 Dec 2013 16:52:18 +0530
Message-ID: <1387624950-31297-7-git-send-email-jchandra@broadcom.com>
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
Message-ID: <20131221112218.PblAP6hvhDuxYG3J4E-QiThlzWpDu1Wbp-KEVxoDXZQ@z>

Use the FUSE register to get the list of active cores in the CPU
instead of using the CPU reset register, this is the recommended
method.

Also add code to mask the coremask with the default number of cores
for each processor series.

Signed-off-by: Jayachandran C <jchandra@broadcom.com>
---
 arch/mips/netlogic/xlp/wakeup.c |   29 ++++++++++++++++++++++++-----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/arch/mips/netlogic/xlp/wakeup.c b/arch/mips/netlogic/xlp/wakeup.c
index 682d563..e6f77c0 100644
--- a/arch/mips/netlogic/xlp/wakeup.c
+++ b/arch/mips/netlogic/xlp/wakeup.c
@@ -99,7 +99,7 @@ static void xlp_enable_secondary_cores(const cpumask_t *wakeup_mask)
 {
 	struct nlm_soc_info *nodep;
 	uint64_t syspcibase;
-	uint32_t syscoremask;
+	uint32_t syscoremask, mask, fusemask;
 	int core, n, cpu;
 
 	for (n = 0; n < NLM_NR_NODES; n++) {
@@ -111,12 +111,31 @@ static void xlp_enable_secondary_cores(const cpumask_t *wakeup_mask)
 		if (n != 0)
 			nlm_node_init(n);
 		nodep = nlm_get_node(n);
-		syscoremask = nlm_read_sys_reg(nodep->sysbase, SYS_CPU_RESET);
+
+		fusemask = nlm_read_sys_reg(nodep->sysbase,
+					SYS_EFUSE_DEVICE_CFG_STATUS0);
+		switch (read_c0_prid() & 0xff00) {
+		case PRID_IMP_NETLOGIC_XLP3XX:
+			mask = 0xf;
+			break;
+		case PRID_IMP_NETLOGIC_XLP2XX:
+			mask = 0x3;
+			break;
+		case PRID_IMP_NETLOGIC_XLP8XX:
+		default:
+			mask = 0xff;
+			break;
+		}
+
+		/*
+		 * Fused out cores are set in the fusemask, and the remaining
+		 * cores are renumbered to range 0 .. nactive-1
+		 */
+		syscoremask = (1 << hweight32(~fusemask & mask)) - 1;
+
 		/* The boot cpu */
-		if (n == 0) {
-			syscoremask |= 1;
+		if (n == 0)
 			nodep->coremask = 1;
-		}
 
 		for (core = 0; core < NLM_CORES_PER_NODE; core++) {
 			/* we will be on node 0 core 0 */
-- 
1.7.9.5
