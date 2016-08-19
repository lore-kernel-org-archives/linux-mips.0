Received: from mailapp01.imgtec.com ([195.59.15.196]:35120 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992170AbcHSNa4N91Pk (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 19 Aug 2016 15:30:56 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH] MIPS: KVM: Check for pfn noslot case
Date: Fri, 19 Aug 2016 14:30:29 +0100
Message-ID: <30bb792dbba5a6fa2a274c11740bbc7005a3ca31.1471611726.git-series.james.hogan@imgtec.com>
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
To: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, kvm@vger.kernel.org, stable@vger.kernel.org, James Hogan <james.hogan@imgtec.com>
Message-ID: <20160819133029.gvZRMXrpFkS4srS2b9m1RNs8z1szEv6zOhiEfzQqABg@z>

When mapping a page into the guest we error check using is_error_pfn(),
however this doesn't detect a value of KVM_PFN_NOSLOT, indicating an
error HVA for the page. This can only happen on MIPS right now due to
unusual memslot management (e.g. being moved / removed / resized), or
with an Enhanced Virtual Memory (EVA) configuration where the default
KVM_HVA_ERR_* and kvm_is_error_hva() definitions are unsuitable (fixed
in a later patch). This case will be treated as a pfn of zero, mapping
the first page of physical memory into the guest.

It would appear the MIPS KVM port wasn't updated prior to being merged
(in v3.10) to take commit 81c52c56e2b4 ("KVM: do not treat noslot pfn as
a error pfn") into account (merged v3.8), which converted a bunch of
is_error_pfn() calls to is_error_noslot_pfn(). Switch to using
is_error_noslot_pfn() instead to catch this case properly.

Fixes: 858dd5d45733 ("KVM/MIPS32: MMU/TLB operations for the Guest.")
Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Radim Krčmář" <rkrcmar@redhat.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Cc: kvm@vger.kernel.org
Cc: <stable@vger.kernel.org> # 3.10.y-
---
 arch/mips/kvm/mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kvm/mmu.c b/arch/mips/kvm/mmu.c
index 6cfdcf55572d..121008c0fcc9 100644
--- a/arch/mips/kvm/mmu.c
+++ b/arch/mips/kvm/mmu.c
@@ -40,7 +40,7 @@ static int kvm_mips_map_page(struct kvm *kvm, gfn_t gfn)
 	srcu_idx = srcu_read_lock(&kvm->srcu);
 	pfn = gfn_to_pfn(kvm, gfn);
 
-	if (is_error_pfn(pfn)) {
+	if (is_error_noslot_pfn(pfn)) {
 		kvm_err("Couldn't get pfn for gfn %#llx!\n", gfn);
 		err = -EFAULT;
 		goto out;
-- 
git-series 0.8.9
