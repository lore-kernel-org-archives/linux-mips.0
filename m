Received: from mailapp01.imgtec.com ([195.59.15.196]:13472 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011935AbbLKRHSJwqqs (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 11 Dec 2015 18:07:18 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH backport v3.10..v3.14 4/4] MIPS: KVM: Uninit VCPU in vcpu_create error path
Date: Fri, 11 Dec 2015 17:06:55 +0000
Message-ID: <1449853615-6535-4-git-send-email-james.hogan@imgtec.com>
In-Reply-To: <1449853615-6535-1-git-send-email-james.hogan@imgtec.com>
References: <1449853615-6535-1-git-send-email-james.hogan@imgtec.com>
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
To: stable@vger.kernel.org
Cc: James Hogan <james.hogan@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>, Paolo Bonzini <pbonzini@redhat.com>, Gleb Natapov <gleb@kernel.org>, linux-mips@linux-mips.org, kvm@vger.kernel.org
Message-ID: <20151211170655.9e2qQvnQaukxFRs5HXLUJ0t4-jyyuNconfRJj41PS2Y@z>

commit 585bb8f9a5e592f2ce7abbe5ed3112d5438d2754 upstream.

If either of the memory allocations in kvm_arch_vcpu_create() fail, the
vcpu which has been allocated and kvm_vcpu_init'd doesn't get uninit'd
in the error handling path. Add a call to kvm_vcpu_uninit() to fix this.

Fixes: 669e846e6c4e ("KVM/MIPS32: MIPS arch specific APIs for KVM")
Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Gleb Natapov <gleb@kernel.org>
Cc: linux-mips@linux-mips.org
Cc: kvm@vger.kernel.org
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: James Hogan <james.hogan@imgtec.com>
---
 arch/mips/kvm/kvm_mips.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kvm/kvm_mips.c b/arch/mips/kvm/kvm_mips.c
index 2cb24788a8a6..7e7de1f2b8ed 100644
--- a/arch/mips/kvm/kvm_mips.c
+++ b/arch/mips/kvm/kvm_mips.c
@@ -312,7 +312,7 @@ struct kvm_vcpu *kvm_arch_vcpu_create(struct kvm *kvm, unsigned int id)
 
 	if (!gebase) {
 		err = -ENOMEM;
-		goto out_free_cpu;
+		goto out_uninit_cpu;
 	}
 	kvm_info("Allocated %d bytes for KVM Exception Handlers @ %p\n",
 		 ALIGN(size, PAGE_SIZE), gebase);
@@ -372,6 +372,9 @@ struct kvm_vcpu *kvm_arch_vcpu_create(struct kvm *kvm, unsigned int id)
 out_free_gebase:
 	kfree(gebase);
 
+out_uninit_cpu:
+	kvm_vcpu_uninit(vcpu);
+
 out_free_cpu:
 	kfree(vcpu);
 
-- 
2.4.10
