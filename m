Received: from mailapp01.imgtec.com ([195.59.15.196]:28217 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007002AbbEXPRuRqnrd (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 24 May 2015 17:17:50 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH v5 07/37] MIPS: JZ4740: probe CPU interrupt controller via DT
Date: Sun, 24 May 2015 16:11:17 +0100
Message-ID: <1432480307-23789-8-git-send-email-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lars-Peter Clausen <lars@metafoo.de>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>
Message-ID: <20150524151117.VOqu9Y8UDS88oAVAyxMR0wAEp5mNiAcLAPrELAJ6SyM@z>

Use the generic irqchip_init function to probe irqchip drivers using DT,
and add the appropriate node to the JZ4740 devicetree in place of the
call to mips_cpu_irq_init.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: Kumar Gala <galak@codeaurora.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-mips@linux-mips.org
---

Changes in v5: None
Changes in v4: None
Changes in v3:
- Rebase.

Changes in v2: None

 arch/mips/boot/dts/ingenic/jz4740.dtsi | 7 +++++++
 arch/mips/jz4740/irq.c                 | 4 ++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/mips/boot/dts/ingenic/jz4740.dtsi b/arch/mips/boot/dts/ingenic/jz4740.dtsi
index c538691f..2d64765c 100644
--- a/arch/mips/boot/dts/ingenic/jz4740.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4740.dtsi
@@ -2,4 +2,11 @@
 	#address-cells = <1>;
 	#size-cells = <1>;
 	compatible = "ingenic,jz4740";
+
+	cpuintc: cpuintc@0 {
+		#address-cells = <0>;
+		#interrupt-cells = <1>;
+		interrupt-controller;
+		compatible = "mti,cpu-interrupt-controller";
+	};
 };
diff --git a/arch/mips/jz4740/irq.c b/arch/mips/jz4740/irq.c
index 97206b3..3ec90875 100644
--- a/arch/mips/jz4740/irq.c
+++ b/arch/mips/jz4740/irq.c
@@ -18,6 +18,7 @@
 #include <linux/types.h>
 #include <linux/interrupt.h>
 #include <linux/ioport.h>
+#include <linux/irqchip.h>
 #include <linux/timex.h>
 #include <linux/slab.h>
 #include <linux/delay.h>
@@ -27,7 +28,6 @@
 
 #include <asm/io.h>
 #include <asm/mipsregs.h>
-#include <asm/irq_cpu.h>
 
 #include <asm/mach-jz4740/base.h>
 #include <asm/mach-jz4740/irq.h>
@@ -84,7 +84,7 @@ void __init arch_init_irq(void)
 	struct irq_chip_generic *gc;
 	struct irq_chip_type *ct;
 
-	mips_cpu_irq_init();
+	irqchip_init();
 
 	jz_intc_base = ioremap(JZ4740_INTC_BASE_ADDR, 0x14);
 
-- 
2.4.1
