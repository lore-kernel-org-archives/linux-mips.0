Received: from mail-gw1-out.broadcom.com ([216.31.210.62]:21695 "EHLO
        mail-gw1-out.broadcom.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27010940AbbHAMDnKxt8t (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 1 Aug 2015 14:03:43 +0200
From: Jayachandran C <jchandra@broadcom.com>
Subject: [PATCH 4/4] MIPS: Netlogic: NAND IRQ mapping
Date: Sat, 1 Aug 2015 17:44:23 +0530
Message-ID: <1438431263-12427-5-git-send-email-jchandra@broadcom.com>
In-Reply-To: <1438431263-12427-1-git-send-email-jchandra@broadcom.com>
References: <1438431263-12427-1-git-send-email-jchandra@broadcom.com>
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
To: linux-mips@linux-mips.org, ralf@linux-mips.org
Cc: Subhendu Sekhar Behera <sbehera@broadcom.com>, Jayachandran C <jchandra@broadcom.com>
Message-ID: <20150801121423.1uZNuATjPQm9w_ISSQIwJcNWce3Iu5AIjlyrasxY190@z>

From: Subhendu Sekhar Behera <sbehera@broadcom.com>

Add NAND IRQ mapping for XLP9xx processor.

Signed-off-by: Subhendu Sekhar Behera <sbehera@broadcom.com>
Signed-off-by: Jayachandran C <jchandra@broadcom.com>
---
 arch/mips/netlogic/xlp/nlm_hal.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/netlogic/xlp/nlm_hal.c b/arch/mips/netlogic/xlp/nlm_hal.c
index a8f4144..80ec929 100644
--- a/arch/mips/netlogic/xlp/nlm_hal.c
+++ b/arch/mips/netlogic/xlp/nlm_hal.c
@@ -91,6 +91,8 @@ static int xlp9xx_irq_to_irt(int irq)
 		return 134;
 	case PIC_SATA_IRQ:
 		return 143;
+	case PIC_NAND_IRQ:
+		return 151;
 	case PIC_SPI_IRQ:
 		return 152;
 	case PIC_MMC_IRQ:
-- 
1.9.1
