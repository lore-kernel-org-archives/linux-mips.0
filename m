Received: from mailapp01.imgtec.com ([195.59.15.196]:13694 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27006518AbbLKRHQZFSqs (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 11 Dec 2015 18:07:16 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH backport v3.10 1/4] MIPS: KVM: Fix ASID restoration logic
Date: Fri, 11 Dec 2015 17:06:52 +0000
Message-ID: <1449853615-6535-1-git-send-email-james.hogan@imgtec.com>
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
To: stable@vger.kernel.org
Cc: James Hogan <james.hogan@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>, Paolo Bonzini <pbonzini@redhat.com>, Gleb Natapov <gleb@kernel.org>, linux-mips@linux-mips.org, kvm@vger.kernel.org
Message-ID: <20151211170652.9Z53-hbBkBGV-_M0Qtilh5TV_Ph5hm93u176f1NALJE@z>

commit 002374f371bd02df864cce1fe85d90dc5b292837 upstream.

ASID restoration on guest resume should determine the guest execution
mode based on the guest Status register rather than bit 30 of the guest
PC.

Fix the two places in locore.S that do this, loading the guest status
from the cop0 area. Note, this assembly is specific to the trap &
emulate implementation of KVM, so it doesn't need to check the
supervisor bit as that mode is not implemented in the guest.

Fixes: b680f70fc111 ("KVM/MIPS32: Entry point for trampolining to...")
Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Gleb Natapov <gleb@kernel.org>
Cc: linux-mips@linux-mips.org
Cc: kvm@vger.kernel.org
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: James Hogan <james.hogan@imgtec.com>
---
 arch/mips/kvm/kvm_locore.S | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/mips/kvm/kvm_locore.S b/arch/mips/kvm/kvm_locore.S
index 920b63210806..34c35f0e3290 100644
--- a/arch/mips/kvm/kvm_locore.S
+++ b/arch/mips/kvm/kvm_locore.S
@@ -156,9 +156,11 @@ FEXPORT(__kvm_mips_vcpu_run)
 
 FEXPORT(__kvm_mips_load_asid)
     /* Set the ASID for the Guest Kernel */
-    sll         t0, t0, 1                       /* with kseg0 @ 0x40000000, kernel */
-                                                /* addresses shift to 0x80000000 */
-    bltz        t0, 1f                          /* If kernel */
+    PTR_L	t0, VCPU_COP0(k1)
+    LONG_L	t0, COP0_STATUS(t0)
+    andi	t0, KSU_USER | ST0_ERL | ST0_EXL
+    xori	t0, KSU_USER
+    bnez	t0, 1f		/* If kernel */
 	addiu       t1, k1, VCPU_GUEST_KERNEL_ASID  /* (BD)  */
     addiu       t1, k1, VCPU_GUEST_USER_ASID    /* else user */
 1:
@@ -442,9 +444,11 @@ __kvm_mips_return_to_guest:
 	mtc0		t0, CP0_EPC
 
     /* Set the ASID for the Guest Kernel */
-    sll         t0, t0, 1                       /* with kseg0 @ 0x40000000, kernel */
-                                                /* addresses shift to 0x80000000 */
-    bltz        t0, 1f                          /* If kernel */
+    PTR_L	t0, VCPU_COP0(k1)
+    LONG_L	t0, COP0_STATUS(t0)
+    andi	t0, KSU_USER | ST0_ERL | ST0_EXL
+    xori	t0, KSU_USER
+    bnez	t0, 1f		/* If kernel */
 	addiu       t1, k1, VCPU_GUEST_KERNEL_ASID  /* (BD)  */
     addiu       t1, k1, VCPU_GUEST_USER_ASID    /* else user */
 1:
-- 
2.4.10
