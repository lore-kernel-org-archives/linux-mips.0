Received: from mailapp01.imgtec.com ([195.59.15.196]:32925 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993921AbdHWSTT1fFxI (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 23 Aug 2017 20:19:19 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 03/11] MIPS: Include asm/setup.h for cpu_cache_init()
Date: Wed, 23 Aug 2017 11:17:46 -0700
Message-ID: <20170823181754.24044-4-paul.burton@imgtec.com>
In-Reply-To: <20170823181754.24044-1-paul.burton@imgtec.com>
References: <20170823181754.24044-1-paul.burton@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Paul.Burton@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, trivial@kernel.org
Cc: Paul Burton <paul.burton@imgtec.com>
Message-ID: <20170823181746.amQC4AfiEow88dqU47m4qfqt9shu5-9XuO_O5iot9Hg@z>

arch/mips/mm/cache.c provides our implementation of the cpu_cache_init()
function, but doesn't include the asm/setup.h header which declares it.
This leads to a warning from sparse:

  arch/mips/mm/cache.c:274:6: warning: symbol 'cpu_cache_init' was not
    declared. Should it be static?

Fix this by including asm/setup.h to get the declaration of
cpu_cache_init().

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---

 arch/mips/mm/cache.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/mm/cache.c b/arch/mips/mm/cache.c
index 899e46279902..0324e1085b16 100644
--- a/arch/mips/mm/cache.c
+++ b/arch/mips/mm/cache.c
@@ -20,6 +20,7 @@
 #include <asm/processor.h>
 #include <asm/cpu.h>
 #include <asm/cpu-features.h>
+#include <asm/setup.h>
 
 /* Cache operations. */
 void (*flush_cache_all)(void);
-- 
2.14.1
