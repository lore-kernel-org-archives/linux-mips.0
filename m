Received: from 9pmail.ess.barracuda.com ([64.235.150.224]:35234 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992368AbeAEKb7Yb4nu (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 5 Jan 2018 11:31:59 +0100
From: Matt Redfearn <matt.redfearn@mips.com>
Subject: [PATCH 1/6] MIPS: Move ehb() to barrier.h
Date: Fri, 5 Jan 2018 10:31:05 +0000
Message-ID: <1515148270-9391-2-git-send-email-matt.redfearn@mips.com>
In-Reply-To: <1515148270-9391-1-git-send-email-matt.redfearn@mips.com>
References: <1515148270-9391-1-git-send-email-matt.redfearn@mips.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Matt.Redfearn@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-mips@linux-mips.org, Matt Redfearn <matt.redfearn@mips.com>, linux-kernel@vger.kernel.org, Philippe Ombredanne <pombredanne@nexb.com>, Kate Stewart <kstewart@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <20180105103105.cqynC7YscnjbrXWPKP77xS0ORfEwj3BIGJTzDw2lvic@z>

The current location of ehb() in mipsmtregs.h does not make sense, since
it is not strictly related to multi-threading, and may be used in code
which does not include mipsmtregs.h

Signed-off-by: Matt Redfearn <matt.redfearn@mips.com>
---

 arch/mips/include/asm/barrier.h    | 13 +++++++++++++
 arch/mips/include/asm/mipsmtregs.h |  8 --------
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/arch/mips/include/asm/barrier.h b/arch/mips/include/asm/barrier.h
index a5eb1bb199a7..a98fd8a2bba2 100644
--- a/arch/mips/include/asm/barrier.h
+++ b/arch/mips/include/asm/barrier.h
@@ -222,6 +222,19 @@
 #define __smp_mb__before_atomic()	__smp_mb__before_llsc()
 #define __smp_mb__after_atomic()	smp_llsc_mb()
 
+/**
+ * ehb() - Execution Hazard Barrier
+ *
+ * Stop instruction execution until execution hazards are cleared
+ */
+static inline void ehb(void)
+{
+	__asm__ __volatile__(
+	"	.set	mips32r2				\n"
+	"	ehb						\n"
+	"	.set	mips0					\n");
+}
+
 #include <asm-generic/barrier.h>
 
 #endif /* __ASM_BARRIER_H */
diff --git a/arch/mips/include/asm/mipsmtregs.h b/arch/mips/include/asm/mipsmtregs.h
index 212336b7c0f4..4acfc78bc504 100644
--- a/arch/mips/include/asm/mipsmtregs.h
+++ b/arch/mips/include/asm/mipsmtregs.h
@@ -274,14 +274,6 @@ static inline void emt(int previous)
 		__raw_emt();
 }
 
-static inline void ehb(void)
-{
-	__asm__ __volatile__(
-	"	.set	mips32r2				\n"
-	"	ehb						\n"
-	"	.set	mips0					\n");
-}
-
 #define mftc0(rt,sel)							\
 ({									\
 	 unsigned long	__res;						\
-- 
2.7.4
