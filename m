Received: from mailapp01.imgtec.com ([195.59.15.196]:60920 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27043847AbcFWQfAsn7Hz (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 23 Jun 2016 18:35:00 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 05/14] MIPS: uasm: Add r6 MUL encoding
Date: Thu, 23 Jun 2016 17:34:38 +0100
Message-ID: <1466699687-24791-6-git-send-email-james.hogan@imgtec.com>
In-Reply-To: <1466699687-24791-1-git-send-email-james.hogan@imgtec.com>
References: <1466699687-24791-1-git-send-email-james.hogan@imgtec.com>
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
To: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>, Ralf Baechle <ralf@linux-mips.org>
Cc: James Hogan <james.hogan@imgtec.com>, linux-mips@linux-mips.org
Message-ID: <20160623163438.dRbS1hUJhiycZBzE9Ar_97FyzfJyY0mkmu-ZLvsgXTw@z>

Add the R6 MUL instruction encoding for 3 operand signed multiply to
uasm so that KVM can use uasm for generating its entry point code at
runtime on R6.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---
 arch/mips/include/uapi/asm/inst.h | 44 +++++++++++++++++++++++++++++++++++++++
 arch/mips/mm/uasm-mips.c          |  4 ++++
 2 files changed, 48 insertions(+)

diff --git a/arch/mips/include/uapi/asm/inst.h b/arch/mips/include/uapi/asm/inst.h
index 6319c5037e66..fc96012c75d1 100644
--- a/arch/mips/include/uapi/asm/inst.h
+++ b/arch/mips/include/uapi/asm/inst.h
@@ -93,6 +93,50 @@ enum spec3_op {
 };
 
 /*
+ * Bits 10-6 minor opcode for r6 spec mult/div encodings
+ */
+enum mult_op {
+	mult_mult_op = 0x0,
+	mult_mul_op = 0x2,
+	mult_muh_op = 0x3,
+};
+enum multu_op {
+	multu_multu_op = 0x0,
+	multu_mulu_op = 0x2,
+	multu_muhu_op = 0x3,
+};
+enum div_op {
+	div_div_op = 0x0,
+	div_div6_op = 0x2,
+	div_mod_op = 0x3,
+};
+enum divu_op {
+	divu_divu_op = 0x0,
+	divu_divu6_op = 0x2,
+	divu_modu_op = 0x3,
+};
+enum dmult_op {
+	dmult_dmult_op = 0x0,
+	dmult_dmul_op = 0x2,
+	dmult_dmuh_op = 0x3,
+};
+enum dmultu_op {
+	dmultu_dmultu_op = 0x0,
+	dmultu_dmulu_op = 0x2,
+	dmultu_dmuhu_op = 0x3,
+};
+enum ddiv_op {
+	ddiv_ddiv_op = 0x0,
+	ddiv_ddiv6_op = 0x2,
+	ddiv_dmod_op = 0x3,
+};
+enum ddivu_op {
+	ddivu_ddivu_op = 0x0,
+	ddivu_ddivu6_op = 0x2,
+	ddivu_dmodu_op = 0x3,
+};
+
+/*
  * rt field of bcond opcodes.
  */
 enum rt_op {
diff --git a/arch/mips/mm/uasm-mips.c b/arch/mips/mm/uasm-mips.c
index 86a3c76a1ad8..cec524167822 100644
--- a/arch/mips/mm/uasm-mips.c
+++ b/arch/mips/mm/uasm-mips.c
@@ -121,7 +121,11 @@ static struct insn insn_table[] = {
 	{ insn_mthc0,  M(cop0_op, mthc0_op, 0, 0, 0, 0),  RT | RD | SET},
 	{ insn_mthi,  M(spec_op, 0, 0, 0, 0, mthi_op), RS },
 	{ insn_mtlo,  M(spec_op, 0, 0, 0, 0, mtlo_op), RS },
+#ifndef CONFIG_CPU_MIPSR6
 	{ insn_mul, M(spec2_op, 0, 0, 0, 0, mul_op), RS | RT | RD},
+#else
+	{ insn_mul, M(spec_op, 0, 0, 0, mult_mul_op, mult_op), RS | RT | RD},
+#endif
 	{ insn_ori,  M(ori_op, 0, 0, 0, 0, 0),	RS | RT | UIMM },
 	{ insn_or,  M(spec_op, 0, 0, 0, 0, or_op),  RS | RT | RD },
 #ifndef CONFIG_CPU_MIPSR6
-- 
2.4.10
