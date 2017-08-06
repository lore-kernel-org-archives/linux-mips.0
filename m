Received: from mailapp01.imgtec.com ([195.59.15.196]:59975 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993965AbdHFAESpSzT0 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 6 Aug 2017 02:04:18 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH v6 0/6] PCI: xilinx: Fixes, optimisation & MIPS support
Date: Sat, 5 Aug 2017 17:03:45 -0700
Message-ID: <20170806000351.17952-1-paul.burton@imgtec.com>
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
To: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org
Cc: Bharat Kumar Gogada <bharatku@xilinx.com>, Michal Simek <michal.simek@xilinx.com>, Ravikiran Gummaluri <rgummal@xilinx.com>, linux-mips@linux-mips.org, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20170806000345.zbYrBhU_u62LbKSQgcTfyjA4xulQR5JNYRlH9Wv9-U0@z>

This series fixes an issue found using INTx interrupts with the Xilinx
AXI PCIe Host Bridge IP on the Imagination Technologies MIPS Boston
development board, performs a couple of optimisations to interrupt
handling & allows the driver to be used on MIPS systems.

Applies atop v4.13-rc3.

Paul Burton (6):
  PCI: Move enum pci_interrupt_pin to a new common header
  PCI: Introduce pci_irqd_intx_xlate()
  PCI: xilinx: Translate INTx range to hwirqs 0-3
  PCI: xilinx: Unify INTx & MSI interrupt decode
  PCI: xilinx: Don't enable config completion interrupts
  PCI: xilinx: Allow build on MIPS platforms

 drivers/pci/host/Kconfig       |  2 +-
 drivers/pci/host/pcie-xilinx.c | 58 +++++++++++++++---------------------------
 include/linux/pci-common.h     | 31 ++++++++++++++++++++++
 include/linux/pci-epf.h        |  9 +------
 include/linux/pci.h            | 33 ++++++++++++++++++++++++
 5 files changed, 87 insertions(+), 46 deletions(-)
 create mode 100644 include/linux/pci-common.h

-- 
2.13.4
