Received: from multi.imgtec.com ([194.200.65.239]:32336 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6835137Ab3FQOBcv2pmj (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 17 Jun 2013 16:01:32 +0200
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 3/7] MIPS: sibyte: Add missing sched.h header
Date: Mon, 17 Jun 2013 15:00:37 +0100
Message-ID: <1371477641-7989-4-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1371477641-7989-1-git-send-email-markos.chandras@imgtec.com>
References: <1371477641-7989-1-git-send-email-markos.chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>, sibyte-users@bitmover.com
Message-ID: <20130617140037.8E81bV7Z1nea6T10hXjfnI-n175SISZY6rkH1tX9bM8@z>

It's needed for the TASK_INTERRUPTIBLE definition.

Fixes the following build problem:
arch/mips/sibyte/common/sb_tbprof.c:235:4: error: 'TASK_INTERRUPTIBLE'
undeclared (first use in this function)

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
Acked-by: Steven J. Hill <Steven.Hill@imgtec.com>
Cc: sibyte-users@bitmover.com
---
 arch/mips/sibyte/common/sb_tbprof.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/sibyte/common/sb_tbprof.c b/arch/mips/sibyte/common/sb_tbprof.c
index 2188b39..059e28c 100644
--- a/arch/mips/sibyte/common/sb_tbprof.c
+++ b/arch/mips/sibyte/common/sb_tbprof.c
@@ -27,6 +27,7 @@
 #include <linux/types.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
+#include <linux/sched.h>
 #include <linux/vmalloc.h>
 #include <linux/fs.h>
 #include <linux/errno.h>
-- 
1.8.2.1
