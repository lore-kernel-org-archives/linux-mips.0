Received: from mailapp01.imgtec.com ([195.59.15.196]:52815 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012707AbcBDQLgyq2i8 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 4 Feb 2016 17:11:36 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH v3 3/6] PCI: xilinx: Always clear interrupt decode register
Date: Thu, 4 Feb 2016 16:10:10 +0000
Message-ID: <1454602213-967-4-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1454602213-967-1-git-send-email-paul.burton@imgtec.com>
References: <1454602213-967-1-git-send-email-paul.burton@imgtec.com>
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
To: linux-mips@linux-mips.org
Cc: Bharat Kumar Gogada <bharatku@xilinx.com>, Michal Simek <michal.simek@xilinx.com>, Ravikiran Gummaluri <rgummal@xilinx.com>, Paul Burton <paul.burton@imgtec.com>, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>, Jiang Liu <jiang.liu@linux.intel.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, Russell Joyce <russell.joyce@york.ac.uk>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Jingoo Han <jingoohan1@gmail.com>, linux-arm-kernel@lists.infradead.org
Message-ID: <20160204161010.Bws3mZzeoinsOrqc7wXqBgCQNCQEd8i28rY5kXJ_ufg@z>

If an MSI or INTx interrupt is incorrectly triggered with an empty FIFO
then xilinx_pcie_intr_handler will print a warning & skip further
processing. However it did not clear the interrupt in the decode
register, so the same INTX or MSI interrupt would trigger again
immediately even though the FIFO is still empty. Clear the interrupt in
the decode register to avoid that situation.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Fixes: 8961def56845 ("PCI: xilinx: Add Xilinx AXI PCIe Host Bridge IP driver")

---

Changes in v3:
- Split out from Boston patchset.

Changes in v2:
- Add Fixes tag.

 drivers/pci/host/pcie-xilinx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/host/pcie-xilinx.c b/drivers/pci/host/pcie-xilinx.c
index afdfb09..1eb74a2 100644
--- a/drivers/pci/host/pcie-xilinx.c
+++ b/drivers/pci/host/pcie-xilinx.c
@@ -444,7 +444,7 @@ static irqreturn_t xilinx_pcie_intr_handler(int irq, void *data)
 		/* Check whether interrupt valid */
 		if (!(val & XILINX_PCIE_RPIFR1_INTR_VALID)) {
 			dev_warn(port->dev, "RP Intr FIFO1 read error\n");
-			return IRQ_HANDLED;
+			goto out;
 		}
 
 		if (val & XILINX_PCIE_RPIFR1_MSI_INTR) {
@@ -492,6 +492,7 @@ static irqreturn_t xilinx_pcie_intr_handler(int irq, void *data)
 	if (status & XILINX_PCIE_INTR_MST_ERRP)
 		dev_warn(port->dev, "Master error poison\n");
 
+out:
 	/* Clear the Interrupt Decode register */
 	pcie_write(port, status, XILINX_PCIE_REG_IDR);
 
-- 
2.7.0
