Received: from mail-gw3-out.broadcom.com ([216.31.210.64]:25697 "EHLO
        mail-gw3-out.broadcom.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6843058AbaEIPVar0nFm (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 9 May 2014 17:21:30 +0200
From: Jayachandran C <jchandra@broadcom.com>
Subject: [PATCH RFC 0/5] Mapped kernel support for Broadcom XLP
Date: Fri, 9 May 2014 20:58:20 +0530
Message-ID: <1399649304-25856-1-git-send-email-jchandra@broadcom.com>
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
Message-ID: <20140509152820.ZqbFvKWk9rthMId8-CMnFVuA6-xpVv8HLf_3BI6Tiv8@z>

This patchset adds support for loading a XLR/XLP kernel compiled with a
CKSEG2 load address.

The changes are to:
 - move the existing MAPPED_KERNEL option from sgi-ip27 to common config
 - Add a plat_mem_fixup function to arch_mem_init which will allow
   the platform to calculate the kernel wired TLB entries and save
   them so that all the CPUs can set them up at boot.
 - Update PAGE_OFFSET, MAP_BASE and MODULE_START when mapped kernel
   is enabled.
 - Update compressed kernel code to generate the final executable in
   KSEG0 and map the load address of the embedded kernel before loading
   it.
 - Use wired entries of sizes 256M/1G/4G to map the available memory on
   XLP9xx and XLP2xx

Comments and suggestions welcome.

JC.

Ashok Kumar (1):
  MIPS: Netlogic: Mapped kernel support

Jayachandran C (4):
  MIPS: Make MAPPED_KERNEL config option common
  MIPS: Add platform function to fixup memory
  MIPS: Compress MAPPED kernels
  MIPS: Netlogic: Map kernel with 1G/4G pages on XLPII

 arch/mips/Kconfig                                  |    7 +
 arch/mips/boot/compressed/calc_vmlinuz_load_addr.c |    9 +
 arch/mips/boot/compressed/decompress.c             |    6 +-
 arch/mips/boot/compressed/head.S                   |    5 +
 .../include/asm/mach-netlogic/kernel-entry-init.h  |   50 ++++
 arch/mips/include/asm/mach-netlogic/spaces.h       |   25 ++
 arch/mips/include/asm/netlogic/common.h            |   15 ++
 arch/mips/include/asm/pgtable-64.h                 |    4 +
 arch/mips/kernel/setup.c                           |    4 +
 arch/mips/mm/tlb-r4k.c                             |    2 +
 arch/mips/netlogic/Platform                        |    5 +
 arch/mips/netlogic/common/Makefile                 |    1 +
 arch/mips/netlogic/common/memory.c                 |  247 ++++++++++++++++++++
 arch/mips/netlogic/common/reset.S                  |   40 ++++
 arch/mips/netlogic/common/smpboot.S                |   16 +-
 arch/mips/netlogic/xlp/setup.c                     |   14 --
 arch/mips/netlogic/xlr/setup.c                     |    3 +-
 arch/mips/netlogic/xlr/wakeup.c                    |    7 +-
 arch/mips/sgi-ip27/Kconfig                         |    8 -
 19 files changed, 440 insertions(+), 28 deletions(-)
 create mode 100644 arch/mips/include/asm/mach-netlogic/kernel-entry-init.h
 create mode 100644 arch/mips/include/asm/mach-netlogic/spaces.h
 create mode 100644 arch/mips/netlogic/common/memory.c

-- 
1.7.9.5
