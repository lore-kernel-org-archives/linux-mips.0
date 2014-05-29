Received: from mailapp01.imgtec.com ([195.59.15.196]:29125 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6837141AbaE2JRMwKdD3 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 29 May 2014 11:17:12 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH v2 22/23] MIPS: KVM: Remove redundant NULL checks before kfree()
Date: Thu, 29 May 2014 10:16:44 +0100
Message-ID: <1401355005-20370-23-git-send-email-james.hogan@imgtec.com>
In-Reply-To: <1401355005-20370-1-git-send-email-james.hogan@imgtec.com>
References: <1401355005-20370-1-git-send-email-james.hogan@imgtec.com>
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
Cc: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>, James Hogan <james.hogan@imgtec.com>, Gleb Natapov <gleb@kernel.org>, kvm@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, Sanjay Lal <sanjayl@kymasys.com>
Message-ID: <20140529091644.NcfKh2ywAu2X3HNAlQPYGiA5vjrbDrL23FdOBazkW1k@z>

The kfree() function already NULL checks the parameter so remove the
redundant NULL checks before kfree() calls in arch/mips/kvm/.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Gleb Natapov <gleb@kernel.org>
Cc: kvm@vger.kernel.org
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Cc: Sanjay Lal <sanjayl@kymasys.com>
---
 arch/mips/kvm/kvm_mips.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/arch/mips/kvm/kvm_mips.c b/arch/mips/kvm/kvm_mips.c
index 687be9ca1f74..1a4330847153 100644
--- a/arch/mips/kvm/kvm_mips.c
+++ b/arch/mips/kvm/kvm_mips.c
@@ -149,9 +149,7 @@ void kvm_mips_free_vcpus(struct kvm *kvm)
 		if (kvm->arch.guest_pmap[i] != KVM_INVALID_PAGE)
 			kvm_mips_release_pfn_clean(kvm->arch.guest_pmap[i]);
 	}
-
-	if (kvm->arch.guest_pmap)
-		kfree(kvm->arch.guest_pmap);
+	kfree(kvm->arch.guest_pmap);
 
 	kvm_for_each_vcpu(i, vcpu, kvm) {
 		kvm_arch_vcpu_free(vcpu);
@@ -389,12 +387,8 @@ void kvm_arch_vcpu_free(struct kvm_vcpu *vcpu)
 
 	kvm_mips_dump_stats(vcpu);
 
-	if (vcpu->arch.guest_ebase)
-		kfree(vcpu->arch.guest_ebase);
-
-	if (vcpu->arch.kseg0_commpage)
-		kfree(vcpu->arch.kseg0_commpage);
-
+	kfree(vcpu->arch.guest_ebase);
+	kfree(vcpu->arch.kseg0_commpage);
 }
 
 void kvm_arch_vcpu_destroy(struct kvm_vcpu *vcpu)
-- 
1.9.3
