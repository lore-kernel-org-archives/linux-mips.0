Received: from mailapp01.imgtec.com ([195.59.15.196]:59477 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010035AbbGJPCnYf5Wp (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 10 Jul 2015 17:02:43 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 06/16] MIPS: skip odd double FP registers when copying FP32 sigcontext
Date: Fri, 10 Jul 2015 16:00:15 +0100
Message-ID: <1436540426-10021-7-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1436540426-10021-1-git-send-email-paul.burton@imgtec.com>
References: <1436540426-10021-1-git-send-email-paul.burton@imgtec.com>
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
Cc: Matthew Fortune <matthew.fortune@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>, Andy Lutomirski <luto@amacapital.net>, Ralf Baechle <ralf@linux-mips.org>, "Maciej W. Rozycki" <macro@codesourcery.com>
Message-ID: <20150710150015.WQgBLt-d9RTKg3RQi4aP0QBq-_f1EM8WitJWaYkkHMA@z>

When a task uses 32 bit floating point, the odd indexed 32b register
values are stored in bits 63:32 of the preceding even indexed 64b
FP register field in saved context. Thus there is no point in
preserving the odd indexed 64b register fields since they hold no
valid context. This patch will cause them to be skipped, as is
already done in arch/mips/kernel/signal32.c.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 arch/mips/kernel/signal.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/signal.c b/arch/mips/kernel/signal.c
index 76f9136..23913ad 100644
--- a/arch/mips/kernel/signal.c
+++ b/arch/mips/kernel/signal.c
@@ -69,8 +69,9 @@ static int copy_fp_to_sigcontext(void __user *sc)
 	uint32_t __user *csr = sc + abi->off_sc_fpc_csr;
 	int i;
 	int err = 0;
+	int inc = test_thread_flag(TIF_32BIT_FPREGS) ? 2 : 1;
 
-	for (i = 0; i < NUM_FPU_REGS; i++) {
+	for (i = 0; i < NUM_FPU_REGS; i += inc) {
 		err |=
 		    __put_user(get_fpr64(&current->thread.fpu.fpr[i], 0),
 			       &fpregs[i]);
@@ -87,9 +88,10 @@ static int copy_fp_from_sigcontext(void __user *sc)
 	uint32_t __user *csr = sc + abi->off_sc_fpc_csr;
 	int i;
 	int err = 0;
+	int inc = test_thread_flag(TIF_32BIT_FPREGS) ? 2 : 1;
 	u64 fpr_val;
 
-	for (i = 0; i < NUM_FPU_REGS; i++) {
+	for (i = 0; i < NUM_FPU_REGS; i += inc) {
 		err |= __get_user(fpr_val, &fpregs[i]);
 		set_fpr64(&current->thread.fpu.fpr[i], 0, fpr_val);
 	}
-- 
2.4.4
