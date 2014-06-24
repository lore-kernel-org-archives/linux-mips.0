Received: from mailapp01.imgtec.com ([195.59.15.196]:60021 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6842302AbaFXRbkMq6QZ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 24 Jun 2014 19:31:40 +0200
From: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
Subject: [PATCH v3 4/9] MIPS: KVM: Remove unneeded volatile
Date: Tue, 24 Jun 2014 10:31:05 -0700
Message-ID: <1403631071-6012-5-git-send-email-dengcheng.zhu@imgtec.com>
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
Message-ID: <20140624173105.IzpHZBmUaI-3bfrRa2ULGAFEqUvHlTRQ1uDWICGSFb4@z>

From: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>

The keyword volatile for idx in the TLB functions is unnecessary.

Signed-off-by: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
---
 arch/mips/kvm/kvm_tlb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kvm/kvm_tlb.c b/arch/mips/kvm/kvm_tlb.c
index 29a5bdb..bbcd822 100644
--- a/arch/mips/kvm/kvm_tlb.c
+++ b/arch/mips/kvm/kvm_tlb.c
@@ -201,7 +201,7 @@ int kvm_mips_host_tlb_write(struct kvm_vcpu *vcpu, unsigned long entryhi,
 {
 	unsigned long flags;
 	unsigned long old_entryhi;
-	volatile int idx;
+	int idx;
 
 	local_irq_save(flags);
 
@@ -426,7 +426,7 @@ EXPORT_SYMBOL(kvm_mips_guest_tlb_lookup);
 int kvm_mips_host_tlb_lookup(struct kvm_vcpu *vcpu, unsigned long vaddr)
 {
 	unsigned long old_entryhi, flags;
-	volatile int idx;
+	int idx;
 
 	local_irq_save(flags);
 
-- 
1.8.5.3
