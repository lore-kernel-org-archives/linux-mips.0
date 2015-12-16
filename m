Received: from mailapp01.imgtec.com ([195.59.15.196]:54885 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27014079AbbLPXuTITgq0 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 17 Dec 2015 00:50:19 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 14/16] MIPS: KVM: Add missing newline to kvm_err()
Date: Wed, 16 Dec 2015 23:49:39 +0000
Message-ID: <1450309781-28030-15-git-send-email-james.hogan@imgtec.com>
In-Reply-To: <1450309781-28030-1-git-send-email-james.hogan@imgtec.com>
References: <1450309781-28030-1-git-send-email-james.hogan@imgtec.com>
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
To: Ralf Baechle <ralf@linux-mips.org>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Gleb Natapov <gleb@kernel.org>, linux-mips@linux-mips.org, kvm@vger.kernel.org, James Hogan <james.hogan@imgtec.com>
Message-ID: <20151216234939._sDwCHNxWZgITu7VoNcSWpKnuUjvHZ9HDJKP7fdmfMM@z>

Add missing newline to end of kvm_err string when guest PMAP couldn't be
allocated.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Gleb Natapov <gleb@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: kvm@vger.kernel.org
Cc: linux-mips@linux-mips.org
---
 arch/mips/kvm/mips.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index 1b688faf2cf3..8bc3977576e6 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -229,7 +229,7 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
 			    kzalloc(npages * sizeof(unsigned long), GFP_KERNEL);
 
 			if (!kvm->arch.guest_pmap) {
-				kvm_err("Failed to allocate guest PMAP");
+				kvm_err("Failed to allocate guest PMAP\n");
 				return;
 			}
 
-- 
2.4.10
