Received: from mailapp01.imgtec.com ([195.59.15.196]:15055 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27026458AbcDVJjhdiagz (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 22 Apr 2016 11:39:37 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 3/5] MIPS: KVM: Fix preemptable kvm_mips_get_*_asid() calls
Date: Fri, 22 Apr 2016 10:38:47 +0100
Message-ID: <1461317929-4991-4-git-send-email-james.hogan@imgtec.com>
In-Reply-To: <1461317929-4991-1-git-send-email-james.hogan@imgtec.com>
References: <1461317929-4991-1-git-send-email-james.hogan@imgtec.com>
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
To: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>, Ralf Baechle <ralf@linux-mips.org>
Cc: James Hogan <james.hogan@imgtec.com>, linux-mips@linux-mips.org, kvm@vger.kernel.org
Message-ID: <20160422093847.N5aEXn-zBRZJP3R6LJ4HeogdID8aP77iowqWPYHKN24@z>

There are a couple of places in KVM fault handling code which implicitly
use smp_processor_id() via kvm_mips_get_kernel_asid() and
kvm_mips_get_user_asid() from preemptable context. This is unsafe as a
preemption could cause the guest kernel ASID to be changed, resulting in
a host TLB entry being written with the wrong ASID.

Fix by disabling preemption around the kvm_mips_get_*_asid() call and
the corresponding kvm_mips_host_tlb_write().

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Radim Krčmář" <rkrcmar@redhat.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Cc: kvm@vger.kernel.org
---
 arch/mips/kvm/tlb.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/arch/mips/kvm/tlb.c b/arch/mips/kvm/tlb.c
index e0e1d0a611fc..60e4ad0016e7 100644
--- a/arch/mips/kvm/tlb.c
+++ b/arch/mips/kvm/tlb.c
@@ -268,6 +268,7 @@ int kvm_mips_handle_kseg0_tlb_fault(unsigned long badvaddr,
 	int even;
 	struct kvm *kvm = vcpu->kvm;
 	const int flush_dcache_mask = 0;
+	int ret;
 
 	if (KVM_GUEST_KSEGX(badvaddr) != KVM_GUEST_KSEG0) {
 		kvm_err("%s: Invalid BadVaddr: %#lx\n", __func__, badvaddr);
@@ -299,14 +300,18 @@ int kvm_mips_handle_kseg0_tlb_fault(unsigned long badvaddr,
 		pfn1 = kvm->arch.guest_pmap[gfn];
 	}
 
+	entrylo0 = mips3_paddr_to_tlbpfn(pfn0 << PAGE_SHIFT) | (0x3 << 3) |
+		   (1 << 2) | (0x1 << 1);
+	entrylo1 = mips3_paddr_to_tlbpfn(pfn1 << PAGE_SHIFT) | (0x3 << 3) |
+		   (1 << 2) | (0x1 << 1);
+
+	preempt_disable();
 	entryhi = (vaddr | kvm_mips_get_kernel_asid(vcpu));
-	entrylo0 = mips3_paddr_to_tlbpfn(pfn0 << PAGE_SHIFT) | (0x3 << 3) |
-		   (1 << 2) | (0x1 << 1);
-	entrylo1 = mips3_paddr_to_tlbpfn(pfn1 << PAGE_SHIFT) | (0x3 << 3) |
-		   (1 << 2) | (0x1 << 1);
+	ret = kvm_mips_host_tlb_write(vcpu, entryhi, entrylo0, entrylo1,
+				      flush_dcache_mask);
+	preempt_enable();
 
-	return kvm_mips_host_tlb_write(vcpu, entryhi, entrylo0, entrylo1,
-				       flush_dcache_mask);
+	return ret;
 }
 EXPORT_SYMBOL_GPL(kvm_mips_handle_kseg0_tlb_fault);
 
@@ -361,6 +366,7 @@ int kvm_mips_handle_mapped_seg_tlb_fault(struct kvm_vcpu *vcpu,
 	unsigned long entryhi = 0, entrylo0 = 0, entrylo1 = 0;
 	struct kvm *kvm = vcpu->kvm;
 	kvm_pfn_t pfn0, pfn1;
+	int ret;
 
 	if ((tlb->tlb_hi & VPN2_MASK) == 0) {
 		pfn0 = 0;
@@ -387,9 +393,6 @@ int kvm_mips_handle_mapped_seg_tlb_fault(struct kvm_vcpu *vcpu,
 		*hpa1 = pfn1 << PAGE_SHIFT;
 
 	/* Get attributes from the Guest TLB */
-	entryhi = (tlb->tlb_hi & VPN2_MASK) | (KVM_GUEST_KERNEL_MODE(vcpu) ?
-					       kvm_mips_get_kernel_asid(vcpu) :
-					       kvm_mips_get_user_asid(vcpu));
 	entrylo0 = mips3_paddr_to_tlbpfn(pfn0 << PAGE_SHIFT) | (0x3 << 3) |
 		   (tlb->tlb_lo0 & MIPS3_PG_D) | (tlb->tlb_lo0 & MIPS3_PG_V);
 	entrylo1 = mips3_paddr_to_tlbpfn(pfn1 << PAGE_SHIFT) | (0x3 << 3) |
@@ -398,8 +401,15 @@ int kvm_mips_handle_mapped_seg_tlb_fault(struct kvm_vcpu *vcpu,
 	kvm_debug("@ %#lx tlb_lo0: 0x%08lx tlb_lo1: 0x%08lx\n", vcpu->arch.pc,
 		  tlb->tlb_lo0, tlb->tlb_lo1);
 
-	return kvm_mips_host_tlb_write(vcpu, entryhi, entrylo0, entrylo1,
-				       tlb->tlb_mask);
+	preempt_disable();
+	entryhi = (tlb->tlb_hi & VPN2_MASK) | (KVM_GUEST_KERNEL_MODE(vcpu) ?
+					       kvm_mips_get_kernel_asid(vcpu) :
+					       kvm_mips_get_user_asid(vcpu));
+	ret = kvm_mips_host_tlb_write(vcpu, entryhi, entrylo0, entrylo1,
+				      tlb->tlb_mask);
+	preempt_enable();
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(kvm_mips_handle_mapped_seg_tlb_fault);
 
-- 
2.4.10
