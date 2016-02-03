Received: from mailapp01.imgtec.com ([195.59.15.196]:53953 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012220AbcBCMEiIzmIM (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 3 Feb 2016 13:04:38 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH v2 6/6] net: pch_gbe: Allow longer for resets
Date: Wed, 3 Feb 2016 12:02:44 +0000
Message-ID: <1454500964-6256-7-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1454500964-6256-1-git-send-email-paul.burton@imgtec.com>
References: <1454500964-6256-1-git-send-email-paul.burton@imgtec.com>
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
To: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@imgtec.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <20160203120244.Y0IIDphIM2zrzBLpHAkokRcT2RT3r0VtbjBL29R3udo@z>

Resets of the EG20T MAC on the MIPS Boston development board take longer
than the 1000 loops that pch_gbe_wait_clr_bit was performing. Bump up
the number of loops.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>

---

Changes in v2: None

 drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c b/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c
index 00ef83c..87994d2 100644
--- a/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c
+++ b/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c
@@ -321,7 +321,7 @@ static void pch_gbe_wait_clr_bit(void *reg, u32 bit)
 	u32 tmp;
 
 	/* wait busy */
-	tmp = 1000;
+	tmp = 10000;
 	while ((ioread32(reg) & bit) && --tmp)
 		cpu_relax();
 	if (!tmp)
-- 
2.7.0
