Received: from mailapp01.imgtec.com ([195.59.15.196]:25475 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992663AbcJYPLYmxwOh (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 25 Oct 2016 17:11:24 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 3/3] KVM: MIPS: Precalculate MMIO load resume PC
Date: Tue, 25 Oct 2016 16:11:12 +0100
Message-ID: <9a82ff28fa4c5243d1d28d757fe87343e162037d.1477320903.git-series.james.hogan@imgtec.com>
MIME-Version: 1.0
In-Reply-To: <cover.c0ced53ae71e1272ec1aaa16007e9eebb1c0eac6.1477320903.git-series.james.hogan@imgtec.com>
References: <cover.c0ced53ae71e1272ec1aaa16007e9eebb1c0eac6.1477320903.git-series.james.hogan@imgtec.com>
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
To: linux-mips@linux-mips.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>, Ralf Baechle <ralf@linux-mips.org>, kvm@vger.kernel.org, stable@vger.kernel.org, James Hogan <james.hogan@imgtec.com>
Message-ID: <20161025151112.TQ2f_758YfpQ9vJ0ncWNpqALHJAU-yS71AttMv-vmIc@z>

The advancing of the PC when completing an MMIO load is done before
re-entering the guest, i.e. before restoring the guest ASID. However if
the load is in a branch delay slot it may need to access guest code to
read the prior branch instruction. This isn't safe in TLB mapped code at
the moment, nor in the future when we'll access unmapped guest segments
using direct user accessors too, as it could read the branch from host
user memory instead.

Therefore calculate the resume PC in advance while we're still in the
right context and save it in the new vcpu->arch.io_pc (replacing the no
longer needed vcpu->arch.pending_load_cause), and restore it on MMIO
completion.

Fixes: e685c689f3a8 ("KVM/MIPS32: Privileged instruction/target branch emulation.")
Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Radim Krčmář" <rkrcmar@redhat.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Cc: kvm@vger.kernel.org
Cc: <stable@vger.kernel.org> # 3.10.x-
---
 arch/mips/include/asm/kvm_host.h |  7 ++++---
 arch/mips/kvm/emulate.c          | 24 +++++++++++++++---------
 2 files changed, 19 insertions(+), 12 deletions(-)

diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm_host.h
index 07f58cfc1ab9..bebec370324f 100644
--- a/arch/mips/include/asm/kvm_host.h
+++ b/arch/mips/include/asm/kvm_host.h
@@ -293,7 +293,10 @@ struct kvm_vcpu_arch {
 	/* Host KSEG0 address of the EI/DI offset */
 	void *kseg0_commpage;
 
-	u32 io_gpr;		/* GPR used as IO source/target */
+	/* Resume PC after MMIO completion */
+	unsigned long io_pc;
+	/* GPR used as IO source/target */
+	u32 io_gpr;
 
 	struct hrtimer comparecount_timer;
 	/* Count timer control KVM register */
@@ -315,8 +318,6 @@ struct kvm_vcpu_arch {
 	/* Bitmask of pending exceptions to be cleared */
 	unsigned long pending_exceptions_clr;
 
-	u32 pending_load_cause;
-
 	/* Save/Restore the entryhi register when are are preempted/scheduled back in */
 	unsigned long preempt_entryhi;
 
diff --git a/arch/mips/kvm/emulate.c b/arch/mips/kvm/emulate.c
index c45ef0f13dfa..aa0937423e28 100644
--- a/arch/mips/kvm/emulate.c
+++ b/arch/mips/kvm/emulate.c
@@ -1528,13 +1528,25 @@ enum emulation_result kvm_mips_emulate_load(union mips_instruction inst,
 					    struct kvm_vcpu *vcpu)
 {
 	enum emulation_result er = EMULATE_DO_MMIO;
+	unsigned long curr_pc;
 	u32 op, rt;
 	u32 bytes;
 
 	rt = inst.i_format.rt;
 	op = inst.i_format.opcode;
 
-	vcpu->arch.pending_load_cause = cause;
+	/*
+	 * Find the resume PC now while we have safe and easy access to the
+	 * prior branch instruction, and save it for
+	 * kvm_mips_complete_mmio_load() to restore later.
+	 */
+	curr_pc = vcpu->arch.pc;
+	er = update_pc(vcpu, cause);
+	if (er == EMULATE_FAIL)
+		return er;
+	vcpu->arch.io_pc = vcpu->arch.pc;
+	vcpu->arch.pc = curr_pc;
+
 	vcpu->arch.io_gpr = rt;
 
 	switch (op) {
@@ -2494,9 +2506,8 @@ enum emulation_result kvm_mips_complete_mmio_load(struct kvm_vcpu *vcpu,
 		goto done;
 	}
 
-	er = update_pc(vcpu, vcpu->arch.pending_load_cause);
-	if (er == EMULATE_FAIL)
-		return er;
+	/* Restore saved resume PC */
+	vcpu->arch.pc = vcpu->arch.io_pc;
 
 	switch (run->mmio.len) {
 	case 4:
@@ -2518,11 +2529,6 @@ enum emulation_result kvm_mips_complete_mmio_load(struct kvm_vcpu *vcpu,
 		break;
 	}
 
-	if (vcpu->arch.pending_load_cause & CAUSEF_BD)
-		kvm_debug("[%#lx] Completing %d byte BD Load to gpr %d (0x%08lx) type %d\n",
-			  vcpu->arch.pc, run->mmio.len, vcpu->arch.io_gpr, *gpr,
-			  vcpu->mmio_needed);
-
 done:
 	return er;
 }
-- 
git-series 0.8.10
