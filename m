Received: from multi.imgtec.com ([194.200.65.239]:18425 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6823043Ab3ISJ2HV0c1o (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 19 Sep 2013 11:28:07 +0200
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH] MIPS: pci: pci-bcm1480: Include missing vt.h header
Date: Thu, 19 Sep 2013 10:27:52 +0100
Message-ID: <1379582872-5482-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20130919092752.W3gObTlKtPNKzzH1wGvC50JYNUcg-hjoB7hUKhYB9tE@z>

It's needed for the MAX_NR_CONSOLES macro.

Fixes the following build problem on a randconfig:

arch/mips/pci/pci-bcm1480.c: In function 'bcm1480_pcibios_init':
arch/mips/pci/pci-bcm1480.c:261:36: error: 'MAX_NR_CONSOLES'
undeclared (first use in this function)
arch/mips/pci/pci-bcm1480.c:261:36: note: each undeclared
identifier is reported only once for each function it appears in
make[1]: *** [arch/mips/pci/pci-bcm1480.o] Error 1

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
This patch is for the upstream-sfr/mips-for-linux-next tree
---
 arch/mips/pci/pci-bcm1480.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/pci/pci-bcm1480.c b/arch/mips/pci/pci-bcm1480.c
index 44dd5aa..5ec2a7b 100644
--- a/arch/mips/pci/pci-bcm1480.c
+++ b/arch/mips/pci/pci-bcm1480.c
@@ -39,6 +39,7 @@
 #include <linux/mm.h>
 #include <linux/console.h>
 #include <linux/tty.h>
+#include <linux/vt.h>
 
 #include <asm/sibyte/bcm1480_regs.h>
 #include <asm/sibyte/bcm1480_scd.h>
-- 
1.8.3.2
