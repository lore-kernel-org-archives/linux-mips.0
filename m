Received: from mail-gw1-out.broadcom.com ([216.31.210.62]:2763 "EHLO
        mail-gw1-out.broadcom.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27010199AbbAGLVYgvU51 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 7 Jan 2015 12:21:24 +0100
From: Jayachandran C <jchandra@broadcom.com>
Subject: [PATCH 00/17] Netlogic XLP updates
Date: Wed, 7 Jan 2015 16:58:21 +0530
Message-ID: <1420630118-17198-1-git-send-email-jchandra@broadcom.com>
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
Message-ID: <20150107112821.ps02XJsiJDciEFe6e9ygmNzDsDpkKAB8ktgCNjb21C4@z>

This patchset is a collection of fixes and updates to the Netlogic
platform support.

Comments/suggestions welcome.

JC.

Ganesan Ramalingam (5):
  MIPS: Netlogic: Fix cop0 prid check in AHCI init
  MIPS: Netlogic: Fix for SATA PHY init
  MIPS: Netlogic: Fix frequency calculation register
  MIPS: Netlogic: Add irq mapping and setup for XHCI port 3
  MIPS: Netlogic: Add built-in dts for XLP5xx boards

Jayachandran C (8):
  MIPS: Netlogic: Disable writing IRT for disabled blocks
  MIPS: MSI: Update MSI handling for XLP
  MIPS: Netlogic: Use MIPS topology.h
  MIPS: Netlogic: Move cores per node out of multi-node.h
  MIPS: Netlogic: nlm_core_id for xlp9xx
  MIPS: Netlogic: Update function to read DRAM BARs
  MIPS: Netlogic: Handle XLP hardware errata
  MIPS: Netlogic: Do not enable SUE for core

Prem Mallappa (1):
  MIPS: Netlogic: Added HugeTLB as default

Qingmin Liu (1):
  MIPS: Netlogic: Fix nlm_xlp2_get_pic_frequency to use ref_div

Shanghui Liu (1):
  MIPS: Netlogic: Fix wait for slave CPUs

Subhendu Sekhar Behera (1):
  MIPS: Netlogic: i2c IRQ mappings for XLP9XX

 arch/mips/Kconfig                                  |  1 +
 arch/mips/boot/dts/Makefile                        |  1 +
 arch/mips/boot/dts/xlp_rvp.dts                     | 77 ++++++++++++++++++++++
 arch/mips/include/asm/mach-netlogic/multi-node.h   |  9 ---
 arch/mips/include/asm/mach-netlogic/topology.h     | 15 -----
 arch/mips/include/asm/netlogic/common.h            | 21 +++++-
 arch/mips/include/asm/netlogic/mips-extns.h        |  8 ++-
 .../mips/include/asm/netlogic/xlp-hal/cpucontrol.h |  2 +
 arch/mips/include/asm/netlogic/xlp-hal/sys.h       |  3 +
 arch/mips/include/asm/netlogic/xlp-hal/xlp.h       |  3 +-
 arch/mips/netlogic/Kconfig                         |  9 +++
 arch/mips/netlogic/common/irq.c                    | 10 +--
 arch/mips/netlogic/common/reset.S                  | 20 +++++-
 arch/mips/netlogic/common/smp.c                    | 25 +++----
 arch/mips/netlogic/xlp/ahci-init-xlp2.c            | 13 ++++
 arch/mips/netlogic/xlp/ahci-init.c                 |  2 +-
 arch/mips/netlogic/xlp/dt.c                        | 10 ++-
 arch/mips/netlogic/xlp/nlm_hal.c                   | 57 ++++++++++------
 arch/mips/netlogic/xlp/setup.c                     |  7 +-
 arch/mips/netlogic/xlp/usb-init-xlp2.c             | 10 ++-
 arch/mips/netlogic/xlp/wakeup.c                    | 10 +--
 arch/mips/pci/msi-xlp.c                            | 19 +++---
 22 files changed, 244 insertions(+), 88 deletions(-)
 create mode 100644 arch/mips/boot/dts/xlp_rvp.dts
 delete mode 100644 arch/mips/include/asm/mach-netlogic/topology.h

-- 
1.9.1
