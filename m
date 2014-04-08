Received: from elvis.franken.de ([193.175.24.41]:51931 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6822100AbaDHG6LiE8si (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 8 Apr 2014 08:58:11 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [PATCH] Fix Micro-assembler field overflow for R4600 V2
Message-ID: <20140408065801.C125C1BB731@solo.franken.de>
Date: Tue,  8 Apr 2014 08:58:01 +0200 (CEST)
Return-Path: <tsbogend@alpha.franken.de>
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
Cc: ralf@linux-mips.org
Message-ID: <20140408065801.RSr-RCEMPeIjJDwdDnkTq6MPKx2BbGpxj4CrNA_mU8g@z>

Fix uasm warning, which triggered because of workaround for R4600 V2 CPUs.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---

 arch/mips/mm/page.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/mm/page.c b/arch/mips/mm/page.c
index 58033c4..b611102 100644
--- a/arch/mips/mm/page.c
+++ b/arch/mips/mm/page.c
@@ -273,7 +273,7 @@ void build_clear_page(void)
 		uasm_i_ori(&buf, A2, A0, off);
 
 	if (R4600_V2_HIT_CACHEOP_WAR && cpu_is_r4600_v2_x())
-		uasm_i_lui(&buf, AT, 0xa000);
+		uasm_i_lui(&buf, AT, uasm_rel_hi(0xa0000000));
 
 	off = cache_line_size ? min(8, pref_bias_clear_store / cache_line_size)
 				* cache_line_size : 0;
@@ -424,7 +424,7 @@ void build_copy_page(void)
 		uasm_i_ori(&buf, A2, A0, off);
 
 	if (R4600_V2_HIT_CACHEOP_WAR && cpu_is_r4600_v2_x())
-		uasm_i_lui(&buf, AT, 0xa000);
+		uasm_i_lui(&buf, AT, uasm_rel_hi(0xa0000000));
 
 	off = cache_line_size ? min(8, pref_bias_copy_load / cache_line_size) *
 				cache_line_size : 0;
