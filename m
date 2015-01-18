Received: from mailapp01.imgtec.com ([195.59.15.196]:10488 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010992AbbARWayK8OQq (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 18 Jan 2015 23:30:54 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 05/36] MIPS: jz4740: use generic plat_irq_dispatch
Date: Sun, 18 Jan 2015 14:27:16 -0800
Message-ID: <1421620067-23933-6-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1421620067-23933-1-git-send-email-paul.burton@imgtec.com>
References: <1421620067-23933-1-git-send-email-paul.burton@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Paul Burton <paul.burton@imgtec.com>, Lars-Peter Clausen <lars@metafoo.de>
Message-ID: <20150118222716.WvCw_ztHWzzo6eTA5O9SR9YwNsV5-93Lz8HdS43VqtI@z>

Make use of the generic plat_irq_dispatch function introduced by commit
85f7cdacbb81 "MIPS: Provide a generic plat_irq_dispatch", in order to
reduce unnecessary code duplication.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>
---
 arch/mips/jz4740/irq.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/mips/jz4740/irq.c b/arch/mips/jz4740/irq.c
index 9c94f7b..999d64b 100644
--- a/arch/mips/jz4740/irq.c
+++ b/arch/mips/jz4740/irq.c
@@ -27,7 +27,6 @@
 #include <linux/seq_file.h>
 
 #include <asm/io.h>
-#include <asm/mipsregs.h>
 
 #include <asm/mach-jz4740/base.h>
 
@@ -108,17 +107,6 @@ void __init arch_init_irq(void)
 	setup_irq(2, &jz4740_cascade_action);
 }
 
-asmlinkage void plat_irq_dispatch(void)
-{
-	unsigned int pending = read_c0_status() & read_c0_cause() & ST0_IM;
-	if (pending & STATUSF_IP2)
-		do_IRQ(2);
-	else if (pending & STATUSF_IP3)
-		do_IRQ(3);
-	else
-		spurious_interrupt();
-}
-
 #ifdef CONFIG_DEBUG_FS
 
 static inline void intc_seq_reg(struct seq_file *s, const char *name,
-- 
2.2.1
