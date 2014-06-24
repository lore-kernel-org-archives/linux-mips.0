Received: from mailapp01.imgtec.com ([195.59.15.196]:41486 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6855641AbaFXRbxOtJjd (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 24 Jun 2014 19:31:53 +0200
From: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
Subject: [PATCH v3 9/9] MIPS: KVM: Remove dead code of TLB index error in kvm_mips_emul_tlbwr()
Date: Tue, 24 Jun 2014 10:31:10 -0700
Message-ID: <1403631071-6012-10-git-send-email-dengcheng.zhu@imgtec.com>
In-Reply-To: <1403631071-6012-1-git-send-email-dengcheng.zhu@imgtec.com>
References: <1403631071-6012-1-git-send-email-dengcheng.zhu@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <DengCheng.Zhu@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: pbonzini@redhat.com
Cc: gleb@kernel.org, kvm@vger.kernel.org, sanjayl@kymasys.com, james.hogan@imgtec.com, ralf@linux-mips.org, linux-mips@linux-mips.org, dengcheng.zhu@imgtec.com
Message-ID: <20140624173110.YtjF-4GDLxTzSp6ZOzzNGg0-kG_5i6CbD3CIHZHzkbw@z>

From: James Hogan <james.hogan@imgtec.com>

It's impossible to fall into the error handling of the TLB index after
being masked by (KVM_MIPS_GUEST_TLB_SIZE - 1). Remove the dead code.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Signed-off-by: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
---
 arch/mips/kvm/emulate.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/mips/kvm/emulate.c b/arch/mips/kvm/emulate.c
index 982f4af..5500fef 100644
--- a/arch/mips/kvm/emulate.c
+++ b/arch/mips/kvm/emulate.c
@@ -846,11 +846,6 @@ enum emulation_result kvm_mips_emul_tlbwr(struct kvm_vcpu *vcpu)
 	get_random_bytes(&index, sizeof(index));
 	index &= (KVM_MIPS_GUEST_TLB_SIZE - 1);
 
-	if (index < 0 || index >= KVM_MIPS_GUEST_TLB_SIZE) {
-		kvm_err("%s: illegal index: %d\n", __func__, index);
-		return EMULATE_FAIL;
-	}
-
 	tlb = &vcpu->arch.guest_tlb[index];
 
 	/*
-- 
1.8.5.3
