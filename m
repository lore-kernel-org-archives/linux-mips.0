Received: from mailapp01.imgtec.com ([195.59.15.196]:47648 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993058AbcLBNjl4EVU6 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 2 Dec 2016 14:39:41 +0100
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: [PATCH 2/5] MIPS: Stack unwinding while on IRQ stack
Date: Fri, 2 Dec 2016 13:39:14 +0000
Message-ID: <1480685957-18809-3-git-send-email-matt.redfearn@imgtec.com>
In-Reply-To: <1480685957-18809-1-git-send-email-matt.redfearn@imgtec.com>
References: <1480685957-18809-1-git-send-email-matt.redfearn@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Matt.Redfearn@imgtec.com>
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
Cc: linux-mips@linux-mips.org, "Jason A . Donenfeld" <Jason@zx2c4.com>, Thomas Gleixner <tglx@linutronix.de>, Matt Redfearn <matt.redfearn@imgtec.com>, Marcin Nowakowski <marcin.nowakowski@imgtec.com>, "Maciej W. Rozycki" <macro@imgtec.com>, Jiri Slaby <jslaby@suse.cz>, Chris Metcalf <cmetcalf@mellanox.com>, linux-kernel@vger.kernel.org, Andrea Gelmini <andrea.gelmini@gelma.net>, James Hogan <james.hogan@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, Andrew Morton <akpm@linux-foundation.org>
Message-ID: <20161202133914.nZHbQTfARElqPFfnsGTFOjeJPZ4EsXVqJlg6IlOkjuw@z>

Within unwind stack, check if the stack pointer being unwound is within
the CPU's irq_stack and if so use that page rather than the task's stack
page.

Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
---

 arch/mips/kernel/process.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/process.c b/arch/mips/kernel/process.c
index 9514e5f2209f..4fdbf7078071 100644
--- a/arch/mips/kernel/process.c
+++ b/arch/mips/kernel/process.c
@@ -33,6 +33,7 @@
 #include <asm/dsemul.h>
 #include <asm/dsp.h>
 #include <asm/fpu.h>
+#include <asm/irq.h>
 #include <asm/msa.h>
 #include <asm/pgtable.h>
 #include <asm/mipsregs.h>
@@ -511,7 +512,19 @@ EXPORT_SYMBOL(unwind_stack_by_address);
 unsigned long unwind_stack(struct task_struct *task, unsigned long *sp,
 			   unsigned long pc, unsigned long *ra)
 {
-	unsigned long stack_page = (unsigned long)task_stack_page(task);
+	unsigned long stack_page = 0;
+	int cpu;
+
+	for_each_possible_cpu(cpu) {
+		if (on_irq_stack(cpu, *sp)) {
+			stack_page = (unsigned long)irq_stack[cpu];
+			break;
+		}
+	}
+
+	if (!stack_page)
+		stack_page = (unsigned long)task_stack_page(task);
+
 	return unwind_stack_by_address(stack_page, sp, pc, ra);
 }
 #endif
-- 
2.7.4
