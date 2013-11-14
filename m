Received: from multi.imgtec.com ([194.200.65.239]:1075 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6862035Ab3KNQM6Kfqzd (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 14 Nov 2013 17:12:58 +0100
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH v2 06/12] MIPS: Add processor identifiers for the proAptiv processors
Date: Thu, 14 Nov 2013 16:12:26 +0000
Message-ID: <1384445552-30573-7-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1384445552-30573-1-git-send-email-markos.chandras@imgtec.com>
References: <1384445552-30573-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20131114161226.a3bCibUA8F6Ok0wh8KAizHgTooCXB03vbYjOCPBB4NY@z>

From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>

Add processor identifiers for single core and multi-core
proAptiv processors.

Signed-off-by: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/include/asm/cpu.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
index 7974be9..6273f6a 100644
--- a/arch/mips/include/asm/cpu.h
+++ b/arch/mips/include/asm/cpu.h
@@ -111,6 +111,8 @@
 #define PRID_IMP_1074K		0x9a00
 #define PRID_IMP_M14KC		0x9c00
 #define PRID_IMP_M14KEC		0x9e00
+#define PRID_IMP_PROAPTIV_UP	0xa200
+#define PRID_IMP_PROAPTIV_MP	0xa300
 
 /*
  * These are the PRID's for when 23:16 == PRID_COMP_SIBYTE
-- 
1.8.4.3
