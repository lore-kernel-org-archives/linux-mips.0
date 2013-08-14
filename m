Received: from multi.imgtec.com ([194.200.65.239]:1668 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6817128Ab3HNI5vxTv46 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 14 Aug 2013 10:57:51 +0200
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH] MIPS: txx9: Fix build error if CONFIG_TOSHIBA_JMR3927 is not selected
Date: Wed, 14 Aug 2013 09:57:16 +0100
Message-ID: <1376470636-18534-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20130814085716.M3gcHpMCd-HlPfBfSJA1LW-KZe_zvCLI07CKTuMWWM8@z>

The jmr3927_vec txx9_board_vec struct is defined in
txx9/jmr3927/setup.c which is only built if
CONFIG_TOSHIBA_JMR3927 is selected. This patch fixes the following
build problem:

arch/mips/txx9/generic/setup.c: In function 'select_board':
arch/mips/txx9/generic/setup.c:354:20: error:
'jmr3927_vec' undeclared (first use in this function)
arch/mips/txx9/generic/setup.c:354:20: note: each undeclared
identifier is reported only once for each function it appears in
make[3]: *** [arch/mips/txx9/generic/setup.o] Error 1

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
Acked-by: Steven J. Hill <Steven.Hill@imgtec.com>
---
 arch/mips/txx9/generic/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/txx9/generic/setup.c b/arch/mips/txx9/generic/setup.c
index 681e7f8..2b0b83c 100644
--- a/arch/mips/txx9/generic/setup.c
+++ b/arch/mips/txx9/generic/setup.c
@@ -350,7 +350,7 @@ static void __init select_board(void)
 	}
 
 	/* select "default" board */
-#ifdef CONFIG_CPU_TX39XX
+#ifdef CONFIG_TOSHIBA_JMR3927
 	txx9_board_vec = &jmr3927_vec;
 #endif
 #ifdef CONFIG_CPU_TX49XX
-- 
1.8.3.2
