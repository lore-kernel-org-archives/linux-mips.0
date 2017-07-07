Received: from mailapp01.imgtec.com ([195.59.15.196]:23477 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993941AbdGGO50sZnTb (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 7 Jul 2017 16:57:26 +0200
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: [PATCH] MIPS: Fix minimum alignment requirement of IRQ stack
Date: Fri, 7 Jul 2017 15:57:12 +0100
Message-ID: <1499439432-29847-1-git-send-email-matt.redfearn@imgtec.com>
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
Cc: linux-mips@linux-mips.org, Matt Redfearn <matt.redfearn@imgtec.com>, Chris Metcalf <cmetcalf@mellanox.com>, linux-kernel@vger.kernel.org, Aaron Tomlin <atomlin@redhat.com>, "Jason A. Donenfeld" <jason@zx2c4.com>
Message-ID: <20170707145712.BylkVQ8d9BkDtN3QcWCW2uUj7r_cewEKPDn_e-3jO70@z>

Commit db8466c581cc ("MIPS: IRQ Stack: Unwind IRQ stack onto task
stack") erroneously set the initial stack pointer of the IRQ stack to a
value with a 4 byte alignment. The MIPS32 ABI requires that the minimum
stack alignment is 8 byte, and the MIPS64 ABIs(n32/n64) require 16 byte
minimum alignment. Use the ALMASK stack pointer mask to align the stack
as appropriate for the kernel build.

Fixes: db8466c581cc ("MIPS: IRQ Stack: Unwind IRQ stack onto task stack")
Reported-by: Darius Ivanauskas <dasilt@yahoo.com>
Suggested-by: James Hogan <james.hogan@imgtec.com>
Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>

---

 arch/mips/include/asm/irq.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/irq.h b/arch/mips/include/asm/irq.h
index ddd1c918103b..ac66a2de091a 100644
--- a/arch/mips/include/asm/irq.h
+++ b/arch/mips/include/asm/irq.h
@@ -9,6 +9,7 @@
 #ifndef _ASM_IRQ_H
 #define _ASM_IRQ_H
 
+#include <asm/asm.h>
 #include <linux/linkage.h>
 #include <linux/smp.h>
 #include <linux/irqdomain.h>
@@ -17,8 +18,8 @@
 
 #include <irq.h>
 
-#define IRQ_STACK_SIZE			THREAD_SIZE
-#define IRQ_STACK_START			(IRQ_STACK_SIZE - sizeof(unsigned long))
+#define IRQ_STACK_SIZE	THREAD_SIZE
+#define IRQ_STACK_START	((IRQ_STACK_SIZE - sizeof(unsigned long)) & ALMASK)
 
 extern void *irq_stack[NR_CPUS];
 
-- 
2.7.4
