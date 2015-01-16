Received: from mailapp01.imgtec.com ([195.59.15.196]:27989 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010571AbbAPKwMPdq3O (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 16 Jan 2015 11:52:12 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 85EB88D567517
        for <linux-mips@linux-mips.org>; Fri, 16 Jan 2015 10:52:04 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH RFC v2 15/70] MIPS: asm: hazards: Add MIPSR6 definitions
Date: Fri, 16 Jan 2015 10:48:54 +0000
Message-ID: <1421405389-15512-16-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1421405389-15512-1-git-send-email-markos.chandras@imgtec.com>
References: <1421405389-15512-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20150116104854.uyOtYJ1XrSlFPYG2RVpyhDRZxsydUjp4gZShywh3Les@z>

Add the MIPSR6 related definitions to MIPS hazards

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/include/asm/hazards.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/mips/include/asm/hazards.h b/arch/mips/include/asm/hazards.h
index e3ee92d4dbe7..0b1b7faf8e15 100644
--- a/arch/mips/include/asm/hazards.h
+++ b/arch/mips/include/asm/hazards.h
@@ -11,6 +11,7 @@
 #define _ASM_HAZARDS_H
 
 #include <linux/stringify.h>
+#include <asm/asm.h>
 
 #define ___ssnop							\
 	sll	$0, $0, 1
@@ -21,7 +22,7 @@
 /*
  * TLB hazards
  */
-#if defined(CONFIG_CPU_MIPSR2) && !defined(CONFIG_CPU_CAVIUM_OCTEON)
+#if defined(CONFIG_CPU_MIPSR2) || defined(CONFIG_CPU_MIPSR6) && !defined(CONFIG_CPU_CAVIUM_OCTEON)
 
 /*
  * MIPSR2 defines ehb for hazard avoidance
@@ -58,7 +59,7 @@ do {									\
 	unsigned long tmp;						\
 									\
 	__asm__ __volatile__(						\
-	"	.set	mips64r2				\n"	\
+	"	.set "MIPS_ISA_LEVEL"				\n"	\
 	"	dla	%0, 1f					\n"	\
 	"	jr.hb	%0					\n"	\
 	"	.set	mips0					\n"	\
@@ -132,7 +133,7 @@ do {									\
 
 #define instruction_hazard()						\
 do {									\
-	if (cpu_has_mips_r2)						\
+	if (cpu_has_mips_r2 || cpu_has_mips_r6)						\
 		__instruction_hazard();					\
 } while (0)
 
@@ -240,7 +241,7 @@ do {									\
 
 #define __disable_fpu_hazard
 
-#elif defined(CONFIG_CPU_MIPSR2)
+#elif defined(CONFIG_CPU_MIPSR2) || defined(CONFIG_CPU_MIPSR6)
 
 #define __enable_fpu_hazard						\
 	___ehb
-- 
2.2.1
