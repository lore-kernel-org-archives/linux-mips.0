Received: from mailapp01.imgtec.com ([195.59.15.196]:61399 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993866AbdF2OF1pYpTH (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 29 Jun 2017 16:05:27 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 1/1] MIPS: Avoid accidental raw backtrace
Date: Thu, 29 Jun 2017 15:05:04 +0100
Message-ID: <913e3161e788882af01f96be523b1b67ae549039.1498744803.git-series.james.hogan@imgtec.com>
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
To: Ralf Baechle <ralf@linux-mips.org>
Cc: James Hogan <james.hogan@imgtec.com>, linux-mips@linux-mips.org, stable@vger.kernel.org
Message-ID: <20170629140504.6Sdyf7qFGafqTseQUOBh0OsKnYDN0UFheRbU9Fwfxwc@z>

Since commit 81a76d7119f6 ("MIPS: Avoid using unwind_stack() with
usermode") show_backtrace() invokes the raw backtracer when
cp0_status & ST0_KSU indicates user mode to fix issues on EVA kernels
where user and kernel address spaces overlap.

However this is used by show_stack() which creates its own pt_regs on
the stack and leaves cp0_status uninitialised in most of the code paths.
This results in the non deterministic use of the raw back tracer
depending on the previous stack content.

show_stack() deals exclusively with kernel mode stacks anyway, so
explicitly initialise regs.cp0_status to KSU_KERNEL (i.e. 0) to ensure
we get a useful backtrace.

Fixes: 81a76d7119f6 ("MIPS: Avoid using unwind_stack() with usermode")
Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Cc: <stable@vger.kernel.org> # 3.15+
---
 arch/mips/kernel/traps.c | 2 ++
 1 file changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index 9681b5877140..38dfa27730ff 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -201,6 +201,8 @@ void show_stack(struct task_struct *task, unsigned long *sp)
 {
 	struct pt_regs regs;
 	mm_segment_t old_fs = get_fs();
+
+	regs.cp0_status = KSU_KERNEL;
 	if (sp) {
 		regs.regs[29] = (unsigned long)sp;
 		regs.regs[31] = 0;
-- 
git-series 0.8.10
