Received: from mailapp01.imgtec.com ([195.59.15.196]:4373 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27013382AbbCKOsM5-XxS (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 11 Mar 2015 15:48:12 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 06/20] MIPS: KVM: Drop pr_info messages on init/exit
Date: Wed, 11 Mar 2015 14:44:42 +0000
Message-ID: <1426085096-12932-7-git-send-email-james.hogan@imgtec.com>
In-Reply-To: <1426085096-12932-1-git-send-email-james.hogan@imgtec.com>
References: <1426085096-12932-1-git-send-email-james.hogan@imgtec.com>
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
To: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, linux-mips@linux-mips.org
Cc: James Hogan <james.hogan@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>, Gleb Natapov <gleb@kernel.org>
Message-ID: <20150311144442.LHD1uWeoyKvFv41s-URJh9oL2GBLzAN10TCv_5ph9Xg@z>

The information messages when the KVM module is loaded and unloaded are
a bit pointless and out of line with other architectures, so lets drop
them.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Gleb Natapov <gleb@kernel.org>
Cc: linux-mips@linux-mips.org
Cc: kvm@vger.kernel.org
---
 arch/mips/kvm/mips.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index b909c0046f08..0aab83d894ba 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -1191,7 +1191,6 @@ int __init kvm_mips_init(void)
 	kvm_mips_release_pfn_clean = kvm_release_pfn_clean;
 	kvm_mips_is_error_pfn = is_error_pfn;
 
-	pr_info("KVM/MIPS Initialized\n");
 	return 0;
 }
 
@@ -1202,8 +1201,6 @@ void __exit kvm_mips_exit(void)
 	kvm_mips_gfn_to_pfn = NULL;
 	kvm_mips_release_pfn_clean = NULL;
 	kvm_mips_is_error_pfn = NULL;
-
-	pr_info("KVM/MIPS unloaded\n");
 }
 
 module_init(kvm_mips_init);
-- 
2.0.5
