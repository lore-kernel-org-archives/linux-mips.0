Received: from bes.se.axis.com ([195.60.68.10]:51487 "EHLO bes.se.axis.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S27014076AbaKTM3YggQj2 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 20 Nov 2014 13:29:24 +0100
From: Niklas Svensson <niklas.svensson@axis.com>
Subject: [PATCH] MIPS: mips-cm: CM regions are disabled at boot
Date: Thu, 20 Nov 2014 13:29:00 +0100
Message-ID: <1416486540-28681-1-git-send-email-niklass@axis.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <niklas.svensson@axis.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: ralf@linux-mips.org, paul.burton@imgtec.com
Cc: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Niklas Svensson <niklass@axis.com>
Message-ID: <20141120122900.dGYsngPc0nzW9oUQT5YXnFnIAaCtBVhhUINVxkvAWwA@z>

Each CM_REGION_TARGET is set to disabled at boot,
so there is no need to disable the matching
CM_GCR_REG explicitly.

Signed-off-by: Niklas Svensson <niklass@axis.com>
---
 arch/mips/kernel/mips-cm.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/mips/kernel/mips-cm.c b/arch/mips/kernel/mips-cm.c
index f76f7a0..a4bbfd9 100644
--- a/arch/mips/kernel/mips-cm.c
+++ b/arch/mips/kernel/mips-cm.c
@@ -104,16 +104,6 @@ int mips_cm_probe(void)
 	base_reg |= CM_GCR_BASE_CMDEFTGT_MEM;
 	write_gcr_base(base_reg);
 
-	/* disable CM regions */
-	write_gcr_reg0_base(CM_GCR_REGn_BASE_BASEADDR_MSK);
-	write_gcr_reg0_mask(CM_GCR_REGn_MASK_ADDRMASK_MSK);
-	write_gcr_reg1_base(CM_GCR_REGn_BASE_BASEADDR_MSK);
-	write_gcr_reg1_mask(CM_GCR_REGn_MASK_ADDRMASK_MSK);
-	write_gcr_reg2_base(CM_GCR_REGn_BASE_BASEADDR_MSK);
-	write_gcr_reg2_mask(CM_GCR_REGn_MASK_ADDRMASK_MSK);
-	write_gcr_reg3_base(CM_GCR_REGn_BASE_BASEADDR_MSK);
-	write_gcr_reg3_mask(CM_GCR_REGn_MASK_ADDRMASK_MSK);
-
 	/* probe for an L2-only sync region */
 	mips_cm_probe_l2sync();
 
-- 
2.1.3
