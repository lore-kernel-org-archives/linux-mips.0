Received: from mailapp01.imgtec.com ([195.59.15.196]:24588 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27014080AbbLPXuT2kYn0 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 17 Dec 2015 00:50:19 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 15/16] MIPS: KVM: Consistent use of uint*_t in MMIO handling
Date: Wed, 16 Dec 2015 23:49:40 +0000
Message-ID: <1450309781-28030-16-git-send-email-james.hogan@imgtec.com>
In-Reply-To: <1450309781-28030-1-git-send-email-james.hogan@imgtec.com>
References: <1450309781-28030-1-git-send-email-james.hogan@imgtec.com>
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
To: Ralf Baechle <ralf@linux-mips.org>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Gleb Natapov <gleb@kernel.org>, linux-mips@linux-mips.org, kvm@vger.kernel.org, James Hogan <james.hogan@imgtec.com>
Message-ID: <20151216234940.g6WE9t3dd6ySM_s6WqqFF59nVlKAwLOaiKGFlHQNX9A@z>

Make consistent use of uint8_t in MMIO handling code.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Gleb Natapov <gleb@kernel.org>
Cc: linux-mips@linux-mips.org
Cc: kvm@vger.kernel.org
---
 arch/mips/kvm/emulate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kvm/emulate.c b/arch/mips/kvm/emulate.c
index 845fd0d91040..912b39bb7f86 100644
--- a/arch/mips/kvm/emulate.c
+++ b/arch/mips/kvm/emulate.c
@@ -2401,7 +2401,7 @@ enum emulation_result kvm_mips_complete_mmio_load(struct kvm_vcpu *vcpu,
 		if (vcpu->mmio_needed == 2)
 			*gpr = *(int8_t *) run->mmio.data;
 		else
-			*gpr = *(u8 *) run->mmio.data;
+			*gpr = *(uint8_t *)run->mmio.data;
 		break;
 	}
 
-- 
2.4.10
