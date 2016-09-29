Received: from mailapp02.imgtec.com ([217.156.133.132]:31848 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23992289AbcI2MOvUVzii (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 29 Sep 2016 14:14:51 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [GIT PULL 5/6] KVM: MIPS: Invalidate TLB by regenerating ASIDs
Date: Thu, 29 Sep 2016 13:14:25 +0100
Message-ID: <1475151266-28660-3-git-send-email-james.hogan@imgtec.com>
In-Reply-To: <1475151193-28505-1-git-send-email-james.hogan@imgtec.com>
References: <1475151193-28505-1-git-send-email-james.hogan@imgtec.com>
MIME-Version: 1.0
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
To: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, kvm@vger.kernel.org, James Hogan <james.hogan@imgtec.com>
Message-ID: <20160929121425.XWKqrpcjkhiFzwrHDfqj-28Jz1TvWIX90Ie3_v5_b3Y@z>

Invalidate host TLB mappings when the guest ASID is changed by
regenerating ASIDs, rather than flushing the entire host TLB except
entries in the guest KSeg0 range.

For the guest kernel mode ASID we regenerate on the spot when the guest
ASID is changed, as that will always take place while the guest is in
kernel mode.

However when the guest invalidates TLB entries the ASID will often by
changed temporarily as part of writing EntryHi without the guest
returning to user mode in between. We therefore regenerate the user mode
ASID lazily before entering the guest in user mode, if and only if the
guest ASID has actually changed since the last guest user mode entry.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Radim Krčmář" <rkrcmar@redhat.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Cc: kvm@vger.kernel.org
---
 arch/mips/include/asm/kvm_host.h |  3 +++
 arch/mips/kvm/emulate.c          | 18 +++++++++++++-----
 arch/mips/kvm/mips.c             | 30 ++++++++++++++++++++++++++++++
 arch/mips/kvm/mmu.c              |  4 ++++
 4 files changed, 50 insertions(+), 5 deletions(-)

diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm_host.h
index 4d7e0e466b5a..a5685c1adba2 100644
--- a/arch/mips/include/asm/kvm_host.h
+++ b/arch/mips/include/asm/kvm_host.h
@@ -328,6 +328,9 @@ struct kvm_vcpu_arch {
 	u32 guest_kernel_asid[NR_CPUS];
 	struct mm_struct guest_kernel_mm, guest_user_mm;
 
+	/* Guest ASID of last user mode execution */
+	unsigned int last_user_gasid;
+
 	int last_sched_cpu;
 
 	/* WAIT executed */
diff --git a/arch/mips/kvm/emulate.c b/arch/mips/kvm/emulate.c
index 43853ec6e160..8dc9e64346e6 100644
--- a/arch/mips/kvm/emulate.c
+++ b/arch/mips/kvm/emulate.c
@@ -1170,15 +1170,23 @@ enum emulation_result kvm_mips_emulate_CP0(union mips_instruction inst,
 							& KVM_ENTRYHI_ASID,
 						nasid);
 
+					/*
+					 * Regenerate/invalidate kernel MMU
+					 * context.
+					 * The user MMU context will be
+					 * regenerated lazily on re-entry to
+					 * guest user if the guest ASID actually
+					 * changes.
+					 */
 					preempt_disable();
-					/* Blow away the shadow host TLBs */
-					kvm_mips_flush_host_tlb(1);
 					cpu = smp_processor_id();
+					kvm_get_new_mmu_context(&vcpu->arch.guest_kernel_mm,
+								cpu, vcpu);
+					vcpu->arch.guest_kernel_asid[cpu] =
+						vcpu->arch.guest_kernel_mm.context.asid[cpu];
 					for_each_possible_cpu(i)
-						if (i != cpu) {
-							vcpu->arch.guest_user_asid[i] = 0;
+						if (i != cpu)
 							vcpu->arch.guest_kernel_asid[i] = 0;
-						}
 					preempt_enable();
 				}
 				kvm_write_c0_guest_entryhi(cop0,
diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index a6ea084b4d9d..ad1b15ba5907 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -411,6 +411,31 @@ int kvm_arch_vcpu_ioctl_set_guest_debug(struct kvm_vcpu *vcpu,
 	return -ENOIOCTLCMD;
 }
 
+/* Must be called with preemption disabled, just before entering guest */
+static void kvm_mips_check_asids(struct kvm_vcpu *vcpu)
+{
+	struct mips_coproc *cop0 = vcpu->arch.cop0;
+	int cpu = smp_processor_id();
+	unsigned int gasid;
+
+	/*
+	 * Lazy host ASID regeneration for guest user mode.
+	 * If the guest ASID has changed since the last guest usermode
+	 * execution, regenerate the host ASID so as to invalidate stale TLB
+	 * entries.
+	 */
+	if (!KVM_GUEST_KERNEL_MODE(vcpu)) {
+		gasid = kvm_read_c0_guest_entryhi(cop0) & KVM_ENTRYHI_ASID;
+		if (gasid != vcpu->arch.last_user_gasid) {
+			kvm_get_new_mmu_context(&vcpu->arch.guest_user_mm, cpu,
+						vcpu);
+			vcpu->arch.guest_user_asid[cpu] =
+				vcpu->arch.guest_user_mm.context.asid[cpu];
+			vcpu->arch.last_user_gasid = gasid;
+		}
+	}
+}
+
 int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu, struct kvm_run *run)
 {
 	int r = 0;
@@ -438,6 +463,9 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu, struct kvm_run *run)
 	htw_stop();
 
 	trace_kvm_enter(vcpu);
+
+	kvm_mips_check_asids(vcpu);
+
 	r = vcpu->arch.vcpu_run(run, vcpu);
 	trace_kvm_out(vcpu);
 
@@ -1551,6 +1579,8 @@ skip_emul:
 	if (ret == RESUME_GUEST) {
 		trace_kvm_reenter(vcpu);
 
+		kvm_mips_check_asids(vcpu);
+
 		/*
 		 * If FPU / MSA are enabled (i.e. the guest's FPU / MSA context
 		 * is live), restore FCR31 / MSACSR.
diff --git a/arch/mips/kvm/mmu.c b/arch/mips/kvm/mmu.c
index c1f8758f5323..8e1f2bffcf0f 100644
--- a/arch/mips/kvm/mmu.c
+++ b/arch/mips/kvm/mmu.c
@@ -260,9 +260,13 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 
 	if ((vcpu->arch.guest_user_asid[cpu] ^ asid_cache(cpu)) &
 						asid_version_mask(cpu)) {
+		u32 gasid = kvm_read_c0_guest_entryhi(vcpu->arch.cop0) &
+				KVM_ENTRYHI_ASID;
+
 		kvm_get_new_mmu_context(&vcpu->arch.guest_user_mm, cpu, vcpu);
 		vcpu->arch.guest_user_asid[cpu] =
 		    vcpu->arch.guest_user_mm.context.asid[cpu];
+		vcpu->arch.last_user_gasid = gasid;
 		newasid++;
 
 		kvm_debug("[%d]: cpu_context: %#lx\n", cpu,
-- 
2.7.3
