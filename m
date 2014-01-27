Received: from multi.imgtec.com ([194.200.65.239]:43592 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6831300AbaA0UXjg4HFK (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 27 Jan 2014 21:23:39 +0100
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 25/58] MIPS: asm: uaccess: Disable unaligned access macros for EVA
Date: Mon, 27 Jan 2014 20:19:12 +0000
Message-ID: <1390853985-14246-26-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20140127201912.wCGoNxBFO4WxIeAXkoDdxz0hxOQ4nAujl5BTM1yFG3A@z>

From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>

ulb, ulh, ulw are macros which emulate unaligned access for MIPS.
However, no such macros exist for EVA mode, so the only way to do
EVA unaligned accesses is in the ADE exception handler. As a result
of which, disable these macros for EVA.

Signed-off-by: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/include/asm/uaccess.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/mips/include/asm/uaccess.h b/arch/mips/include/asm/uaccess.h
index 0df57e7..9c6f5ce 100644
--- a/arch/mips/include/asm/uaccess.h
+++ b/arch/mips/include/asm/uaccess.h
@@ -402,6 +402,11 @@ do {									\
 extern void __put_user_unknown(void);
 
 /*
+ * ul{b,h,w} are macros and there are no equivalent macros for EVA.
+ * EVA unaligned access is handled in the ADE exception handler.
+ */
+#ifndef CONFIG_EVA
+/*
  * put_user_unaligned: - Write a simple value into user space.
  * @x:	 Value to copy to user space.
  * @ptr: Destination address, in user space.
@@ -666,6 +671,7 @@ do {									\
 }
 
 extern void __put_user_unaligned_unknown(void);
+#endif
 
 /*
  * We're generating jump to subroutines which will be outside the range of
-- 
1.8.5.3
