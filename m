Received: from mailapp01.imgtec.com ([195.89.28.114]:36206 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6816199AbaB1UAsP99El (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 28 Feb 2014 21:00:48 +0100
From: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
Subject: [PATCH 1/3] MIPS: APRP: Fix the linking of rtlx interrupt hook
Date: Fri, 28 Feb 2014 10:23:01 -0800
Message-ID: <1393611783-7037-2-git-send-email-dengcheng.zhu@imgtec.com>
In-Reply-To: <1393611783-7037-1-git-send-email-dengcheng.zhu@imgtec.com>
References: <1393611783-7037-1-git-send-email-dengcheng.zhu@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <DengCheng.Zhu@imgtec.com>
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
Cc: john@phrozen.org, ralf@linux-mips.org, Steven.Hill@imgtec.com, Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
Message-ID: <20140228182301.OSoS7ZSAZcfx2Kyr34Tif-NxtbM9ZNl6BGVdSw9v8gc@z>

From: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>

There are 2 errors with the existing aprp_hook linking:
- The prefix CONFIG_ is missing;
- The hook should be linked exclusively in the cases of MT and CMP.

This patch fixes them.

Reviewed-by: Steven J. Hill <Steven.Hill@imgtec.com>
Signed-off-by: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
---
 arch/mips/mti-malta/malta-int.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/mti-malta/malta-int.c b/arch/mips/mti-malta/malta-int.c
index ca3e3a4..2242181 100644
--- a/arch/mips/mti-malta/malta-int.c
+++ b/arch/mips/mti-malta/malta-int.c
@@ -119,7 +119,7 @@ static void malta_hw0_irqdispatch(void)
 
 	do_IRQ(MALTA_INT_BASE + irq);
 
-#ifdef MIPS_VPE_APSP_API
+#ifdef CONFIG_MIPS_VPE_APSP_API_MT
 	if (aprp_hook)
 		aprp_hook();
 #endif
@@ -310,7 +310,7 @@ static void ipi_call_dispatch(void)
 
 static irqreturn_t ipi_resched_interrupt(int irq, void *dev_id)
 {
-#ifdef MIPS_VPE_APSP_API
+#ifdef CONFIG_MIPS_VPE_APSP_API_CMP
 	if (aprp_hook)
 		aprp_hook();
 #endif
-- 
1.8.5.3
