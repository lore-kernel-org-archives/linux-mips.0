Received: from mailapp01.imgtec.com ([195.59.15.196]:41527 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012273AbbLCMCplpqnW (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 3 Dec 2015 13:02:45 +0100
From: Harvey Hunt <harvey.hunt@imgtec.com>
Subject: [PATCH v9 0/3] mtd: nand: jz4780: Add NAND and BCH drivers
Date: Thu, 3 Dec 2015 12:02:19 +0000
Message-ID: <1449144142-24004-1-git-send-email-harvey.hunt@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Harvey.Hunt@imgtec.com>
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
Cc: Harvey Hunt <harvey.hunt@imgtec.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Paul Burton <paul.burton@imgtec.com>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
Message-ID: <20151203120219.HejxklSRp9j91guRyBmuXQkcfHx-k73JTwgFgKfUKLE@z>

Hi,

This series adds support for the BCH controller and NAND devices on
the Ingenic JZ4780 SoC.

Tested on the MIPS Creator Ci20 board. All dependencies are now in
mainline.

This version of the series is based on 4.4-rc3.

As suggested by Boris [0], refactoring work has been done to treat NAND
chips as children nodes of the NAND controller.

Review and feedback welcome.

Thanks,

Harvey

[0] https://patchwork.ozlabs.org/patch/526818/

Cc: Brian Norris <computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Paul Burton <paul.burton@imgtec.com>
Cc: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-mips@linux-mips.org
Cc: linux-mtd@lists.infradead.org

Alex Smith (3):
  dt-bindings: binding for jz4780-{nand,bch}
  mtd: nand: jz4780: driver for NAND devices on JZ4780 SoCs
  MIPS: dts: jz4780/ci20: Add NEMC, BCH and NAND device tree nodes

 .../bindings/mtd/ingenic,jz4780-nand.txt           |  86 +++++
 arch/mips/boot/dts/ingenic/ci20.dts                |  63 ++++
 arch/mips/boot/dts/ingenic/jz4780.dtsi             |  26 ++
 drivers/mtd/nand/Kconfig                           |   7 +
 drivers/mtd/nand/Makefile                          |   1 +
 drivers/mtd/nand/jz4780_bch.c                      | 361 ++++++++++++++++++
 drivers/mtd/nand/jz4780_bch.h                      |  42 +++
 drivers/mtd/nand/jz4780_nand.c                     | 420 +++++++++++++++++++++
 8 files changed, 1006 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
 create mode 100644 drivers/mtd/nand/jz4780_bch.c
 create mode 100644 drivers/mtd/nand/jz4780_bch.h
 create mode 100644 drivers/mtd/nand/jz4780_nand.c

-- 
2.6.2
