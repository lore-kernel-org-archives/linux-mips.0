Received: from mail-gw2-out.broadcom.com ([216.31.210.63]:38797 "EHLO
        mail-gw2-out.broadcom.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27010828AbbHAMDlBeoAt (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 1 Aug 2015 14:03:41 +0200
From: Jayachandran C <jchandra@broadcom.com>
Subject: [PATCH 0/4] Netlogic updates for 4.3
Date: Sat, 1 Aug 2015 17:44:19 +0530
Message-ID: <1438431263-12427-1-git-send-email-jchandra@broadcom.com>
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
Cc: Jayachandran C <jchandra@broadcom.com>
Message-ID: <20150801121419.1UklyQaXeFC-y-4FhiLKS0Ntz9H4_DOctza_bV7h5UM@z>

Some updates and fixes for the netlogic platform. The first patch
is to update interrupt controller code to use chip_data. Other minor
patches are to update dts files to use the GPIO controller (which
now upstream) and to add NAND interrupt mapping.

JC.

Kamlakant Patel (3):
  MIPS: Netlogic: Use chip_data for irq_chip methods
  MIPS: Netlogic: add device tree entry for XLP GPIO
  MIPS: Netlogic: enable ARCH_REQUIRE_GPIOLIB for XLP platform

Subhendu Sekhar Behera (1):
  MIPS: Netlogic: NAND IRQ mapping

 arch/mips/Kconfig                       |  1 +
 arch/mips/boot/dts/netlogic/xlp_evp.dts | 12 ++++++++++++
 arch/mips/boot/dts/netlogic/xlp_fvp.dts | 12 ++++++++++++
 arch/mips/boot/dts/netlogic/xlp_gvp.dts | 11 +++++++++++
 arch/mips/boot/dts/netlogic/xlp_rvp.dts | 11 +++++++++++
 arch/mips/boot/dts/netlogic/xlp_svp.dts | 12 ++++++++++++
 arch/mips/netlogic/common/irq.c         | 12 ++++++------
 arch/mips/netlogic/xlp/nlm_hal.c        |  2 ++
 arch/mips/pci/msi-xlp.c                 | 20 ++++++++++----------
 9 files changed, 77 insertions(+), 16 deletions(-)

-- 
1.9.1
