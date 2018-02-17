Received: from 9pmail.ess.barracuda.com ([64.235.150.225]:32908 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992923AbeBQUOIS1yHG (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 17 Feb 2018 21:14:08 +0100
From: Paul Burton <paul.burton@mips.com>
Subject: [PATCH v5 00/14] net: pch_gbe: Fixes & MIPS support
Date: Sat, 17 Feb 2018 12:10:23 -0800
Message-ID: <20180217201037.3006-1-paul.burton@mips.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Paul.Burton@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: netdev@vger.kernel.org
Cc: Hassan Naveed <hassan.naveed@mips.com>, Matt Redfearn <matt.redfearn@mips.com>, "David S . Miller" <davem@davemloft.net>, linux-mips@linux-mips.org, Paul Burton <paul.burton@mips.com>
Message-ID: <20180217201023.JYeJJ5nBNEI5G6BwUmhk746wd7529q_b27MXHK4SdQ0@z>

The Intel EG20T Platform Controller Hub is used on the MIPS Boston
development board to provide various peripherals including ethernet.
This series fixes some issues with the pch_gbe driver discovered whilst
in use on the Boston board, and implements support for device tree which
we use to provide the PHY reset GPIO.

Applies atop v4.16-rc1.

Hassan Naveed (1):
  net: pch_gbe: Fix TX RX descriptor accesses for big endian systems

Paul Burton (13):
  net: pch_gbe: Mark Minnow PHY reset GPIO active low
  net: pch_gbe: Pull PHY GPIO handling out of Minnow code
  dt-bindings: net: Document Intel pch_gbe binding
  net: pch_gbe: Add device tree support
  net: pch_gbe: Always reset PHY along with MAC
  net: pch_gbe: Allow longer for resets
  net: pch_gbe: Fix handling of TX padding
  net: pch_gbe: Fold pch_gbe_setup_[rt]ctl into pch_gbe_configure_[rt]x
  net: pch_gbe: Use pch_gbe_disable_dma_rx() in pch_gbe_configure_rx()
  net: pch_gbe: Disable TX DMA whilst configuring descriptors
  net: pch_gbe: Ensure DMA is ordered with descriptor writes
  ptp: pch: Allow build on MIPS platforms
  net: pch_gbe: Allow build on MIPS platforms

 Documentation/devicetree/bindings/net/pch_gbe.txt  |  25 ++
 drivers/net/ethernet/oki-semi/pch_gbe/Kconfig      |   2 +-
 drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe.h    |  27 +-
 .../net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c   | 283 ++++++++++++---------
 drivers/ptp/Kconfig                                |   2 +-
 5 files changed, 204 insertions(+), 135 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/pch_gbe.txt

-- 
2.16.1
