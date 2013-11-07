Received: from multi.imgtec.com ([194.200.65.239]:52390 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6822969Ab3KGMszOCUtV (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 7 Nov 2013 13:48:55 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 3/6] mips: remove unused {en,dis}able_fpu macros
Date: Thu, 7 Nov 2013 12:48:30 +0000
Message-ID: <1383828513-28462-4-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1383828513-28462-1-git-send-email-paul.burton@imgtec.com>
References: <1383828513-28462-1-git-send-email-paul.burton@imgtec.com>
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
To: linux-mips@linux-mips.org
Cc: Paul Burton <paul.burton@imgtec.com>
Message-ID: <20131107124830.uoX6RI51gxbEHQVpssSA7ypXfk402FNyRGUoUOQYaTI@z>

These macros are not used anywhere in the kernel. Remove them.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---
 arch/mips/include/asm/fpu.h | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/arch/mips/include/asm/fpu.h b/arch/mips/include/asm/fpu.h
index d088e5d..3bf023f 100644
--- a/arch/mips/include/asm/fpu.h
+++ b/arch/mips/include/asm/fpu.h
@@ -45,19 +45,6 @@ do {									\
 	disable_fpu_hazard();						\
 } while (0)
 
-#define enable_fpu()							\
-do {									\
-	if (cpu_has_fpu)						\
-		__enable_fpu();						\
-} while (0)
-
-#define disable_fpu()							\
-do {									\
-	if (cpu_has_fpu)						\
-		__disable_fpu();					\
-} while (0)
-
-
 #define clear_fpu_owner()	clear_thread_flag(TIF_USEDFPU)
 
 static inline int __is_fpu_owner(void)
-- 
1.8.4.1
