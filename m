Received: from mail-gw3-out.broadcom.com ([216.31.210.64]:2296 "EHLO
        mail-gw3-out.broadcom.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6843082AbaD2ObxqWmqy (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 29 Apr 2014 16:31:53 +0200
From: Jayachandran C <jchandra@broadcom.com>
Subject: [PATCH 03/17] MIPS: Netlogic: Move coremask setup to nlm_node_init
Date: Tue, 29 Apr 2014 20:07:42 +0530
Message-ID: <c017150e53765af02de61aae0390177226dda976.1398780013.git.jchandra@broadcom.com>
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
Message-ID: <20140429143742.4TeZ4Fdusb8BwEezTwwb8xRL36yf0FG6tbs9CYl7P8M@z>

This is needed for nlm_node_present(0) to work on uniprocessor compile.

Signed-off-by: Jayachandran C <jchandra@broadcom.com>
---
 arch/mips/netlogic/xlp/nlm_hal.c |    2 ++
 arch/mips/netlogic/xlp/wakeup.c  |    4 ----
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/mips/netlogic/xlp/nlm_hal.c b/arch/mips/netlogic/xlp/nlm_hal.c
index 997cd9e..7b277cd 100644
--- a/arch/mips/netlogic/xlp/nlm_hal.c
+++ b/arch/mips/netlogic/xlp/nlm_hal.c
@@ -54,6 +54,8 @@ void nlm_node_init(int node)
 	struct nlm_soc_info *nodep;
 
 	nodep = nlm_get_node(node);
+	if (node == 0)
+		nodep->coremask = 1;	/* node 0, boot cpu */
 	nodep->sysbase = nlm_get_sys_regbase(node);
 	nodep->picbase = nlm_get_pic_regbase(node);
 	nodep->ebase = read_c0_ebase() & (~((1 << 12) - 1));
diff --git a/arch/mips/netlogic/xlp/wakeup.c b/arch/mips/netlogic/xlp/wakeup.c
index 9a92617..7589238 100644
--- a/arch/mips/netlogic/xlp/wakeup.c
+++ b/arch/mips/netlogic/xlp/wakeup.c
@@ -159,10 +159,6 @@ static void xlp_enable_secondary_cores(const cpumask_t *wakeup_mask)
 		 */
 		syscoremask = (1 << hweight32(~fusemask & mask)) - 1;
 
-		/* The boot cpu */
-		if (n == 0)
-			nodep->coremask = 1;
-
 		pr_info("Node %d - SYS/FUSE coremask %x\n", n, syscoremask);
 		for (core = 0; core < nlm_cores_per_node(); core++) {
 			/* we will be on node 0 core 0 */
-- 
1.7.9.5
