Received: from mailapp01.imgtec.com ([195.59.15.196]:33542 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010542AbbGMQNZaNuo8 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 13 Jul 2015 18:13:25 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH] MIPS: tlb-r4k: panic if the MMU doesn't support PAGE_SIZE
Date: Mon, 13 Jul 2015 17:12:44 +0100
Message-ID: <1436803964-29820-1-git-send-email-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>, "Steven J. Hill" <Steven.Hill@imgtec.com>, Joshua Kinard <kumba@gentoo.org>, linux-kernel@vger.kernel.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>, James Hogan <james.hogan@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20150713161244.nL3FnudyoKsoesvD21NG5pYewnEsgUM8Tkrw6tV6wFA@z>

After writing the appropriate mask to the cop0 PageMask register, read
the register back & check it matches what we want. If it doesn't then
the MMU does not support the page size the kernel is configured for and
we're better off bailing than continuing to do odd things with TLB
exceptions.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 arch/mips/mm/tlb-r4k.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/mips/mm/tlb-r4k.c b/arch/mips/mm/tlb-r4k.c
index 08318ec..4330315 100644
--- a/arch/mips/mm/tlb-r4k.c
+++ b/arch/mips/mm/tlb-r4k.c
@@ -19,6 +19,7 @@
 #include <asm/cpu.h>
 #include <asm/cpu-type.h>
 #include <asm/bootinfo.h>
+#include <asm/hazards.h>
 #include <asm/mmu_context.h>
 #include <asm/pgtable.h>
 #include <asm/tlb.h>
@@ -486,6 +487,10 @@ static void r4k_tlb_configure(void)
 	 *     be set to fixed-size pages.
 	 */
 	write_c0_pagemask(PM_DEFAULT_MASK);
+	back_to_back_c0_hazard();
+	if (read_c0_pagemask() != PM_DEFAULT_MASK)
+		panic("MMU doesn't support PAGE_SIZE=0x%lx", PAGE_SIZE);
+
 	write_c0_wired(0);
 	if (current_cpu_type() == CPU_R10000 ||
 	    current_cpu_type() == CPU_R12000 ||
-- 
2.4.5
