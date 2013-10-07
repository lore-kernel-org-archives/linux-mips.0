Received: from multi.imgtec.com ([194.200.65.239]:47229 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6823911Ab3JGKcucY-SC (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 7 Oct 2013 12:32:50 +0200
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH] MIPS: Always register R4K clock when selected
Date: Mon, 7 Oct 2013 11:32:54 +0100
Message-ID: <1381141974-16018-1-git-send-email-markos.chandras@imgtec.com>
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
Cc: "Steven J. Hill" <Steven.Hill@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20131007103254.e_FBcu2DzU3unPWcyFrgH4KHLl8RmRwSu168Q9nui6k@z>

From: "Steven J. Hill" <Steven.Hill@imgtec.com>

Always register the R4K clocksource when CONFIG_CSRC_R4K is selected,
regardless of selected support for other clocksources. The kernel will
select the best clocksource based on their ratings, making it safe to
register R4K unconditionally and use it as a fallback should the
kernel be run on a system where other selected clocksources are
inoperable.

Signed-off-by: Steven J. Hill <Steven.Hill@imgtec.com>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/include/asm/time.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/time.h b/arch/mips/include/asm/time.h
index 2d7b9df..24f534a 100644
--- a/arch/mips/include/asm/time.h
+++ b/arch/mips/include/asm/time.h
@@ -75,7 +75,7 @@ extern int init_r4k_clocksource(void);
 
 static inline int init_mips_clocksource(void)
 {
-#if defined(CONFIG_CSRC_R4K) && !defined(CONFIG_CSRC_GIC)
+#ifdef CONFIG_CSRC_R4K
 	return init_r4k_clocksource();
 #else
 	return 0;
-- 
1.8.3.2
