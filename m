Received: from mailapp01.imgtec.com ([195.89.28.114]:39839 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6843043AbaDYPUocER70 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 25 Apr 2014 17:20:44 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 10/21] MIPS: KVM: Migrate hrtimer to follow VCPU
Date: Fri, 25 Apr 2014 16:19:53 +0100
Message-ID: <1398439204-26171-11-git-send-email-james.hogan@imgtec.com>
In-Reply-To: <1398439204-26171-1-git-send-email-james.hogan@imgtec.com>
References: <1398439204-26171-1-git-send-email-james.hogan@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
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
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: James Hogan <james.hogan@imgtec.com>, Gleb Natapov <gleb@kernel.org>, kvm@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, Sanjay Lal <sanjayl@kymasys.com>
Message-ID: <20140425151953.tvZ2xxRTtvH8mI-DcUTAs9BcoRAfZDFxZHh17fo49hg@z>

When a VCPU is scheduled in on a different CPU, refresh the hrtimer used
for emulating count/compare so that it gets migrated to the same CPU.

This should prevent a timer interrupt occurring on a different CPU to
where the guest it relates to is running, which would cause the guest
timer interrupt not to be delivered until after the next guest exit.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Gleb Natapov <gleb@kernel.org>
Cc: kvm@vger.kernel.org
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Cc: Sanjay Lal <sanjayl@kymasys.com>
---
 arch/mips/include/asm/kvm_host.h |  1 +
 arch/mips/kvm/kvm_mips_emul.c    | 17 +++++++++++++++++
 arch/mips/kvm/kvm_tlb.c          |  6 ++++++
 3 files changed, 24 insertions(+)

diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm_host.h
index 90e1c0005ff4..f56bb699506e 100644
--- a/arch/mips/include/asm/kvm_host.h
+++ b/arch/mips/include/asm/kvm_host.h
@@ -705,6 +705,7 @@ extern enum emulation_result kvm_mips_complete_mmio_load(struct kvm_vcpu *vcpu,
 							 struct kvm_run *run);
 
 enum emulation_result kvm_mips_emulate_count(struct kvm_vcpu *vcpu);
+void kvm_mips_migrate_count(struct kvm_vcpu *vcpu);
 
 enum emulation_result kvm_mips_check_privilege(unsigned long cause,
 					       uint32_t *opc,
diff --git a/arch/mips/kvm/kvm_mips_emul.c b/arch/mips/kvm/kvm_mips_emul.c
index bad31c6235d4..7be7317be45d 100644
--- a/arch/mips/kvm/kvm_mips_emul.c
+++ b/arch/mips/kvm/kvm_mips_emul.c
@@ -249,6 +249,23 @@ enum emulation_result kvm_mips_emulate_count(struct kvm_vcpu *vcpu)
 	return er;
 }
 
+/**
+ * kvm_mips_migrate_count() - Migrate timer.
+ * @vcpu:	Virtual CPU.
+ *
+ * Migrate CP0_Count hrtimer to the current CPU by cancelling and restarting it
+ * if it was running prior to being cancelled.
+ *
+ * Must be called when the VCPU is migrated to a different CPU to ensure that
+ * timer expiry during guest execution interrupts the guest and causes the
+ * interrupt to be delivered in a timely manner.
+ */
+void kvm_mips_migrate_count(struct kvm_vcpu *vcpu)
+{
+	if (hrtimer_cancel(&vcpu->arch.comparecount_timer))
+		hrtimer_restart(&vcpu->arch.comparecount_timer);
+}
+
 enum emulation_result kvm_mips_emul_eret(struct kvm_vcpu *vcpu)
 {
 	struct mips_coproc *cop0 = vcpu->arch.cop0;
diff --git a/arch/mips/kvm/kvm_tlb.c b/arch/mips/kvm/kvm_tlb.c
index 9d371ee0a755..1f61fe6739da 100644
--- a/arch/mips/kvm/kvm_tlb.c
+++ b/arch/mips/kvm/kvm_tlb.c
@@ -691,6 +691,12 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 	if (vcpu->arch.last_sched_cpu != cpu) {
 		kvm_info("[%d->%d]KVM VCPU[%d] switch\n",
 			 vcpu->arch.last_sched_cpu, cpu, vcpu->vcpu_id);
+		/*
+		 * Migrate the timer interrupt to the current CPU so that it
+		 * always interrupts the guest and synchronously triggers a
+		 * guest timer interrupt.
+		 */
+		kvm_mips_migrate_count(vcpu);
 	}
 
 	if (!newasid) {
-- 
1.8.1.2
