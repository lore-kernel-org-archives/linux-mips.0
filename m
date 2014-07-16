Received: from mail-pd0-f176.google.com ([209.85.192.176]:57162 "EHLO
        mail-pd0-f176.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6861108AbaGPBLOyaJ8D (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 16 Jul 2014 03:11:14 +0200
From: Huacai Chen <chenhc@lemote.com>
Subject: [PATCH V2] MIPS: Don't BUG_ON(!is_fpu_owner()) in do_ade()
Date: Wed, 16 Jul 2014 09:19:16 +0800
Message-ID: <1405473556-8353-1-git-send-email-chenhc@lemote.com>
Return-Path: <chenhuacai@gmail.com>
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
Cc: John Crispin <john@phrozen.org>, "Steven J. Hill" <Steven.Hill@imgtec.com>, linux-mips@linux-mips.org, Fuxin Zhang <zhangfx@lemote.com>, Zhangjin Wu <wuzhangjin@gmail.com>, Huacai Chen <chenhc@lemote.com>, Jie Chen <chenj@lemote.com>, Rui Wang <wangr@lemote.com>, stable@vger.kernel.org
Message-ID: <20140716011916.Fr8TrhYg9EXsInQhF8XpEVWdULC1je9fXIn6VLFno7o@z>

In do_ade(), is_fpu_owner() isn't preempt-reliable. For example, when
an unaligned ldc1 is executed, do_cpu() is called and then FPU will be
enabled (and TIF_USEDFPU will be set for the current process). Then,
do_ade() is called because the access is unaligned. If the current
process is preempted at this time, TIF_USEDFPU will be cleard. When the
process is scheduled again, BUG_ON(!is_fpu_owner()) is triggered.

This small program can trigger this BUG in a preemptible kernel:
--
int main (int argc, char *argv[])
{
        double u64[2];

        while (1) {
                asm volatile (
                        ".set push \n\t"
                        ".set noreorder \n\t"
                        "ldc1 $f3, 4(%0) \n\t"
                        ".set pop \n\t"
                        ::"r"(u64):
                );
        }

        return 0;
}
--

V2: Remove the BUG_ON() unconditionally due to Paul's suggestion.

Signed-off-by: Huacai Chen <chenhc@lemote.com>
Signed-off-by: Jie Chen <chenj@lemote.com>
Signed-off-by: Rui Wang <wangr@lemote.com>
Cc: <stable@vger.kernel.org>
---
 arch/mips/kernel/unaligned.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/kernel/unaligned.c b/arch/mips/kernel/unaligned.c
index 2b35172..e11906d 100644
--- a/arch/mips/kernel/unaligned.c
+++ b/arch/mips/kernel/unaligned.c
@@ -690,7 +690,6 @@ static void emulate_load_store_insn(struct pt_regs *regs,
 	case sdc1_op:
 		die_if_kernel("Unaligned FP access in kernel code", regs);
 		BUG_ON(!used_math());
-		BUG_ON(!is_fpu_owner());
 
 		lose_fpu(1);	/* Save FPU state for the emulator. */
 		res = fpu_emulator_cop1Handler(regs, &current->thread.fpu, 1,
-- 
1.9.0
