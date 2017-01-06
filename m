Received: from mailapp01.imgtec.com ([195.59.15.196]:1256 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993144AbdAFBd53C09u (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 6 Jan 2017 02:33:57 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 28/30] KVM: MIPS/TLB: Drop kvm_local_flush_tlb_all()
Date: Fri, 6 Jan 2017 01:33:00 +0000
Message-ID: <c41ca7a007f3e13930fe7784811549052a1db446.1483665879.git-series.james.hogan@imgtec.com>
MIME-Version: 1.0
In-Reply-To: <cover.d6d201de414322ed2c1372e164254e6055ef7db9.1483665879.git-series.james.hogan@imgtec.com>
References: <cover.d6d201de414322ed2c1372e164254e6055ef7db9.1483665879.git-series.james.hogan@imgtec.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
To: linux-mips@linux-mips.org
Cc: James Hogan <james.hogan@imgtec.com>, Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>, Ralf Baechle <ralf@linux-mips.org>, kvm@vger.kernel.org
Message-ID: <20170106013300.PhQLu8Ey0b3mgF8KbJIBjlQMLl-6ut89D-O8RzZTvls@z>

Now that KVM no longer uses wired entries we can safely use
local_flush_tlb_all() when we need to flush the entire TLB (on the start
of a new ASID cycle). This doesn't flush wired entries, which allows
other code to use them without KVM clobbering them all the time. It also
is more up to date, knowing about the tlbinv architectural feature,
flushing of micro TLB on cores where that is necessary (Loongson I
believe), and knows to stop the HTW while doing so.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Radim Krčmář" <rkrcmar@redhat.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Cc: kvm@vger.kernel.org
---
 arch/mips/include/asm/kvm_host.h    |  1 -
 arch/mips/include/asm/mmu_context.h |  5 -----
 arch/mips/kvm/mmu.c                 |  2 +-
 arch/mips/kvm/tlb.c                 | 29 -----------------------------
 4 files changed, 1 insertion(+), 36 deletions(-)

diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm_host.h
index 1191b3002773..680e7a1ddf91 100644
--- a/arch/mips/include/asm/kvm_host.h
+++ b/arch/mips/include/asm/kvm_host.h
@@ -638,7 +638,6 @@ void kvm_trap_emul_invalidate_gva(struct kvm_vcpu *vcpu, unsigned long addr,
 				  bool user);
 extern void kvm_get_new_mmu_context(struct mm_struct *mm, unsigned long cpu,
 				    struct kvm_vcpu *vcpu);
-extern void kvm_local_flush_tlb_all(void);
 extern void kvm_mips_alloc_new_mmu_context(struct kvm_vcpu *vcpu);
 extern void kvm_mips_vcpu_load(struct kvm_vcpu *vcpu, int cpu);
 extern void kvm_mips_vcpu_put(struct kvm_vcpu *vcpu);
diff --git a/arch/mips/include/asm/mmu_context.h b/arch/mips/include/asm/mmu_context.h
index 16eb8521398e..2abf94f72c0a 100644
--- a/arch/mips/include/asm/mmu_context.h
+++ b/arch/mips/include/asm/mmu_context.h
@@ -99,17 +99,12 @@ static inline void enter_lazy_tlb(struct mm_struct *mm, struct task_struct *tsk)
 static inline void
 get_new_mmu_context(struct mm_struct *mm, unsigned long cpu)
 {
-	extern void kvm_local_flush_tlb_all(void);
 	unsigned long asid = asid_cache(cpu);
 
 	if (!((asid += cpu_asid_inc()) & cpu_asid_mask(&cpu_data[cpu]))) {
 		if (cpu_has_vtag_icache)
 			flush_icache_all();
-#ifdef CONFIG_KVM
-		kvm_local_flush_tlb_all();      /* start new asid cycle */
-#else
 		local_flush_tlb_all();	/* start new asid cycle */
-#endif
 		if (!asid)		/* fix version if needed */
 			asid = asid_first_version(cpu);
 	}
diff --git a/arch/mips/kvm/mmu.c b/arch/mips/kvm/mmu.c
index c4e9c65065ea..cf832ea963d8 100644
--- a/arch/mips/kvm/mmu.c
+++ b/arch/mips/kvm/mmu.c
@@ -453,7 +453,7 @@ void kvm_get_new_mmu_context(struct mm_struct *mm, unsigned long cpu,
 		if (cpu_has_vtag_icache)
 			flush_icache_all();
 
-		kvm_local_flush_tlb_all();      /* start new asid cycle */
+		local_flush_tlb_all();      /* start new asid cycle */
 
 		if (!asid)      /* fix version if needed */
 			asid = asid_first_version(cpu);
diff --git a/arch/mips/kvm/tlb.c b/arch/mips/kvm/tlb.c
index 22b17207b3b7..367f70f7d868 100644
--- a/arch/mips/kvm/tlb.c
+++ b/arch/mips/kvm/tlb.c
@@ -262,32 +262,3 @@ void kvm_mips_flush_host_tlb(int skip_kseg0)
 	local_irq_restore(flags);
 }
 EXPORT_SYMBOL_GPL(kvm_mips_flush_host_tlb);
-
-void kvm_local_flush_tlb_all(void)
-{
-	unsigned long flags;
-	unsigned long old_ctx;
-	int entry = 0;
-
-	local_irq_save(flags);
-	/* Save old context and create impossible VPN2 value */
-	old_ctx = read_c0_entryhi();
-	write_c0_entrylo0(0);
-	write_c0_entrylo1(0);
-
-	/* Blast 'em all away. */
-	while (entry < current_cpu_data.tlbsize) {
-		/* Make sure all entries differ. */
-		write_c0_entryhi(UNIQUE_ENTRYHI(entry));
-		write_c0_index(entry);
-		mtc0_tlbw_hazard();
-		tlb_write_indexed();
-		tlbw_use_hazard();
-		entry++;
-	}
-	write_c0_entryhi(old_ctx);
-	mtc0_tlbw_hazard();
-
-	local_irq_restore(flags);
-}
-EXPORT_SYMBOL_GPL(kvm_local_flush_tlb_all);
-- 
git-series 0.8.10
