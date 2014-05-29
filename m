Received: from mailapp01.imgtec.com ([195.59.15.196]:26058 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6822107AbaE2TMeOcsFT (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 29 May 2014 21:12:34 +0200
From: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
Subject: [PATCH] MIPS: KVM: remove the stale memory alias support function unalias_gfn
Date: Thu, 29 May 2014 12:12:22 -0700
Message-ID: <1401390742-3550-1-git-send-email-dengcheng.zhu@imgtec.com>
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
Message-ID: <20140529191222.2cr1J9OHTV17rihw3Q6xnwy9-UWEueqW22CIWTmbIA4@z>

From: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>

The memory alias support has been removed since a1f4d39500 (KVM: Remove
memory alias support). So remove unalias_gfn from the MIPS port.

Reviewed-by: James Hogan <james.hogan@imgtec.com>
Signed-off-by: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
---
 arch/mips/kvm/kvm_mips.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/mips/kvm/kvm_mips.c b/arch/mips/kvm/kvm_mips.c
index da5186f..a0d1e71 100644
--- a/arch/mips/kvm/kvm_mips.c
+++ b/arch/mips/kvm/kvm_mips.c
@@ -61,11 +61,6 @@ static int kvm_mips_reset_vcpu(struct kvm_vcpu *vcpu)
 	return 0;
 }
 
-gfn_t unalias_gfn(struct kvm *kvm, gfn_t gfn)
-{
-	return gfn;
-}
-
 /* XXXKYMA: We are simulatoring a processor that has the WII bit set in Config7, so we
  * are "runnable" if interrupts are pending
  */
-- 
1.8.5.3
