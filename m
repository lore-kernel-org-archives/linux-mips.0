Received: from mail-gw1-out.broadcom.com ([216.31.210.62]:2763 "EHLO
        mail-gw1-out.broadcom.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27010208AbbAGLVZbfgOd (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 7 Jan 2015 12:21:25 +0100
From: Jayachandran C <jchandra@broadcom.com>
Subject: [PATCH 03/17] MIPS: Netlogic: Fix cop0 prid check in AHCI init
Date: Wed, 7 Jan 2015 16:58:24 +0530
Message-ID: <1420630118-17198-4-git-send-email-jchandra@broadcom.com>
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
Message-ID: <20150107112824.i66KOKG2ljfP5JcDf2Jk2vpqqSxDxjX_P6_qAy9n9sw@z>

From: Ganesan Ramalingam <ganesanr@broadcom.com>

PRID register should be masked with IMP_MASK to get processor ID.

Signed-off-by: Ganesan Ramalingam <ganesanr@broadcom.com>
Signed-off-by: Jayachandran C <jchandra@broadcom.com>
---
 arch/mips/netlogic/xlp/ahci-init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/netlogic/xlp/ahci-init.c b/arch/mips/netlogic/xlp/ahci-init.c
index a9d0fae..92be1a3 100644
--- a/arch/mips/netlogic/xlp/ahci-init.c
+++ b/arch/mips/netlogic/xlp/ahci-init.c
@@ -151,7 +151,7 @@ static void nlm_sata_firmware_init(int node)
 static int __init nlm_ahci_init(void)
 {
 	int node = 0;
-	int chip = read_c0_prid() & PRID_REV_MASK;
+	int chip = read_c0_prid() & PRID_IMP_MASK;
 
 	if (chip == PRID_IMP_NETLOGIC_XLP3XX)
 		nlm_sata_firmware_init(node);
-- 
1.9.1
