Received: from mailapp01.imgtec.com ([195.59.15.196]:29724 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992078AbdFTJ6Si7Zxm (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 20 Jun 2017 11:58:18 +0200
From: James Cowgill <James.Cowgill@imgtec.com>
Subject: [PATCH v2] KVM: MIPS: Fix maybe-uninitialized build failure
Date: Tue, 20 Jun 2017 10:57:51 +0100
Message-ID: <20170620095751.5443-1-James.Cowgill@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-Path: <James.Cowgill@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: James Hogan <james.hogan@imgtec.com>, Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, kvm@vger.kernel.org, James Cowgill <James.Cowgill@imgtec.com>
Message-ID: <20170620095751.4sc9x8dYuda5wDvGZBRRRaw-lAEuG5sezTOh2vgtvIA@z>

This commit fixes a "maybe-uninitialized" build failure in
arch/mips/kvm/tlb.c when KVM, DYNAMIC_DEBUG and JUMP_LABEL are all
enabled. The failure is:

In file included from ./include/linux/printk.h:329:0,
                 from ./include/linux/kernel.h:13,
                 from ./include/asm-generic/bug.h:15,
                 from ./arch/mips/include/asm/bug.h:41,
                 from ./include/linux/bug.h:4,
                 from ./include/linux/thread_info.h:11,
                 from ./include/asm-generic/current.h:4,
                 from ./arch/mips/include/generated/asm/current.h:1,
                 from ./include/linux/sched.h:11,
                 from arch/mips/kvm/tlb.c:13:
arch/mips/kvm/tlb.c: In function ‘kvm_mips_host_tlb_inv’:
./include/linux/dynamic_debug.h:126:3: error: ‘idx_kernel’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
   __dynamic_pr_debug(&descriptor, pr_fmt(fmt), \
   ^~~~~~~~~~~~~~~~~~
arch/mips/kvm/tlb.c:169:16: note: ‘idx_kernel’ was declared here
  int idx_user, idx_kernel;
                ^~~~~~~~~~

There is a similar error relating to "idx_user". Both errors were
observed with GCC 6.

As far as I can tell, it is impossible for either idx_user or idx_kernel
to be uninitialized when they are later read in the calls to kvm_debug,
but to satisfy the compiler, add zero initializers to both variables.

Signed-off-by: James Cowgill <James.Cowgill@imgtec.com>
Fixes: 57e3869cfaae ("KVM: MIPS/TLB: Generalise host TLB invalidate to kernel ASID")
Cc: <stable@vger.kernel.org> # 4.11+
---
 arch/mips/kvm/tlb.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kvm/tlb.c b/arch/mips/kvm/tlb.c
index 7c6336dd2638..7cd92166a0b9 100644
--- a/arch/mips/kvm/tlb.c
+++ b/arch/mips/kvm/tlb.c
@@ -166,7 +166,11 @@ static int _kvm_mips_host_tlb_inv(unsigned long entryhi)
 int kvm_mips_host_tlb_inv(struct kvm_vcpu *vcpu, unsigned long va,
 			  bool user, bool kernel)
 {
-	int idx_user, idx_kernel;
+	/*
+	 * Initialize idx_user and idx_kernel to workaround bogus
+	 * maybe-initialized warning when using GCC 6.
+	 */
+	int idx_user = 0, idx_kernel = 0;
 	unsigned long flags, old_entryhi;
 
 	local_irq_save(flags);
-- 
2.11.0
