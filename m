Received: from mailapp01.imgtec.com ([195.59.15.196]:6554 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6822134AbaE2JRClbTMg (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 29 May 2014 11:17:02 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH v2 02/23] MIPS: Export local_flush_icache_range for KVM
Date: Thu, 29 May 2014 10:16:24 +0100
Message-ID: <1401355005-20370-3-git-send-email-james.hogan@imgtec.com>
In-Reply-To: <1401355005-20370-1-git-send-email-james.hogan@imgtec.com>
References: <1401355005-20370-1-git-send-email-james.hogan@imgtec.com>
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
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>, James Hogan <james.hogan@imgtec.com>, Gleb Natapov <gleb@kernel.org>, kvm@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, Sanjay Lal <sanjayl@kymasys.com>
Message-ID: <20140529091624.mzPlORjpa05FeUNWxMv8NUG51l-qTdEJwE8_jcwsjlA@z>

Export the local_flush_icache_range function pointer for GPL modules so
that it can be used by KVM for syncing the icache after binary
translation of trapping instructions.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Gleb Natapov <gleb@kernel.org>
Cc: kvm@vger.kernel.org
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Cc: Sanjay Lal <sanjayl@kymasys.com>
---
v2:
 - New patch.
---
 arch/mips/mm/cache.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/mm/cache.c b/arch/mips/mm/cache.c
index 9e67cdea3c74..f7b91d3a371d 100644
--- a/arch/mips/mm/cache.c
+++ b/arch/mips/mm/cache.c
@@ -31,6 +31,7 @@ void (*flush_cache_page)(struct vm_area_struct *vma, unsigned long page,
 void (*flush_icache_range)(unsigned long start, unsigned long end);
 EXPORT_SYMBOL_GPL(flush_icache_range);
 void (*local_flush_icache_range)(unsigned long start, unsigned long end);
+EXPORT_SYMBOL_GPL(local_flush_icache_range);
 
 void (*__flush_cache_vmap)(void);
 void (*__flush_cache_vunmap)(void);
-- 
1.9.3
