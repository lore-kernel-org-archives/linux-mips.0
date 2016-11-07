Received: from mailapp01.imgtec.com ([195.59.15.196]:23902 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23991964AbcKGLbIIQyns (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 7 Nov 2016 12:31:08 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH] MIPS: netlogic: Exclude netlogic,xlp-pic code from XLR builds
Date: Mon, 7 Nov 2016 11:30:41 +0000
Message-ID: <20161107113042.15821-1-paul.burton@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-Path: <Paul.Burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>, Jayachandran C <jchandra@broadcom.com>
Message-ID: <20161107113041.-QqeKyIDVJlIDopNFdFfj4tHBtKFQY-OI_yRKVZ5nXY@z>

Code in arch/mips/netlogic/common/irq.c which handles the XLP PIC fails
to build in XLR configurations due to cpu_is_xlp9xx not being defined,
leading to the following build failure:

    arch/mips/netlogic/common/irq.c: In function ‘xlp_of_pic_init’:
    arch/mips/netlogic/common/irq.c:298:2: error: implicit declaration
    of function ‘cpu_is_xlp9xx’ [-Werror=implicit-function-declaration]
      if (cpu_is_xlp9xx()) {
      ^

Although the code was conditional upon CONFIG_OF which is indirectly
selected by CONFIG_NLM_XLP_BOARD but not CONFIG_NLM_XLR_BOARD, the
failing XLR with CONFIG_OF configuration can be configured manually or
by randconfig.

Fix the build failure by making the affected XLP PIC code conditional
upon CONFIG_CPU_XLP which is used to guard the inclusion of
asm/netlogic/xlp-hal/xlp.h that provides the required cpu_is_xlp9xx
function.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Jayachandran C <jchandra@broadcom.com>
---

 arch/mips/netlogic/common/irq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/netlogic/common/irq.c b/arch/mips/netlogic/common/irq.c
index 3660dc6..b04eca1 100644
--- a/arch/mips/netlogic/common/irq.c
+++ b/arch/mips/netlogic/common/irq.c
@@ -275,7 +275,7 @@ asmlinkage void plat_irq_dispatch(void)
 	do_IRQ(nlm_irq_to_xirq(node, i));
 }
 
-#ifdef CONFIG_OF
+#if defined(CONFIG_CPU_XLP) && defined(CONFIG_OF)
 static const struct irq_domain_ops xlp_pic_irq_domain_ops = {
 	.xlate = irq_domain_xlate_onetwocell,
 };
@@ -348,7 +348,7 @@ void __init arch_init_irq(void)
 #if defined(CONFIG_CPU_XLR)
 	nlm_setup_fmn_irq();
 #endif
-#if defined(CONFIG_OF)
+#if defined(CONFIG_CPU_XLP) && defined(CONFIG_OF)
 	of_irq_init(xlp_pic_irq_ids);
 #endif
 }
-- 
2.10.2
