Received: from mailapp01.imgtec.com ([195.59.15.196]:43893 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27013503AbbEXPVPjbMa5 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 24 May 2015 17:21:15 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH v5 17/37] MIPS: JZ4740: define IRQ numbers based on number of intc IRQs
Date: Sun, 24 May 2015 16:11:27 +0100
Message-ID: <1432480307-23789-18-git-send-email-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>, Lars-Peter Clausen <lars@metafoo.de>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org
Message-ID: <20150524151127.mEwnPpdp11MsV1vUxzoIV6Ngt5FBdpgWIEF_fMtAL9I@z>

For interrupts numbered after those of the interrupt controller, define
their numbers based upon the number of interrupts provided by the SoC
interrupt controller. This is in preparation for supporting newer
Ingenic SoCs which provide more interrupts.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Jason Cooper <jason@lakedaemon.net>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---

Changes in v5: None
Changes in v4: None
Changes in v3:
- Rebase.

Changes in v2: None

 arch/mips/include/asm/mach-jz4740/irq.h | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/mips/include/asm/mach-jz4740/irq.h b/arch/mips/include/asm/mach-jz4740/irq.h
index df50736..b218f76 100644
--- a/arch/mips/include/asm/mach-jz4740/irq.h
+++ b/arch/mips/include/asm/mach-jz4740/irq.h
@@ -19,6 +19,10 @@
 #define MIPS_CPU_IRQ_BASE 0
 #define JZ4740_IRQ_BASE 8
 
+#ifdef CONFIG_MACH_JZ4740
+# define NR_INTC_IRQS	32
+#endif
+
 /* 1st-level interrupts */
 #define JZ4740_IRQ(x)		(JZ4740_IRQ_BASE + (x))
 #define JZ4740_IRQ_I2C		JZ4740_IRQ(1)
@@ -45,12 +49,12 @@
 #define JZ4740_IRQ_LCD		JZ4740_IRQ(30)
 
 /* 2nd-level interrupts */
-#define JZ4740_IRQ_DMA(x)	(JZ4740_IRQ(32) + (x))
+#define JZ4740_IRQ_DMA(x)	(JZ4740_IRQ(NR_INTC_IRQS) + (x))
 
 #define JZ4740_IRQ_INTC_GPIO(x) (JZ4740_IRQ_GPIO0 - (x))
-#define JZ4740_IRQ_GPIO(x)	(JZ4740_IRQ(48) + (x))
+#define JZ4740_IRQ_GPIO(x)	(JZ4740_IRQ(NR_INTC_IRQS + 16) + (x))
 
-#define JZ4740_IRQ_ADC_BASE	JZ4740_IRQ(176)
+#define JZ4740_IRQ_ADC_BASE	JZ4740_IRQ(NR_INTC_IRQS + 144)
 
 #define NR_IRQS (JZ4740_IRQ_ADC_BASE + 6)
 
-- 
2.4.1
