Received: from mailapp01.imgtec.com ([195.59.15.196]:29940 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008044AbbCCStnaIT6W (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 3 Mar 2015 19:49:43 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id DD88D8508899F
        for <linux-mips@linux-mips.org>; Tue,  3 Mar 2015 18:49:33 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 1/4] MIPS: asm: r4kcache: Use correct base register for MIPS R6 cache flushes
Date: Tue, 3 Mar 2015 18:48:47 +0000
Message-ID: <1425408530-21613-2-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1425408530-21613-1-git-send-email-markos.chandras@imgtec.com>
References: <1425408530-21613-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20150303184847.w-IC169DKueJEiUzqnVKQ0hAMsOZ4-B5MvOdhwnOfqA@z>

Commit 934c79231c1b("MIPS: asm: r4kcache: Add MIPS R6 cache unroll
functions") added support for MIPS R6 cache flushes but it used the
wrong base address register to perform the flushes so the same lines
were flushed over and over. Moreover, replace the "addiu" instructions
with LONG_ADDIU so the correct base address is calculated for 64-bit
cores.

Fixes: 934c79231c1b("MIPS: asm: r4kcache: Add MIPS R6 cache unroll functions")
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/include/asm/r4kcache.h | 88 ++++++++++++++++++++--------------------
 1 file changed, 44 insertions(+), 44 deletions(-)

diff --git a/arch/mips/include/asm/r4kcache.h b/arch/mips/include/asm/r4kcache.h
index 1b22d2da88a1..d329f7328bd4 100644
--- a/arch/mips/include/asm/r4kcache.h
+++ b/arch/mips/include/asm/r4kcache.h
@@ -12,6 +12,7 @@
 #ifndef _ASM_R4KCACHE_H
 #define _ASM_R4KCACHE_H
 
+#include <linux/stringify.h>
 #include <asm/asm.h>
 #include <asm/cacheops.h>
 #include <asm/compiler.h>
@@ -344,7 +345,7 @@ static inline void invalidate_tcache_page(unsigned long addr)
 	"	cache %1, 0x0a0(%0); cache %1, 0x0b0(%0)\n"	\
 	"	cache %1, 0x0c0(%0); cache %1, 0x0d0(%0)\n"	\
 	"	cache %1, 0x0e0(%0); cache %1, 0x0f0(%0)\n"	\
-	"	addiu $1, $0, 0x100			\n"	\
+	"	"__stringify(LONG_ADDIU)" $1, %0, 0x100	\n"	\
 	"	cache %1, 0x000($1); cache %1, 0x010($1)\n"	\
 	"	cache %1, 0x020($1); cache %1, 0x030($1)\n"	\
 	"	cache %1, 0x040($1); cache %1, 0x050($1)\n"	\
@@ -368,17 +369,17 @@ static inline void invalidate_tcache_page(unsigned long addr)
 	"	cache %1, 0x040(%0); cache %1, 0x060(%0)\n"	\
 	"	cache %1, 0x080(%0); cache %1, 0x0a0(%0)\n"	\
 	"	cache %1, 0x0c0(%0); cache %1, 0x0e0(%0)\n"	\
-	"	addiu $1, %0, 0x100\n"				\
+	"	"__stringify(LONG_ADDIU)" $1, %0, 0x100 \n"	\
 	"	cache %1, 0x000($1); cache %1, 0x020($1)\n"	\
 	"	cache %1, 0x040($1); cache %1, 0x060($1)\n"	\
 	"	cache %1, 0x080($1); cache %1, 0x0a0($1)\n"	\
 	"	cache %1, 0x0c0($1); cache %1, 0x0e0($1)\n"	\
-	"	addiu $1, $1, 0x100\n"				\
+	"	"__stringify(LONG_ADDIU)" $1, $1, 0x100 \n"	\
 	"	cache %1, 0x000($1); cache %1, 0x020($1)\n"	\
 	"	cache %1, 0x040($1); cache %1, 0x060($1)\n"	\
 	"	cache %1, 0x080($1); cache %1, 0x0a0($1)\n"	\
 	"	cache %1, 0x0c0($1); cache %1, 0x0e0($1)\n"	\
-	"	addiu $1, $1, 0x100\n"				\
+	"	"__stringify(LONG_ADDIU)" $1, $1, 0x100\n"	\
 	"	cache %1, 0x000($1); cache %1, 0x020($1)\n"	\
 	"	cache %1, 0x040($1); cache %1, 0x060($1)\n"	\
 	"	cache %1, 0x080($1); cache %1, 0x0a0($1)\n"	\
@@ -396,25 +397,25 @@ static inline void invalidate_tcache_page(unsigned long addr)
 	"	.set noat\n"					\
 	"	cache %1, 0x000(%0); cache %1, 0x040(%0)\n"	\
 	"	cache %1, 0x080(%0); cache %1, 0x0c0(%0)\n"	\
-	"	addiu $1, %0, 0x100\n"				\
+	"	"__stringify(LONG_ADDIU)" $1, %0, 0x100 \n"	\
 	"	cache %1, 0x000($1); cache %1, 0x040($1)\n"	\
 	"	cache %1, 0x080($1); cache %1, 0x0c0($1)\n"	\
-	"	addiu $1, %0, 0x100\n"				\
+	"	"__stringify(LONG_ADDIU)" $1, $1, 0x100 \n"	\
 	"	cache %1, 0x000($1); cache %1, 0x040($1)\n"	\
 	"	cache %1, 0x080($1); cache %1, 0x0c0($1)\n"	\
-	"	addiu $1, %0, 0x100\n"				\
+	"	"__stringify(LONG_ADDIU)" $1, $1, 0x100 \n"	\
 	"	cache %1, 0x000($1); cache %1, 0x040($1)\n"	\
 	"	cache %1, 0x080($1); cache %1, 0x0c0($1)\n"	\
-	"	addiu $1, %0, 0x100\n"				\
+	"	"__stringify(LONG_ADDIU)" $1, $1, 0x100 \n"	\
 	"	cache %1, 0x000($1); cache %1, 0x040($1)\n"	\
 	"	cache %1, 0x080($1); cache %1, 0x0c0($1)\n"	\
-	"	addiu $1, %0, 0x100\n"				\
+	"	"__stringify(LONG_ADDIU)" $1, $1, 0x100 \n"	\
 	"	cache %1, 0x000($1); cache %1, 0x040($1)\n"	\
 	"	cache %1, 0x080($1); cache %1, 0x0c0($1)\n"	\
-	"	addiu $1, %0, 0x100\n"				\
+	"	"__stringify(LONG_ADDIU)" $1, $1, 0x100 \n"	\
 	"	cache %1, 0x000($1); cache %1, 0x040($1)\n"	\
 	"	cache %1, 0x080($1); cache %1, 0x0c0($1)\n"	\
-	"	addiu $1, %0, 0x100\n"				\
+	"	"__stringify(LONG_ADDIU)" $1, $1, 0x100 \n"	\
 	"	cache %1, 0x000($1); cache %1, 0x040($1)\n"	\
 	"	cache %1, 0x080($1); cache %1, 0x0c0($1)\n"	\
 	"	.set pop\n"					\
@@ -429,39 +430,38 @@ static inline void invalidate_tcache_page(unsigned long addr)
 	"	.set mips64r6\n"				\
 	"	.set noat\n"					\
 	"	cache %1, 0x000(%0); cache %1, 0x080(%0)\n"	\
-	"	addiu $1, %0, 0x100\n"				\
-	"	cache %1, 0x000(%0); cache %1, 0x080(%0)\n"	\
-	"	addiu $1, %0, 0x100\n"				\
-	"	cache %1, 0x000(%0); cache %1, 0x080(%0)\n"	\
-	"	addiu $1, %0, 0x100\n"				\
-	"	cache %1, 0x000(%0); cache %1, 0x080(%0)\n"	\
-	"	addiu $1, %0, 0x100\n"				\
-	"	cache %1, 0x000(%0); cache %1, 0x080(%0)\n"	\
-	"	addiu $1, %0, 0x100\n"				\
-	"	cache %1, 0x000(%0); cache %1, 0x080(%0)\n"	\
-	"	addiu $1, %0, 0x100\n"				\
-	"	cache %1, 0x000(%0); cache %1, 0x080(%0)\n"	\
-	"	addiu $1, %0, 0x100\n"				\
-	"	cache %1, 0x000(%0); cache %1, 0x080(%0)\n"	\
-	"	addiu $1, %0, 0x100\n"				\
-	"	cache %1, 0x000(%0); cache %1, 0x080(%0)\n"	\
-	"	addiu $1, %0, 0x100\n"				\
-	"	cache %1, 0x000(%0); cache %1, 0x080(%0)\n"	\
-	"	addiu $1, %0, 0x100\n"				\
-	"	cache %1, 0x000(%0); cache %1, 0x080(%0)\n"	\
-	"	addiu $1, %0, 0x100\n"				\
-	"	cache %1, 0x000(%0); cache %1, 0x080(%0)\n"	\
-	"	addiu $1, %0, 0x100\n"				\
-	"	cache %1, 0x000(%0); cache %1, 0x080(%0)\n"	\
-	"	addiu $1, %0, 0x100\n"				\
-	"	cache %1, 0x000(%0); cache %1, 0x080(%0)\n"	\
-	"	addiu $1, %0, 0x100\n"				\
-	"	cache %1, 0x000(%0); cache %1, 0x080(%0)\n"	\
-	"	addiu $1, %0, 0x100\n"				\
-	"	cache %1, 0x000(%0); cache %1, 0x080(%0)\n"	\
-	"	addiu $1, %0, 0x100\n"				\
-	"	cache %1, 0x000(%0); cache %1, 0x080(%0)\n"	\
-	"	addiu $1, %0, 0x100\n"				\
+	"	"__stringify(LONG_ADDIU)" $1, %0, 0x100 \n"	\
+	"	cache %1, 0x000($1); cache %1, 0x080($1)\n"	\
+	"	"__stringify(LONG_ADDIU)" $1, $1, 0x100 \n"	\
+	"	cache %1, 0x000($1); cache %1, 0x080($1)\n"	\
+	"	"__stringify(LONG_ADDIU)" $1, $1, 0x100 \n"	\
+	"	cache %1, 0x000($1); cache %1, 0x080($1)\n"	\
+	"	"__stringify(LONG_ADDIU)" $1, $1, 0x100 \n"	\
+	"	cache %1, 0x000($1); cache %1, 0x080($1)\n"	\
+	"	"__stringify(LONG_ADDIU)" $1, $1, 0x100 \n"	\
+	"	cache %1, 0x000($1); cache %1, 0x080($1)\n"	\
+	"	"__stringify(LONG_ADDIU)" $1, $1, 0x100 \n"	\
+	"	cache %1, 0x000($1); cache %1, 0x080($1)\n"	\
+	"	"__stringify(LONG_ADDIU)" $1, $1, 0x100 \n"	\
+	"	cache %1, 0x000($1); cache %1, 0x080($1)\n"	\
+	"	"__stringify(LONG_ADDIU)" $1, $1, 0x100 \n"	\
+	"	cache %1, 0x000($1); cache %1, 0x080($1)\n"	\
+	"	"__stringify(LONG_ADDIU)" $1, $1, 0x100 \n"	\
+	"	cache %1, 0x000($1); cache %1, 0x080($1)\n"	\
+	"	"__stringify(LONG_ADDIU)" $1, $1, 0x100 \n"	\
+	"	cache %1, 0x000($1); cache %1, 0x080($1)\n"	\
+	"	"__stringify(LONG_ADDIU)" $1, $1, 0x100 \n"	\
+	"	cache %1, 0x000($1); cache %1, 0x080($1)\n"	\
+	"	"__stringify(LONG_ADDIU)" $1, $1, 0x100 \n"	\
+	"	cache %1, 0x000($1); cache %1, 0x080($1)\n"	\
+	"	"__stringify(LONG_ADDIU)" $1, $1, 0x100 \n"	\
+	"	cache %1, 0x000($1); cache %1, 0x080($1)\n"	\
+	"	"__stringify(LONG_ADDIU)" $1, $1, 0x100 \n"	\
+	"	cache %1, 0x000($1); cache %1, 0x080($1)\n"	\
+	"	"__stringify(LONG_ADDIU)" $1, $1, 0x100 \n"	\
+	"	cache %1, 0x000($1); cache %1, 0x080($1)\n"	\
+	"	"__stringify(LONG_ADDIU)" $1, $1, 0x100 \n"	\
+	"	cache %1, 0x000($1); cache %1, 0x080($1)\n"	\
 	"	.set pop\n"					\
 		:						\
 		: "r" (base),					\
-- 
2.3.1
