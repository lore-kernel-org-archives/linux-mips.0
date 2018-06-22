Received: from 9pmail.ess.barracuda.com ([64.235.154.211]:37248 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23994077AbeFVSHjvecWO (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 22 Jun 2018 20:07:39 +0200
From: Paul Burton <paul.burton@mips.com>
Subject: [PATCH] MIPS: Remove no-op cast in show_regs()
Date: Fri, 22 Jun 2018 11:07:03 -0700
Message-ID: <20180622180703.18324-1-paul.burton@mips.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Paul.Burton@mips.com>
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
Cc: Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20180622180703.t17LlckLG6ylBkvfEuWrGcdFVxjr7fiEvfw-5_Cg3bc@z>

In show_regs() we have a regs argument of type struct pt_regs *, and we
explicitly cast it to that same type as part of calling __show_regs().

Casting regs to the same type that it is declared as does nothing at
all, so remove the useless cast.

Signed-off-by: Paul Burton <paul.burton@mips.com>
Cc: James Hogan <jhogan@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---
 arch/mips/kernel/traps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index 8d505a21396e..6be2337ca224 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -350,7 +350,7 @@ static void __show_regs(const struct pt_regs *regs)
  */
 void show_regs(struct pt_regs *regs)
 {
-	__show_regs((struct pt_regs *)regs);
+	__show_regs(regs);
 	dump_stack();
 }
 
-- 
2.17.1
