Received: from 9pmail.ess.barracuda.com ([64.235.154.211]:45627 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992841AbeEOWDoToctZ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 16 May 2018 00:03:44 +0200
Date: Tue, 15 May 2018 23:03:09 +0100
From: "Maciej W. Rozycki" <macro@mips.com>
Subject: [PATCH] MIPS: ptrace: Make FPU context layout comments match
 reality
Message-ID: <alpine.DEB.2.00.1805141441260.10896@tp.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej.Rozycki@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: James Hogan <jhogan@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20180515220309.Vwbu4ahvGbse_qClYL8nq1debOxW7xEJPO1HZffO_-M@z>

Correct comments across ptrace(2) handlers about an FPU register context
layout discrepancy between MIPS I and later ISAs, which was fixed with
`linux-mips.org' (LMO) commit 42533948caac ("Major pile of FP emulator
changes."), the fix corrected with LMO commit 849fa7a50dff ("R3k FPU
ptrace() handling fixes."), and then broken and fixed over and over
again, until last time fixed with commit 80cbfad79096 ("MIPS: Correct
MIPS I FP context layout").

NB running the GDB test suite for the relevant ABI/ISA and watching out 
for regressions is advisable when poking around ptrace(2).

Signed-off-by: Maciej W. Rozycki <macro@mips.com>
---
 arch/mips/kernel/ptrace.c   |    4 ++--
 arch/mips/kernel/ptrace32.c |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

linux-mips-ptrace-r2300-switch-comment.diff
Index: linux/arch/mips/kernel/ptrace.c
===================================================================
--- linux.orig/arch/mips/kernel/ptrace.c	2018-05-10 21:24:39.000000000 +0100
+++ linux/arch/mips/kernel/ptrace.c	2018-05-12 13:28:01.156433000 +0100
@@ -1063,7 +1063,7 @@ long arch_ptrace(struct task_struct *chi
 				/*
 				 * The odd registers are actually the high
 				 * order bits of the values stored in the even
-				 * registers - unless we're using r2k_switch.S.
+				 * registers.
 				 */
 				tmp = get_fpr32(&fregs[(addr & ~1) - FPR_BASE],
 						addr & 1);
@@ -1158,7 +1158,7 @@ long arch_ptrace(struct task_struct *chi
 				/*
 				 * The odd registers are actually the high
 				 * order bits of the values stored in the even
-				 * registers - unless we're using r2k_switch.S.
+				 * registers.
 				 */
 				set_fpr32(&fregs[(addr & ~1) - FPR_BASE],
 					  addr & 1, data);
Index: linux-mipsswbrd038/arch/mips/kernel/ptrace32.c
===================================================================
--- linux-mipsswbrd038.orig/arch/mips/kernel/ptrace32.c	2018-05-10 20:52:25.000000000 +0100
+++ linux-mipsswbrd038/arch/mips/kernel/ptrace32.c	2018-05-12 13:28:18.503568000 +0100
@@ -103,7 +103,7 @@ long compat_arch_ptrace(struct task_stru
 				/*
 				 * The odd registers are actually the high
 				 * order bits of the values stored in the even
-				 * registers - unless we're using r2k_switch.S.
+				 * registers.
 				 */
 				tmp = get_fpr32(&fregs[(addr & ~1) - FPR_BASE],
 						addr & 1);
@@ -216,7 +216,7 @@ long compat_arch_ptrace(struct task_stru
 				/*
 				 * The odd registers are actually the high
 				 * order bits of the values stored in the even
-				 * registers - unless we're using r2k_switch.S.
+				 * registers.
 				 */
 				set_fpr32(&fregs[(addr & ~1) - FPR_BASE],
 					  addr & 1, data);
