Received: from mailapp01.imgtec.com ([195.89.28.115]:44813 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6843063AbaDYPUty9VZH (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 25 Apr 2014 17:20:49 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 17/21] MIPS: KVM: Whitespace fixes in kvm_mips_callbacks
Date: Fri, 25 Apr 2014 16:20:00 +0100
Message-ID: <1398439204-26171-18-git-send-email-james.hogan@imgtec.com>
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
Message-ID: <20140425152000.nanIzFY_wArPAEqN2BBN_sRCKnaP8BOs2qDtlHWLGzs@z>

Fix whitespace in struct kvm_mips_callbacks function pointers.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Gleb Natapov <gleb@kernel.org>
Cc: kvm@vger.kernel.org
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Cc: Sanjay Lal <sanjayl@kymasys.com>
---
 arch/mips/include/asm/kvm_host.h | 46 ++++++++++++++++++++--------------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm_host.h
index 94a7299e1f6c..3d6263d4d9fa 100644
--- a/arch/mips/include/asm/kvm_host.h
+++ b/arch/mips/include/asm/kvm_host.h
@@ -570,29 +570,29 @@ static inline void _kvm_atomic_change_c0_guest_reg(unsigned long *reg,
 
 
 struct kvm_mips_callbacks {
-	int (*handle_cop_unusable) (struct kvm_vcpu *vcpu);
-	int (*handle_tlb_mod) (struct kvm_vcpu *vcpu);
-	int (*handle_tlb_ld_miss) (struct kvm_vcpu *vcpu);
-	int (*handle_tlb_st_miss) (struct kvm_vcpu *vcpu);
-	int (*handle_addr_err_st) (struct kvm_vcpu *vcpu);
-	int (*handle_addr_err_ld) (struct kvm_vcpu *vcpu);
-	int (*handle_syscall) (struct kvm_vcpu *vcpu);
-	int (*handle_res_inst) (struct kvm_vcpu *vcpu);
-	int (*handle_break) (struct kvm_vcpu *vcpu);
-	int (*vm_init) (struct kvm *kvm);
-	int (*vcpu_init) (struct kvm_vcpu *vcpu);
-	int (*vcpu_setup) (struct kvm_vcpu *vcpu);
-	 gpa_t(*gva_to_gpa) (gva_t gva);
-	void (*queue_timer_int) (struct kvm_vcpu *vcpu);
-	void (*dequeue_timer_int) (struct kvm_vcpu *vcpu);
-	void (*queue_io_int) (struct kvm_vcpu *vcpu,
-			      struct kvm_mips_interrupt *irq);
-	void (*dequeue_io_int) (struct kvm_vcpu *vcpu,
-				struct kvm_mips_interrupt *irq);
-	int (*irq_deliver) (struct kvm_vcpu *vcpu, unsigned int priority,
-			    uint32_t cause);
-	int (*irq_clear) (struct kvm_vcpu *vcpu, unsigned int priority,
-			  uint32_t cause);
+	int (*handle_cop_unusable)(struct kvm_vcpu *vcpu);
+	int (*handle_tlb_mod)(struct kvm_vcpu *vcpu);
+	int (*handle_tlb_ld_miss)(struct kvm_vcpu *vcpu);
+	int (*handle_tlb_st_miss)(struct kvm_vcpu *vcpu);
+	int (*handle_addr_err_st)(struct kvm_vcpu *vcpu);
+	int (*handle_addr_err_ld)(struct kvm_vcpu *vcpu);
+	int (*handle_syscall)(struct kvm_vcpu *vcpu);
+	int (*handle_res_inst)(struct kvm_vcpu *vcpu);
+	int (*handle_break)(struct kvm_vcpu *vcpu);
+	int (*vm_init)(struct kvm *kvm);
+	int (*vcpu_init)(struct kvm_vcpu *vcpu);
+	int (*vcpu_setup)(struct kvm_vcpu *vcpu);
+	gpa_t (*gva_to_gpa)(gva_t gva);
+	void (*queue_timer_int)(struct kvm_vcpu *vcpu);
+	void (*dequeue_timer_int)(struct kvm_vcpu *vcpu);
+	void (*queue_io_int)(struct kvm_vcpu *vcpu,
+			     struct kvm_mips_interrupt *irq);
+	void (*dequeue_io_int)(struct kvm_vcpu *vcpu,
+			       struct kvm_mips_interrupt *irq);
+	int (*irq_deliver)(struct kvm_vcpu *vcpu, unsigned int priority,
+			   uint32_t cause);
+	int (*irq_clear)(struct kvm_vcpu *vcpu, unsigned int priority,
+			 uint32_t cause);
 	int (*get_one_reg)(struct kvm_vcpu *vcpu,
 			   const struct kvm_one_reg *reg, s64 *v);
 	int (*set_one_reg)(struct kvm_vcpu *vcpu,
-- 
1.8.1.2
