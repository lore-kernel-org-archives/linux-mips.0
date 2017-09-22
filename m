Received: from mailapp01.imgtec.com ([195.59.15.196]:45933 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992544AbdIVGpwkU-pc (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 22 Sep 2017 08:45:52 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 2/4] MIPS: Don't dump CM error state for fixed up bus errors
Date: Thu, 21 Sep 2017 23:44:45 -0700
Message-ID: <20170922064447.28728-3-paul.burton@imgtec.com>
In-Reply-To: <20170922064447.28728-1-paul.burton@imgtec.com>
References: <20170922064447.28728-1-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20170922064445.bHFriqvq-NsR-0KgTrv8qwck08YemH_0aHumy7LDSPM@z>

If a bus error has a fixup then this implies that it is somewhat
expected. Therefore avoid printing out CM error state when a fixup
exists.

One case in which user code can trigger this is performing unaligned
accesses to the GIC user page, which the kernel then attempts to emulate
with byte sized memory accesses that trigger bus errors. These are fixed
up and ultimately harmless, so spamming the kernel log with CM error
information for these cases seems inappropriate.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---

 arch/mips/kernel/traps.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index e7190e5ae427..259e2d259204 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -449,11 +449,10 @@ asmlinkage void do_be(struct pt_regs *regs)
 	if (data && !user_mode(regs))
 		fixup = search_dbe_tables(exception_epc(regs));
 
-	if (fixup)
-		action = MIPS_BE_FIXUP;
-
 	if (board_be_handler)
 		action = board_be_handler(regs, fixup != NULL);
+	else if (fixup)
+		action = MIPS_BE_FIXUP;
 	else
 		mips_cm_error_report();
 
-- 
2.14.1
