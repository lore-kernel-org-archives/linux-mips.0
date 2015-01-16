Received: from mailapp01.imgtec.com ([195.59.15.196]:57789 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010770AbbAPKxXIeAVA (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 16 Jan 2015 11:53:23 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 59B4A82E44D79
        for <linux-mips@linux-mips.org>; Fri, 16 Jan 2015 10:53:15 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH RFC v2 40/70] MIPS: mm: page: Add MIPS R6 support
Date: Fri, 16 Jan 2015 10:49:19 +0000
Message-ID: <1421405389-15512-41-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1421405389-15512-1-git-send-email-markos.chandras@imgtec.com>
References: <1421405389-15512-1-git-send-email-markos.chandras@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Markos.Chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20150116104919.CkR461wMkYiAYiUiZSEeOEqS85CNI-q0ztyKW4OuVXs@z>

The MIPS R6 pref instruction only have 9 bits for the immediate
field so skip the micro-assembler PREF instruction is the offset
does not fit in 9 bits.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/mm/page.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/arch/mips/mm/page.c b/arch/mips/mm/page.c
index b611102e23b5..b84e0b2ce140 100644
--- a/arch/mips/mm/page.c
+++ b/arch/mips/mm/page.c
@@ -72,6 +72,20 @@ static struct uasm_reloc relocs[5];
 #define cpu_is_r4600_v1_x()	((read_c0_prid() & 0xfffffff0) == 0x00002010)
 #define cpu_is_r4600_v2_x()	((read_c0_prid() & 0xfffffff0) == 0x00002020)
 
+/*
+ * R6 has a limited offset of the pref instruction.
+ * Skip it if the offset is more than 9 bits.
+ */
+#define _uasm_i_pref(a, b, c, d)		\
+do {						\
+	if (cpu_has_mips_r6) {			\
+	    if ((d > 0xff) || (d < -0x100))	\
+		uasm_i_pref(a, b, c, d);	\
+	} else {				\
+		uasm_i_pref(a, b, c, d);	\
+	}					\
+} while(0)
+
 static int pref_bias_clear_store;
 static int pref_bias_copy_load;
 static int pref_bias_copy_store;
@@ -214,7 +228,7 @@ static inline void build_clear_pref(u32 **buf, int off)
 		return;
 
 	if (pref_bias_clear_store) {
-		uasm_i_pref(buf, pref_dst_mode, pref_bias_clear_store + off,
+		_uasm_i_pref(buf, pref_dst_mode, pref_bias_clear_store + off,
 			    A0);
 	} else if (cache_line_size == (half_clear_loop_size << 1)) {
 		if (cpu_has_cache_cdex_s) {
@@ -357,7 +371,7 @@ static inline void build_copy_load_pref(u32 **buf, int off)
 		return;
 
 	if (pref_bias_copy_load)
-		uasm_i_pref(buf, pref_src_mode, pref_bias_copy_load + off, A1);
+		_uasm_i_pref(buf, pref_src_mode, pref_bias_copy_load + off, A1);
 }
 
 static inline void build_copy_store_pref(u32 **buf, int off)
@@ -366,7 +380,7 @@ static inline void build_copy_store_pref(u32 **buf, int off)
 		return;
 
 	if (pref_bias_copy_store) {
-		uasm_i_pref(buf, pref_dst_mode, pref_bias_copy_store + off,
+		_uasm_i_pref(buf, pref_dst_mode, pref_bias_copy_store + off,
 			    A0);
 	} else if (cache_line_size == (half_copy_loop_size << 1)) {
 		if (cpu_has_cache_cdex_s) {
-- 
2.2.1
