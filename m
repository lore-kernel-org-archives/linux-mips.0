Received: from mail333.us4.mandrillapp.com ([205.201.137.77]:37203 "EHLO
        mail333.us4.mandrillapp.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27007431AbcCAXvG5es6J (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 2 Mar 2016 00:51:06 +0100
Received: from pmta03.dal05.mailchimp.com (127.0.0.1) by mail333.us4.mandrillapp.com id hqolek174noh for <linux-mips@linux-mips.org>; Tue, 1 Mar 2016 23:51:00 +0000 (envelope-from <bounce-md_30481620.56d62ae4.v1-9edb38bdf75e4a0ab6cdb726df4e7730@mandrillapp.com>)
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 3.14 033/130] MIPS: KVM: Fix ASID restoration logic
Message-ID: <20160301234500.926247873@linuxfoundation.org>
In-Reply-To: <20160301234459.768886030@linuxfoundation.org>
References: <20160301234459.768886030@linuxfoundation.org>
Date: Tue, 01 Mar 2016 23:51:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-Path: <bounce-md_30481620.56d62ae4.v1-9edb38bdf75e4a0ab6cdb726df4e7730@mandrillapp.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, James Hogan <james.hogan@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>, Paolo Bonzini <pbonzini@redhat.com>, Gleb Natapov <gleb@kernel.org>, linux-mips@linux-mips.org, kvm@vger.kernel.org
Message-ID: <20160301235100.BvgJiKq-fFUn0cYSZLulCnUWi-sylJewqHNHCXCpl30@z>

3.14-stable review patch.  If anyone has any objections, please let me know.

------------------

From: James Hogan <james.hogan@imgtec.com>

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
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/mips/kvm/kvm_locore.S |   16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

--- a/arch/mips/kvm/kvm_locore.S
+++ b/arch/mips/kvm/kvm_locore.S
@@ -159,9 +159,11 @@ FEXPORT(__kvm_mips_vcpu_run)
 
 FEXPORT(__kvm_mips_load_asid)
 	/* Set the ASID for the Guest Kernel */
-	INT_SLL	t0, t0, 1	/* with kseg0 @ 0x40000000, kernel */
-			        /* addresses shift to 0x80000000 */
-	bltz	t0, 1f		/* If kernel */
+	PTR_L	t0, VCPU_COP0(k1)
+	LONG_L	t0, COP0_STATUS(t0)
+	andi	t0, KSU_USER | ST0_ERL | ST0_EXL
+	xori	t0, KSU_USER
+	bnez	t0, 1f		/* If kernel */
 	 INT_ADDIU t1, k1, VCPU_GUEST_KERNEL_ASID  /* (BD)  */
 	INT_ADDIU t1, k1, VCPU_GUEST_USER_ASID    /* else user */
 1:
@@ -438,9 +440,11 @@ __kvm_mips_return_to_guest:
 	mtc0	t0, CP0_EPC
 
 	/* Set the ASID for the Guest Kernel */
-	INT_SLL	t0, t0, 1	/* with kseg0 @ 0x40000000, kernel */
-				/* addresses shift to 0x80000000 */
-	bltz	t0, 1f		/* If kernel */
+	PTR_L	t0, VCPU_COP0(k1)
+	LONG_L	t0, COP0_STATUS(t0)
+	andi	t0, KSU_USER | ST0_ERL | ST0_EXL
+	xori	t0, KSU_USER
+	bnez	t0, 1f		/* If kernel */
 	 INT_ADDIU t1, k1, VCPU_GUEST_KERNEL_ASID  /* (BD)  */
 	INT_ADDIU t1, k1, VCPU_GUEST_USER_ASID    /* else user */
 1:
