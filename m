Received: from dns1.mips.com ([12.201.5.69]:36082 "EHLO dns1.mips.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S1491831Ab1HZJHa (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 26 Aug 2011 11:07:30 +0200
From: Deng-Cheng Zhu <dczhu@mips.com>
Subject: [PATCH v3 0/2] Pass resources to pci_create_bus() and fix MIPS PCI resources
Date: Fri, 26 Aug 2011 17:07:11 +0800
Message-ID: <1314349633-13155-1-git-send-email-dczhu@mips.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: jbarnes@virtuousgeek.org, ralf@linux-mips.org
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, eyal@mips.com, zenon@mips.com, dczhu@mips.com, dengcheng.zhu@gmail.com
Message-ID: <20110826090711.M3jPGJLgLARrpmeUT-uslMR6HbzLTUzEWA3L_VCJGAM@z>

Change the pci_create_bus() interface to pass in available resources to get them
settled down early. This is to avoid possible resource conflicts while doing
pci_scan_slot() in pci_scan_child_bus(). Note that pcibios_fixup_bus() can get
rid of such conflicts, but it's done AFTER scanning slots.

In addition, MIPS PCI resources are now fixed using this new interface.

-- Changes --
v3 - v2:
o Do not do fixups for root buses in pcibios_fixup_bus().
o Skip bus creation when bus resources cannot be allocated.
o PCI domain/bus numbers added to the error info in controller_resources().

v2 - v1:
o Merge [PATCH 1/3] to [PATCH 3/3], so now 2 patches in total.
o Add more info to patch description.
o Fix arch breaks in default resource setup discovered by Bjorn Helgaas.

Deng-Cheng Zhu (2):
  PCI: Pass available resources into pci_create_bus()
  MIPS: PCI: Pass controller's resources to pci_create_bus() in
    pcibios_scanbus()

 arch/microblaze/pci/pci-common.c |    3 +-
 arch/mips/pci/pci.c              |   61 +++++++++++++++++++++++++++++++++-----
 arch/powerpc/kernel/pci-common.c |    3 +-
 arch/sparc/kernel/pci.c          |    3 +-
 arch/x86/pci/acpi.c              |    2 +-
 drivers/pci/probe.c              |   15 +++++++--
 include/linux/pci.h              |    3 +-
 7 files changed, 73 insertions(+), 17 deletions(-)
