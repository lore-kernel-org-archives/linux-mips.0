Received: from mailapp01.imgtec.com ([195.59.15.196]:10013 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011341AbbG0UAf7IJiX (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 27 Jul 2015 22:00:35 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH v2 06/16] MIPS: skip odd double FP registers when copying FP32 sigcontext
Date: Mon, 27 Jul 2015 12:58:17 -0700
Message-ID: <1438027107-24420-7-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1438027107-24420-1-git-send-email-paul.burton@imgtec.com>
References: <1438027107-24420-1-git-send-email-paul.burton@imgtec.com>
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
Cc: Guenter Roeck <linux@roeck-us.net>, Matthew Fortune <matthew.fortune@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, Michael Ellerman <mpe@ellerman.id.au>, linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>, Andy Lutomirski <luto@amacapital.net>, Ralf Baechle <ralf@linux-mips.org>, "Maciej W. Rozycki" <macro@codesourcery.com>, Andrew Morton <akpm@linux-foundation.org>
Message-ID: <20150727195817.cHcq4oZlF1mfrexlX71OBPXQOdo9u7ts1SIdNtYBNyQ@z>

When a task uses 32 bit floating point, the odd indexed 32b register
values are stored in bits 63:32 of the preceding even indexed 64b
FP register field in saved context. Thus there is no point in
preserving the odd indexed 64b register fields since they hold no
valid context. This patch will cause them to be skipped, as is
already done in arch/mips/kernel/signal32.c.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

Changes in v2: None

 arch/mips/kernel/signal.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/signal.c b/arch/mips/kernel/signal.c
index 9c42c50..cc3a01f 100644
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
2.4.6
