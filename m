Received: from mail-gw2-out.broadcom.com ([216.31.210.63]:25502 "EHLO
        mail-gw2-out.broadcom.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27010207AbbAGLVZ2-eYa (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 7 Jan 2015 12:21:25 +0100
From: Jayachandran C <jchandra@broadcom.com>
Subject: [PATCH 04/17] MIPS: Netlogic: Disable writing IRT for disabled blocks
Date: Wed, 7 Jan 2015 16:58:25 +0530
Message-ID: <1420630118-17198-5-git-send-email-jchandra@broadcom.com>
In-Reply-To: <1420630118-17198-1-git-send-email-jchandra@broadcom.com>
References: <1420630118-17198-1-git-send-email-jchandra@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <jchandra@broadcom.com>
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
Cc: Jayachandran C <jchandra@broadcom.com>, ralf@linux-mips.org
Message-ID: <20150107112825.hipxrr_ePEJvnRRh0eeYvlXmEfITuAe7wRi0vV2S4A8@z>

If the device header of a block is not present, return invalid IRT
value so that we do not program an incorrect offset.

Signed-off-by: Jayachandran C <jchandra@broadcom.com>
---
 arch/mips/netlogic/xlp/nlm_hal.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/arch/mips/netlogic/xlp/nlm_hal.c b/arch/mips/netlogic/xlp/nlm_hal.c
index 7e0d224..de41fb5 100644
--- a/arch/mips/netlogic/xlp/nlm_hal.c
+++ b/arch/mips/netlogic/xlp/nlm_hal.c
@@ -170,16 +170,23 @@ static int xlp_irq_to_irt(int irq)
 	}
 
 	if (devoff != 0) {
+		uint32_t val;
+
 		pcibase = nlm_pcicfg_base(devoff);
-		irt = nlm_read_reg(pcibase, XLP_PCI_IRTINFO_REG) & 0xffff;
-		/* HW weirdness, I2C IRT entry has to be fixed up */
-		switch (irq) {
-		case PIC_I2C_1_IRQ:
-			irt = irt + 1; break;
-		case PIC_I2C_2_IRQ:
-			irt = irt + 2; break;
-		case PIC_I2C_3_IRQ:
-			irt = irt + 3; break;
+		val = nlm_read_reg(pcibase, XLP_PCI_IRTINFO_REG);
+		if (val == 0xffffffff) {
+			irt = -1;
+		} else {
+			irt = val & 0xffff;
+			/* HW weirdness, I2C IRT entry has to be fixed up */
+			switch (irq) {
+			case PIC_I2C_1_IRQ:
+				irt = irt + 1; break;
+			case PIC_I2C_2_IRQ:
+				irt = irt + 2; break;
+			case PIC_I2C_3_IRQ:
+				irt = irt + 3; break;
+			}
 		}
 	} else if (irq >= PIC_PCIE_LINK_LEGACY_IRQ(0) &&
 			irq <= PIC_PCIE_LINK_LEGACY_IRQ(3)) {
-- 
1.9.1
