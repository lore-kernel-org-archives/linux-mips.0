Received: from mailapp01.imgtec.com ([195.59.15.196]:47674 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27026878AbcDRJgm7UToM (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 18 Apr 2016 11:36:42 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH v2 03/13] MIPS: Remove redundant asm/pgtable-bits.h inclusions
Date: Mon, 18 Apr 2016 10:35:23 +0100
Message-ID: <1460972133-16973-4-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1460972133-16973-1-git-send-email-paul.burton@imgtec.com>
References: <1460972133-16973-1-git-send-email-paul.burton@imgtec.com>
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
To: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Cc: James Hogan <james.hogan@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, "Maciej W. Rozycki" <macro@linux-mips.org>, linux-kernel@vger.kernel.org, Jonas Gorski <jogo@openwrt.org>, Markos Chandras <markos.chandras@imgtec.com>, Alex Smith <alex.smith@imgtec.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Message-ID: <20160418093523.mIirHXqWTk6AhybYcTE8AbQAZctOURUINcEGtHcD74I@z>

asm/pgtable-bits.h is included in 2 assembly files and thus has to
in either of the assembly files that include it.

Remove the redundant inclusions such that asm/pgtable-bits.h doesn't
need to #ifdef around C code, for cleanliness & and in preparation for
later patches which will add more C.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Reviewed-by: James Hogan <james.hogan@imgtec.com>

---

Changes in v2:
- Fixup commit message that was missing a line.

 arch/mips/include/asm/pgtable-bits.h | 2 --
 arch/mips/kernel/head.S              | 1 -
 arch/mips/kernel/r4k_switch.S        | 1 -
 3 files changed, 4 deletions(-)

diff --git a/arch/mips/include/asm/pgtable-bits.h b/arch/mips/include/asm/pgtable-bits.h
index 97b3138..2f40312 100644
--- a/arch/mips/include/asm/pgtable-bits.h
+++ b/arch/mips/include/asm/pgtable-bits.h
@@ -191,7 +191,6 @@
  */
 
 
-#ifndef __ASSEMBLY__
 /*
  * pte_to_entrylo converts a page table entry (PTE) into a Mips
  * entrylo0/1 value.
@@ -218,7 +217,6 @@ static inline uint64_t pte_to_entrylo(unsigned long pte_val)
 
 	return pte_val >> _PAGE_GLOBAL_SHIFT;
 }
-#endif
 
 /*
  * Cache attributes
diff --git a/arch/mips/kernel/head.S b/arch/mips/kernel/head.S
index 4e4cc5b..b8fb0ba 100644
--- a/arch/mips/kernel/head.S
+++ b/arch/mips/kernel/head.S
@@ -21,7 +21,6 @@
 #include <asm/asmmacro.h>
 #include <asm/irqflags.h>
 #include <asm/regdef.h>
-#include <asm/pgtable-bits.h>
 #include <asm/mipsregs.h>
 #include <asm/stackframe.h>
 
diff --git a/arch/mips/kernel/r4k_switch.S b/arch/mips/kernel/r4k_switch.S
index 92cd051..2f0a3b2 100644
--- a/arch/mips/kernel/r4k_switch.S
+++ b/arch/mips/kernel/r4k_switch.S
@@ -15,7 +15,6 @@
 #include <asm/fpregdef.h>
 #include <asm/mipsregs.h>
 #include <asm/asm-offsets.h>
-#include <asm/pgtable-bits.h>
 #include <asm/regdef.h>
 #include <asm/stackframe.h>
 #include <asm/thread_info.h>
-- 
2.8.0
