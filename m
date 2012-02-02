Received: from smtpgw2.netlogicmicro.com ([12.203.210.54]:52718 "EHLO
        smtpgw2.netlogicmicro.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1904106Ab2BBOjH (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 2 Feb 2012 15:39:07 +0100
From: Jayachandran C <jayachandranc@netlogicmicro.com>
Subject: [PATCH 01/11] MIPS: Netlogic: Fix PCIX irq on XLR chips
Date: Thu, 2 Feb 2012 20:12:55 +0530
Message-ID: <451f6dd7ce79b388d0f1d2266be8afe90daef99a.1328189941.git.jayachandranc@netlogicmicro.com>
In-Reply-To: <cover.1328189941.git.jayachandranc@netlogicmicro.com>
References: <cover.1328189941.git.jayachandranc@netlogicmicro.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: linux-mips@linux-mips.org, ralf@linux-mips.org
Cc: Jayachandran C <jayachandranc@netlogicmicro.com>
Message-ID: <20120202144255.CxsTIEcyES4QztrZcpu5QgtCNiRPdU9IrQPqDaw8a0E@z>

The correct irq is PIC_PCIX_IRQ

Signed-off-by: Jayachandran C <jayachandranc@netlogicmicro.com>
---
 arch/mips/pci/pci-xlr.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/mips/pci/pci-xlr.c b/arch/mips/pci/pci-xlr.c
index 3d701a9..0148001 100644
--- a/arch/mips/pci/pci-xlr.c
+++ b/arch/mips/pci/pci-xlr.c
@@ -327,7 +327,7 @@ static int __init pcibios_init(void)
 		}
 	} else {
 		/* XLR PCI controller ACK */
-		irq_set_handler_data(PIC_PCIE_XLSB0_LINK3_IRQ, xlr_pci_ack);
+		irq_set_handler_data(PIC_PCIX_IRQ, xlr_pci_ack);
 	}
 
 	return 0;
-- 
1.7.5.4
