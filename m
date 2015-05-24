Received: from mailapp01.imgtec.com ([195.59.15.196]:64620 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007004AbbEXPQtorY2c (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 24 May 2015 17:16:49 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH v5 05/37] MIPS: JZ4740: require & include DT
Date: Sun, 24 May 2015 16:11:15 +0100
Message-ID: <1432480307-23789-6-git-send-email-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lars-Peter Clausen <lars@metafoo.de>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Andrew Bresticker <abrestic@chromium.org>, linux-kernel@vger.kernel.org
Message-ID: <20150524151115.fFwGXMqiuTAZMSiPu9PTmWfhdy0jwC3AyfUgsnA-O38@z>

Require a DT for JZ4740 based systems, and add a stub one for the
qi_lb60 (Ben NanoNote) board. Devices will be migrated to being probed
via this DT over time.

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

 arch/mips/Kconfig                      |  2 ++
 arch/mips/boot/dts/Makefile            |  1 +
 arch/mips/boot/dts/ingenic/Makefile    |  9 +++++++++
 arch/mips/boot/dts/ingenic/jz4740.dtsi |  5 +++++
 arch/mips/boot/dts/ingenic/qi_lb60.dts |  7 +++++++
 arch/mips/jz4740/setup.c               | 19 +++++++++++++++++++
 6 files changed, 43 insertions(+)
 create mode 100644 arch/mips/boot/dts/ingenic/Makefile
 create mode 100644 arch/mips/boot/dts/ingenic/jz4740.dtsi
 create mode 100644 arch/mips/boot/dts/ingenic/qi_lb60.dts

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 4a3acca..741e364 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -299,6 +299,8 @@ config MACH_INGENIC
 	select SYS_HAS_EARLY_PRINTK
 	select HAVE_CLK
 	select GENERIC_IRQ_CHIP
+	select BUILTIN_DTB
+	select USE_OF
 
 config LANTIQ
 	bool "Lantiq based platforms"
diff --git a/arch/mips/boot/dts/Makefile b/arch/mips/boot/dts/Makefile
index 5d95e4b..9c31b30 100644
--- a/arch/mips/boot/dts/Makefile
+++ b/arch/mips/boot/dts/Makefile
@@ -1,5 +1,6 @@
 dts-dirs	+= brcm
 dts-dirs	+= cavium-octeon
+dts-dirs	+= ingenic
 dts-dirs	+= lantiq
 dts-dirs	+= mti
 dts-dirs	+= netlogic
diff --git a/arch/mips/boot/dts/ingenic/Makefile b/arch/mips/boot/dts/ingenic/Makefile
new file mode 100644
index 0000000..0c84f0b
--- /dev/null
+++ b/arch/mips/boot/dts/ingenic/Makefile
@@ -0,0 +1,9 @@
+dtb-$(CONFIG_JZ4740_QI_LB60)	+= qi_lb60.dtb
+
+obj-y				+= $(patsubst %.dtb, %.dtb.o, $(dtb-y))
+
+# Force kbuild to make empty built-in.o if necessary
+obj-				+= dummy.o
+
+always				:= $(dtb-y)
+clean-files			:= *.dtb *.dtb.S
diff --git a/arch/mips/boot/dts/ingenic/jz4740.dtsi b/arch/mips/boot/dts/ingenic/jz4740.dtsi
new file mode 100644
index 0000000..c538691f
--- /dev/null
+++ b/arch/mips/boot/dts/ingenic/jz4740.dtsi
@@ -0,0 +1,5 @@
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	compatible = "ingenic,jz4740";
+};
diff --git a/arch/mips/boot/dts/ingenic/qi_lb60.dts b/arch/mips/boot/dts/ingenic/qi_lb60.dts
new file mode 100644
index 0000000..0c0f639
--- /dev/null
+++ b/arch/mips/boot/dts/ingenic/qi_lb60.dts
@@ -0,0 +1,7 @@
+/dts-v1/;
+
+#include "jz4740.dtsi"
+
+/ {
+	compatible = "qi,lb60", "ingenic,jz4740";
+};
diff --git a/arch/mips/jz4740/setup.c b/arch/mips/jz4740/setup.c
index ef796f9..d6bb7a3 100644
--- a/arch/mips/jz4740/setup.c
+++ b/arch/mips/jz4740/setup.c
@@ -17,8 +17,11 @@
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/of_fdt.h>
+#include <linux/of_platform.h>
 
 #include <asm/bootinfo.h>
+#include <asm/prom.h>
 
 #include <asm/mach-jz4740/base.h>
 
@@ -53,8 +56,24 @@ void __init plat_mem_setup(void)
 {
 	jz4740_reset_init();
 	jz4740_detect_mem();
+	__dt_setup_arch(__dtb_start);
 }
 
+void __init device_tree_init(void)
+{
+	if (!initial_boot_params)
+		return;
+
+	unflatten_and_copy_device_tree();
+}
+
+static int __init populate_machine(void)
+{
+	of_platform_populate(NULL, of_default_bus_match_table, NULL, NULL);
+	return 0;
+}
+arch_initcall(populate_machine);
+
 const char *get_system_type(void)
 {
 	return "JZ4740";
-- 
2.4.1
