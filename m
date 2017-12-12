Received: from 9pmail.ess.barracuda.com ([64.235.150.224]:57999 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992391AbdLLJ6xT1SwC (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 12 Dec 2017 10:58:53 +0100
From: Matt Redfearn <matt.redfearn@mips.com>
Subject: [RFC PATCH 02/16] MIPS: bpf: Add emit_load_cpu helper to load current CPU ID
Date: Tue, 12 Dec 2017 09:57:48 +0000
Message-ID: <1513072682-1371-3-git-send-email-matt.redfearn@mips.com>
In-Reply-To: <1513072682-1371-1-git-send-email-matt.redfearn@mips.com>
References: <1513072682-1371-1-git-send-email-matt.redfearn@mips.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Matt.Redfearn@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20171212095748.ZinlDJPVrkamAhJ6S7DaHwPkw5LChDuA_8KGlO0BQjM@z>

Add a helper function to load rA with the current CPU ID. This replaces
the inline version. The SEEN_OFF flag appears redundant as the offset is
a compile time constant and can be inlined into the emitted load
instruction.

Signed-off-by: Matt Redfearn <matt.redfearn@mips.com>
---

 arch/mips/net/bpf_jit.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/arch/mips/net/bpf_jit.c b/arch/mips/net/bpf_jit.c
index 44b925005dd3..ae2ff1f08d5a 100644
--- a/arch/mips/net/bpf_jit.c
+++ b/arch/mips/net/bpf_jit.c
@@ -518,6 +518,14 @@ static inline void emit_jr(unsigned int reg, struct jit_ctx *ctx)
 	emit_instr(ctx, jr, reg);
 }
 
+static inline void emit_load_cpu(unsigned int reg, struct jit_ctx *ctx)
+{
+	/* A = current_thread_info()->cpu */
+	BUILD_BUG_ON(FIELD_SIZEOF(struct thread_info, cpu) != 4);
+	/* $28/gp points to the thread_info struct */
+	emit_load(reg, 28, offsetof(struct thread_info, cpu), ctx);
+}
+
 static inline u16 align_sp(unsigned int num)
 {
 	/* Double word alignment for 32-bit, quadword for 64-bit */
@@ -1115,14 +1123,9 @@ static int build_body(struct jit_ctx *ctx)
 			}
 #endif
 			break;
-		case BPF_ANC | SKF_AD_CPU:
-			ctx->flags |= SEEN_A | SEEN_OFF;
-			/* A = current_thread_info()->cpu */
-			BUILD_BUG_ON(FIELD_SIZEOF(struct thread_info,
-						  cpu) != 4);
-			off = offsetof(struct thread_info, cpu);
-			/* $28/gp points to the thread_info struct */
-			emit_load(r_A, 28, off, ctx);
+		case BPF_ANC |  SKF_AD_CPU:
+			ctx->flags |= SEEN_A;
+			emit_load_cpu(r_A, ctx);
 			break;
 		case BPF_ANC | SKF_AD_IFINDEX:
 			/* A = skb->dev->ifindex */
-- 
2.7.4
