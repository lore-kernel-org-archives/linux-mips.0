Received: from mailapp01.imgtec.com ([195.59.15.196]:63866 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6818465AbaGWJAYeoAeg (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 23 Jul 2014 11:00:24 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 0B5A154531EC4
        for <linux-mips@linux-mips.org>; Wed, 23 Jul 2014 10:00:15 +0100 (IST)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH] MIPS: bpf: Add new emit_long_instr macro
Date: Wed, 23 Jul 2014 10:00:09 +0100
Message-ID: <1406106009-6520-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20140723090009.BKCP_FShtXteyZraRStQyMd_YURYeELvjPjOJoOFsUQ@z>

This macro uses the capitalized UASM_* macros to emit 32 or 64-bit
instructions depending on the kernel configurations. This allows
us to remove a few CONFIG_64BIT ifdefs from the code.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/net/bpf_jit.c | 51 ++++++++++++++++++-------------------------------
 1 file changed, 19 insertions(+), 32 deletions(-)

diff --git a/arch/mips/net/bpf_jit.c b/arch/mips/net/bpf_jit.c
index b87390a56a2f..0819b3135f78 100644
--- a/arch/mips/net/bpf_jit.c
+++ b/arch/mips/net/bpf_jit.c
@@ -163,6 +163,19 @@ do {							\
 	(ctx)->idx++;					\
 } while (0)
 
+/*
+ * Similar to emit_instr but it must be used when we need to emit
+ * 32-bit or 64-bit instructions
+ */
+#define emit_long_instr(ctx, func, ...)			\
+do {							\
+	if ((ctx)->target != NULL) {			\
+		u32 *p = &(ctx)->target[ctx->idx];	\
+		UASM_i_##func(&p, ##__VA_ARGS__);	\
+	}						\
+	(ctx)->idx++;					\
+} while (0)
+
 /* Determine if immediate is within the 16-bit signed range */
 static inline bool is_range16(s32 imm)
 {
@@ -218,13 +231,6 @@ static inline void emit_ori(unsigned int dst, unsigned src, u32 imm,
 	}
 }
 
-
-static inline void emit_daddu(unsigned int dst, unsigned int src1,
-			      unsigned int src2, struct jit_ctx *ctx)
-{
-	emit_instr(ctx, daddu, dst, src1, src2);
-}
-
 static inline void emit_daddiu(unsigned int dst, unsigned int src,
 			       int imm, struct jit_ctx *ctx)
 {
@@ -283,11 +289,7 @@ static inline void emit_xori(ptr dst, ptr src, u32 imm, struct jit_ctx *ctx)
 
 static inline void emit_stack_offset(int offset, struct jit_ctx *ctx)
 {
-	if (config_enabled(CONFIG_64BIT))
-		emit_instr(ctx, daddiu, r_sp, r_sp, offset);
-	else
-		emit_instr(ctx, addiu, r_sp, r_sp, offset);
-
+	emit_long_instr(ctx, ADDIU, r_sp, r_sp, offset);
 }
 
 static inline void emit_subu(unsigned int dst, unsigned int src1,
@@ -365,10 +367,7 @@ static inline void emit_store_stack_reg(ptr reg, ptr base,
 					unsigned int offset,
 					struct jit_ctx *ctx)
 {
-	if (config_enabled(CONFIG_64BIT))
-		emit_instr(ctx, sd, reg, offset, base);
-	else
-		emit_instr(ctx, sw, reg, offset, base);
+	emit_long_instr(ctx, SW, reg, offset, base);
 }
 
 static inline void emit_store(ptr reg, ptr base, unsigned int offset,
@@ -381,10 +380,7 @@ static inline void emit_load_stack_reg(ptr reg, ptr base,
 				       unsigned int offset,
 				       struct jit_ctx *ctx)
 {
-	if (config_enabled(CONFIG_64BIT))
-		emit_instr(ctx, ld, reg, offset, base);
-	else
-		emit_instr(ctx, lw, reg, offset, base);
+	emit_long_instr(ctx, LW, reg, offset, base);
 }
 
 static inline void emit_load(unsigned int reg, unsigned int base,
@@ -458,10 +454,7 @@ static inline void emit_load_ptr(unsigned int dst, unsigned int src,
 				     int imm, struct jit_ctx *ctx)
 {
 	/* src contains the base addr of the 32/64-pointer */
-	if (config_enabled(CONFIG_64BIT))
-		emit_instr(ctx, ld, dst, imm, src);
-	else
-		emit_instr(ctx, lw, dst, imm, src);
+	emit_long_instr(ctx, LW, dst, imm, src);
 }
 
 /* load a function pointer to register */
@@ -483,10 +476,7 @@ static inline void emit_load_func(unsigned int reg, ptr imm,
 /* Move to real MIPS register */
 static inline void emit_reg_move(ptr dst, ptr src, struct jit_ctx *ctx)
 {
-	if (config_enabled(CONFIG_64BIT))
-		emit_daddu(dst, src, r_zero, ctx);
-	else
-		emit_addu(dst, src, r_zero, ctx);
+	emit_long_instr(ctx, ADDU, dst, src, r_zero);
 }
 
 /* Move to JIT (32-bit) register */
@@ -623,10 +613,7 @@ static void save_bpf_jit_regs(struct jit_ctx *ctx, unsigned offset)
 	if (ctx->flags & SEEN_MEM) {
 		if (real_off % (RSIZE * 2))
 			real_off += RSIZE;
-		if (config_enabled(CONFIG_64BIT))
-			emit_daddiu(r_M, r_sp, real_off, ctx);
-		else
-			emit_addiu(r_M, r_sp, real_off, ctx);
+		emit_long_instr(ctx, ADDIU, r_M, r_sp, real_off);
 	}
 }
 
-- 
2.0.2
