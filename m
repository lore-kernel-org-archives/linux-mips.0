Received: from mailapp01.imgtec.com ([195.59.15.196]:4714 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012202AbcBHSoNZqcrb (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 8 Feb 2016 19:44:13 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 3/3] MIPS: Fix uapi include in exported asm/siginfo.h
Date: Mon, 8 Feb 2016 18:43:51 +0000
Message-ID: <1454957031-20138-4-git-send-email-james.hogan@imgtec.com>
In-Reply-To: <1454957031-20138-1-git-send-email-james.hogan@imgtec.com>
References: <1454957031-20138-1-git-send-email-james.hogan@imgtec.com>
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
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-kernel@vger.kernel.org, Christopher Ferris <cferris@google.com>, James Hogan <james.hogan@imgtec.com>, Petr Malat <oss@malat.biz>, linux-mips@linux-mips.org, stable@vger.kernel.org
Message-ID: <20160208184351.Idnp53250vawdIyooIFvDWsB8K4Vjq1prHATwEWHAHY@z>

Since commit 8cb48fe169dd ("MIPS: Provide correct siginfo_t.si_stime"),
MIPS' uapi/asm/siginfo.h has included uapi/asm-generic/siginfo.h
directly before defining MIPS' struct siginfo, in order to get the
necessary definitions needed for the siginfo struct without the generic
copy_siginfo() hitting compiler errors due to struct siginfo not yet
being defined.

Now that the generic copy_siginfo() is moved out to linux/signal.h we
can safely include asm-generic/siginfo.h before defining the MIPS
specific struct siginfo, which avoids the uapi/ include as well as
breakage due to generic copy_siginfo() being defined before struct
siginfo.

Reported-by: Christopher Ferris <cferris@google.com>
Fixes: 8cb48fe169dd ("MIPS: Provide correct siginfo_t.si_stime")
Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Petr Malat <oss@malat.biz>
Cc: linux-mips@linux-mips.org
Cc: <stable@vger.kernel.org> # 4.0-
---
 arch/mips/include/uapi/asm/siginfo.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/mips/include/uapi/asm/siginfo.h b/arch/mips/include/uapi/asm/siginfo.h
index 03ec1090f781..e2b5337e840f 100644
--- a/arch/mips/include/uapi/asm/siginfo.h
+++ b/arch/mips/include/uapi/asm/siginfo.h
@@ -28,7 +28,7 @@
 
 #define __ARCH_SIGSYS
 
-#include <uapi/asm-generic/siginfo.h>
+#include <asm-generic/siginfo.h>
 
 /* We can't use generic siginfo_t, because our si_code and si_errno are swapped */
 typedef struct siginfo {
@@ -118,6 +118,4 @@ typedef struct siginfo {
 #define SI_TIMER __SI_CODE(__SI_TIMER, -3) /* sent by timer expiration */
 #define SI_MESGQ __SI_CODE(__SI_MESGQ, -4) /* sent by real time mesq state change */
 
-#include <asm-generic/siginfo.h>
-
 #endif /* _UAPI_ASM_SIGINFO_H */
-- 
2.4.10
