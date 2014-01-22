Received: from multi.imgtec.com ([194.200.65.239]:21303 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6825759AbaAVQUYBKeE4 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 22 Jan 2014 17:20:24 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH v2 1/5] MIPS: Add MIPS P5600 PRid and cputype identifiers
Date: Wed, 22 Jan 2014 16:19:37 +0000
Message-ID: <1390407581-24238-2-git-send-email-james.hogan@imgtec.com>
In-Reply-To: <1390407581-24238-1-git-send-email-james.hogan@imgtec.com>
References: <1390407581-24238-1-git-send-email-james.hogan@imgtec.com>
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
To: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Cc: James Hogan <james.hogan@imgtec.com>
Message-ID: <20140122161937.dgJEKZEib1MzBnAVu8SPvt_z8nvVYHT-P6KVwIxwg3w@z>

Add a Processor ID and CPU type for the MIPS P5600 core.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Reviewed-by: Markos Chandras <markos.chandras@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---
 arch/mips/include/asm/cpu.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
index 76411df3d971..c5c2531fd0a9 100644
--- a/arch/mips/include/asm/cpu.h
+++ b/arch/mips/include/asm/cpu.h
@@ -115,6 +115,7 @@
 #define PRID_IMP_INTERAPTIV_MP	0xa100
 #define PRID_IMP_PROAPTIV_UP	0xa200
 #define PRID_IMP_PROAPTIV_MP	0xa300
+#define PRID_IMP_P5600		0xa800
 
 /*
  * These are the PRID's for when 23:16 == PRID_COMP_SIBYTE
@@ -296,7 +297,7 @@ enum cpu_type_enum {
 	CPU_4KC, CPU_4KEC, CPU_4KSC, CPU_24K, CPU_34K, CPU_1004K, CPU_74K,
 	CPU_ALCHEMY, CPU_PR4450, CPU_BMIPS32, CPU_BMIPS3300, CPU_BMIPS4350,
 	CPU_BMIPS4380, CPU_BMIPS5000, CPU_JZRISC, CPU_LOONGSON1, CPU_M14KC,
-	CPU_M14KEC, CPU_INTERAPTIV, CPU_PROAPTIV,
+	CPU_M14KEC, CPU_INTERAPTIV, CPU_PROAPTIV, CPU_P5600,
 
 	/*
 	 * MIPS64 class processors
-- 
1.8.1.2
