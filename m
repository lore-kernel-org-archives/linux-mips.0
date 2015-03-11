Received: from mailapp01.imgtec.com ([195.59.15.196]:29880 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27013388AbbCKOsMQrlty (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 11 Mar 2015 15:48:12 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 05/20] MIPS: KVM: Sort kvm_mips_get_reg() registers
Date: Wed, 11 Mar 2015 14:44:41 +0000
Message-ID: <1426085096-12932-6-git-send-email-james.hogan@imgtec.com>
In-Reply-To: <1426085096-12932-1-git-send-email-james.hogan@imgtec.com>
References: <1426085096-12932-1-git-send-email-james.hogan@imgtec.com>
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
To: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, linux-mips@linux-mips.org
Cc: James Hogan <james.hogan@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>, Gleb Natapov <gleb@kernel.org>
Message-ID: <20150311144441.B_gIBi8VRaUQaIIMnhtAUe9zjiXfu5YAxknbPl8Lltk@z>

Sort the registers in the kvm_mips_get_reg() switch by register number,
which puts ERROREPC after the CONFIG registers.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Gleb Natapov <gleb@kernel.org>
Cc: linux-mips@linux-mips.org
Cc: kvm@vger.kernel.org
---
 arch/mips/kvm/mips.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index fd620cc8a44c..b909c0046f08 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -578,9 +578,6 @@ static int kvm_mips_get_reg(struct kvm_vcpu *vcpu,
 	case KVM_REG_MIPS_CP0_PRID:
 		v = (long)kvm_read_c0_guest_prid(cop0);
 		break;
-	case KVM_REG_MIPS_CP0_ERROREPC:
-		v = (long)kvm_read_c0_guest_errorepc(cop0);
-		break;
 	case KVM_REG_MIPS_CP0_CONFIG:
 		v = (long)kvm_read_c0_guest_config(cop0);
 		break;
@@ -596,6 +593,9 @@ static int kvm_mips_get_reg(struct kvm_vcpu *vcpu,
 	case KVM_REG_MIPS_CP0_CONFIG7:
 		v = (long)kvm_read_c0_guest_config7(cop0);
 		break;
+	case KVM_REG_MIPS_CP0_ERROREPC:
+		v = (long)kvm_read_c0_guest_errorepc(cop0);
+		break;
 	/* registers to be handled specially */
 	case KVM_REG_MIPS_CP0_COUNT:
 	case KVM_REG_MIPS_COUNT_CTL:
-- 
2.0.5
