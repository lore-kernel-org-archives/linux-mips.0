Received: from multi.imgtec.com ([194.200.65.239]:8066 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6827305AbaA2NKIsU4Wb (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 29 Jan 2014 14:10:08 +0100
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH] MIPS: mm: c-r4k: Detect instruction cache aliases
Date: Wed, 29 Jan 2014 13:10:09 +0000
Message-ID: <1391001009-19580-1-git-send-email-markos.chandras@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Markos.Chandras@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org
Cc: Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20140129131009.7x6f4un4TsPW1H0D6Diiq1HAV7wfTh7JdZtRQFIAdPs@z>

The *Aptiv cores can use the CONF7/IAR bit to detect if the core
has hardware support to remove instruction cache aliasing.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
This patch is for the upstream-sfr/mips-for-linux-next tree
---
 arch/mips/include/asm/mipsregs.h | 3 +++
 arch/mips/mm/c-r4k.c             | 5 ++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
index bbc3dd4..0c74617 100644
--- a/arch/mips/include/asm/mipsregs.h
+++ b/arch/mips/include/asm/mipsregs.h
@@ -653,6 +653,9 @@
 
 #define MIPS_CONF7_RPS		(_ULCAST_(1) << 2)
 
+#define MIPS_CONF7_IAR		(_ULCAST_(1) << 10)
+#define MIPS_CONF7_AR		(_ULCAST_(1) << 16)
+
 /*  EntryHI bit definition */
 #define MIPS_ENTRYHI_EHINV	(_ULCAST_(1) << 10)
 
diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
index 13b549a..e790524 100644
--- a/arch/mips/mm/c-r4k.c
+++ b/arch/mips/mm/c-r4k.c
@@ -1110,7 +1110,10 @@ static void probe_pcache(void)
 	case CPU_PROAPTIV:
 		if (current_cpu_type() == CPU_74K)
 			alias_74k_erratum(c);
-		if ((read_c0_config7() & (1 << 16))) {
+		if (!(read_c0_config7() & MIPS_CONF7_IAR))
+			if (c->icache.waysize > PAGE_SIZE)
+				c->icache.flags |= MIPS_CACHE_ALIASES;
+		if (read_c0_config7() & MIPS_CONF7_AR) {
 			/* effectively physically indexed dcache,
 			   thus no virtual aliases. */
 			c->dcache.flags |= MIPS_CACHE_PINDEX;
-- 
1.8.5.3
