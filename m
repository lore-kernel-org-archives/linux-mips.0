Received: from mailapp01.imgtec.com ([195.59.15.196]:60125 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992298AbcIAQbIg0W92 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 1 Sep 2016 18:31:08 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 6/9] MIPS: cacheflush: Use __flush_icache_user_range()
Date: Thu, 1 Sep 2016 17:30:12 +0100
Message-ID: <da700c1b02450c810931a8752e906ab8e90cb859.1472747205.git-series.james.hogan@imgtec.com>
In-Reply-To: <cover.d93e43428f3c573bdd18d7c874830705b39c3a8a.1472747205.git-series.james.hogan@imgtec.com>
References: <cover.d93e43428f3c573bdd18d7c874830705b39c3a8a.1472747205.git-series.james.hogan@imgtec.com>
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
To: Ralf Baechle <ralf@linux-mips.org>
Cc: James Hogan <james.hogan@imgtec.com>, Leonid Yegoshin <leonid.yegoshin@imgtec.com>, linux-mips@linux-mips.org
Message-ID: <20160901163012.BOP2C2m1WQODyzDnDkDVzXQlZ6b9EMYw5SESfbBP4Pg@z>

The cacheflush(2) system call uses flush_icache_range() to flush a range
of usermode addresses from the icache, so change it to utilise the new
__flush_icache_user_range() API to allow the more generic
flush_icache_range() to be changed to work on kernel addresses only.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Leonid Yegoshin <leonid.yegoshin@imgtec.com>
Cc: linux-mips@linux-mips.org
---
 arch/mips/mm/cache.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/mm/cache.c b/arch/mips/mm/cache.c
index 5a644c3fe155..7ec0847c725a 100644
--- a/arch/mips/mm/cache.c
+++ b/arch/mips/mm/cache.c
@@ -78,7 +78,7 @@ SYSCALL_DEFINE3(cacheflush, unsigned long, addr, unsigned long, bytes,
 	if (!access_ok(VERIFY_WRITE, (void __user *) addr, bytes))
 		return -EFAULT;
 
-	flush_icache_range(addr, addr + bytes);
+	__flush_icache_user_range(addr, addr + bytes);
 
 	return 0;
 }
-- 
git-series 0.8.10
