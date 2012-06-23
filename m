Received: from [69.28.251.93] ([69.28.251.93]:53300 "EHLO b32.net"
        rhost-flags-FAIL-FAIL-OK-OK) by eddie.linux-mips.org with ESMTP
        id S1903683Ab2FWFX5 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Sat, 23 Jun 2012 07:23:57 +0200
From: Kevin Cernekee <cernekee@gmail.com>
Subject: [PATCH 5/7] MIPS: BCM63XX: Fix USB IRQ definitions for 6328
Date: Fri, 22 Jun 2012 22:14:55 -0700
Message-ID: <313fb93d1ee0993cb023e745c92c31e6@localhost>
In-Reply-To: <0f67eabbb0d5c59add27e42a08b94944@localhost>
References: <0f67eabbb0d5c59add27e42a08b94944@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
Return-Path: <linux-mips-bounce@linux-mips.org>
To: ralf@linux-mips.org
Cc: ffainelli@freebox.fr, mbizon@freebox.fr, jonas.gorski@gmail.com, linux-mips@linux-mips.org
Message-ID: <20120623051455.kX6Xwph_KvnhlmLEdt7qwYuzl9W9snt4H2L-2J_2-dQ@z>

OHCI/EHCI are in the high (second) word.  Not currently used by any
driver.

Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
---
 arch/mips/include/asm/mach-bcm63xx/bcm63xx_cpu.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/mach-bcm63xx/bcm63xx_cpu.h b/arch/mips/include/asm/mach-bcm63xx/bcm63xx_cpu.h
index 2b59ae4..c0e6333 100644
--- a/arch/mips/include/asm/mach-bcm63xx/bcm63xx_cpu.h
+++ b/arch/mips/include/asm/mach-bcm63xx/bcm63xx_cpu.h
@@ -602,8 +602,8 @@ enum bcm63xx_irq {
 #define BCM_6328_ENET0_IRQ		0
 #define BCM_6328_ENET1_IRQ		0
 #define BCM_6328_ENET_PHY_IRQ		(IRQ_INTERNAL_BASE + 12)
-#define BCM_6328_OHCI0_IRQ		(IRQ_INTERNAL_BASE + 9)
-#define BCM_6328_EHCI0_IRQ		(IRQ_INTERNAL_BASE + 10)
+#define BCM_6328_OHCI0_IRQ		(BCM_6328_HIGH_IRQ_BASE + 9)
+#define BCM_6328_EHCI0_IRQ		(BCM_6328_HIGH_IRQ_BASE + 10)
 #define BCM_6328_PCMCIA_IRQ		0
 #define BCM_6328_ENET0_RXDMA_IRQ	0
 #define BCM_6328_ENET0_TXDMA_IRQ	0
-- 
1.7.11.1
