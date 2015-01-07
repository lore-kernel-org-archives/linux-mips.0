Received: from mail-gw3-out.broadcom.com ([216.31.210.64]:25072 "EHLO
        mail-gw3-out.broadcom.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27010419AbbAGLV040MM2 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 7 Jan 2015 12:21:26 +0100
From: Jayachandran C <jchandra@broadcom.com>
Subject: [PATCH 05/17] MIPS: Netlogic: Fix for SATA PHY init
Date: Wed, 7 Jan 2015 16:58:26 +0530
Message-ID: <1420630118-17198-6-git-send-email-jchandra@broadcom.com>
In-Reply-To: <1420630118-17198-1-git-send-email-jchandra@broadcom.com>
References: <1420630118-17198-1-git-send-email-jchandra@broadcom.com>
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
Cc: Ganesan Ramalingam <ganesanr@broadcom.com>, ralf@linux-mips.org, Jayachandran C <jchandra@broadcom.com>
Message-ID: <20150107112826.aRDsCxy1CEz0MK5nZqGYKwGYRbA8PJzOdCkVBE2WGHo@z>

From: Ganesan Ramalingam <ganesanr@broadcom.com>

Update to the SATA PHY initialization. This is needed for SATA detection
to succeed in all configurations.

Signed-off-by: Ganesan Ramalingam <ganesanr@broadcom.com>
Signed-off-by: Jayachandran C <jchandra@broadcom.com>
---
 arch/mips/netlogic/xlp/ahci-init-xlp2.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/mips/netlogic/xlp/ahci-init-xlp2.c b/arch/mips/netlogic/xlp/ahci-init-xlp2.c
index c83dbf3..7b066a4 100644
--- a/arch/mips/netlogic/xlp/ahci-init-xlp2.c
+++ b/arch/mips/netlogic/xlp/ahci-init-xlp2.c
@@ -203,6 +203,7 @@ static u8 read_phy_reg(u64 regbase, u32 addr, u32 physel)
 static void config_sata_phy(u64 regbase)
 {
 	u32 port, i, reg;
+	u8 val;
 
 	for (port = 0; port < 2; port++) {
 		for (i = 0, reg = RXCDRCALFOSC0; reg <= CALDUTY; reg++, i++)
@@ -210,6 +211,18 @@ static void config_sata_phy(u64 regbase)
 
 		for (i = 0, reg = RXDPIF; reg <= PPMDRIFTMAX_HI; reg++, i++)
 			write_phy_reg(regbase, reg, port, sata_phy_config2[i]);
+
+		/* Fix for PHY link up failures at lower temperatures */
+		write_phy_reg(regbase, 0x800F, port, 0x1f);
+
+		val = read_phy_reg(regbase, 0x0029, port);
+		write_phy_reg(regbase, 0x0029, port, val | (0x7 << 1));
+
+		val = read_phy_reg(regbase, 0x0056, port);
+		write_phy_reg(regbase, 0x0056, port, val & ~(1 << 3));
+
+		val = read_phy_reg(regbase, 0x0018, port);
+		write_phy_reg(regbase, 0x0018, port, val & ~(0x7 << 0));
 	}
 }
 
-- 
1.9.1
