Received: from multi.imgtec.com ([194.200.65.239]:43781 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6837846AbaBSKQ70Vxop (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 19 Feb 2014 11:16:59 +0100
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH] MIPS: bcm47xx: board: Include missing errno.h for ENXIO
Date: Wed, 19 Feb 2014 10:17:18 +0000
Message-ID: <1392805038-29963-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20140219101718.EqX48Ds0P2kYJPhy5K8BHZP8d8tmOezbAkLBz5MBKwE@z>

Fixes the following build problen on allmodconfig:

arch/mips/bcm47xx/board.c: In function 'bcm47xx_board_detect':
arch/mips/bcm47xx/board.c:291:14: error: 'ENXIO' undeclared
(first use in this function)

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/bcm47xx/board.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/bcm47xx/board.c b/arch/mips/bcm47xx/board.c
index 6d612e2..cdd8246 100644
--- a/arch/mips/bcm47xx/board.c
+++ b/arch/mips/bcm47xx/board.c
@@ -1,3 +1,4 @@
+#include <linux/errno.h>
 #include <linux/export.h>
 #include <linux/string.h>
 #include <bcm47xx_board.h>
-- 
1.9.0
