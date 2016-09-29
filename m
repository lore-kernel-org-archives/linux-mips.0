Received: from mailapp02.imgtec.com ([217.156.133.132]:63599 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23992078AbcI2MNZpjTOi (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 29 Sep 2016 14:13:25 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [GIT PULL 2/6] KVM: MIPS: Emulate MMIO via TLB miss for EVA
Date: Thu, 29 Sep 2016 13:13:09 +0100
Message-ID: <1475151193-28505-3-git-send-email-james.hogan@imgtec.com>
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
Message-ID: <20160929121309.iRw8u5ywH1YPCBAryNilza_qKohOhYYUwtdnZhfW7u8@z>

MIPS Enhanced Virtual Addressing (EVA) allows the virtual memory
segments to be rearranged such that the KSeg0/KSeg1 segments are
accessible TLB mapped to user mode, which would trigger a TLB Miss
exception (due to lack of TLB mappings) instead of an Address Error
exception.

Update the TLB Miss handling similar to Address Error handling for guest
MMIO emulation.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Radim Krčmář" <rkrcmar@redhat.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Cc: kvm@vger.kernel.org
---
 arch/mips/kvm/trap_emul.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/mips/kvm/trap_emul.c b/arch/mips/kvm/trap_emul.c
index 091553942bcb..3a5484f9aa50 100644
--- a/arch/mips/kvm/trap_emul.c
+++ b/arch/mips/kvm/trap_emul.c
@@ -175,6 +175,24 @@ static int kvm_trap_emul_handle_tlb_miss(struct kvm_vcpu *vcpu, bool store)
 			run->exit_reason = KVM_EXIT_INTERNAL_ERROR;
 			ret = RESUME_HOST;
 		}
+	} else if (KVM_GUEST_KERNEL_MODE(vcpu)
+		   && (KSEGX(badvaddr) == CKSEG0 || KSEGX(badvaddr) == CKSEG1)) {
+		/*
+		 * With EVA we may get a TLB exception instead of an address
+		 * error when the guest performs MMIO to KSeg1 addresses.
+		 */
+		kvm_debug("Emulate %s MMIO space\n",
+			  store ? "Store to" : "Load from");
+		er = kvm_mips_emulate_inst(cause, opc, run, vcpu);
+		if (er == EMULATE_FAIL) {
+			kvm_err("Emulate %s MMIO space failed\n",
+				store ? "Store to" : "Load from");
+			run->exit_reason = KVM_EXIT_INTERNAL_ERROR;
+			ret = RESUME_HOST;
+		} else {
+			run->exit_reason = KVM_EXIT_MMIO;
+			ret = RESUME_HOST;
+		}
 	} else {
 		kvm_err("Illegal TLB %s fault address , cause %#x, PC: %p, BadVaddr: %#lx\n",
 			store ? "ST" : "LD", cause, opc, badvaddr);
-- 
2.7.3
