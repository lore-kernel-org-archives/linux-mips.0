Received: from mailapp01.imgtec.com ([195.59.15.196]:11586 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27043848AbcFWQfCNKXTz (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 23 Jun 2016 18:35:02 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 07/14] MIPS: KVM: Add dumping of generated entry code
Date: Thu, 23 Jun 2016 17:34:40 +0100
Message-ID: <1466699687-24791-8-git-send-email-james.hogan@imgtec.com>
In-Reply-To: <1466699687-24791-1-git-send-email-james.hogan@imgtec.com>
References: <1466699687-24791-1-git-send-email-james.hogan@imgtec.com>
MIME-Version: 1.0
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
To: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>, Ralf Baechle <ralf@linux-mips.org>
Cc: James Hogan <james.hogan@imgtec.com>, linux-mips@linux-mips.org, kvm@vger.kernel.org
Message-ID: <20160623163440.XdSz8lRN4B5pO6kX3V69acp-Nn-p93c6-R3sRYoonCA@z>

Dump the generated entry code with pr_debug(), similar to how it is done
in tlbex.c, so it can be more easily debugged.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Radim Krčmář <rkrcmar@redhat.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Cc: kvm@vger.kernel.org
---
 arch/mips/kvm/mips.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index f00cf5f9ac52..f809ad84196d 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -245,6 +245,23 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
 	}
 }
 
+static inline void dump_handler(const char *symbol, void *start, void *end)
+{
+	u32 *p;
+
+	pr_debug("LEAF(%s)\n", symbol);
+
+	pr_debug("\t.set push\n");
+	pr_debug("\t.set noreorder\n");
+
+	for (p = start; p < (u32 *)end; ++p)
+		pr_debug("\t.word\t0x%08x\t\t# %p\n", *p, p);
+
+	pr_debug("\t.set\tpop\n");
+
+	pr_debug("\tEND(%s)\n", symbol);
+}
+
 struct kvm_vcpu *kvm_arch_vcpu_create(struct kvm *kvm, unsigned int id)
 {
 	int err, size;
@@ -309,6 +326,14 @@ struct kvm_vcpu *kvm_arch_vcpu_create(struct kvm *kvm, unsigned int id)
 	vcpu->arch.vcpu_run = p;
 	p = kvm_mips_build_vcpu_run(p);
 
+	/* Dump the generated code */
+	pr_debug("#include <asm/asm.h>\n");
+	pr_debug("#include <asm/regdef.h>\n");
+	pr_debug("\n");
+	dump_handler("kvm_vcpu_run", vcpu->arch.vcpu_run, p);
+	dump_handler("kvm_gen_exc", gebase + 0x180, gebase + 0x200);
+	dump_handler("kvm_exit", gebase + 0x2000, vcpu->arch.vcpu_run);
+
 	/* Invalidate the icache for these ranges */
 	local_flush_icache_range((unsigned long)gebase,
 				(unsigned long)gebase + ALIGN(size, PAGE_SIZE));
-- 
2.4.10
