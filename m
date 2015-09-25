Received: from mailapp01.imgtec.com ([195.59.15.196]:39181 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27006508AbbIYDeVqnCDF (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 25 Sep 2015 05:34:21 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 77012C45476A1
        for <linux-mips@linux-mips.org>; Fri, 25 Sep 2015 04:34:14 +0100 (IST)
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH] FIXUP: MIPS: fix n64 syscall address calculation
Date: Thu, 24 Sep 2015 20:33:45 -0700
Message-ID: <1443152025-1975-1-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1442995677-20591-1-git-send-email-markos.chandras@imgtec.com>
References: <1442995677-20591-1-git-send-email-markos.chandras@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20150925033345.qABqGpMqGafdGuEForZeia-Elmr0OklUzAQ58zgQMyo@z>

The patch "MIPS: kernel: scall: Always run the seccomp syscall filters"
incorrectly calculates the address of the syscall function and instead
attempts a load from the offset of the syscall being invoked into the
table. This completely trashes all n64 userland syscalls. Fix the
address calculation.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Markos Chandras <markos.chandras@imgtec.com>
---
Markos: could you please test all 3 ABIs you modified? The n64 one at
        least has clearly not been tested.
---
 arch/mips/kernel/scall64-64.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kernel/scall64-64.S b/arch/mips/kernel/scall64-64.S
index 59e754e..ffab10a2 100644
--- a/arch/mips/kernel/scall64-64.S
+++ b/arch/mips/kernel/scall64-64.S
@@ -59,7 +59,7 @@ syscall_common:
 
 	dsll	t0, t2, 3		# offset into table
 	dla	t2, sys_call_table
-	daddu	t2, t0
+	daddu	t0, t2
 	ld	t2, (t0)		# syscall routine
 	beqz	t2, illegal_syscall
 
-- 
2.5.3
