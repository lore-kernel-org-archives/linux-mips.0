Received: from multi.imgtec.com ([194.200.65.239]:10809 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6827345AbaAOKcXfJKBm (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 15 Jan 2014 11:32:23 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 03/15] MIPS: add missing includes to gic.h
Date: Wed, 15 Jan 2014 10:31:48 +0000
Message-ID: <1389781920-31151-4-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1389781920-31151-1-git-send-email-paul.burton@imgtec.com>
References: <1389781920-31151-1-git-send-email-paul.burton@imgtec.com>
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
Message-ID: <20140115103148.TEKpAiH9CeuYlAtPy0HqaYq1xq112TswL51bTB7VxAc@z>

The gic.h header uses bitmaps and NR_CPUS, and should therefore include
linux/bitmap.h and linux/threads.h. This is in preparation for use of
this header in a subsequent commit from a C file which doesn't already
include those headers.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---
 arch/mips/include/asm/gic.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/include/asm/gic.h b/arch/mips/include/asm/gic.h
index b2e3e93..0827166 100644
--- a/arch/mips/include/asm/gic.h
+++ b/arch/mips/include/asm/gic.h
@@ -11,6 +11,9 @@
 #ifndef _ASM_GICREGS_H
 #define _ASM_GICREGS_H
 
+#include <linux/bitmap.h>
+#include <linux/threads.h>
+
 #undef	GICISBYTELITTLEENDIAN
 
 /* Constants */
-- 
1.8.4.2
