Received: from mailapp01.imgtec.com ([195.59.15.196]:39875 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992663AbcITMGCXbQl6 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 20 Sep 2016 14:06:02 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 2/4] KVM: MIPS: Split kernel/user ASID regeneration
Date: Tue, 20 Sep 2016 13:05:38 +0100
Message-ID: <cc2428bec559fc4bd94f831c968b3671c6da4b22.1474372617.git-series.james.hogan@imgtec.com>
MIME-Version: 1.0
In-Reply-To: <cover.b4aaacd5414bd20c4eb4d53417956b268d69d1af.1474372617.git-series.james.hogan@imgtec.com>
References: <cover.b4aaacd5414bd20c4eb4d53417956b268d69d1af.1474372617.git-series.james.hogan@imgtec.com>
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
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, James Hogan <james.hogan@imgtec.com>
Message-ID: <20160920120538.DGURVYCh0ECnWfrNt8Z5FNW_Kyc_QSH-Ig6JEpuc9Ms@z>

The host ASIDs for guest kernel and user mode are regenerated together
if the ASID for guest kernel mode is out of date. That is fine as the
ASID for guest kernel mode is always generated first, however it doesn't
allow the ASIDs to be regenerated or invalidated individually instead of
linearly flushing the entire host TLB.

Therefore separate the regeneration code so that the ASIDs are checked
and regenerated separately.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Radim Krčmář" <rkrcmar@redhat.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Cc: kvm@vger.kernel.org
---
 arch/mips/kvm/mmu.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kvm/mmu.c b/arch/mips/kvm/mmu.c
index 121008c0fcc9..3b677c851be0 100644
--- a/arch/mips/kvm/mmu.c
+++ b/arch/mips/kvm/mmu.c
@@ -250,6 +250,16 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 		kvm_get_new_mmu_context(&vcpu->arch.guest_kernel_mm, cpu, vcpu);
 		vcpu->arch.guest_kernel_asid[cpu] =
 		    vcpu->arch.guest_kernel_mm.context.asid[cpu];
+		newasid++;
+
+		kvm_debug("[%d]: cpu_context: %#lx\n", cpu,
+			  cpu_context(cpu, current->mm));
+		kvm_debug("[%d]: Allocated new ASID for Guest Kernel: %#x\n",
+			  cpu, vcpu->arch.guest_kernel_asid[cpu]);
+	}
+
+	if ((vcpu->arch.guest_user_asid[cpu] ^ asid_cache(cpu)) &
+						asid_version_mask(cpu)) {
 		kvm_get_new_mmu_context(&vcpu->arch.guest_user_mm, cpu, vcpu);
 		vcpu->arch.guest_user_asid[cpu] =
 		    vcpu->arch.guest_user_mm.context.asid[cpu];
@@ -257,8 +267,6 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 
 		kvm_debug("[%d]: cpu_context: %#lx\n", cpu,
 			  cpu_context(cpu, current->mm));
-		kvm_debug("[%d]: Allocated new ASID for Guest Kernel: %#x\n",
-			  cpu, vcpu->arch.guest_kernel_asid[cpu]);
 		kvm_debug("[%d]: Allocated new ASID for Guest User: %#x\n", cpu,
 			  vcpu->arch.guest_user_asid[cpu]);
 	}
-- 
git-series 0.8.10
