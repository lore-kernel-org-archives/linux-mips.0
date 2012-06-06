Received: from mail-pz0-f49.google.com ([209.85.210.49]:61115 "EHLO
        mail-pz0-f49.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1903717Ab2FFX2p (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 7 Jun 2012 01:28:45 +0200
From: David Daney <ddaney.cavm@gmail.com>
Subject: [PATCH v3 0/5] MIPS: OCTEON: Convert some device to use Device Tree.
Date: Wed,  6 Jun 2012 16:28:29 -0700
Message-ID: <1339025314-24216-1-git-send-email-ddaney.cavm@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
Return-Path: <linux-mips-bounce@linux-mips.org>
To: linux-mips@linux-mips.org, ralf@linux-mips.org, devicetree-discuss@lists.ozlabs.org, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>
Cc: linux-kernel@vger.kernel.org, David Daney <david.daney@cavium.com>
Message-ID: <20120606232829.fLRZD56tynHJUVW8nFFJrXHD1E2d_aPLJ3NETCI1pPw@z>

From: David Daney <david.daney@cavium.com>

This patch set depends on the previous set to add Device Tree to
OCTEON.  That set can be found among other places here:

http://www.linux-mips.org/archives/linux-mips/2012-06/msg00081.html

For v3:

No functional changes, Added more Acked-bys, rebased to avoid merge
conflicts.

For v2:

No functional changes, but minor clean-ups to use some new device tree
helper functions.

Some Acked-bys added.

I am suggesting that all these go via Ralf's linux-mips.org tree as
they depend on other patches in that tree.

From v1:

The patches are for drivers scattered throughout the tree, but there
is an order dependency as well as the dependency mentioned above, so
it may be preferable to merge them all via Ralf's linux-mips.org tree
rather that separately via the various device sub-system maintainers.

The mdio-octeon.c and octeon_mgmt patches were already Acked-by davem.

The i2c has been seen before, but to my knowledge was never acked.

The octeon_ethernet patch is in staging and has also been seen before.

The serial patch is new.

David Daney (5):
  i2c: Convert i2c-octeon.c to use device tree.
  netdev: mdio-octeon.c: Convert to use device tree.
  netdev: octeon_mgmt: Convert to use device tree.
  staging: octeon_ethernet: Convert to use device tree.
  MIPS: Octeon: Use device tree to register serial ports.

 arch/mips/cavium-octeon/octeon-irq.c      |    8 -
 arch/mips/cavium-octeon/octeon-platform.c |  176 ----------------
 arch/mips/cavium-octeon/serial.c          |  134 +++++--------
 arch/mips/include/asm/octeon/octeon.h     |    5 -
 drivers/i2c/busses/i2c-octeon.c           |   92 +++++----
 drivers/net/ethernet/octeon/octeon_mgmt.c |  312 +++++++++++++++++++----------
 drivers/net/phy/mdio-octeon.c             |   92 ++++++---
 drivers/staging/octeon/ethernet-mdio.c    |   28 ++--
 drivers/staging/octeon/ethernet.c         |  153 +++++++++-----
 drivers/staging/octeon/octeon-ethernet.h  |    3 +
 10 files changed, 484 insertions(+), 519 deletions(-)

-- 
1.7.2.3
