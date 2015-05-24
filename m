Received: from mailapp01.imgtec.com ([195.59.15.196]:10531 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27006775AbbEXPQYGYile (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 24 May 2015 17:16:24 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH v5 03/37] MIPS: JZ4740: introduce CONFIG_MACH_INGENIC
Date: Sun, 24 May 2015 16:11:13 +0100
Message-ID: <1432480307-23789-4-git-send-email-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@chromium.org>
Message-ID: <20150524151113.sI6bvYXfjOESBc4KhlV4cU5wJ0FmuLKMzhUl5FLxHrw@z>

In preparation for supporting Ingenic SoCs other than the JZ4740,
introduce MACH_INGENIC to Kconfig & move MACH_JZ4740 to a separate
entry selected by the board when appropriate. This allows MACH_INGENIC
to be used to enable things generic across Ingenic SoCs.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---

Changes in v5: None
Changes in v4: None
Changes in v3:
- New patch

Changes in v2: None

 arch/mips/Kconfig                   | 5 ++---
 arch/mips/configs/qi_lb60_defconfig | 2 +-
 arch/mips/jz4740/Kconfig            | 7 ++++++-
 arch/mips/jz4740/Platform           | 8 ++++----
 4 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index f501665..4a3acca 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -288,9 +288,8 @@ config MACH_JAZZ
 	 Members include the Acer PICA, MIPS Magnum 4000, MIPS Millennium and
 	 Olivetti M700-10 workstations.
 
-config MACH_JZ4740
-	bool "Ingenic JZ4740 based machines"
-	select SYS_HAS_CPU_MIPS32_R1
+config MACH_INGENIC
+	bool "Ingenic SoC based machines"
 	select SYS_SUPPORTS_32BIT_KERNEL
 	select SYS_SUPPORTS_LITTLE_ENDIAN
 	select SYS_SUPPORTS_ZBOOT_UART16550
diff --git a/arch/mips/configs/qi_lb60_defconfig b/arch/mips/configs/qi_lb60_defconfig
index 2b96547..1139b89 100644
--- a/arch/mips/configs/qi_lb60_defconfig
+++ b/arch/mips/configs/qi_lb60_defconfig
@@ -1,4 +1,4 @@
-CONFIG_MACH_JZ4740=y
+CONFIG_MACH_INGENIC=y
 # CONFIG_COMPACTION is not set
 # CONFIG_CROSS_MEMORY_ATTACH is not set
 CONFIG_HZ_100=y
diff --git a/arch/mips/jz4740/Kconfig b/arch/mips/jz4740/Kconfig
index 4689030..dff0966 100644
--- a/arch/mips/jz4740/Kconfig
+++ b/arch/mips/jz4740/Kconfig
@@ -1,9 +1,14 @@
 choice
 	prompt "Machine type"
-	depends on MACH_JZ4740
+	depends on MACH_INGENIC
 	default JZ4740_QI_LB60
 
 config JZ4740_QI_LB60
 	bool "Qi Hardware Ben NanoNote"
+	select MACH_JZ4740
 
 endchoice
+
+config MACH_JZ4740
+	bool
+	select SYS_HAS_CPU_MIPS32_R1
diff --git a/arch/mips/jz4740/Platform b/arch/mips/jz4740/Platform
index c41d300..28448d3 100644
--- a/arch/mips/jz4740/Platform
+++ b/arch/mips/jz4740/Platform
@@ -1,4 +1,4 @@
-platform-$(CONFIG_MACH_JZ4740)	+= jz4740/
-cflags-$(CONFIG_MACH_JZ4740)	+= -I$(srctree)/arch/mips/include/asm/mach-jz4740
-load-$(CONFIG_MACH_JZ4740)	+= 0xffffffff80010000
-zload-$(CONFIG_MACH_JZ4740)	+= 0xffffffff80600000
+platform-$(CONFIG_MACH_INGENIC)	+= jz4740/
+cflags-$(CONFIG_MACH_INGENIC)	+= -I$(srctree)/arch/mips/include/asm/mach-jz4740
+load-$(CONFIG_MACH_INGENIC)	+= 0xffffffff80010000
+zload-$(CONFIG_MACH_INGENIC)	+= 0xffffffff80600000
-- 
2.4.1
