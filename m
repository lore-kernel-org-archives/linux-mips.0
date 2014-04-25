Received: from mailapp01.imgtec.com ([195.89.28.114]:39839 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6843054AbaDYPUpivYi- (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 25 Apr 2014 17:20:45 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 18/21] MIPS: KVM: Fix kvm_debug bit-rottage
Date: Fri, 25 Apr 2014 16:20:01 +0100
Message-ID: <1398439204-26171-19-git-send-email-james.hogan@imgtec.com>
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
Message-ID: <20140425152001.gwO0TcHM1Dgtu6USAcRWjicI5QZ2al1CDbjA27yy0x0@z>

Fix build errors when DEBUG is defined in arch/mips/kvm/.
 - The DEBUG code in kvm_mips_handle_tlbmod() was missing some variables.
 - The DEBUG code in kvm_mips_host_tlb_write() was conditional on an
   undefined "debug" variable.
 - The DEBUG code in kvm_mips_host_tlb_inv() accessed asid_map directly
   rather than using kvm_mips_get_user_asid(). Also fixed brace
   placement.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Gleb Natapov <gleb@kernel.org>
Cc: kvm@vger.kernel.org
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Cc: Sanjay Lal <sanjayl@kymasys.com>
---
 arch/mips/kvm/kvm_mips_emul.c |  6 +++++-
 arch/mips/kvm/kvm_tlb.c       | 14 +++++---------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/mips/kvm/kvm_mips_emul.c b/arch/mips/kvm/kvm_mips_emul.c
index fcbc5ff6c347..ba7519b78985 100644
--- a/arch/mips/kvm/kvm_mips_emul.c
+++ b/arch/mips/kvm/kvm_mips_emul.c
@@ -1882,8 +1882,12 @@ kvm_mips_handle_tlbmod(unsigned long cause, uint32_t *opc,
 		       struct kvm_run *run, struct kvm_vcpu *vcpu)
 {
 	enum emulation_result er = EMULATE_DONE;
-
 #ifdef DEBUG
+	struct mips_coproc *cop0 = vcpu->arch.cop0;
+	unsigned long entryhi = (vcpu->arch.host_cp0_badvaddr & VPN2_MASK) |
+				(kvm_read_c0_guest_entryhi(cop0) & ASID_MASK);
+	int index;
+
 	/*
 	 * If address not in the guest TLB, then we are in trouble
 	 */
diff --git a/arch/mips/kvm/kvm_tlb.c b/arch/mips/kvm/kvm_tlb.c
index 1f61fe6739da..53a39d32b5e0 100644
--- a/arch/mips/kvm/kvm_tlb.c
+++ b/arch/mips/kvm/kvm_tlb.c
@@ -233,12 +233,9 @@ kvm_mips_host_tlb_write(struct kvm_vcpu *vcpu, unsigned long entryhi,
 	tlbw_use_hazard();
 
 #ifdef DEBUG
-	if (debug) {
-		kvm_debug("@ %#lx idx: %2d [entryhi(R): %#lx] "
-			  "entrylo0(R): 0x%08lx, entrylo1(R): 0x%08lx\n",
-			  vcpu->arch.pc, idx, read_c0_entryhi(),
-			  read_c0_entrylo0(), read_c0_entrylo1());
-	}
+	kvm_debug("@ %#lx idx: %2d [entryhi(R): %#lx] entrylo0(R): 0x%08lx, entrylo1(R): 0x%08lx\n",
+		  vcpu->arch.pc, idx, read_c0_entryhi(),
+		  read_c0_entrylo0(), read_c0_entrylo1());
 #endif
 
 	/* Flush D-cache */
@@ -507,10 +504,9 @@ int kvm_mips_host_tlb_inv(struct kvm_vcpu *vcpu, unsigned long va)
 	local_irq_restore(flags);
 
 #ifdef DEBUG
-	if (idx > 0) {
+	if (idx > 0)
 		kvm_debug("%s: Invalidated entryhi %#lx @ idx %d\n", __func__,
-			  (va & VPN2_MASK) | (vcpu->arch.asid_map[va & ASID_MASK] & ASID_MASK), idx);
-	}
+			  (va & VPN2_MASK) | kvm_mips_get_user_asid(vcpu), idx);
 #endif
 
 	return 0;
-- 
1.8.1.2
