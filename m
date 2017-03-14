Received: from mailapp01.imgtec.com ([195.59.15.196]:62841 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993942AbdCNRAUUGuSE (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 14 Mar 2017 18:00:20 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 1/2] KVM: MIPS/Emulate: Fix TLBWR with wired for T&E
Date: Tue, 14 Mar 2017 17:00:07 +0000
Message-ID: <8083c96f7d942288a45a5f23d7bfd39bfceb273e.1489510483.git-series.james.hogan@imgtec.com>
MIME-Version: 1.0
In-Reply-To: <cover.57583f73c169e83d499329fbda19909b816c0024.1489510483.git-series.james.hogan@imgtec.com>
References: <cover.57583f73c169e83d499329fbda19909b816c0024.1489510483.git-series.james.hogan@imgtec.com>
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
Cc: James Hogan <james.hogan@imgtec.com>, Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>, Ralf Baechle <ralf@linux-mips.org>, kvm@vger.kernel.org, "# 3 . 10 . x-" <stable@vger.kernel.org>
Message-ID: <20170314170007.TTFEmIJL77HN0S9MpXzQOyUVptOPMCC2MZagwPcYERQ@z>

The implementation of the TLBWR instruction for Trap & Emulate does not
take the CP0_Wired register into account, allowing the guest's wired
entries to be easily overwritten during normal guest TLB refill
operation.

Offset the random TLB index by CP0_Wired and keep it in the range of
valid non-wired entries with a modulo operation instead of a mask. This
allows wired TLB entries to be properly preserved.

Fixes: e685c689f3a8 ("KVM/MIPS32: Privileged instruction/target ...")
Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Radim Krčmář" <rkrcmar@redhat.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Cc: kvm@vger.kernel.org
Cc: <stable@vger.kernel.org> # 3.10.x-
---
 arch/mips/kvm/emulate.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kvm/emulate.c b/arch/mips/kvm/emulate.c
index 4833ebad89d9..dd47f2bda01b 100644
--- a/arch/mips/kvm/emulate.c
+++ b/arch/mips/kvm/emulate.c
@@ -1094,10 +1094,12 @@ enum emulation_result kvm_mips_emul_tlbwr(struct kvm_vcpu *vcpu)
 	struct mips_coproc *cop0 = vcpu->arch.cop0;
 	struct kvm_mips_tlb *tlb = NULL;
 	unsigned long pc = vcpu->arch.pc;
+	unsigned int wired;
 	int index;
 
 	get_random_bytes(&index, sizeof(index));
-	index &= (KVM_MIPS_GUEST_TLB_SIZE - 1);
+	wired = kvm_read_c0_guest_wired(cop0) & (KVM_MIPS_GUEST_TLB_SIZE - 1);
+	index = wired + index % (KVM_MIPS_GUEST_TLB_SIZE - wired);
 
 	tlb = &vcpu->arch.guest_tlb[index];
 
-- 
git-series 0.8.10
