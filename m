Received: from mailapp01.imgtec.com ([195.59.15.196]:26333 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23994826AbdCNKSbrGmOU (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 14 Mar 2017 11:18:31 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH v2 30/33] KVM: MIPS/VZ: Support guest load-linked bit
Date: Tue, 14 Mar 2017 10:15:37 +0000
Message-ID: <279db1d4ae4551af0825fb0f4ffe7f91cd6e5331.1489485940.git-series.james.hogan@imgtec.com>
MIME-Version: 1.0
In-Reply-To: <cover.26e10ec77a4ed0d3177ccf4fabf57bc95ea030f8.1489485940.git-series.james.hogan@imgtec.com>
References: <cover.26e10ec77a4ed0d3177ccf4fabf57bc95ea030f8.1489485940.git-series.james.hogan@imgtec.com>
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
To: linux-mips@linux-mips.org, kvm@vger.kernel.org
Cc: James Hogan <james.hogan@imgtec.com>, Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20170314101537.Fwq7MaGObaA9K_z5IkC4epQQBKHtE_NDckWHiSFQ41k@z>

When restoring guest state after another VCPU has run, be sure to clear
CP0_LLAddr.LLB in order to break any interrupted atomic critical
section. Without this SMP guest atomics don't work when LLB is present
as one guest can complete the atomic section started by another guest.

MIPS VZ guest read of CP0_LLAddr causes Guest Privileged Sensitive
Instruction (GPSI) exception due to the address being root physical.
Handle this by reporting only the LLB bit, which contains the bit for
whether a ll/sc atomic is in progress without any reason for failure.

Similarly on P5600 a guest write to CP0_LLAddr also causes a GPSI
exception. Handle this also by clearing the guest LLB bit from root
mode.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Radim Krčmář" <rkrcmar@redhat.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Cc: kvm@vger.kernel.org
---
 arch/mips/kvm/vz.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+), 0 deletions(-)

diff --git a/arch/mips/kvm/vz.c b/arch/mips/kvm/vz.c
index fb12c5b4a75c..450f946358ae 100644
--- a/arch/mips/kvm/vz.c
+++ b/arch/mips/kvm/vz.c
@@ -730,6 +730,13 @@ static enum emulation_result kvm_vz_gpsi_cop0(union mips_instruction inst,
 			} else if (rd == MIPS_CP0_COMPARE &&
 				   sel == 0) {		/* Compare */
 				val = read_gc0_compare();
+			} else if (rd == MIPS_CP0_LLADDR &&
+				   sel == 0) {		/* LLAddr */
+				if (cpu_guest_has_rw_llb)
+					val = read_gc0_lladdr() &
+						MIPS_LLADDR_LLB;
+				else
+					val = 0;
 			} else if ((rd == MIPS_CP0_PRID &&
 				    (sel == 0 ||	/* PRid */
 				     sel == 2 ||	/* CDMMBase */
@@ -777,6 +784,15 @@ static enum emulation_result kvm_vz_gpsi_cop0(union mips_instruction inst,
 				kvm_mips_write_compare(vcpu,
 						       vcpu->arch.gprs[rt],
 						       true);
+			} else if (rd == MIPS_CP0_LLADDR &&
+				   sel == 0) {		/* LLAddr */
+				/*
+				 * P5600 generates GPSI on guest MTC0 LLAddr.
+				 * Only allow the guest to clear LLB.
+				 */
+				if (cpu_guest_has_rw_llb &&
+				    !(val & MIPS_LLADDR_LLB))
+					write_gc0_lladdr(0);
 			} else if (rd == MIPS_CP0_ERRCTL &&
 				   (sel == 0)) {	/* ErrCtl */
 				/* ignore the written value */
@@ -2247,6 +2263,14 @@ static int kvm_vz_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 		write_c0_guestctl2(
 			cop0->reg[MIPS_CP0_GUESTCTL2][MIPS_CP0_GUESTCTL2_SEL]);
 
+	/*
+	 * We should clear linked load bit to break interrupted atomics. This
+	 * prevents a SC on the next VCPU from succeeding by matching a LL on
+	 * the previous VCPU.
+	 */
+	if (cpu_guest_has_rw_llb)
+		write_gc0_lladdr(0);
+
 	return 0;
 }
 
-- 
git-series 0.8.10
