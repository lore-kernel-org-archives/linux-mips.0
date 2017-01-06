Received: from mailapp01.imgtec.com ([195.59.15.196]:7698 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993146AbdAFBd6WMSuu (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 6 Jan 2017 02:33:58 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 30/30] KVM: MIPS/MMU: Drop kvm_get_new_mmu_context()
Date: Fri, 6 Jan 2017 01:33:02 +0000
Message-ID: <f202859d752c9cbcc6861270f75b5102bee50076.1483665879.git-series.james.hogan@imgtec.com>
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
Message-ID: <20170106013302.GlhQXs3U7l-y1xPqolokaWQKHIQYWj4lq2-i7-PjhsE@z>

MIPS KVM uses its own variation of get_new_mmu_context() which takes an
extra vcpu pointer (unused) and does exactly the same thing.

Switch to just using get_new_mmu_context() directly and drop KVM's
version of it as it doesn't really serve any purpose.

The nearby declarations of kvm_mips_alloc_new_mmu_context(),
kvm_mips_vcpu_load() and kvm_mips_vcpu_put() are also removed from
kvm_host.h, as no definitions or users exist.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Radim Krčmář" <rkrcmar@redhat.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Cc: kvm@vger.kernel.org
---
 arch/mips/include/asm/kvm_host.h |  5 -----
 arch/mips/kvm/emulate.c          |  3 +--
 arch/mips/kvm/mmu.c              | 19 -------------------
 arch/mips/kvm/trap_emul.c        |  6 +++---
 4 files changed, 4 insertions(+), 29 deletions(-)

diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm_host.h
index 39f0ae1ab3e3..06bdcf215a37 100644
--- a/arch/mips/include/asm/kvm_host.h
+++ b/arch/mips/include/asm/kvm_host.h
@@ -635,11 +635,6 @@ void kvm_mips_flush_gva_pt(pgd_t *pgd, enum kvm_mips_flush flags);
 void kvm_mmu_free_memory_caches(struct kvm_vcpu *vcpu);
 void kvm_trap_emul_invalidate_gva(struct kvm_vcpu *vcpu, unsigned long addr,
 				  bool user);
-extern void kvm_get_new_mmu_context(struct mm_struct *mm, unsigned long cpu,
-				    struct kvm_vcpu *vcpu);
-extern void kvm_mips_alloc_new_mmu_context(struct kvm_vcpu *vcpu);
-extern void kvm_mips_vcpu_load(struct kvm_vcpu *vcpu, int cpu);
-extern void kvm_mips_vcpu_put(struct kvm_vcpu *vcpu);
 
 /* Emulation */
 u32 kvm_get_inst(u32 *opc, struct kvm_vcpu *vcpu);
diff --git a/arch/mips/kvm/emulate.c b/arch/mips/kvm/emulate.c
index cd11d787d9dc..67ea39973b96 100644
--- a/arch/mips/kvm/emulate.c
+++ b/arch/mips/kvm/emulate.c
@@ -1198,8 +1198,7 @@ enum emulation_result kvm_mips_emulate_CP0(union mips_instruction inst,
 					 */
 					preempt_disable();
 					cpu = smp_processor_id();
-					kvm_get_new_mmu_context(kern_mm,
-								cpu, vcpu);
+					get_new_mmu_context(kern_mm, cpu);
 					for_each_possible_cpu(i)
 						if (i != cpu)
 							cpu_context(i, kern_mm) = 0;
diff --git a/arch/mips/kvm/mmu.c b/arch/mips/kvm/mmu.c
index cf832ea963d8..aab604e75d3b 100644
--- a/arch/mips/kvm/mmu.c
+++ b/arch/mips/kvm/mmu.c
@@ -443,25 +443,6 @@ int kvm_mips_handle_commpage_tlb_fault(unsigned long badvaddr,
 	return 0;
 }
 
-void kvm_get_new_mmu_context(struct mm_struct *mm, unsigned long cpu,
-			     struct kvm_vcpu *vcpu)
-{
-	unsigned long asid = asid_cache(cpu);
-
-	asid += cpu_asid_inc();
-	if (!(asid & cpu_asid_mask(&cpu_data[cpu]))) {
-		if (cpu_has_vtag_icache)
-			flush_icache_all();
-
-		local_flush_tlb_all();      /* start new asid cycle */
-
-		if (!asid)      /* fix version if needed */
-			asid = asid_first_version(cpu);
-	}
-
-	cpu_context(cpu, mm) = asid_cache(cpu) = asid;
-}
-
 /**
  * kvm_mips_migrate_count() - Migrate timer.
  * @vcpu:	Virtual CPU.
diff --git a/arch/mips/kvm/trap_emul.c b/arch/mips/kvm/trap_emul.c
index 7b6ccd2ce26b..17e6d9bd01cf 100644
--- a/arch/mips/kvm/trap_emul.c
+++ b/arch/mips/kvm/trap_emul.c
@@ -706,7 +706,7 @@ static int kvm_trap_emul_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 
 	if ((cpu_context(cpu, kern_mm) ^ asid_cache(cpu)) &
 						asid_version_mask(cpu)) {
-		kvm_get_new_mmu_context(kern_mm, cpu, vcpu);
+		get_new_mmu_context(kern_mm, cpu);
 
 		kvm_debug("[%d]: cpu_context: %#lx\n", cpu,
 			  cpu_context(cpu, current->mm));
@@ -716,7 +716,7 @@ static int kvm_trap_emul_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 
 	if ((cpu_context(cpu, user_mm) ^ asid_cache(cpu)) &
 						asid_version_mask(cpu)) {
-		kvm_get_new_mmu_context(user_mm, cpu, vcpu);
+		get_new_mmu_context(user_mm, cpu);
 
 		kvm_debug("[%d]: cpu_context: %#lx\n", cpu,
 			  cpu_context(cpu, current->mm));
@@ -781,7 +781,7 @@ static void kvm_trap_emul_vcpu_reenter(struct kvm_run *run,
 		gasid = kvm_read_c0_guest_entryhi(cop0) & KVM_ENTRYHI_ASID;
 		if (gasid != vcpu->arch.last_user_gasid) {
 			kvm_mips_flush_gva_pt(user_mm->pgd, KMF_USER);
-			kvm_get_new_mmu_context(user_mm, cpu, vcpu);
+			get_new_mmu_context(user_mm, cpu);
 			for_each_possible_cpu(i)
 				if (i != cpu)
 					cpu_context(i, user_mm) = 0;
-- 
git-series 0.8.10
