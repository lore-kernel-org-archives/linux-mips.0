Received: from mailapp01.imgtec.com ([195.59.15.196]:60555 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007723AbbLDWZQhckqU (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 4 Dec 2015 23:25:16 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 2/2] MIPS: Avoid using unwind_stack() with usermode
Date: Fri, 4 Dec 2015 22:25:02 +0000
Message-ID: <1449267902-28674-3-git-send-email-james.hogan@imgtec.com>
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
Message-ID: <20151204222502.00YiNYKYFWOnMhAhMApeooDDgblX9_EESUYyHZ3YL1U@z>

When showing backtraces in response to traps, for example crashes and
address errors (usually unaligned accesses) when they are set in debugfs
to be reported, unwind_stack will be used if the PC was in the kernel
text address range. However since EVA it is possible for user and kernel
address ranges to overlap, and even without EVA userland can still
trigger an address error by jumping to a KSeg0 address.

Adjust the check to also ensure that it was running in kernel mode. I
don't believe any harm can come of this problem, since unwind_stack() is
sufficiently defensive, however it is only meant for unwinding kernel
code, so to be correct it should use the raw backtracing instead.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Cc: <stable@vger.kernel.org> # 3.15+
Signed-off-by: James Hogan <james.hogan@imgtec.com>
---
 arch/mips/kernel/traps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index 886cb1976e90..52ef4eb41f43 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -144,7 +144,7 @@ static void show_backtrace(struct task_struct *task, const struct pt_regs *regs)
 	if (!task)
 		task = current;
 
-	if (raw_show_trace || !__kernel_text_address(pc)) {
+	if (raw_show_trace || user_mode(regs) || !__kernel_text_address(pc)) {
 		show_raw_backtrace(sp);
 		return;
 	}
-- 
2.4.10
