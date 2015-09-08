Received: from mailapp01.imgtec.com ([195.59.15.196]:3646 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27006747AbbIHJLH40xum (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 8 Sep 2015 11:11:07 +0200
From: Alex Smith <alex.smith@imgtec.com>
Subject: [PATCH v5 0/4] mtd: nand: jz4780: Add NAND and BCH drivers
Date: Tue, 8 Sep 2015 10:10:49 +0100
Message-ID: <1441703453-2838-1-git-send-email-alex.smith@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Alex.Smith@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mtd@lists.infradead.org
Cc: Alex Smith <alex@alex-smith.me.uk>, Alex Smith <alex.smith@imgtec.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
Message-ID: <20150908091049.bfw1h-pQaWLteZp02EWkIrU3Vo15orTZZjS-634lRTU@z>

Hi,

This series adds support for the BCH controller and NAND devices on
the Ingenic JZ4780 SoC.

Tested on the MIPS Creator Ci20 board. All dependencies are now in
mainline.

This version of the series is based on current mainline (pre 4.3-rc1).

Review and feedback welcome.

Thanks,
Alex

Alex Smith (4):
  mtd: nand: increase ready wait timeout and report timeouts
  dt-bindings: binding for jz4780-{nand,bch}
  mtd: nand: jz4780: driver for NAND devices on JZ4780 SoCs
  MIPS: dts: jz4780/ci20: Add NEMC, BCH and NAND device tree nodes

 .../bindings/mtd/ingenic,jz4780-nand.txt           |  57 ++++
 arch/mips/boot/dts/ingenic/ci20.dts                |  51 +++
 arch/mips/boot/dts/ingenic/jz4780.dtsi             |  26 ++
 drivers/mtd/nand/Kconfig                           |   7 +
 drivers/mtd/nand/Makefile                          |   1 +
 drivers/mtd/nand/jz4780_bch.c                      | 348 +++++++++++++++++++
 drivers/mtd/nand/jz4780_bch.h                      |  42 +++
 drivers/mtd/nand/jz4780_nand.c                     | 378 +++++++++++++++++++++
 drivers/mtd/nand/nand_base.c                       |  14 +-
 9 files changed, 921 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
 create mode 100644 drivers/mtd/nand/jz4780_bch.c
 create mode 100644 drivers/mtd/nand/jz4780_bch.h
 create mode 100644 drivers/mtd/nand/jz4780_nand.c

-- 
2.5.0
