Received: from [69.28.251.93] ([69.28.251.93]:40960 "EHLO b32.net"
        rhost-flags-FAIL-FAIL-OK-OK) by eddie.linux-mips.org with ESMTP
        id S1491177Ab0JQSGB (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Sun, 17 Oct 2010 20:06:01 +0200
From: Kevin Cernekee <cernekee@gmail.com>
Subject: [PATCH v2 2/9] MIPS: Add BMIPS processor types to Kconfig
Date: Sun, 17 Oct 2010 10:56:53 -0700
Message-ID: <584a8c475b66c7ccdd112fb6afda8491@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Return-Path: <cernekee@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Ralf Baechle <ralf@linux-mips.org>
Cc: ffainelli@freebox.fr, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20101017175653.9AlqelEHFHzMhmrOkpeTdpCFKYJ-MlbVjCQLACluABc@z>

[v2: add "VIPER" marketing name for BMIPS4350]

Add processor feature definitions for BMIPS3300, BMIPS4350, BMIPS4380,
and BMIPS5000.

Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
---
 arch/mips/Kconfig |   63 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 63 insertions(+), 0 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 5526faa..f161e9f 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1332,6 +1332,57 @@ config CPU_CAVIUM_OCTEON
 	  can have up to 16 Mips64v2 cores and 8 integrated gigabit ethernets.
 	  Full details can be found at http://www.caviumnetworks.com.
 
+config CPU_BMIPS3300
+	bool "BMIPS3300"
+	depends on SYS_HAS_CPU_BMIPS3300
+	select DMA_NONCOHERENT
+	select IRQ_CPU
+	select SWAP_IO_SPACE
+	select SYS_SUPPORTS_32BIT_KERNEL
+	select WEAK_ORDERING
+	help
+	  Broadcom BMIPS3300 processors.
+
+config CPU_BMIPS4350
+	bool "BMIPS4350"
+	depends on SYS_HAS_CPU_BMIPS4350
+	select CPU_SUPPORTS_32BIT_KERNEL
+	select DMA_NONCOHERENT
+	select IRQ_CPU
+	select SWAP_IO_SPACE
+	select SYS_SUPPORTS_SMP
+	select SYS_SUPPORTS_HOTPLUG_CPU
+	select WEAK_ORDERING
+	help
+	  Broadcom BMIPS4350 ("VIPER") processors.
+
+config CPU_BMIPS4380
+	bool "BMIPS4380"
+	depends on SYS_HAS_CPU_BMIPS4380
+	select CPU_SUPPORTS_32BIT_KERNEL
+	select DMA_NONCOHERENT
+	select IRQ_CPU
+	select SWAP_IO_SPACE
+	select SYS_SUPPORTS_SMP
+	select SYS_SUPPORTS_HOTPLUG_CPU
+	select WEAK_ORDERING
+	help
+	  Broadcom BMIPS4380 processors.
+
+config CPU_BMIPS5000
+	bool "BMIPS5000"
+	depends on SYS_HAS_CPU_BMIPS5000
+	select CPU_SUPPORTS_32BIT_KERNEL
+	select CPU_SUPPORTS_HIGHMEM
+	select DMA_NONCOHERENT
+	select IRQ_CPU
+	select SWAP_IO_SPACE
+	select SYS_SUPPORTS_SMP
+	select SYS_SUPPORTS_HOTPLUG_CPU
+	select WEAK_ORDERING
+	help
+	  Broadcom BMIPS5000 processors.
+
 endchoice
 
 if CPU_LOONGSON2F
@@ -1450,6 +1501,18 @@ config SYS_HAS_CPU_SB1
 config SYS_HAS_CPU_CAVIUM_OCTEON
 	bool
 
+config SYS_HAS_CPU_BMIPS3300
+	bool
+
+config SYS_HAS_CPU_BMIPS4350
+	bool
+
+config SYS_HAS_CPU_BMIPS4380
+	bool
+
+config SYS_HAS_CPU_BMIPS5000
+	bool
+
 #
 # CPU may reorder R->R, R->W, W->R, W->W
 # Reordering beyond LL and SC is handled in WEAK_REORDERING_BEYOND_LLSC
-- 
1.7.0.4
