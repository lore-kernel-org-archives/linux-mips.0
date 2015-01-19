Received: from mailapp01.imgtec.com ([195.59.15.196]:43318 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011795AbbASMeBHq8pn (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 19 Jan 2015 13:34:01 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 6DF97F3B9572
        for <linux-mips@linux-mips.org>; Mon, 19 Jan 2015 12:33:52 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH RFC v3 40/70] MIPS: mm: page: Add MIPS R6 support
Date: Mon, 19 Jan 2015 12:33:50 +0000
Message-ID: <1421670830-24463-1-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <54BA4E7F.5020208@cogentembedded.com>
References: <54BA4E7F.5020208@cogentembedded.com>
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
Message-ID: <20150119123350.uphOyd5_BYSLrh8a8qB7DK4LOimTNlcj685L0d4Ds4M@z>

The MIPS R6 pref instruction only has 9 bits for the immediate
field so skip the micro-assembler PREF instruction if the offset
does not fit in 9 bits. Moreover, bit 30 (Pref_PrepareForStore) is
no longer valid in MIPS R6, so we change the default for all MIPS R6
processors to bit 5 (Pref_StoreStreamed).

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/mm/page.c | 30 ++++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/arch/mips/mm/page.c b/arch/mips/mm/page.c
index b611102e23b5..152b5d300f0c 100644
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
+		if (d <= 0x1ff && d >= -0x200)	\
+			uasm_i_pref(a, b, c, d);\
+	} else {				\
+		uasm_i_pref(a, b, c, d);	\
+	}					\
+} while(0)
+
 static int pref_bias_clear_store;
 static int pref_bias_copy_load;
 static int pref_bias_copy_store;
@@ -178,7 +192,15 @@ static void set_prefetch_parameters(void)
 			pref_bias_copy_load = 256;
 			pref_bias_copy_store = 128;
 			pref_src_mode = Pref_LoadStreamed;
-			pref_dst_mode = Pref_PrepareForStore;
+			if (cpu_has_mips_r6)
+				/*
+				 * Bit 30 (Pref_PrepareForStore) has been
+				 * removed from MIPS R6. Use bit 5
+				 * (Pref_StoreStreamed).
+				 */
+				pref_dst_mode = Pref_StoreStreamed;
+			else
+				pref_dst_mode = Pref_PrepareForStore;
 			break;
 		}
 	} else {
@@ -214,7 +236,7 @@ static inline void build_clear_pref(u32 **buf, int off)
 		return;
 
 	if (pref_bias_clear_store) {
-		uasm_i_pref(buf, pref_dst_mode, pref_bias_clear_store + off,
+		_uasm_i_pref(buf, pref_dst_mode, pref_bias_clear_store + off,
 			    A0);
 	} else if (cache_line_size == (half_clear_loop_size << 1)) {
 		if (cpu_has_cache_cdex_s) {
@@ -357,7 +379,7 @@ static inline void build_copy_load_pref(u32 **buf, int off)
 		return;
 
 	if (pref_bias_copy_load)
-		uasm_i_pref(buf, pref_src_mode, pref_bias_copy_load + off, A1);
+		_uasm_i_pref(buf, pref_src_mode, pref_bias_copy_load + off, A1);
 }
 
 static inline void build_copy_store_pref(u32 **buf, int off)
@@ -366,7 +388,7 @@ static inline void build_copy_store_pref(u32 **buf, int off)
 		return;
 
 	if (pref_bias_copy_store) {
-		uasm_i_pref(buf, pref_dst_mode, pref_bias_copy_store + off,
+		_uasm_i_pref(buf, pref_dst_mode, pref_bias_copy_store + off,
 			    A0);
 	} else if (cache_line_size == (half_copy_loop_size << 1)) {
 		if (cpu_has_cache_cdex_s) {
-- 
2.2.1
