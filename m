Received: from mailapp01.imgtec.com ([195.59.15.196]:11662 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27025947AbbDUOvcJLNCm (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 21 Apr 2015 16:51:32 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH v3 14/37] MIPS: JZ4740: drop intc debugfs code
Date: Tue, 21 Apr 2015 15:46:41 +0100
Message-ID: <1429627624-30525-15-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1429627624-30525-1-git-send-email-paul.burton@imgtec.com>
References: <1429627624-30525-1-git-send-email-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>, Lars-Peter Clausen <lars@metafoo.de>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>
Message-ID: <20150421144641.ITYQ5va4rMIg0QOsl_NOys2vJkE7dxk7EUTZIRaqBeA@z>

The debugfs code becomes a nuisance when attempting to avoid globals,
since the interrupt controller probe function run too early for it to be
safe to create the debugfs files. Drop it.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Jason Cooper <jason@lakedaemon.net>
---
I recognise this one may be controversial. Please shout if you care
about this debugfs code!

Changes in v3:
  - New patch.
---
 arch/mips/jz4740/irq.c | 42 ------------------------------------------
 1 file changed, 42 deletions(-)

diff --git a/arch/mips/jz4740/irq.c b/arch/mips/jz4740/irq.c
index ddcf78a..615eaa8 100644
--- a/arch/mips/jz4740/irq.c
+++ b/arch/mips/jz4740/irq.c
@@ -23,9 +23,6 @@
 #include <linux/slab.h>
 #include <linux/delay.h>
 
-#include <linux/debugfs.h>
-#include <linux/seq_file.h>
-
 #include <asm/io.h>
 
 #include <asm/mach-jz4740/base.h>
@@ -123,42 +120,3 @@ static int __init jz4740_intc_of_init(struct device_node *node,
 	return 0;
 }
 IRQCHIP_DECLARE(jz4740_intc, "ingenic,jz4740-intc", jz4740_intc_of_init);
-
-#ifdef CONFIG_DEBUG_FS
-
-static inline void intc_seq_reg(struct seq_file *s, const char *name,
-	unsigned int reg)
-{
-	seq_printf(s, "%s:\t\t%08x\n", name, readl(jz_intc_base + reg));
-}
-
-static int intc_regs_show(struct seq_file *s, void *unused)
-{
-	intc_seq_reg(s, "Status", JZ_REG_INTC_STATUS);
-	intc_seq_reg(s, "Mask", JZ_REG_INTC_MASK);
-	intc_seq_reg(s, "Pending", JZ_REG_INTC_PENDING);
-
-	return 0;
-}
-
-static int intc_regs_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, intc_regs_show, NULL);
-}
-
-static const struct file_operations intc_regs_operations = {
-	.open		= intc_regs_open,
-	.read		= seq_read,
-	.llseek		= seq_lseek,
-	.release	= single_release,
-};
-
-static int __init intc_debugfs_init(void)
-{
-	(void) debugfs_create_file("jz_regs_intc", S_IFREG | S_IRUGO,
-				NULL, NULL, &intc_regs_operations);
-	return 0;
-}
-subsys_initcall(intc_debugfs_init);
-
-#endif
-- 
2.3.5
