Received: from multi.imgtec.com ([194.200.65.239]:18601 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6825760Ab3LBQtAInESW (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 2 Dec 2013 17:49:00 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 0/3] MIPS: Malta: remove some bootloader dependencies
Date: Mon, 2 Dec 2013 16:48:35 +0000
Message-ID: <1386002918-32270-1-git-send-email-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>
Message-ID: <20131202164835.TQ1iSSxiM24z5snFZtAzbV6g5Eyg8zPXxRYFQvBu0Kk@z>

A Linux kernel built for the Malta board currently relies upon the
bootloader having performed a fairly significant amount of hardware
initialisation. This causes a number of issues:

  - Malta has traditionally only been used with YAMON as its bootloader
    and Linux has become reliant upon setup which YAMON performs. Other
    bootloaders may not require all of that setup for their own use but
    if the kernel is not capable of it then all bootloaders still have
    to perform that hardware setup regardless of whether they need it
    themselves. This is currently the case for U-boot.

  - Malta is a development board & thus some would like to be able to
    load kernels via a JTAG debugger. In this case no bootloader has
    been executed and so little of that setup has been performed.
    Loading a kernel via JTAG becomes impractical if you first have to
    probe your PCI bus & setup PIIX4 interrupts via JTAG...

This series removes a few of the dependencies which Linux has upon the
bootloader. The first 2 caused problems whilst porting U-boot to Malta
and currently cause U-boot to perform initialisation that it would
otherwise not need to do. More unnecessary dependencies remain to be
tackled in the future.

Paul Burton (3):
  MIPS: Malta: initialise the RTC at boot
  MIPS: Malta: mux & enable SERIRQ interrupt
  MIPS: Malta: use generic 8250 early console

 arch/mips/Kconfig                         |  1 -
 arch/mips/include/asm/mips-boards/piix4.h |  7 ++++
 arch/mips/mti-malta/Makefile              |  2 --
 arch/mips/mti-malta/malta-console.c       | 47 -------------------------
 arch/mips/mti-malta/malta-init.c          | 58 ++++++++++++++++++-------------
 arch/mips/mti-malta/malta-time.c          | 13 +++++++
 arch/mips/pci/fixup-malta.c               | 11 ++++++
 7 files changed, 64 insertions(+), 75 deletions(-)
 delete mode 100644 arch/mips/mti-malta/malta-console.c

-- 
1.8.4.2
