Received: from mailapp01.imgtec.com ([195.59.15.196]:31756 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010718AbcAROSdJXH3m (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 18 Jan 2016 15:18:33 +0100
From: Govindraj Raja <Govindraj.Raja@imgtec.com>
Subject: [PATCH] mips: scache: fix scache init with invalid line size.
Date: Mon, 18 Jan 2016 14:18:26 +0000
Message-ID: <1453126706-24299-1-git-send-email-Govindraj.Raja@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Govindraj.Raja@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, James Hogan <James.Hogan@imgtec.com>, James Hartley <James.Hartley@imgtec.com>
Message-ID: <20160118141826.yQoHsSFjLun1fjEinSy5L0Z9foZpBEdvtskybK1CeMg@z>

In current scache init cache line_size is determined from
cpu config register, however if there there no scache
then mips_sc_probe_cm3 function populates a invalid line_size of 2.

The invalid line_size can cause a NULL pointer deference
during r4k_dma_cache_inv as r4k_blast_scache is populated based on
line_size. Scache line_size of 2 is invalid option in r4k_blast_scache_setup.

This issue was faced during a MIPS I6400 based virtual platform bring up
where scache was not available in virtual platform model.

Signed-off-by: Govindraj Raja <Govindraj.Raja@imgtec.com>
---
 arch/mips/mm/sc-mips.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/mm/sc-mips.c b/arch/mips/mm/sc-mips.c
index 3bd0597..6e422bc 100644
--- a/arch/mips/mm/sc-mips.c
+++ b/arch/mips/mm/sc-mips.c
@@ -168,7 +168,8 @@ static int __init mips_sc_probe_cm3(void)
 
 	line_sz = cfg & CM_GCR_L2_CONFIG_LINE_SIZE_MSK;
 	line_sz >>= CM_GCR_L2_CONFIG_LINE_SIZE_SHF;
-	c->scache.linesz = 2 << line_sz;
+	if (line_sz)
+		c->scache.linesz = 2 << line_sz;
 
 	assoc = cfg & CM_GCR_L2_CONFIG_ASSOC_MSK;
 	assoc >>= CM_GCR_L2_CONFIG_ASSOC_SHF;
-- 
2.5.0
