Return-Path: <SRS0=vM5M=2D=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99CA8C7DBD5
	for <linux-mips@archiver.kernel.org>; Fri, 13 Dec 2019 20:40:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CF058247F8
	for <linux-mips@archiver.kernel.org>; Fri, 13 Dec 2019 20:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576269624;
	bh=eWf6gFXLEAOlec6FznFIinn6gbQWDeW5IrAOMMrKI0U=;
	h=From:Cc:Subject:Date:In-Reply-To:References:To:List-ID:From;
	b=UrM9dSgtgTP9FLozWXrwb97f0KCAX33Fk0Pa5UzNWdGt3iRmOzNPg+8KkS4voRnvt
	 DuyPq57fQ0xbuLD6c8B/MrKTSc915/Yqb7qR+8PK937EN09CKIOTLWjk4tJKSW4RO/
	 gS94I3eF8raUs866/Q7NKogh1yTbjrfDvgWNhp1w=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728784AbfLMS1x (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Fri, 13 Dec 2019 13:27:53 -0500
Received: from inca-roads.misterjones.org ([213.251.177.50]:42676 "EHLO
        inca-roads.misterjones.org" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728722AbfLMS1x (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 13 Dec 2019 13:27:53 -0500
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=why.lan)
        by cheepnis.misterjones.org with esmtpsa (TLSv1.2:DHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.80)
        (envelope-from <maz@kernel.org>)
        id 1ifpdH-0001O7-7w; Fri, 13 Dec 2019 19:25:43 +0100
From:   Marc Zyngier <maz@kernel.org>
Cc:     James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        James Hogan <jhogan@kernel.org>,
        Paul Mackerras <paulus@ozlabs.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
        linux-mips@vger.kernel.org, kvm-ppc@vger.kernel.org,
        kvm@vger.kernel.org
Subject: [PATCH 4/7] KVM: arm/arm64: Condition TLB maintenance on unmap with a flag
Date:   Fri, 13 Dec 2019 18:25:00 +0000
Message-Id: <20191213182503.14460-5-maz@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191213182503.14460-1-maz@kernel.org>
References: <20191213182503.14460-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: james.morse@arm.com, julien.thierry.kdev@gmail.com, suzuki.poulose@arm.com, jhogan@kernel.org, paulus@ozlabs.org, pbonzini@redhat.com, rkrcmar@redhat.com, sean.j.christopherson@intel.com, vkuznets@redhat.com, wanpengli@tencent.com, jmattson@google.com, joro@8bytes.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org, kvm-ppc@vger.kernel.org, kvm@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on cheepnis.misterjones.org); SAEximRunCond expanded to false
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In order to allow the elision of TLB maintenance operations
on unmap, add a new flag (KVM_UNMAP_ELIDE_TBLI) that a caller
can use to indicate that TLB invalidation is not required.

Nobody is passing this flag yet, hence no functional change.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 virt/kvm/arm/mmu.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/virt/kvm/arm/mmu.c b/virt/kvm/arm/mmu.c
index ebf8c87cc007..4399866842dc 100644
--- a/virt/kvm/arm/mmu.c
+++ b/virt/kvm/arm/mmu.c
@@ -37,6 +37,7 @@ static unsigned long io_map_base;
 
 /* Flags controlling S2 unmapping */
 #define KVM_UNMAP_ELIDE_CMO		(1UL << 0)
+#define KVM_UNMAP_ELIDE_TBLI		(1UL << 1)
 
 #define KVM_S2PTE_FLAG_IS_IOMAP		(1UL << 0)
 #define KVM_S2_FLAG_LOGGING_ACTIVE	(1UL << 1)
@@ -160,7 +161,8 @@ static void clear_stage2_pgd_entry(struct kvm *kvm, pgd_t *pgd, phys_addr_t addr
 {
 	pud_t *pud_table __maybe_unused = stage2_pud_offset(kvm, pgd, 0UL);
 	stage2_pgd_clear(kvm, pgd);
-	kvm_tlb_flush_vmid_ipa(kvm, addr);
+	if (!(flags & KVM_UNMAP_ELIDE_TBLI))
+		kvm_tlb_flush_vmid_ipa(kvm, addr);
 	stage2_pud_free(kvm, pud_table);
 	put_page(virt_to_page(pgd));
 }
@@ -171,7 +173,8 @@ static void clear_stage2_pud_entry(struct kvm *kvm, pud_t *pud, phys_addr_t addr
 	pmd_t *pmd_table __maybe_unused = stage2_pmd_offset(kvm, pud, 0);
 	VM_BUG_ON(stage2_pud_huge(kvm, *pud));
 	stage2_pud_clear(kvm, pud);
-	kvm_tlb_flush_vmid_ipa(kvm, addr);
+	if (!(flags & KVM_UNMAP_ELIDE_TBLI))
+		kvm_tlb_flush_vmid_ipa(kvm, addr);
 	stage2_pmd_free(kvm, pmd_table);
 	put_page(virt_to_page(pud));
 }
@@ -182,7 +185,8 @@ static void clear_stage2_pmd_entry(struct kvm *kvm, pmd_t *pmd, phys_addr_t addr
 	pte_t *pte_table = pte_offset_kernel(pmd, 0);
 	VM_BUG_ON(pmd_thp_or_huge(*pmd));
 	pmd_clear(pmd);
-	kvm_tlb_flush_vmid_ipa(kvm, addr);
+	if (!(flags & KVM_UNMAP_ELIDE_TBLI))
+		kvm_tlb_flush_vmid_ipa(kvm, addr);
 	free_page((unsigned long)pte_table);
 	put_page(virt_to_page(pmd));
 }
@@ -253,7 +257,8 @@ static void unmap_stage2_ptes(struct kvm *kvm, pmd_t *pmd,
 			pte_t old_pte = *pte;
 
 			kvm_set_pte(pte, __pte(0));
-			kvm_tlb_flush_vmid_ipa(kvm, addr);
+			if (!(flags & KVM_UNMAP_ELIDE_TBLI))
+				kvm_tlb_flush_vmid_ipa(kvm, addr);
 
 			/* No need to invalidate the cache for device mappings */
 			if (!kvm_is_device_pfn(pte_pfn(old_pte)) &&
@@ -283,7 +288,8 @@ static void unmap_stage2_pmds(struct kvm *kvm, pud_t *pud,
 				pmd_t old_pmd = *pmd;
 
 				pmd_clear(pmd);
-				kvm_tlb_flush_vmid_ipa(kvm, addr);
+				if (!(flags & KVM_UNMAP_ELIDE_TBLI))
+					kvm_tlb_flush_vmid_ipa(kvm, addr);
 
 				if (!(flags & KVM_UNMAP_ELIDE_CMO))
 					kvm_flush_dcache_pmd(old_pmd);
@@ -314,7 +320,8 @@ static void unmap_stage2_puds(struct kvm *kvm, pgd_t *pgd,
 				pud_t old_pud = *pud;
 
 				stage2_pud_clear(kvm, pud);
-				kvm_tlb_flush_vmid_ipa(kvm, addr);
+				if (!(flags & KVM_UNMAP_ELIDE_TBLI))
+					kvm_tlb_flush_vmid_ipa(kvm, addr);
 				if (!(flags & KVM_UNMAP_ELIDE_CMO))
 					kvm_flush_dcache_pud(old_pud);
 				put_page(virt_to_page(pud));
-- 
2.20.1

