Return-Path: <SRS0=vM5M=2D=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07DA3C7DBDB
	for <linux-mips@archiver.kernel.org>; Fri, 13 Dec 2019 20:40:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3BBD3247E3
	for <linux-mips@archiver.kernel.org>; Fri, 13 Dec 2019 20:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576269626;
	bh=7Oe9UOh8V8HiBdebN5JrWKM6Yw6faFdNR32/Y97JVRk=;
	h=From:Cc:Subject:Date:In-Reply-To:References:To:List-ID:From;
	b=FAy6zDgx1FT9+dW/Vvq/vXEeNflZM0ORD7S7AHANhI9WpyeLTZNVv04KR/qbVrfue
	 Kv6y3AndpU5cHxyvMCKMY05YJsvHGYU9c221QbgPwVlTBDbzgXSn1k+dQYvvUvemR9
	 oa2i5G020Ojq/N+bFXKpnHkXub01t+4l4s0Qvm5o=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728793AbfLMS14 (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Fri, 13 Dec 2019 13:27:56 -0500
Received: from inca-roads.misterjones.org ([213.251.177.50]:36299 "EHLO
        inca-roads.misterjones.org" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728800AbfLMS1z (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 13 Dec 2019 13:27:55 -0500
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=why.lan)
        by cheepnis.misterjones.org with esmtpsa (TLSv1.2:DHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.80)
        (envelope-from <maz@kernel.org>)
        id 1ifpdJ-0001O7-JV; Fri, 13 Dec 2019 19:25:45 +0100
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
Subject: [PATCH 7/7] KVM: arm/arm64: Elide CMOs when unmapping a range
Date:   Fri, 13 Dec 2019 18:25:03 +0000
Message-Id: <20191213182503.14460-8-maz@kernel.org>
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

If userspace issues a munmap() on a set of pages, there is no
expectation that the pages are cleaned to the PoC. So let's
not do more work than strictly necessary, and set the magic
flag that avoids CMOs in this case.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 virt/kvm/arm/mmu.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/virt/kvm/arm/mmu.c b/virt/kvm/arm/mmu.c
index c55022dbac89..6749be33d822 100644
--- a/virt/kvm/arm/mmu.c
+++ b/virt/kvm/arm/mmu.c
@@ -2056,7 +2056,13 @@ static int handle_hva_to_gpa(struct kvm *kvm,
 
 static int kvm_unmap_hva_handler(struct kvm *kvm, gpa_t gpa, u64 size, void *data)
 {
-	unmap_stage2_range(kvm, gpa, size, 0);
+	struct mmu_notifier_range *range = data;
+	unsigned long flags = 0;
+
+	if (range->event == MMU_NOTIFY_UNMAP)
+		flags = KVM_UNMAP_ELIDE_CMO;
+
+	unmap_stage2_range(kvm, gpa, size, flags);
 	return 0;
 }
 
@@ -2067,7 +2073,7 @@ int kvm_unmap_hva_range(struct kvm *kvm, const struct mmu_notifier_range *range)
 
 	trace_kvm_unmap_hva_range(range->start, range->end);
 	handle_hva_to_gpa(kvm, range->start, range->end,
-			  &kvm_unmap_hva_handler, NULL);
+			  &kvm_unmap_hva_handler, (void *)range);
 	return 0;
 }
 
-- 
2.20.1

