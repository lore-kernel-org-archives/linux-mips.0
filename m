Received: from mail-pl1-x643.google.com ([IPv6:2607:f8b0:4864:20::643]:40583
        "EHLO mail-pl1-x643.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990412AbeJMOyg6GZOw (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 13 Oct 2018 16:54:36 +0200
From: lantianyu1986@gmail.com
Subject: [PATCH V4 1/15] KVM: Add tlb_remote_flush_with_range callback in kvm_x86_ops
Date: Sat, 13 Oct 2018 22:53:52 +0800
Message-ID: <20181013145406.4911-2-Tianyu.Lan@microsoft.com>
In-Reply-To: <20181013145406.4911-1-Tianyu.Lan@microsoft.com>
References: <20181013145406.4911-1-Tianyu.Lan@microsoft.com>
Return-Path: <lantianyu1986@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
Cc: Lan Tianyu <Tianyu.Lan@microsoft.com>, christoffer.dall@arm.com, marc.zyngier@arm.com, linux@armlinux.org, catalin.marinas@arm.com, will.deacon@arm.com, jhogan@kernel.org, ralf@linux-mips.org, paul.burton@mips.com, paulus@ozlabs.org, benh@kernel.crashing.org, mpe@ellerman.id.au, kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, pbonzini@redhat.com, rkrcmar@redhat.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, devel@linuxdriverproject.org, kvm@vger.kernel.org, michael.h.kelley@microsoft.com, vkuznets@redhat.com
Message-ID: <20181013145352.RXEcA5PYXNrqDdpsu38Dk_ZwYjrPARcGegxzaqNpx6w@z>

From: Lan Tianyu <Tianyu.Lan@microsoft.com>

Add flush range call back in the kvm_x86_ops and platform can use it
to register its associated function. The parameter "kvm_tlb_range"
accepts a single range and flush list which contains a list of ranges.

Signed-off-by: Lan Tianyu <Tianyu.Lan@microsoft.com>
---
Change since v1:
       Change "end_gfn" to "pages" to aviod confusion as to whether
"end_gfn" is inclusive or exlusive.
---
 arch/x86/include/asm/kvm_host.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 4b09d4aa9bf4..fea95aa77319 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -439,6 +439,12 @@ struct kvm_mmu {
 	u64 pdptrs[4]; /* pae */
 };
 
+struct kvm_tlb_range {
+	u64 start_gfn;
+	u64 pages;
+	struct list_head *flush_list;
+};
+
 enum pmc_type {
 	KVM_PMC_GP = 0,
 	KVM_PMC_FIXED,
@@ -1039,6 +1045,8 @@ struct kvm_x86_ops {
 
 	void (*tlb_flush)(struct kvm_vcpu *vcpu, bool invalidate_gpa);
 	int  (*tlb_remote_flush)(struct kvm *kvm);
+	int  (*tlb_remote_flush_with_range)(struct kvm *kvm,
+			struct kvm_tlb_range *range);
 
 	/*
 	 * Flush any TLB entries associated with the given GVA.
-- 
2.14.4
