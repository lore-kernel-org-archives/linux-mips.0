Received: from mailapp01.imgtec.com ([195.59.15.196]:17291 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992500AbcHSRQr585tr (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 19 Aug 2016 19:16:47 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH] MIPS: Use objdump -f to find kernel entry point
Date: Fri, 19 Aug 2016 18:16:14 +0100
Message-ID: <20160819171614.28813-1-paul.burton@imgtec.com>
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
To: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@imgtec.com>
Message-ID: <20160819171614.LfOJrztfWEg6RKiOf0JyuCC5Jtc4cbwtDW5PKge8Y40@z>

When using nm to find the address of the kernel_entry symbol, the
microMIPS ISA bit is not set for microMIPS kernels. This means that the
entry address reported for the kernel is one that is treated as MIPS32
code, which causes problems if it is placed into an image such as a
uImage or FIT image from which the bootloader will read the entry
address & branch to it as non-microMIPS code.

Fix this by instead using the objdump tool to determine the kernel entry
address instead. We already pass $(OBJDUMP) around the kernel makefiles,
and it reports the entry address with the microMIPS ISA bit intact.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---
 arch/mips/Makefile | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index efd7a9d..9bf611d 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -232,8 +232,9 @@ include arch/mips/Kbuild.platforms
 ifdef CONFIG_PHYSICAL_START
 load-y					= $(CONFIG_PHYSICAL_START)
 endif
-entry-y				= 0x$(shell $(NM) vmlinux 2>/dev/null \
-					| grep "\bkernel_entry\b" | cut -f1 -d \ )
+entry-y				= $(shell $(OBJDUMP) -f vmlinux 2>/dev/null \
+					| grep "^start address " \
+					| cut -f3 -d \ )
 
 cflags-y			+= -I$(srctree)/arch/mips/include/asm/mach-generic
 drivers-$(CONFIG_PCI)		+= arch/mips/pci/
-- 
2.9.3
