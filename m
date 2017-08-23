Received: from mailapp01.imgtec.com ([195.59.15.196]:36851 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993963AbdHWST7KNA6I (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 23 Aug 2017 20:19:59 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 05/11] MIPS: Include asm/delay.h for __{,n,u}delay()
Date: Wed, 23 Aug 2017 11:17:48 -0700
Message-ID: <20170823181754.24044-6-paul.burton@imgtec.com>
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
Message-ID: <20170823181748.oZmqyaTfzqMqBqEcKLnI7yRw9EArtFRsYHkVyokK-LI@z>

arch/mips/lib/delay.c provides our implementations of the __delay(),
__ndelay() & __udelay() functions, but doesn't include the asm/delay.h
header which declares them. This leads to warnings from sparse:

  arch/mips/lib/delay.c:26:6: warning: symbol '__delay' was not
    declared. Should it be static?
  arch/mips/lib/delay.c:50:6: warning: symbol '__udelay' was not
    declared. Should it be static?
  arch/mips/lib/delay.c:58:6: warning: symbol '__ndelay' was not
    declared. Should it be static?

Fix this by including asm/delay.h to get the declarations of __delay(),
__ndelay() & __udelay().

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---

 arch/mips/lib/delay.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/lib/delay.c b/arch/mips/lib/delay.c
index 2307a3cb2714..0025438957be 100644
--- a/arch/mips/lib/delay.c
+++ b/arch/mips/lib/delay.c
@@ -15,6 +15,7 @@
 
 #include <asm/asm.h>
 #include <asm/compiler.h>
+#include <asm/delay.h>
 #include <asm/war.h>
 
 #ifndef CONFIG_CPU_DADDI_WORKAROUNDS
-- 
2.14.1
