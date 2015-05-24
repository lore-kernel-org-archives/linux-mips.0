Received: from mailapp01.imgtec.com ([195.59.15.196]:28774 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007002AbbEXPTWmD6N0 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 24 May 2015 17:19:22 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH v5 08/37] MIPS: JZ4740: use generic plat_irq_dispatch
Date: Sun, 24 May 2015 16:11:18 +0100
Message-ID: <1432480307-23789-9-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1432480307-23789-1-git-send-email-paul.burton@imgtec.com>
References: <1432480307-23789-1-git-send-email-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>, Lars-Peter Clausen <lars@metafoo.de>, Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>
Message-ID: <20150524151118.58Hk99T4MeOtk_QD-x18XMX9wMqVBBPZiId7fICbOnA@z>

Make use of the generic plat_irq_dispatch function introduced by commit
85f7cdacbb81 "MIPS: Provide a generic plat_irq_dispatch", in order to
reduce unnecessary code duplication.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---

Changes in v5: None
Changes in v4: None
Changes in v3:
- Rebase

Changes in v2: None

 arch/mips/jz4740/irq.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/mips/jz4740/irq.c b/arch/mips/jz4740/irq.c
index 3ec90875..a2452bb 100644
--- a/arch/mips/jz4740/irq.c
+++ b/arch/mips/jz4740/irq.c
@@ -27,7 +27,6 @@
 #include <linux/seq_file.h>
 
 #include <asm/io.h>
-#include <asm/mipsregs.h>
 
 #include <asm/mach-jz4740/base.h>
 #include <asm/mach-jz4740/irq.h>
@@ -111,17 +110,6 @@ void __init arch_init_irq(void)
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
2.4.1
