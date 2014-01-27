Received: from multi.imgtec.com ([194.200.65.239]:4458 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6817294AbaA0P1PlAdwZ (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 27 Jan 2014 16:27:15 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 06/15] mips: clear upper bits of FP registers on emulator writes
Date: Mon, 27 Jan 2014 15:23:05 +0000
Message-ID: <1390836194-26286-7-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1390836194-26286-1-git-send-email-paul.burton@imgtec.com>
References: <1390836194-26286-1-git-send-email-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>
Message-ID: <20140127152305.MdSo7t7nmPxlxuwHb31tSOVAqt-yBKwieMoEakW1wCo@z>

The upper bits of an FP register are architecturally defined as
unpredictable following an instructions which only writes the lower
bits. The prior behaviour of the kernel is to leave them unmodified.
This patch modifies that to clear the upper bits to zero. This is what
the MSA architecture reference manual specifies should happen for its
wider registers and is still permissible for scalar FP instructions
given the bits unpredictability there.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---
 arch/mips/math-emu/cp1emu.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/arch/mips/math-emu/cp1emu.c b/arch/mips/math-emu/cp1emu.c
index 9144842..c484f5f 100644
--- a/arch/mips/math-emu/cp1emu.c
+++ b/arch/mips/math-emu/cp1emu.c
@@ -884,20 +884,35 @@ static inline int cop1_64bit(struct pt_regs *xcp)
 } while (0)
 
 #define SITOREG(si, x) do {						\
-	if (cop1_64bit(xcp))						\
+	if (cop1_64bit(xcp)) {						\
+		unsigned i;						\
 		set_fpr32(&ctx->fpr[x], 0, si);				\
-	else								\
+		for (i = 1; i < ARRAY_SIZE(ctx->fpr[x].val32); i++)	\
+			set_fpr32(&ctx->fpr[x], i, 0);			\
+	} else {							\
 		set_fpr32(&ctx->fpr[(x) & ~1], (x) & 1, si);		\
+	}								\
 } while (0)
 
 #define SIFROMHREG(si, x)	((si) = get_fpr32(&ctx->fpr[x], 1))
-#define SITOHREG(si, x)		set_fpr32(&ctx->fpr[x], 1, si)
+
+#define SITOHREG(si, x) do {						\
+	unsigned i;							\
+	set_fpr32(&ctx->fpr[x], 1, si);					\
+	for (i = 2; i < ARRAY_SIZE(ctx->fpr[x].val32); i++)		\
+			set_fpr32(&ctx->fpr[x], i, 0);			\
+} while (0)
 
 #define DIFROMREG(di, x) \
 	((di) = get_fpr64(&ctx->fpr[(x) & ~(cop1_64bit(xcp) == 0)], 0))
 
-#define DITOREG(di, x) \
-	set_fpr64(&ctx->fpr[(x) & ~(cop1_64bit(xcp) == 0)], 0, di)
+#define DITOREG(di, x) do {						\
+	unsigned fpr, i;						\
+	fpr = (x) & ~(cop1_64bit(xcp) == 0);				\
+	set_fpr64(&ctx->fpr[fpr], 0, di);				\
+	for (i = 1; i < ARRAY_SIZE(ctx->fpr[x].val64); i++)		\
+		set_fpr64(&ctx->fpr[fpr], i, 0);			\
+} while (0)
 
 #define SPFROMREG(sp, x) SIFROMREG((sp).bits, x)
 #define SPTOREG(sp, x)	SITOREG((sp).bits, x)
-- 
1.8.5.3
