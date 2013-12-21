Received: from mail-gw1-out.broadcom.com ([216.31.210.62]:23520 "EHLO
        mail-gw1-out.broadcom.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6815753Ab3LULKvAjRFX (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 21 Dec 2013 12:10:51 +0100
From: Jayachandran C <jchandra@broadcom.com>
Subject: [PATCH 00/18] Broadcom XLP Updates for 3.14
Date: Sat, 21 Dec 2013 16:52:12 +0530
Message-ID: <1387624950-31297-1-git-send-email-jchandra@broadcom.com>
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
Message-ID: <20131221112212.FvCDZS_XEn-8XNt26icuDR45TaX2LrfIpLntFDuhyR8@z>

The main change is to support the XLP9XX processor family:
http://www.broadcom.com/products/Processors/Enterprise/XLP900-Series

The other changes (patches 1-7) are updates to the existing XLP code,
changes are to :
* add MSI/MSI-X support for XLP PCIe interface,
* add topology.h for XLP,
* do some few minor fixes and cleanups.

JC.

Ganesan Ramalingam (1):
  MIPS: Netlogic: XLP9XX USB support

Jayachandran C (16):
  MIPS: Netlogic: Add MSI support for XLP
  MIPS: Netlogic: Add topology.h for XLP family
  MIPS: Netlogic: Some cleanups for assembly code
  MIPS: Netlogic: Add macro for node present
  MIPS: Netlogic: Get coremask from FUSE register
  MIPS: Netlogic: Core wakeup improvements
  MIPS: Netlogic: Identify XLP 9XX chip
  MIPS: Netlogic: update iomap.h for XLP9XX
  MIPS: Netlogic: XLP9XX PIC updates
  MIPS: Netlogic: SYS block updates of XLP9XX
  MIPS: Netlogic: XLP9XX UART offset
  MIPS: Netlogic: XLP9XX bridge and DRAM code
  MIPS: Netlogic: Add cpu to node mapping for XLP9XX
  MIPS: PCI: Netlogic XLP9XX support
  MIPS: Netlogic: XLP9XX PIC OF support
  MIPS: Netlogic: Add default DTB for XLP9XX SoC

Yonghong Song (1):
  MIPS: Netlogic: L1D cacheflush before thread enable on XLPII

 arch/mips/Kconfig                                |    1 +
 arch/mips/include/asm/cpu.h                      |    1 +
 arch/mips/include/asm/mach-netlogic/irq.h        |    3 +-
 arch/mips/include/asm/mach-netlogic/multi-node.h |   33 +-
 arch/mips/include/asm/mach-netlogic/topology.h   |   20 +
 arch/mips/include/asm/netlogic/common.h          |   24 +-
 arch/mips/include/asm/netlogic/mips-extns.h      |    7 +-
 arch/mips/include/asm/netlogic/xlp-hal/bridge.h  |   69 ++-
 arch/mips/include/asm/netlogic/xlp-hal/iomap.h   |   48 ++-
 arch/mips/include/asm/netlogic/xlp-hal/pcibus.h  |   41 +-
 arch/mips/include/asm/netlogic/xlp-hal/pic.h     |   77 ++--
 arch/mips/include/asm/netlogic/xlp-hal/sys.h     |   18 +-
 arch/mips/include/asm/netlogic/xlp-hal/uart.h    |    3 +-
 arch/mips/include/asm/netlogic/xlp-hal/xlp.h     |   38 +-
 arch/mips/kernel/cpu-probe.c                     |    1 +
 arch/mips/netlogic/Kconfig                       |    9 +
 arch/mips/netlogic/common/earlycons.c            |    2 +
 arch/mips/netlogic/common/irq.c                  |   72 +++-
 arch/mips/netlogic/common/reset.S                |   62 ++-
 arch/mips/netlogic/common/smp.c                  |    8 +-
 arch/mips/netlogic/common/smpboot.S              |    3 +-
 arch/mips/netlogic/dts/Makefile                  |    1 +
 arch/mips/netlogic/dts/xlp_gvp.dts               |   76 ++++
 arch/mips/netlogic/xlp/dt.c                      |    7 +-
 arch/mips/netlogic/xlp/nlm_hal.c                 |   71 +++-
 arch/mips/netlogic/xlp/setup.c                   |   25 +-
 arch/mips/netlogic/xlp/usb-init-xlp2.c           |   88 +++-
 arch/mips/netlogic/xlp/wakeup.c                  |   91 +++-
 arch/mips/netlogic/xlr/wakeup.c                  |    2 +-
 arch/mips/pci/Makefile                           |    1 +
 arch/mips/pci/msi-xlp.c                          |  494 ++++++++++++++++++++++
 arch/mips/pci/pci-xlp.c                          |  110 +++--
 32 files changed, 1279 insertions(+), 227 deletions(-)
 create mode 100644 arch/mips/include/asm/mach-netlogic/topology.h
 create mode 100644 arch/mips/netlogic/dts/xlp_gvp.dts
 create mode 100644 arch/mips/pci/msi-xlp.c

-- 
1.7.9.5
