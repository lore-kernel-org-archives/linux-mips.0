Received: from multi.imgtec.com ([194.200.65.239]:43121 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6823923Ab3KTKqYogi6N (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 20 Nov 2013 11:46:24 +0100
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 1/3] MIPS: Add processor identifiers for the interAptiv processors
Date: Wed, 20 Nov 2013 10:46:00 +0000
Message-ID: <1384944362-7197-2-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1384944362-7197-1-git-send-email-markos.chandras@imgtec.com>
References: <1384944362-7197-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20131120104600.1aciq5cqZMgqOn4uKKqelGouZu55F1r5IwCYK-i-128@z>

From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>

Add processor identifiers for UP and MT interAptiv processors.

Signed-off-by: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/include/asm/cpu.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
index 9bb2abe..aa63c4c 100644
--- a/arch/mips/include/asm/cpu.h
+++ b/arch/mips/include/asm/cpu.h
@@ -111,6 +111,8 @@
 #define PRID_IMP_1074K		0x9a00
 #define PRID_IMP_M14KC		0x9c00
 #define PRID_IMP_M14KEC		0x9e00
+#define PRID_IMP_INTERAPTIV_UP	0xa000
+#define PRID_IMP_INTERAPTIV_MP	0xa100
 #define PRID_IMP_PROAPTIV_UP	0xa200
 #define PRID_IMP_PROAPTIV_MP	0xa300
 
-- 
1.8.4.3
