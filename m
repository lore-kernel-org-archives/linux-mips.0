Received: from mailapp01.imgtec.com ([195.59.15.196]:58591 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008674AbbFVLVoZ4YF3 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 22 Jun 2015 13:21:44 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH v3 1/3] MIPS: declare MSA MI10 instruction formats
Date: Mon, 22 Jun 2015 12:20:58 +0100
Message-ID: <1434972060-8865-2-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1434972060-8865-1-git-send-email-paul.burton@imgtec.com>
References: <1434972060-8865-1-git-send-email-paul.burton@imgtec.com>
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
To: linux-mips@linux-mips.org
Cc: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, "Steven J. Hill" <Steven.Hill@imgtec.com>, linux-kernel@vger.kernel.org, Markos Chandras <markos.chandras@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20150622112058.DaxVMkPtLIhQel4NXpqLz6E6gdXO87xaWKDkRp-wz1U@z>

From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>

Declare a struct describing the MSA MI10 instruction format used for ld
& st instructions, for use by subsequent patches.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

Changes in v3:
- Split this out into a separate patch

Changes in v2: None

 arch/mips/include/uapi/asm/inst.h | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/uapi/asm/inst.h b/arch/mips/include/uapi/asm/inst.h
index fc0cf5a..3dce80e 100644
--- a/arch/mips/include/uapi/asm/inst.h
+++ b/arch/mips/include/uapi/asm/inst.h
@@ -26,7 +26,7 @@ enum major_op {
 	cop0_op, cop1_op, cop2_op, cop1x_op,
 	beql_op, bnel_op, blezl_op, bgtzl_op,
 	daddi_op, cbcond1_op = daddi_op, daddiu_op, ldl_op, ldr_op,
-	spec2_op, jalx_op, mdmx_op, spec3_op,
+	spec2_op, jalx_op, mdmx_op, msa_op = mdmx_op, spec3_op,
 	lb_op, lh_op, lwl_op, lw_op,
 	lbu_op, lhu_op, lwr_op, lwu_op,
 	sb_op, sh_op, swl_op, sw_op,
@@ -221,6 +221,24 @@ enum bshfl_func {
 };
 
 /*
+ * func field for MSA MI10 format.
+ */
+enum msa_mi10_func {
+	msa_ld_op = 8,
+	msa_st_op = 9,
+};
+
+/*
+ * MSA 2 bit format fields.
+ */
+enum msa_2b_fmt {
+	msa_fmt_b = 0,
+	msa_fmt_h = 1,
+	msa_fmt_w = 2,
+	msa_fmt_d = 3,
+};
+
+/*
  * (microMIPS) Major opcodes.
  */
 enum mm_major_op {
@@ -611,6 +629,16 @@ struct v_format {				/* MDMX vector format */
 	;)))))))
 };
 
+struct msa_mi10_format {		/* MSA MI10 */
+	__BITFIELD_FIELD(unsigned int opcode : 6,
+	__BITFIELD_FIELD(signed int s10 : 10,
+	__BITFIELD_FIELD(unsigned int rs : 5,
+	__BITFIELD_FIELD(unsigned int wd : 5,
+	__BITFIELD_FIELD(unsigned int func : 4,
+	__BITFIELD_FIELD(unsigned int df : 2,
+	;))))))
+};
+
 struct spec3_format {   /* SPEC3 */
 	__BITFIELD_FIELD(unsigned int opcode:6,
 	__BITFIELD_FIELD(unsigned int rs:5,
@@ -888,6 +916,7 @@ union mips_instruction {
 	struct p_format p_format;
 	struct f_format f_format;
 	struct ma_format ma_format;
+	struct msa_mi10_format msa_mi10_format;
 	struct b_format b_format;
 	struct ps_format ps_format;
 	struct v_format v_format;
-- 
2.4.2
