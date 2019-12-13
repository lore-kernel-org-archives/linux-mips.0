Return-Path: <SRS0=vM5M=2D=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F3A8C7DBDD
	for <linux-mips@archiver.kernel.org>; Fri, 13 Dec 2019 20:40:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 72F6924778
	for <linux-mips@archiver.kernel.org>; Fri, 13 Dec 2019 20:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576269626;
	bh=uAL2jJdxCCCXDdbpAMcLhNCIscr/cjy2D35ZE6IVupM=;
	h=From:Cc:Subject:Date:In-Reply-To:References:To:List-ID:From;
	b=h/Z6R4IAmK0oRM7oleqBJ38OTlU+pO86+G/BwbsU2OXUMU0yQ55sNui9MUXYRlU+F
	 bnOaRpjTXynzjK6Mz8/ukE/e+PjsrY5UzDjCLx0afbj7WgFTwfWZ2uJwlRnPgE9QMM
	 P8tWcNnQRdbvI0ixhq7XCF5Fkmxmc0nAfmexowZ4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728824AbfLMS14 (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Fri, 13 Dec 2019 13:27:56 -0500
Received: from inca-roads.misterjones.org ([213.251.177.50]:40283 "EHLO
        inca-roads.misterjones.org" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728660AbfLMS1y (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 13 Dec 2019 13:27:54 -0500
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=why.lan)
        by cheepnis.misterjones.org with esmtpsa (TLSv1.2:DHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.80)
        (envelope-from <maz@kernel.org>)
        id 1ifpdI-0001O7-2m; Fri, 13 Dec 2019 19:25:44 +0100
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
Subject: [PATCH 5/7] KVM: arm/arm64: Elide both CMOs and TBLIs on freeing the whole Stage-2
Date:   Fri, 13 Dec 2019 18:25:01 +0000
Message-Id: <20191213182503.14460-6-maz@kernel.org>
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

When freeing the whole of a VM's Stage-2 page tables, there is
little point in doing cache maintenance on each and every page
(the guest won't be running anymore, let alone having its MMU
off). As for TLBs, there is no point in invalidating individual
pages, as we can replace the whole thing with a VMALL operation,
which invalidates all the TLBs for this VM in one go.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 virt/kvm/arm/mmu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/virt/kvm/arm/mmu.c b/virt/kvm/arm/mmu.c
index 4399866842dc..d7c710491d26 100644
--- a/virt/kvm/arm/mmu.c
+++ b/virt/kvm/arm/mmu.c
@@ -1016,10 +1016,13 @@ void kvm_free_stage2_pgd(struct kvm *kvm)
 
 	spin_lock(&kvm->mmu_lock);
 	if (kvm->arch.pgd) {
-		unmap_stage2_range(kvm, 0, kvm_phys_size(kvm), 0);
+		unmap_stage2_range(kvm, 0, kvm_phys_size(kvm),
+				   KVM_UNMAP_ELIDE_CMO | KVM_UNMAP_ELIDE_TBLI);
 		pgd = READ_ONCE(kvm->arch.pgd);
 		kvm->arch.pgd = NULL;
 		kvm->arch.pgd_phys = 0;
+
+		kvm_flush_remote_tlbs(kvm);
 	}
 	spin_unlock(&kvm->mmu_lock);
 
-- 
2.20.1

