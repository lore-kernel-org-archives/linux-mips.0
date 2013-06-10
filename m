Received: from multi.imgtec.com ([194.200.65.239]:13359 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6827461Ab3FJNQbFMASk (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 10 Jun 2013 15:16:31 +0200
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH v2] MIPS: include: mmu_context.h: Replace VIRTUALIZATION with KVM
Date: Mon, 10 Jun 2013 14:16:16 +0100
Message-ID: <1370870176-4033-1-git-send-email-markos.chandras@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Markos.Chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>, "Steven J. Hill" <Steven.Hill@imgtec.com>
Message-ID: <20130610131616.nm0rza3Qdh4Uwi_he-2cJ5lxBjor16Tif7LhhtsA2is@z>

The kvm_* symbols are only available if KVM is selected.

Fixes the following linking problem on a randconfig:

arch/mips/built-in.o: In function `local_flush_tlb_mm':
(.text+0x18a94): undefined reference to `kvm_local_flush_tlb_all'
arch/mips/built-in.o: In function `local_flush_tlb_range':
(.text+0x18d0c): undefined reference to `kvm_local_flush_tlb_all'
kernel/built-in.o: In function `__schedule':
core.c:(.sched.text+0x2a00): undefined reference to `kvm_local_flush_tlb_all'
mm/built-in.o: In function `use_mm':
(.text+0x30214): undefined reference to `kvm_local_flush_tlb_all'
fs/built-in.o: In function `flush_old_exec':
(.text+0xf0a0): undefined reference to `kvm_local_flush_tlb_all'
make: *** [vmlinux] Error 1

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
Signed-off-by: Steven J. Hill <Steven.Hill@imgtec.com>
---
Changes since v1:
- Drop #ifdef from function declaration
---
 arch/mips/include/asm/mmu_context.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/mmu_context.h b/arch/mips/include/asm/mmu_context.h
index 8201160..516e6e9 100644
--- a/arch/mips/include/asm/mmu_context.h
+++ b/arch/mips/include/asm/mmu_context.h
@@ -117,7 +117,7 @@ get_new_mmu_context(struct mm_struct *mm, unsigned long cpu)
 	if (! ((asid += ASID_INC) & ASID_MASK) ) {
 		if (cpu_has_vtag_icache)
 			flush_icache_all();
-#ifdef CONFIG_VIRTUALIZATION
+#ifdef CONFIG_KVM
 		kvm_local_flush_tlb_all();      /* start new asid cycle */
 #else
 		local_flush_tlb_all();	/* start new asid cycle */
-- 
1.8.2.1
