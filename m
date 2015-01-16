Received: from mailapp01.imgtec.com ([195.59.15.196]:58985 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010619AbbAPKwVlgD38 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 16 Jan 2015 11:52:21 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id CABBBAD382338
        for <linux-mips@linux-mips.org>; Fri, 16 Jan 2015 10:52:13 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH RFC v2 21/70] MIPS: asm: atomic: Update ISA constraints for MIPS R6 support
Date: Fri, 16 Jan 2015 10:49:00 +0000
Message-ID: <1421405389-15512-22-git-send-email-markos.chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>, Matthew Fortune <Matthew.Fortune@imgtec.com>
Message-ID: <20150116104900.ROdkgiuUOFc0HWO0gfaPDyHxA8mmWYivRvKZQW5ybiI@z>

MIPS R6 changed the opcodes for LL/SC instructions so we need to
set the correct ISA level.

Cc: Matthew Fortune <Matthew.Fortune@imgtec.com>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/include/asm/atomic.h | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/mips/include/asm/atomic.h b/arch/mips/include/asm/atomic.h
index 857da84cfc92..be86ec65b573 100644
--- a/arch/mips/include/asm/atomic.h
+++ b/arch/mips/include/asm/atomic.h
@@ -16,6 +16,7 @@
 
 #include <linux/irqflags.h>
 #include <linux/types.h>
+#include <asm/asm.h>
 #include <asm/barrier.h>
 #include <asm/compiler.h>
 #include <asm/cpu-features.h>
@@ -61,7 +62,7 @@ static __inline__ void atomic_##op(int i, atomic_t * v)			      \
 									      \
 		do {							      \
 			__asm__ __volatile__(				      \
-			"	.set	arch=r4000			\n"   \
+			"	.set	"MIPS_ISA_LEVEL"		\n"   \
 			"	ll	%0, %1		# atomic_" #op "\n"   \
 			"	" #asm_op " %0, %2			\n"   \
 			"	sc	%0, %1				\n"   \
@@ -104,7 +105,7 @@ static __inline__ int atomic_##op##_return(int i, atomic_t * v)		      \
 									      \
 		do {							      \
 			__asm__ __volatile__(				      \
-			"	.set	arch=r4000			\n"   \
+			"	.set	"MIPS_ISA_LEVEL"		\n"   \
 			"	ll	%1, %2	# atomic_" #op "_return	\n"   \
 			"	" #asm_op " %0, %1, %3			\n"   \
 			"	sc	%0, %2				\n"   \
@@ -178,7 +179,7 @@ static __inline__ int atomic_sub_if_positive(int i, atomic_t * v)
 		int temp;
 
 		__asm__ __volatile__(
-		"	.set	arch=r4000				\n"
+		"	.set	"MIPS_ISA_LEVEL"			\n"
 		"1:	ll	%1, %2		# atomic_sub_if_positive\n"
 		"	subu	%0, %1, %3				\n"
 		"	bltz	%0, 1f					\n"
@@ -340,7 +341,7 @@ static __inline__ void atomic64_##op(long i, atomic64_t * v)		      \
 									      \
 		do {							      \
 			__asm__ __volatile__(				      \
-			"	.set	arch=r4000			\n"   \
+			"	.set	"MIPS_ISA_LEVEL"		\n"   \
 			"	lld	%0, %1		# atomic64_" #op "\n" \
 			"	" #asm_op " %0, %2			\n"   \
 			"	scd	%0, %1				\n"   \
@@ -383,7 +384,7 @@ static __inline__ long atomic64_##op##_return(long i, atomic64_t * v)	      \
 									      \
 		do {							      \
 			__asm__ __volatile__(				      \
-			"	.set	arch=r4000			\n"   \
+			"	.set	"MIPS_ISA_LEVEL"		\n"   \
 			"	lld	%1, %2	# atomic64_" #op "_return\n"  \
 			"	" #asm_op " %0, %1, %3			\n"   \
 			"	scd	%0, %2				\n"   \
@@ -459,7 +460,7 @@ static __inline__ long atomic64_sub_if_positive(long i, atomic64_t * v)
 		long temp;
 
 		__asm__ __volatile__(
-		"	.set	arch=r4000				\n"
+		"	.set	"MIPS_ISA_LEVEL"			\n"
 		"1:	lld	%1, %2		# atomic64_sub_if_positive\n"
 		"	dsubu	%0, %1, %3				\n"
 		"	bltz	%0, 1f					\n"
-- 
2.2.1
