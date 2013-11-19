Received: from multi.imgtec.com ([194.200.65.239]:2613 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6815921Ab3KSRcRf9dh6 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 19 Nov 2013 18:32:17 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 2/6] mips: simplify PTRACE_PEEKUSR for FPC_EIR
Date: Tue, 19 Nov 2013 17:30:35 +0000
Message-ID: <1384882239-17965-3-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1384882239-17965-1-git-send-email-paul.burton@imgtec.com>
References: <1384882239-17965-1-git-send-email-paul.burton@imgtec.com>
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
Message-ID: <20131119173035.OyPHsBdywcVV3e92Ko2yumIJH6839P0L-vOD9IjAVfY@z>

All architecturally defined bits in the FPU implementation register
are read only & unchanging. It contains some implementation-defined
bits but the architecture manual states "This bits are explicitly not
intended to be used for mode control functions" which seems to provide
justification for viewing the register as a whole as unchanging. This
being the case we can simply re-use the value we read at boot rather
than having to re-read it later, and avoid the complexity which that
read entails.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Reviewed-by: Qais Yousef <qais.yousef@imgtec.com>
---
 arch/mips/kernel/ptrace.c   | 40 +++-------------------------------------
 arch/mips/kernel/ptrace32.c | 42 +++---------------------------------------
 2 files changed, 6 insertions(+), 76 deletions(-)

diff --git a/arch/mips/kernel/ptrace.c b/arch/mips/kernel/ptrace.c
index 624773e..7654ac2 100644
--- a/arch/mips/kernel/ptrace.c
+++ b/arch/mips/kernel/ptrace.c
@@ -467,44 +467,10 @@ long arch_ptrace(struct task_struct *child, long request,
 		case FPC_CSR:
 			tmp = child->thread.fpu.fcr31;
 			break;
-		case FPC_EIR: { /* implementation / version register */
-			unsigned int flags;
-#ifdef CONFIG_MIPS_MT_SMTC
-			unsigned long irqflags;
-			unsigned int mtflags;
-#endif /* CONFIG_MIPS_MT_SMTC */
-
-			preempt_disable();
-			if (!cpu_has_fpu) {
-				preempt_enable();
-				break;
-			}
-
-#ifdef CONFIG_MIPS_MT_SMTC
-			/* Read-modify-write of Status must be atomic */
-			local_irq_save(irqflags);
-			mtflags = dmt();
-#endif /* CONFIG_MIPS_MT_SMTC */
-			if (cpu_has_mipsmt) {
-				unsigned int vpflags = dvpe();
-				flags = read_c0_status();
-				__enable_fpu(FPU_AS_IS);
-				__asm__ __volatile__("cfc1\t%0,$0": "=r" (tmp));
-				write_c0_status(flags);
-				evpe(vpflags);
-			} else {
-				flags = read_c0_status();
-				__enable_fpu(FPU_AS_IS);
-				__asm__ __volatile__("cfc1\t%0,$0": "=r" (tmp));
-				write_c0_status(flags);
-			}
-#ifdef CONFIG_MIPS_MT_SMTC
-			emt(mtflags);
-			local_irq_restore(irqflags);
-#endif /* CONFIG_MIPS_MT_SMTC */
-			preempt_enable();
+		case FPC_EIR:
+			/* implementation / version register */
+			tmp = current_cpu_data.fpu_id;
 			break;
-		}
 		case DSP_BASE ... DSP_BASE + 5: {
 			dspreg_t *dregs;
 
diff --git a/arch/mips/kernel/ptrace32.c b/arch/mips/kernel/ptrace32.c
index c394d8f..b40c3ca 100644
--- a/arch/mips/kernel/ptrace32.c
+++ b/arch/mips/kernel/ptrace32.c
@@ -127,46 +127,10 @@ long compat_arch_ptrace(struct task_struct *child, compat_long_t request,
 		case FPC_CSR:
 			tmp = child->thread.fpu.fcr31;
 			break;
-		case FPC_EIR: { /* implementation / version register */
-			unsigned int flags;
-#ifdef CONFIG_MIPS_MT_SMTC
-			unsigned int irqflags;
-			unsigned int mtflags;
-#endif /* CONFIG_MIPS_MT_SMTC */
-
-			preempt_disable();
-			if (!cpu_has_fpu) {
-				preempt_enable();
-				tmp = 0;
-				break;
-			}
-
-#ifdef CONFIG_MIPS_MT_SMTC
-			/* Read-modify-write of Status must be atomic */
-			local_irq_save(irqflags);
-			mtflags = dmt();
-#endif /* CONFIG_MIPS_MT_SMTC */
-
-			if (cpu_has_mipsmt) {
-				unsigned int vpflags = dvpe();
-				flags = read_c0_status();
-				__enable_fpu(FPU_AS_IS);
-				__asm__ __volatile__("cfc1\t%0,$0": "=r" (tmp));
-				write_c0_status(flags);
-				evpe(vpflags);
-			} else {
-				flags = read_c0_status();
-				__enable_fpu(FPU_AS_IS);
-				__asm__ __volatile__("cfc1\t%0,$0": "=r" (tmp));
-				write_c0_status(flags);
-			}
-#ifdef CONFIG_MIPS_MT_SMTC
-			emt(mtflags);
-			local_irq_restore(irqflags);
-#endif /* CONFIG_MIPS_MT_SMTC */
-			preempt_enable();
+		case FPC_EIR:
+			/* implementation / version register */
+			tmp = current_cpu_data.fpu_id;
 			break;
-		}
 		case DSP_BASE ... DSP_BASE + 5: {
 			dspreg_t *dregs;
 
-- 
1.8.4.2
