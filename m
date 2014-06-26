Received: from mailapp01.imgtec.com ([195.59.15.196]:12567 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6860050AbaFZTMyAsxp4 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 26 Jun 2014 21:12:54 +0200
From: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
Subject: [PATCH v4 6/7] MIPS: KVM: Skip memory cleaning in kvm_mips_commpage_init()
Date: Thu, 26 Jun 2014 12:11:39 -0700
Message-ID: <1403809900-17454-7-git-send-email-dengcheng.zhu@imgtec.com>
In-Reply-To: <1403809900-17454-1-git-send-email-dengcheng.zhu@imgtec.com>
References: <1403809900-17454-1-git-send-email-dengcheng.zhu@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <DengCheng.Zhu@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: pbonzini@redhat.com
Cc: gleb@kernel.org, kvm@vger.kernel.org, sanjayl@kymasys.com, james.hogan@imgtec.com, ralf@linux-mips.org, linux-mips@linux-mips.org, dengcheng.zhu@imgtec.com
Message-ID: <20140626191139.zi1gIdOi6dzJfvyRJMVK4ACtQPyoZM42b6BsxMeN9gw@z>

From: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>

The commpage is allocated using kzalloc(), so there's no need of cleaning
the memory of the kvm_mips_commpage struct and its internal mips_coproc.

Reviewed-by: James Hogan <james.hogan@imgtec.com>
Signed-off-by: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
---
 arch/mips/kvm/commpage.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/mips/kvm/commpage.c b/arch/mips/kvm/commpage.c
index 61b9c04..2d6e976 100644
--- a/arch/mips/kvm/commpage.c
+++ b/arch/mips/kvm/commpage.c
@@ -28,9 +28,6 @@ void kvm_mips_commpage_init(struct kvm_vcpu *vcpu)
 {
 	struct kvm_mips_commpage *page = vcpu->arch.kseg0_commpage;
 
-	memset(page, 0, sizeof(struct kvm_mips_commpage));
-
 	/* Specific init values for fields */
 	vcpu->arch.cop0 = &page->cop0;
-	memset(vcpu->arch.cop0, 0, sizeof(struct mips_coproc));
 }
-- 
1.8.5.3
