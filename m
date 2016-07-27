Received: from mailapp01.imgtec.com ([195.59.15.196]:26854 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992316AbcG0PIQ7WzL3 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 27 Jul 2016 17:08:16 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH] MIPS: Print segment physical address when EU=1
Date: Wed, 27 Jul 2016 16:07:54 +0100
Message-ID: <1469632074-1554-1-git-send-email-james.hogan@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <James.Hogan@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: James Hogan <james.hogan@imgtec.com>, linux-mips@linux-mips.org
Message-ID: <20160727150754.PF6JdvGawPmZIOGvCa6Ebqd4Htsv49RjvWCBx6cINvA@z>

Currently the debugfs interface to print the segment configuration
refuses to print the physical address of mapped segments. However if the
EU bit is set these become unmapped at error level (when
CP0_Status.ERL=1), so the physical address is still relevant.

Update the logic to print the physical address of mapped segments when
the EU bit is set, while still hiding the Cache Coherency Attribute
(since EU overrides that to uncached when ERL=1 too).

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---
 arch/mips/kernel/segment.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/mips/kernel/segment.c b/arch/mips/kernel/segment.c
index 87bc74a5a518..2703f218202e 100644
--- a/arch/mips/kernel/segment.c
+++ b/arch/mips/kernel/segment.c
@@ -26,17 +26,20 @@ static void build_segment_config(char *str, unsigned int cfg)
 
 	/*
 	 * Access modes MK, MSK and MUSK are mapped segments. Therefore
-	 * there is no direct physical address mapping.
+	 * there is no direct physical address mapping unless it becomes
+	 * unmapped uncached at error level due to EU.
 	 */
-	if ((am == 0) || (am > 3)) {
+	if ((am == 0) || (am > 3) || (cfg & MIPS_SEGCFG_EU))
 		str += sprintf(str, "         %03lx",
 			((cfg & MIPS_SEGCFG_PA) >> MIPS_SEGCFG_PA_SHIFT));
+	else
+		str += sprintf(str, "         UND");
+
+	if ((am == 0) || (am > 3))
 		str += sprintf(str, "         %01ld",
 			((cfg & MIPS_SEGCFG_C) >> MIPS_SEGCFG_C_SHIFT));
-	} else {
-		str += sprintf(str, "         UND");
+	else
 		str += sprintf(str, "         U");
-	}
 
 	/* Exception configuration. */
 	str += sprintf(str, "       %01ld\n",
-- 
2.7.3
