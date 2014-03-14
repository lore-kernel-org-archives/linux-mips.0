Received: from mailapp01.imgtec.com ([195.89.28.114]:47505 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6826363AbaCNNG3EmeTz (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 14 Mar 2014 14:06:29 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 3/4] MIPS: KVM: Consult HWREna before emulating RDHWR
Date: Fri, 14 Mar 2014 13:06:09 +0000
Message-ID: <1394802370-20487-4-git-send-email-james.hogan@imgtec.com>
In-Reply-To: <1394802370-20487-1-git-send-email-james.hogan@imgtec.com>
References: <1394802370-20487-1-git-send-email-james.hogan@imgtec.com>
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
To: Ralf Baechle <ralf@linux-mips.org>, Gleb Natapov <gleb@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>
Cc: James Hogan <james.hogan@imgtec.com>, Sanjay Lal <sanjayl@kymasys.com>, linux-mips@linux-mips.org, kvm@vger.kernel.org
Message-ID: <20140314130609.EL0QxUVFv9ivcj994OKDMAuSHRBIfFcT5FTuA2GTcgA@z>

The ability to read hardware registers from userland with the RDHWR
instruction should depend upon the corresponding bit of the HWREna
register being set, otherwise a reserved instruction exception should be
generated.

However KVM's current emulation ignores the guest's HWREna and always
emulates RDHWR instructions even if the guest OS has disallowed them.

Therefore rework the RDHWR emulation code to check for privilege or the
corresponding bit in the guest HWREna bit. Also remove the #if 0 case
for the UserLocal register. I presume it was there for debug purposes
but it seems unnecessary now that the guest can control whether it
causes a guest exception.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Gleb Natapov <gleb@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Sanjay Lal <sanjayl@kymasys.com>
Cc: linux-mips@linux-mips.org
Cc: kvm@vger.kernel.org
---
 arch/mips/include/asm/kvm_host.h |  2 ++
 arch/mips/kvm/kvm_mips_emul.c    | 30 ++++++++++++++++--------------
 2 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm_host.h
index 502c8da08574..060aaa6348d7 100644
--- a/arch/mips/include/asm/kvm_host.h
+++ b/arch/mips/include/asm/kvm_host.h
@@ -414,6 +414,8 @@ struct kvm_vcpu_arch {
 #define kvm_write_c0_guest_pagemask(cop0, val)	(cop0->reg[MIPS_CP0_TLB_PG_MASK][0] = (val))
 #define kvm_read_c0_guest_wired(cop0)		(cop0->reg[MIPS_CP0_TLB_WIRED][0])
 #define kvm_write_c0_guest_wired(cop0, val)	(cop0->reg[MIPS_CP0_TLB_WIRED][0] = (val))
+#define kvm_read_c0_guest_hwrena(cop0)		(cop0->reg[MIPS_CP0_HWRENA][0])
+#define kvm_write_c0_guest_hwrena(cop0, val)	(cop0->reg[MIPS_CP0_HWRENA][0] = (val))
 #define kvm_read_c0_guest_badvaddr(cop0)	(cop0->reg[MIPS_CP0_BAD_VADDR][0])
 #define kvm_write_c0_guest_badvaddr(cop0, val)	(cop0->reg[MIPS_CP0_BAD_VADDR][0] = (val))
 #define kvm_read_c0_guest_count(cop0)		(cop0->reg[MIPS_CP0_COUNT][0])
diff --git a/arch/mips/kvm/kvm_mips_emul.c b/arch/mips/kvm/kvm_mips_emul.c
index e75ef8219caf..d562572c2efc 100644
--- a/arch/mips/kvm/kvm_mips_emul.c
+++ b/arch/mips/kvm/kvm_mips_emul.c
@@ -1542,8 +1542,15 @@ kvm_mips_handle_ri(unsigned long cause, uint32_t *opc,
 	}
 
 	if ((inst & OPCODE) == SPEC3 && (inst & FUNC) == RDHWR) {
+		int usermode = !KVM_GUEST_KERNEL_MODE(vcpu);
 		int rd = (inst & RD) >> 11;
 		int rt = (inst & RT) >> 16;
+		/* If usermode, check RDHWR rd is allowed by guest HWREna */
+		if (usermode && !(kvm_read_c0_guest_hwrena(cop0) & BIT(rd))) {
+			kvm_debug("RDHWR %#x disallowed by HWREna @ %p\n",
+				  rd, opc);
+			goto emulate_ri;
+		}
 		switch (rd) {
 		case 0:	/* CPU number */
 			arch->gprs[rt] = 0;
@@ -1567,32 +1574,27 @@ kvm_mips_handle_ri(unsigned long cause, uint32_t *opc,
 			}
 			break;
 		case 29:
-#if 1
 			arch->gprs[rt] = kvm_read_c0_guest_userlocal(cop0);
-#else
-			/* UserLocal not implemented */
-			er = EMULATE_FAIL;
-#endif
 			break;
 
 		default:
 			kvm_debug("RDHWR %#x not supported @ %p\n", rd, opc);
-			er = EMULATE_FAIL;
-			break;
+			goto emulate_ri;
 		}
 	} else {
 		kvm_debug("Emulate RI not supported @ %p: %#x\n", opc, inst);
-		er = EMULATE_FAIL;
+		goto emulate_ri;
 	}
 
+	return EMULATE_DONE;
+
+emulate_ri:
 	/*
-	 * Rollback PC only if emulation was unsuccessful
+	 * Rollback PC (if in branch delay slot then the PC already points to
+	 * branch target), and pass the RI exception to the guest OS.
 	 */
-	if (er == EMULATE_FAIL) {
-		vcpu->arch.pc = curr_pc;
-		er = kvm_mips_emulate_ri_exc(cause, opc, run, vcpu);
-	}
-	return er;
+	vcpu->arch.pc = curr_pc;
+	return kvm_mips_emulate_ri_exc(cause, opc, run, vcpu);
 }
 
 enum emulation_result
-- 
1.8.1.2
