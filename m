Received: from mailapp01.imgtec.com ([195.59.15.196]:64137 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23994897AbdFQT6FdMRfh (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 17 Jun 2017 21:58:05 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH v5 0/4] PCI: xilinx: Fixes, optimisation & MIPS support
Date: Sat, 17 Jun 2017 12:57:37 -0700
Message-ID: <20170617195741.12757-1-paul.burton@imgtec.com>
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
To: linux-pci@vger.kernel.org
Cc: Bharat Kumar Gogada <bharatku@xilinx.com>, Ravikiran Gummaluri <rgummal@xilinx.com>, Bjorn Helgaas <bhelgaas@google.com>, Michal Simek <michal.simek@xilinx.com>, linux-mips@linux-mips.org, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20170617195737.Xiaoto2J0jYsYo8fj6c8WEWQJ9tXq_jldEtrsFik-og@z>

This series fixes an issue found using INTx interrupts with the Xilinx
AXI PCIe Host Bridge IP on the Imagination Technologies MIPS Boston
development board, performs a couple of optimisations to interrupt
handling & allows the driver to be used on MIPS systems.

Applies atop v4.12-rc5.

Paul Burton (4):
  PCI: xilinx: Create legacy IRQ domain with size 5
  PCI: xilinx: Unify INTx & MSI interrupt decode
  PCI: xilinx: Don't enable config completion interrupts
  PCI: xilinx: Allow build on MIPS platforms

 drivers/pci/host/Kconfig       |  2 +-
 drivers/pci/host/pcie-xilinx.c | 55 +++++++++++++++---------------------------
 2 files changed, 20 insertions(+), 37 deletions(-)

-- 
2.13.1
