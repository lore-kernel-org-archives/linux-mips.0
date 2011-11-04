Received: from smtp4-g21.free.fr ([212.27.42.4]:60203 "EHLO smtp4-g21.free.fr"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S1904133Ab1KDSst (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 4 Nov 2011 19:48:49 +0100
From: Maxime Bizon <mbizon@freebox.fr>
Subject: [PATCH v2 04/11] MIPS: BCM63XX: introduce bcm_readll & bcm_writell.
Date: Fri,  4 Nov 2011 19:09:28 +0100
Message-ID: <1320430175-13725-5-git-send-email-mbizon@freebox.fr>
In-Reply-To: <1320430175-13725-1-git-send-email-mbizon@freebox.fr>
References: <1320430175-13725-1-git-send-email-mbizon@freebox.fr>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: ralf@linux-mips.orgralf@linux-mips.org
Cc: Maxime Bizon <mbizon@freebox.fr>, linux-mips@linux-mips.org
Message-ID: <20111104180928.yVJCI8eMzqq_YO1wZi32LlCeqXJ6IrV1oHf6DhbYPZ0@z>

Needed for upcoming 6368 CPU support.

Signed-off-by: Maxime Bizon <mbizon@freebox.fr>
---
 arch/mips/include/asm/mach-bcm63xx/bcm63xx_io.h |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/mips/include/asm/mach-bcm63xx/bcm63xx_io.h b/arch/mips/include/asm/mach-bcm63xx/bcm63xx_io.h
index 91180fa..8bf4a67 100644
--- a/arch/mips/include/asm/mach-bcm63xx/bcm63xx_io.h
+++ b/arch/mips/include/asm/mach-bcm63xx/bcm63xx_io.h
@@ -49,9 +49,11 @@
 #define bcm_readb(a)	(*(volatile unsigned char *)	BCM_REGS_VA(a))
 #define bcm_readw(a)	(*(volatile unsigned short *)	BCM_REGS_VA(a))
 #define bcm_readl(a)	(*(volatile unsigned int *)	BCM_REGS_VA(a))
+#define bcm_readll(a)	(*(volatile u64 *)		BCM_REGS_VA(a))
 #define bcm_writeb(v, a) (*(volatile unsigned char *) BCM_REGS_VA((a)) = (v))
 #define bcm_writew(v, a) (*(volatile unsigned short *) BCM_REGS_VA((a)) = (v))
 #define bcm_writel(v, a) (*(volatile unsigned int *) BCM_REGS_VA((a)) = (v))
+#define bcm_writell(v, a) (*(volatile u64 *) BCM_REGS_VA((a)) = (v))
 
 /*
  * IO helpers to access register set for current CPU
-- 
1.7.1.1
