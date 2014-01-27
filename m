Received: from multi.imgtec.com ([194.200.65.239]:43566 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6817294AbaA0UUtK37Vl (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 27 Jan 2014 21:20:49 +0100
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 04/58] MIPS: futex: Add EVA support for futex operations
Date: Mon, 27 Jan 2014 20:18:51 +0000
Message-ID: <1390853985-14246-5-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1390853985-14246-1-git-send-email-markos.chandras@imgtec.com>
References: <1390853985-14246-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20140127201851.ruFrpYryJBg35ggTaNHx83ckig3G9eiWhpn4wV2F7W0@z>

Use LLE/SCE instructions for performing an address translation for
userspace when EVA is enabled.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/include/asm/futex.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/mips/include/asm/futex.h b/arch/mips/include/asm/futex.h
index 6ea1581..2a572e1 100644
--- a/arch/mips/include/asm/futex.h
+++ b/arch/mips/include/asm/futex.h
@@ -12,6 +12,7 @@
 
 #include <linux/futex.h>
 #include <linux/uaccess.h>
+#include <asm/asm.h>
 #include <asm/barrier.h>
 #include <asm/errno.h>
 #include <asm/war.h>
@@ -49,11 +50,11 @@
 		"	.set	push				\n"	\
 		"	.set	noat				\n"	\
 		"	.set	mips3				\n"	\
-		"1:	ll	%1, %4	# __futex_atomic_op	\n"	\
+		"1:	"user_ll("%1", "%4")" # __futex_atomic_op\n"	\
 		"	.set	mips0				\n"	\
 		"	" insn	"				\n"	\
 		"	.set	mips3				\n"	\
-		"2:	sc	$1, %2				\n"	\
+		"2:	"user_sc("$1", "%2")"			\n"	\
 		"	beqz	$1, 1b				\n"	\
 		__WEAK_LLSC_MB						\
 		"3:						\n"	\
@@ -174,12 +175,12 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
 		"	.set	push					\n"
 		"	.set	noat					\n"
 		"	.set	mips3					\n"
-		"1:	ll	%1, %3					\n"
+		"1:	"user_ll("%1", "%3")"				\n"
 		"	bne	%1, %z4, 3f				\n"
 		"	.set	mips0					\n"
 		"	move	$1, %z5					\n"
 		"	.set	mips3					\n"
-		"2:	sc	$1, %2					\n"
+		"2:	"user_sc("$1", "%2")"				\n"
 		"	beqz	$1, 1b					\n"
 		__WEAK_LLSC_MB
 		"3:							\n"
-- 
1.8.5.3
