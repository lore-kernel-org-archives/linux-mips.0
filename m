Received: from mail-gw2-out.broadcom.com ([216.31.210.63]:29457 "EHLO
        mail-gw2-out.broadcom.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6843072AbaD2ObzG9NCo (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 29 Apr 2014 16:31:55 +0200
From: Jayachandran C <jchandra@broadcom.com>
Subject: [PATCH 06/17] MIPS: Netlogic: Use cpumask_scnprintf for wakup_mask
Date: Tue, 29 Apr 2014 20:07:45 +0530
Message-ID: <26b70b3880094baa731bfe9b2927fd6d872b82fc.1398780013.git.jchandra@broadcom.com>
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
Message-ID: <20140429143745._WwLwSiRB-YZ_G3t7n2v2Guts3QS0DCfpfcxZvD26Pk@z>

Use standard function to print cpumask. Also fixup a typo in the same
file.

Signed-off-by: Jayachandran C <jchandra@broadcom.com>
---
 arch/mips/netlogic/common/smp.c |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/mips/netlogic/common/smp.c b/arch/mips/netlogic/common/smp.c
index 6baae15..b93c5d4 100644
--- a/arch/mips/netlogic/common/smp.c
+++ b/arch/mips/netlogic/common/smp.c
@@ -198,7 +198,7 @@ void __init nlm_smp_setup(void)
 	cpumask_scnprintf(buf, ARRAY_SIZE(buf), cpu_possible_mask);
 	pr_info("Possible CPU mask: %s\n", buf);
 
-	/* check with the cores we have worken up */
+	/* check with the cores we have woken up */
 	for (ncore = 0, i = 0; i < NLM_NR_NODES; i++)
 		ncore += hweight32(nlm_get_node(i)->coremask);
 
@@ -213,6 +213,7 @@ static int nlm_parse_cpumask(cpumask_t *wakeup_mask)
 {
 	uint32_t core0_thr_mask, core_thr_mask;
 	int threadmode, i, j;
+	char buf[64];
 
 	core0_thr_mask = 0;
 	for (i = 0; i < NLM_THREADS_PER_CORE; i++)
@@ -247,8 +248,8 @@ static int nlm_parse_cpumask(cpumask_t *wakeup_mask)
 	return threadmode;
 
 unsupp:
-	panic("Unsupported CPU mask %lx",
-		(unsigned long)cpumask_bits(wakeup_mask)[0]);
+	cpumask_scnprintf(buf, ARRAY_SIZE(buf), wakeup_mask);
+	panic("Unsupported CPU mask %s", buf);
 	return 0;
 }
 
-- 
1.7.9.5
