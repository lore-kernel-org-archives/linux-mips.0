Received: from multi.imgtec.com ([194.200.65.239]:16958 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6841854Ab3JIPQUU189k (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 9 Oct 2013 17:16:20 +0200
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH] MIPS: MT: Mark existing TCs as present
Date: Wed, 9 Oct 2013 16:16:25 +0100
Message-ID: <1381331785-15578-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20131009151625.xq5vvNarodSH8m-tZmzxl9ifgP1okizTesZGR9r7or0@z>

According to Documentation/cpu-hotplug.txt, the cpu_present_mask should
contain all the CPUs which are present in the system. Therefore, all the TCs
currently present in the system should be marked as 'present' even if they
will never be brought online.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/kernel/smp-mt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/kernel/smp-mt.c b/arch/mips/kernel/smp-mt.c
index 57a3f7a..35f8d22 100644
--- a/arch/mips/kernel/smp-mt.c
+++ b/arch/mips/kernel/smp-mt.c
@@ -71,6 +71,7 @@ static unsigned int __init smvp_vpe_init(unsigned int tc, unsigned int mvpconf0,
 
 		/* Record this as available CPU */
 		set_cpu_possible(tc, true);
+		set_cpu_present(tc, true);
 		__cpu_number_map[tc]	= ++ncpu;
 		__cpu_logical_map[ncpu] = tc;
 	}
-- 
1.8.3.2
