Received: from mailapp01.imgtec.com ([195.59.15.196]:11912 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23991786AbdCaJBCwm5Nq (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 31 Mar 2017 11:01:02 +0200
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Subject: [PATCH 0/2] MIPS: Xilfpga: Switch to generic kernel
Date: Fri, 31 Mar 2017 10:00:40 +0100
Message-ID: <20170331090042.29168-1-Zubair.Kakakhel@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Zubair.Kakakhel@imgtec.com>
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
Cc: Zubair.Kakakhel@imgtec.com, linux-kernel@vger.kernel.org
Message-ID: <20170331090040.mqChdc06dORHDeLKg4nmeUJmGgUTSBLFptiAeeJRxok@z>

Hi,

Couple of patches that convert the MIPSfpga platform to using
the generic kernels

Based on v4.11-rc4.

Regards,
ZubairLK

Zubair Lutfullah Kakakhel (2):
  MIPS: generic: Add support for MIPSfpga
  MIPS: Xilfpga: Switch to using generic defconfigs

 arch/mips/Kbuild.platforms                     |  1 -
 arch/mips/Kconfig                              | 24 ---------
 arch/mips/Makefile                             |  4 ++
 arch/mips/boot/dts/xilfpga/Makefile            |  2 +-
 arch/mips/boot/dts/xilfpga/nexys4ddr.dts       |  8 +++
 arch/mips/configs/generic/board-xilfpga.config | 19 +++++++
 arch/mips/configs/xilfpga_defconfig            | 75 --------------------------
 arch/mips/generic/Kconfig                      |  6 +++
 arch/mips/generic/vmlinux.its.S                | 25 +++++++++
 arch/mips/xilfpga/Kconfig                      |  9 ----
 arch/mips/xilfpga/Makefile                     |  7 ---
 arch/mips/xilfpga/Platform                     |  3 --
 arch/mips/xilfpga/init.c                       | 44 ---------------
 arch/mips/xilfpga/intc.c                       | 22 --------
 arch/mips/xilfpga/time.c                       | 41 --------------
 15 files changed, 63 insertions(+), 227 deletions(-)
 create mode 100644 arch/mips/configs/generic/board-xilfpga.config
 delete mode 100644 arch/mips/configs/xilfpga_defconfig
 delete mode 100644 arch/mips/xilfpga/Kconfig
 delete mode 100644 arch/mips/xilfpga/Makefile
 delete mode 100644 arch/mips/xilfpga/Platform
 delete mode 100644 arch/mips/xilfpga/init.c
 delete mode 100644 arch/mips/xilfpga/intc.c
 delete mode 100644 arch/mips/xilfpga/time.c

-- 
2.10.2
