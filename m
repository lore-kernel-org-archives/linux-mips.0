Received: from mailapp01.imgtec.com ([195.59.15.196]:58075 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23994806AbdCNKSPwl1TU (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 14 Mar 2017 11:18:15 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH v2 9/33] KVM: MIPS/Emulate: Implement 64-bit MMIO emulation
Date: Tue, 14 Mar 2017 10:15:16 +0000
Message-ID: <2614a4ae7831484a25251b765799b854234519b1.1489485940.git-series.james.hogan@imgtec.com>
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
Message-ID: <20170314101516.6oqoiVZNWLzGFTzQPRtv4iTOdHHGNDN21wmQO5bxn_I@z>

Implement additional MMIO emulation for MIPS64, including 64-bit
loads/stores, and 32-bit unsigned loads. These are only exposed on
64-bit VZ hosts.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Radim Krčmář" <rkrcmar@redhat.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Cc: kvm@vger.kernel.org
---
 arch/mips/kvm/emulate.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kvm/emulate.c b/arch/mips/kvm/emulate.c
index e0f74ee2aad8..d75ab8940e1f 100644
--- a/arch/mips/kvm/emulate.c
+++ b/arch/mips/kvm/emulate.c
@@ -1499,6 +1499,17 @@ enum emulation_result kvm_mips_emulate_store(union mips_instruction inst,
 		goto out_fail;
 
 	switch (inst.i_format.opcode) {
+#if defined(CONFIG_64BIT) && defined(CONFIG_KVM_MIPS_VZ)
+	case sd_op:
+		run->mmio.len = 8;
+		*(u64 *)data = vcpu->arch.gprs[rt];
+
+		kvm_debug("[%#lx] OP_SD: eaddr: %#lx, gpr: %#lx, data: %#llx\n",
+			  vcpu->arch.pc, vcpu->arch.host_cp0_badvaddr,
+			  vcpu->arch.gprs[rt], *(u64 *)data);
+		break;
+#endif
+
 	case sw_op:
 		run->mmio.len = 4;
 		*(u32 *)data = vcpu->arch.gprs[rt];
@@ -1575,6 +1586,15 @@ enum emulation_result kvm_mips_emulate_load(union mips_instruction inst,
 
 	vcpu->mmio_needed = 2;	/* signed */
 	switch (op) {
+#if defined(CONFIG_64BIT) && defined(CONFIG_KVM_MIPS_VZ)
+	case ld_op:
+		run->mmio.len = 8;
+		break;
+
+	case lwu_op:
+		vcpu->mmio_needed = 1;	/* unsigned */
+		/* fall through */
+#endif
 	case lw_op:
 		run->mmio.len = 4;
 		break;
@@ -2421,8 +2441,15 @@ enum emulation_result kvm_mips_complete_mmio_load(struct kvm_vcpu *vcpu,
 	vcpu->arch.pc = vcpu->arch.io_pc;
 
 	switch (run->mmio.len) {
+	case 8:
+		*gpr = *(s64 *)run->mmio.data;
+		break;
+
 	case 4:
-		*gpr = *(s32 *) run->mmio.data;
+		if (vcpu->mmio_needed == 2)
+			*gpr = *(s32 *)run->mmio.data;
+		else
+			*gpr = *(u32 *)run->mmio.data;
 		break;
 
 	case 2:
-- 
git-series 0.8.10
