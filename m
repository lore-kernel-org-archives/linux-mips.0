Received: from mailapp01.imgtec.com ([195.59.15.196]:18981 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993914AbdFBXlHnXWJ4 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 3 Jun 2017 01:41:07 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH v3 0/7] net: pch_gbe: Fixes & MIPS support
Date: Fri, 2 Jun 2017 16:40:35 -0700
Message-ID: <20170602234042.22782-1-paul.burton@imgtec.com>
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
To: netdev@vger.kernel.org
Cc: Tobias Klauser <tklauser@distanz.ch>, "David S . Miller" <davem@davemloft.net>, Jarod Wilson <jarod@redhat.com>, linux-mips@linux-mips.org, Eric Dumazet <edumazet@google.com>, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20170602234035.ywO83H5Ey9joxShd62QjnkCc9Shp2peBKPWkXomj49g@z>

The Intel EG20T Platform Controller Hub is used on the MIPS Boston
development board to provide various peripherals including ethernet.
This series fixes some issues with the pch_gbe driver discovered whilst
in use on the Boston board, and implements support for device tree which
we use to provide the PHY reset GPIO.

Applies atop v4.12-rc3.

Paul Burton (7):
  net: pch_gbe: Mark Minnow PHY reset GPIO active low
  net: pch_gbe: Pull PHY GPIO handling out of Minnow code
  dt-bindings: net: Document Intel pch_gbe binding
  net: pch_gbe: Add device tree support
  net: pch_gbe: Always reset PHY along with MAC
  net: pch_gbe: Allow longer for resets
  net: pch_gbe: Allow build on MIPS platforms

 Documentation/devicetree/bindings/net/pch_gbe.txt  | 25 +++++++
 drivers/net/ethernet/oki-semi/pch_gbe/Kconfig      |  2 +-
 drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe.h    |  4 +-
 .../net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c   | 79 +++++++++++++++++-----
 4 files changed, 91 insertions(+), 19 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/pch_gbe.txt

-- 
2.13.0
