Received: from mailapp01.imgtec.com ([195.59.15.196]:31593 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993159AbcHRJCJja0jd (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 18 Aug 2016 11:02:09 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH BACKPORT 4.7 2/4] MIPS: KVM: Add missing gfn range check
Date: Thu, 18 Aug 2016 10:01:27 +0100
Message-ID: <bdd31f220bb2a95b2e3cfad2208e31e60c25d3f4.1471018462.git-series.james.hogan@imgtec.com>
MIME-Version: 1.0
In-Reply-To: <cover.d02ea4d58713b53527649c3ad5487b32fd8df3cd.1471018462.git-series.james.hogan@imgtec.com>
References: <cover.d02ea4d58713b53527649c3ad5487b32fd8df3cd.1471018462.git-series.james.hogan@imgtec.com>
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
To: stable@vger.kernel.org
Cc: James Hogan <james.hogan@imgtec.com>, Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, kvm@vger.kernel.org
Message-ID: <20160818090127.Dq_UWtavazqku6d5YV6IXhR58fmDoAf45ldrG4fI0Ro@z>

commit 8985d50382359e5bf118fdbefc859d0dbf6cebc7 upstream.

kvm_mips_handle_mapped_seg_tlb_fault() calculates the guest frame number
based on the guest TLB EntryLo values, however it is not range checked
to ensure it lies within the guest_pmap. If the physical memory the
guest refers to is out of range then dump the guest TLB and emit an
internal error.

Fixes: 858dd5d45733 ("KVM/MIPS32: MMU/TLB operations for the Guest.")
Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Radim Krčmář" <rkrcmar@redhat.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Cc: kvm@vger.kernel.org
Signed-off-by: Radim Krčmář <rkrcmar@redhat.com>
[james.hogan@imgtec.com: Backport to v4.7]
Signed-off-by: James Hogan <james.hogan@imgtec.com>
---
 arch/mips/kvm/tlb.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/arch/mips/kvm/tlb.c b/arch/mips/kvm/tlb.c
index 79d90a34775e..6c17ee73b8a3 100644
--- a/arch/mips/kvm/tlb.c
+++ b/arch/mips/kvm/tlb.c
@@ -373,6 +373,7 @@ int kvm_mips_handle_mapped_seg_tlb_fault(struct kvm_vcpu *vcpu,
 	unsigned long entryhi = 0, entrylo0 = 0, entrylo1 = 0;
 	struct kvm *kvm = vcpu->kvm;
 	kvm_pfn_t pfn0, pfn1;
+	gfn_t gfn0, gfn1;
 	long tlb_lo[2];
 	int ret;
 
@@ -387,18 +388,24 @@ int kvm_mips_handle_mapped_seg_tlb_fault(struct kvm_vcpu *vcpu,
 			VPN2_MASK & (PAGE_MASK << 1)))
 		tlb_lo[(KVM_GUEST_COMMPAGE_ADDR >> PAGE_SHIFT) & 1] = 0;
 
-	if (kvm_mips_map_page(kvm, mips3_tlbpfn_to_paddr(tlb_lo[0])
-				   >> PAGE_SHIFT) < 0)
+	gfn0 = mips3_tlbpfn_to_paddr(tlb_lo[0]) >> PAGE_SHIFT;
+	gfn1 = mips3_tlbpfn_to_paddr(tlb_lo[1]) >> PAGE_SHIFT;
+	if (gfn0 >= kvm->arch.guest_pmap_npages ||
+	    gfn1 >= kvm->arch.guest_pmap_npages) {
+		kvm_err("%s: Invalid gfn: [%#llx, %#llx], EHi: %#lx\n",
+			__func__, gfn0, gfn1, tlb->tlb_hi);
+		kvm_mips_dump_guest_tlbs(vcpu);
+		return -1;
+	}
+
+	if (kvm_mips_map_page(kvm, gfn0) < 0)
 		return -1;
 
-	if (kvm_mips_map_page(kvm, mips3_tlbpfn_to_paddr(tlb_lo[1])
-				   >> PAGE_SHIFT) < 0)
+	if (kvm_mips_map_page(kvm, gfn1) < 0)
 		return -1;
 
-	pfn0 = kvm->arch.guest_pmap[mips3_tlbpfn_to_paddr(tlb_lo[0])
-				    >> PAGE_SHIFT];
-	pfn1 = kvm->arch.guest_pmap[mips3_tlbpfn_to_paddr(tlb_lo[1])
-				    >> PAGE_SHIFT];
+	pfn0 = kvm->arch.guest_pmap[gfn0];
+	pfn1 = kvm->arch.guest_pmap[gfn1];
 
 	if (hpa0)
 		*hpa0 = pfn0 << PAGE_SHIFT;
-- 
git-series 0.8.8
