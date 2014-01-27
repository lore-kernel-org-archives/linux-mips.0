Received: from multi.imgtec.com ([194.200.65.239]:43558 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6825759AbaA0UU2lYvee (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 27 Jan 2014 21:20:28 +0100
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 02/58] MIPS: asm: Add prefetch instruction for EVA
Date: Mon, 27 Jan 2014 20:18:49 +0000
Message-ID: <1390853985-14246-3-git-send-email-markos.chandras@imgtec.com>
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
Cc: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20140127201849.w5s-S14hvESTQ4buHCyG5jcXc9YbXtG58ysDHv0A9TI@z>

From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>

EVA can use the PREFE instruction to perform the virtual address
translation using the user mapping of the address rather than the
kernel mapping.

Signed-off-by: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/include/asm/asm.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/mips/include/asm/asm.h b/arch/mips/include/asm/asm.h
index 879691d..b79be18a 100644
--- a/arch/mips/include/asm/asm.h
+++ b/arch/mips/include/asm/asm.h
@@ -149,6 +149,13 @@ symbol		=	value
 		pref	hint, addr;			\
 		.set	pop
 
+#define PREFE(hint, addr)				\
+		.set	push;				\
+		.set	mips0;				\
+		.set	eva;				\
+		prefe	hint, addr;			\
+		.set	pop
+
 #define PREFX(hint,addr)				\
 		.set	push;				\
 		.set	mips4;				\
@@ -158,6 +165,7 @@ symbol		=	value
 #else /* !CONFIG_CPU_HAS_PREFETCH */
 
 #define PREF(hint, addr)
+#define PREFE(hint, addr)
 #define PREFX(hint, addr)
 
 #endif /* !CONFIG_CPU_HAS_PREFETCH */
-- 
1.8.5.3
