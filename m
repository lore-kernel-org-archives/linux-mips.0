Received: from 9pmail.ess.barracuda.com ([64.235.154.210]:44588 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23993874AbeFVR4SHEr2O (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 22 Jun 2018 19:56:18 +0200
From: Paul Burton <paul.burton@mips.com>
Subject: [PATCH 1/3] MIPS: Call dump_stack() from show_regs()
Date: Fri, 22 Jun 2018 10:55:45 -0700
Message-ID: <20180622175547.17716-2-paul.burton@mips.com>
In-Reply-To: <20180622175547.17716-1-paul.burton@mips.com>
References: <20180622175547.17716-1-paul.burton@mips.com>
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
Cc: Huacai Chen <chenhc@lemote.com>, Paul Burton <paul.burton@mips.com>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>
Message-ID: <20180622175545.4YP0Gh0W-9JuJSW4Bm5BlO7GvB1H53vL7MWz35_GLMw@z>

The generic nmi_cpu_backtrace() function calls show_regs() when a struct
pt_regs is available, and dump_stack() otherwise. If we were to make use
of the generic nmi_cpu_backtrace() with MIPS' current implementation of
show_regs() this would mean that we see only register data with no
accompanying stack information, in contrast with our current
implementation which calls dump_stack() regardless of whether register
state is available.

In preparation for making use of the generic nmi_cpu_backtrace() to
implement arch_trigger_cpumask_backtrace(), have our implementation of
show_regs() call dump_stack() and drop the explicit dump_stack() call in
arch_dump_stack() which is invoked by arch_trigger_cpumask_backtrace().

This will allow the output we produce to remain the same after a later
patch switches to using nmi_cpu_backtrace(). It may mean that we produce
extra stack output in other uses of show_regs(), but this:

  1) Seems harmless.
  2) Is good for consistency between arch_trigger_cpumask_backtrace()
     and other users of show_regs().
  3) Matches the behaviour of the ARM & PowerPC architectures.

Signed-off-by: Paul Burton <paul.burton@mips.com>
Cc: James Hogan <jhogan@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Huacai Chen <chenhc@lemote.com>
Cc: linux-mips@linux-mips.org
---

 arch/mips/kernel/process.c | 4 ++--
 arch/mips/kernel/traps.c   | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/process.c b/arch/mips/kernel/process.c
index 8d85046adcc8..d4cfeb931382 100644
--- a/arch/mips/kernel/process.c
+++ b/arch/mips/kernel/process.c
@@ -663,8 +663,8 @@ static void arch_dump_stack(void *info)
 
 	if (regs)
 		show_regs(regs);
-
-	dump_stack();
+	else
+		dump_stack();
 }
 
 void arch_trigger_cpumask_backtrace(const cpumask_t *mask, bool exclude_self)
diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index d67fa74622ee..8d505a21396e 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -351,6 +351,7 @@ static void __show_regs(const struct pt_regs *regs)
 void show_regs(struct pt_regs *regs)
 {
 	__show_regs((struct pt_regs *)regs);
+	dump_stack();
 }
 
 void show_registers(struct pt_regs *regs)
-- 
2.17.1
