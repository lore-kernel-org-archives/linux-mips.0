Received: from mail-gw2-out.broadcom.com ([216.31.210.63]:30940 "EHLO
        mail-gw2-out.broadcom.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27010502AbbAGLVst0Qn0 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 7 Jan 2015 12:21:48 +0100
From: Jayachandran C <jchandra@broadcom.com>
Subject: [PATCH 16/17] MIPS: Netlogic: i2c IRQ mappings for XLP9XX
Date: Wed, 7 Jan 2015 16:58:37 +0530
Message-ID: <1420630118-17198-17-git-send-email-jchandra@broadcom.com>
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
Cc: Subhendu Sekhar Behera <sbehera@broadcom.com>, ralf@linux-mips.org, Jayachandran C <jchandra@broadcom.com>
Message-ID: <20150107112837.oMZjrN4y_OSYAw1hfOzpkBYksRNd21cGfF9ugtyGRPU@z>

From: Subhendu Sekhar Behera <sbehera@broadcom.com>

The new I2C block in XLP9XX has 4 interrupts, add the mapping for
these in nlm_hal.c

Signed-off-by: Subhendu Sekhar Behera <sbehera@broadcom.com>
Signed-off-by: Jayachandran C <jchandra@broadcom.com>
---
 arch/mips/netlogic/xlp/nlm_hal.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/mips/netlogic/xlp/nlm_hal.c b/arch/mips/netlogic/xlp/nlm_hal.c
index 8d743d0..a8f4144 100644
--- a/arch/mips/netlogic/xlp/nlm_hal.c
+++ b/arch/mips/netlogic/xlp/nlm_hal.c
@@ -71,6 +71,14 @@ static int xlp9xx_irq_to_irt(int irq)
 	switch (irq) {
 	case PIC_GPIO_IRQ:
 		return 12;
+	case PIC_I2C_0_IRQ:
+		return 125;
+	case PIC_I2C_1_IRQ:
+		return 126;
+	case PIC_I2C_2_IRQ:
+		return 127;
+	case PIC_I2C_3_IRQ:
+		return 128;
 	case PIC_9XX_XHCI_0_IRQ:
 		return 114;
 	case PIC_9XX_XHCI_1_IRQ:
-- 
1.9.1
