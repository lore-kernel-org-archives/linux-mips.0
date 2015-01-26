Received: from mailapp01.imgtec.com ([195.59.15.196]:4826 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010725AbbAZJlUFuheK (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 26 Jan 2015 10:41:20 +0100
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 1/3] MIPS: asm: pgtable: Add c0 hazards on HTW start/stop sequences
Date: Mon, 26 Jan 2015 09:40:34 +0000
Message-ID: <1422265236-29290-2-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1422265236-29290-1-git-send-email-markos.chandras@imgtec.com>
References: <1422265236-29290-1-git-send-email-markos.chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>, stable@vger.kernel.org
Message-ID: <20150126094034.I6Gezjk4pvG8ik67ICX0Yra6BKCHa_umCdUe-ia96ao@z>

When we use htw_{start,stop}() outside of htw_reset(), we need
to ensure that c0 changes have been propagated properly before
we attempt to continue with subsequence memory operations.

Cc: <stable@vger.kernel.org> # 3.17+
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/include/asm/pgtable.h | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
index d6d1928539b1..7f7c558de9fc 100644
--- a/arch/mips/include/asm/pgtable.h
+++ b/arch/mips/include/asm/pgtable.h
@@ -99,16 +99,20 @@ extern void paging_init(void);
 
 #define htw_stop()							\
 do {									\
-	if (cpu_has_htw)						\
+	if (cpu_has_htw) {						\
 		write_c0_pwctl(read_c0_pwctl() &			\
 			       ~(1 << MIPS_PWCTL_PWEN_SHIFT));		\
+		back_to_back_c0_hazard();				\
+	}								\
 } while(0)
 
 #define htw_start()							\
 do {									\
-	if (cpu_has_htw)						\
+	if (cpu_has_htw) {						\
 		write_c0_pwctl(read_c0_pwctl() |			\
 			       (1 << MIPS_PWCTL_PWEN_SHIFT));		\
+		back_to_back_c0_hazard();				\
+	}								\
 } while(0)
 
 
@@ -116,9 +120,7 @@ do {									\
 do {									\
 	if (cpu_has_htw) {						\
 		htw_stop();						\
-		back_to_back_c0_hazard();				\
 		htw_start();						\
-		back_to_back_c0_hazard();				\
 	}								\
 } while(0)
 
-- 
2.2.2
