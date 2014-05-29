Received: from mailapp01.imgtec.com ([195.59.15.196]:31246 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6839027AbaE2JRSjO8gE (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 29 May 2014 11:17:18 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH v2 23/23] MIPS: KVM: Remove redundant semicolon
Date: Thu, 29 May 2014 10:16:45 +0100
Message-ID: <1401355005-20370-24-git-send-email-james.hogan@imgtec.com>
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
Message-ID: <20140529091645.kz3ShJ4oZhUsI4At4Di7TITwFU8joPmZUR2S7KqtEPI@z>

Remove extra semicolon in kvm_arch_vcpu_dump_regs().

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Gleb Natapov <gleb@kernel.org>
Cc: kvm@vger.kernel.org
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Cc: Sanjay Lal <sanjayl@kymasys.com>
---
v2:
 - New patch.
---
 arch/mips/kvm/kvm_mips.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kvm/kvm_mips.c b/arch/mips/kvm/kvm_mips.c
index 1a4330847153..fd858a9e1f8a 100644
--- a/arch/mips/kvm/kvm_mips.c
+++ b/arch/mips/kvm/kvm_mips.c
@@ -928,7 +928,7 @@ int kvm_arch_vcpu_dump_regs(struct kvm_vcpu *vcpu)
 		return -1;
 
 	printk("VCPU Register Dump:\n");
-	printk("\tpc = 0x%08lx\n", vcpu->arch.pc);;
+	printk("\tpc = 0x%08lx\n", vcpu->arch.pc);
 	printk("\texceptions: %08lx\n", vcpu->arch.pending_exceptions);
 
 	for (i = 0; i < 32; i += 4) {
-- 
1.9.3
