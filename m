Received: from mailapp01.imgtec.com ([195.59.15.196]:59270 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007714AbbLDWZQLeQkU (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 4 Dec 2015 23:25:16 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 1/2] MIPS: Don't unwind to user mode with EVA
Date: Fri, 4 Dec 2015 22:25:01 +0000
Message-ID: <1449267902-28674-2-git-send-email-james.hogan@imgtec.com>
In-Reply-To: <1449267902-28674-1-git-send-email-james.hogan@imgtec.com>
References: <1449267902-28674-1-git-send-email-james.hogan@imgtec.com>
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
To: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Cc: James Hogan <james.hogan@imgtec.com>, Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, stable@vger.kernel.org
Message-ID: <20151204222501.0sveNRPlZmgocifvJ0sxkJ-7Pn22yWiGefJUHFjlDa0@z>

When unwinding through IRQs and exceptions, the unwinding only continues
if the PC is a kernel text address, however since EVA it is possible for
user and kernel address ranges to overlap, potentially allowing
unwinding to continue to user mode if the user PC happens to be in the
kernel text address range.

Adjust the check to also ensure that the register state from before the
exception is actually running in kernel mode, i.e. !user_mode(regs).

I don't believe any harm can come of this problem, since the PC is only
output, the stack pointer is checked to ensure it resides within the
task's stack page before it is dereferenced in search of the return
address, and the return address register is similarly only output (if
the PC is in a leaf function or the beginning of a non-leaf function).

However unwind_stack() is only meant for unwinding kernel code, so to be
correct the unwind should stop there.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Cc: <stable@vger.kernel.org> # 3.15+
---
 arch/mips/kernel/process.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kernel/process.c b/arch/mips/kernel/process.c
index f2975d4d1e44..6b3ae73cda3f 100644
--- a/arch/mips/kernel/process.c
+++ b/arch/mips/kernel/process.c
@@ -457,7 +457,7 @@ unsigned long notrace unwind_stack_by_address(unsigned long stack_page,
 		    *sp + sizeof(*regs) <= stack_page + THREAD_SIZE - 32) {
 			regs = (struct pt_regs *)*sp;
 			pc = regs->cp0_epc;
-			if (__kernel_text_address(pc)) {
+			if (!user_mode(regs) && __kernel_text_address(pc)) {
 				*sp = regs->regs[29];
 				*ra = regs->regs[31];
 				return pc;
-- 
2.4.10
