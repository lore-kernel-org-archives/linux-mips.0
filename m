Received: from mail-wr0-x243.google.com ([IPv6:2a00:1450:400c:c0c::243]:35437
        "EHLO mail-wr0-x243.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23991512AbdFERKs0UoFK (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 5 Jun 2017 19:10:48 +0200
From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH] MIPS: Make individual platforms select ARCH_MIGHT_HAVE_PC_SERIO
Date: Mon,  5 Jun 2017 10:10:32 -0700
Message-ID: <20170605171033.15008-1-f.fainelli@gmail.com>
Return-Path: <f.fainelli@gmail.com>
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
Cc: msalter@redhat.com, dmitry.torokhov@gmail.com, Florian Fainelli <f.fainelli@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, open list <linux-kernel@vger.kernel.org>
Message-ID: <20170605171032.4yevKGIIMtWsn3vmjvzQmY2wWn6mikk1ghFCQd07O0Y@z>

Out of the many MIPS platforms only 3 appear to be actually using an
I8042 keyboard controller: SGI, JAZZ and LOOGSON64, remove
ARCH_MIGHT_HAVE_PC_SERIO from the top-level MIPS Kconfig symbol and move
it down to those platforms that need it.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/mips/Kconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 0b15978c0f88..c96547cdca61 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -7,7 +7,6 @@ config MIPS
 	select ARCH_HAS_ELF_RANDOMIZE
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_MIGHT_HAVE_PC_PARPORT
-	select ARCH_MIGHT_HAVE_PC_SERIO
 	select ARCH_SUPPORTS_UPROBES
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_CMPXCHG_LOCKREF if 64BIT
@@ -347,6 +346,7 @@ config MACH_JAZZ
 	select I8253
 	select I8259
 	select ISA
+	select ARCH_MIGHT_HAVE_PC_SERIO
 	select SYS_HAS_CPU_R4X00
 	select SYS_SUPPORTS_32BIT_KERNEL
 	select SYS_SUPPORTS_64BIT_KERNEL
@@ -423,6 +423,7 @@ config MACH_LOONGSON32
 
 config MACH_LOONGSON64
 	bool "Loongson-2/3 family of machines"
+	select ARCH_MIGHT_HAVE_PC_SERIO
 	select SYS_SUPPORTS_ZBOOT
 	help
 	  This enables the support of Loongson-2/3 family of machines.
@@ -1294,6 +1295,7 @@ config SGI_HAS_ZILOG
 	bool
 
 config SGI_HAS_I8042
+	select ARCH_MIGHT_HAVE_PC_SERIO
 	bool
 
 config DEFAULT_SGI_PARTITION
-- 
2.9.3
