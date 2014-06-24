Received: from mailapp01.imgtec.com ([195.59.15.196]:13542 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6834666AbaFXRbpus67p (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 24 Jun 2014 19:31:45 +0200
From: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
Subject: [PATCH v3 6/9] MIPS: KVM: Restore correct value for WIRED at TLB uninit
Date: Tue, 24 Jun 2014 10:31:07 -0700
Message-ID: <1403631071-6012-7-git-send-email-dengcheng.zhu@imgtec.com>
In-Reply-To: <1403631071-6012-1-git-send-email-dengcheng.zhu@imgtec.com>
References: <1403631071-6012-1-git-send-email-dengcheng.zhu@imgtec.com>
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
Message-ID: <20140624173107.7JRtFeDZeXlABxf2sThrxHUhsJm6oK4ITtFb1QHbhCk@z>

From: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>

At TLB initialization, the commpage TLB entry is reserved on top of the
existing WIRED entries (the number not necessarily be 0).

Signed-off-by: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
---
 arch/mips/kvm/mips.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index 27250ee..3d53d34 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -170,7 +170,7 @@ void kvm_arch_sync_events(struct kvm *kvm)
 static void kvm_mips_uninit_tlbs(void *arg)
 {
 	/* Restore wired count */
-	write_c0_wired(0);
+	write_c0_wired(read_c0_wired() - 1);
 	mtc0_tlbw_hazard();
 	/* Clear out all the TLBs */
 	kvm_local_flush_tlb_all();
-- 
1.8.5.3
