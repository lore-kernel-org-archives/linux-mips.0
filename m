Received: from mail-gw1-out.broadcom.com ([216.31.210.62]:2763 "EHLO
        mail-gw1-out.broadcom.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27010442AbbAGLV1o9pY7 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 7 Jan 2015 12:21:27 +0100
From: Jayachandran C <jchandra@broadcom.com>
Subject: [PATCH 07/17] MIPS: MSI: Update MSI handling for XLP
Date: Wed, 7 Jan 2015 16:58:28 +0530
Message-ID: <1420630118-17198-8-git-send-email-jchandra@broadcom.com>
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
Message-ID: <20150107112828.o5UfL5Kj2jDB0PgLHZrFL-QQhleKqgO-NcMPvDb7bZk@z>

The per-cpu interrupt ACK using EIRR has to be done just once after
all the bits in the status register are processed.

PIC ack has to be done once in case of MSI, and for every interrupt
in case of MSI-X

Signed-off-by: Jayachandran C <jchandra@broadcom.com>
---
 arch/mips/pci/msi-xlp.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/arch/mips/pci/msi-xlp.c b/arch/mips/pci/msi-xlp.c
index 6a40f24..3407495 100644
--- a/arch/mips/pci/msi-xlp.c
+++ b/arch/mips/pci/msi-xlp.c
@@ -178,13 +178,6 @@ static void xlp_msi_mask_ack(struct irq_data *d)
 	else
 		nlm_write_reg(md->lnkbase, PCIE_MSI_STATUS, 1u << vec);
 
-	/* Ack at eirr and PIC */
-	ack_c0_eirr(PIC_PCIE_LINK_MSI_IRQ(link));
-	if (cpu_is_xlp9xx())
-		nlm_pic_ack(md->node->picbase,
-				PIC_9XX_IRT_PCIE_LINK_INDEX(link));
-	else
-		nlm_pic_ack(md->node->picbase, PIC_IRT_PCIE_LINK_INDEX(link));
 }
 
 static struct irq_chip xlp_msi_chip = {
@@ -230,8 +223,6 @@ static void xlp_msix_mask_ack(struct irq_data *d)
 	}
 	nlm_write_reg(md->lnkbase, status_reg, 1u << bit);
 
-	/* Ack at eirr and PIC */
-	ack_c0_eirr(PIC_PCIE_MSIX_IRQ(link));
 	if (!cpu_is_xlp9xx())
 		nlm_pic_ack(md->node->picbase,
 				PIC_IRT_PCIE_MSIX_INDEX(msixvec));
@@ -541,6 +532,14 @@ void nlm_dispatch_msi(int node, int lirq)
 		do_IRQ(irqbase + i);
 		status &= status - 1;
 	}
+
+	/* Ack at eirr and PIC */
+	ack_c0_eirr(PIC_PCIE_LINK_MSI_IRQ(link));
+	if (cpu_is_xlp9xx())
+		nlm_pic_ack(md->node->picbase,
+				PIC_9XX_IRT_PCIE_LINK_INDEX(link));
+	else
+		nlm_pic_ack(md->node->picbase, PIC_IRT_PCIE_LINK_INDEX(link));
 }
 
 void nlm_dispatch_msix(int node, int lirq)
@@ -567,4 +566,6 @@ void nlm_dispatch_msix(int node, int lirq)
 		do_IRQ(irqbase + i);
 		status &= status - 1;
 	}
+	/* Ack at eirr and PIC */
+	ack_c0_eirr(PIC_PCIE_MSIX_IRQ(link));
 }
-- 
1.9.1
