Received: from mailapp01.imgtec.com ([195.59.15.196]:8372 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011610AbcAZQsAPRtiC (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 26 Jan 2016 17:48:00 +0100
From: Govindraj Raja <Govindraj.Raja@imgtec.com>
Subject: [PATCH v2] mips: scache: fix scache init with invalid line size.
Date: Tue, 26 Jan 2016 16:47:28 +0000
Message-ID: <1453826848-22283-1-git-send-email-Govindraj.Raja@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>, Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, James Hogan <James.Hogan@imgtec.com>, James Hartley <James.Hartley@imgtec.com>, Govindraj Raja <Govindraj.Raja@imgtec.com>
Message-ID: <20160126164728.KSNGy99t7olJQK2-2FYC4Li0J3wD3z13NDxf4SkaC2w@z>

In current scache init cache line_size is determined from
cpu config register, however if there there no scache
then mips_sc_probe_cm3 function populates a invalid line_size of 2.

The invalid line_size can cause a NULL pointer deference
during r4k_dma_cache_inv as r4k_blast_scache is populated based on
line_size. Scache line_size of 2 is invalid option in r4k_blast_scache_setup.

This issue was faced during a MIPS I6400 based virtual platform bring up
where scache was not available in virtual platform model.

Changes from v1:
	Avoid clearing of MIPS_CACHE_NOT_PRESENT if scache is absent
	https://patchwork.linux-mips.org/patch/12126/

Signed-off-by: Govindraj Raja <Govindraj.Raja@imgtec.com>
---
 arch/mips/mm/sc-mips.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/mips/mm/sc-mips.c b/arch/mips/mm/sc-mips.c
index 3bd0597..68c48f4 100644
--- a/arch/mips/mm/sc-mips.c
+++ b/arch/mips/mm/sc-mips.c
@@ -164,11 +164,13 @@ static int __init mips_sc_probe_cm3(void)
 
 	sets = cfg & CM_GCR_L2_CONFIG_SET_SIZE_MSK;
 	sets >>= CM_GCR_L2_CONFIG_SET_SIZE_SHF;
-	c->scache.sets = 64 << sets;
+	if (sets)
+		c->scache.sets = 64 << sets;
 
 	line_sz = cfg & CM_GCR_L2_CONFIG_LINE_SIZE_MSK;
 	line_sz >>= CM_GCR_L2_CONFIG_LINE_SIZE_SHF;
-	c->scache.linesz = 2 << line_sz;
+	if (line_sz)
+		c->scache.linesz = 2 << line_sz;
 
 	assoc = cfg & CM_GCR_L2_CONFIG_ASSOC_MSK;
 	assoc >>= CM_GCR_L2_CONFIG_ASSOC_SHF;
@@ -176,7 +178,8 @@ static int __init mips_sc_probe_cm3(void)
 	c->scache.waysize = c->scache.sets * c->scache.linesz;
 	c->scache.waybit = __ffs(c->scache.waysize);
 
-	c->scache.flags &= ~MIPS_CACHE_NOT_PRESENT;
+	if (c->scache.linesz)
+		c->scache.flags &= ~MIPS_CACHE_NOT_PRESENT;
 
 	return 1;
 }
-- 
2.5.0
