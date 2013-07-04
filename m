Received: from multi.imgtec.com ([194.200.65.239]:10499 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6819996Ab3GDIiiwgQKk (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 4 Jul 2013 10:38:38 +0200
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH] MIPS: loongson: Hide the pci code behind CONFIG_PCI
Date: Thu, 4 Jul 2013 09:38:29 +0100
Message-ID: <1372927109-21498-1-git-send-email-markos.chandras@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Markos.Chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20130704083829.iCmev-TPqpxQPxlIrX7Nyth6qqPkWUH79gt4mjZ1Qiw@z>

The pci.c code depends on symbols which are only visible
if CONFIG_PCI is selected.

Also fixes the following problem on loongson allnoconfig:
arch/mips/built-in.o: In function `pcibios_init':
pci.c:(.init.text+0x528):
undefined reference to `register_pci_controller'
arch/mips/built-in.o:(.data+0xc):
undefined reference to `loongson_pci_ops'

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
Acked-by: Steven J. Hill <Steven.Hill@imgtec.com> 
---
This patch is for the upstream-sfr/mips-for-linux-next tree
---
 arch/mips/loongson/common/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/loongson/common/Makefile b/arch/mips/loongson/common/Makefile
index 4c57b3e..9e4484c 100644
--- a/arch/mips/loongson/common/Makefile
+++ b/arch/mips/loongson/common/Makefile
@@ -3,8 +3,9 @@
 #
 
 obj-y += setup.o init.o cmdline.o env.o time.o reset.o irq.o \
-    pci.o bonito-irq.o mem.o machtype.o platform.o
+    bonito-irq.o mem.o machtype.o platform.o
 obj-$(CONFIG_GPIOLIB) += gpio.o
+obj-$(CONFIG_PCI) += pci.o
 
 #
 # Serial port support
-- 
1.8.2.1
