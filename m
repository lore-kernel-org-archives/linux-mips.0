Received: from 20pmail.ess.barracuda.com ([64.235.154.233]:42937 "EHLO
        20pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990430AbdJPKIw2FGNl (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 16 Oct 2017 12:08:52 +0200
From: Matt Redfearn <matt.redfearn@mips.com>
Subject: [PATCH] MIPS: generic: Fix compilation error from include asm/mips-cpc.h
Date: Mon, 16 Oct 2017 11:06:49 +0100
Message-ID: <1508148409-15864-1-git-send-email-matt.redfearn@mips.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Matt.Redfearn@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, Paul Burton <paul.burton@mips.com>, Matt Redfearn <matt.redfearn@mips.com>, Marcin Nowakowski <marcin.nowakowski@imgtec.com>, linux-kernel@vger.kernel.org, Ying Huang <ying.huang@intel.com>, Matija Glavinic Pecotic <matija.glavinic-pecotic.ext@nokia.com>, Ingo Molnar <mingo@kernel.org>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20171016100649.nVZ8VHpqwrwo8OAzdV3bdao-pEw3HdwAJVFn-vuOVi0@z>

Commit e83f7e02af50c ("MIPS: CPS: Have asm/mips-cps.h include CM & CPC
headers") adds a #error to arch/mips/include/asm/mips-cpc.h if it is
included directly. While this commit replaced almost all direct includes
of mips-cm.h and mips-cpc.h, 2 remain.

With some defconfigs, mips-cps.h is indirectly included before
mips-cpc.h, but in others this results in compilation errors:

In file included from arch/mips/generic/init.c:23:0:
./arch/mips/include/asm/mips-cpc.h:12:3: error: #error Please include
asm/mips-cps.h rather than asm/mips-cpc.h
 # error Please include asm/mips-cps.h rather than asm/mips-cpc.h

In file included from arch/mips/kernel/smp.c:23:0:
./arch/mips/include/asm/mips-cpc.h:12:3: error: #error Please include
asm/mips-cps.h rather than asm/mips-cpc.h
 # error Please include asm/mips-cps.h rather than asm/mips-cpc.h

In both cases, fix this by including mips-cps.h instead.

Fixes: e83f7e02af50c ("MIPS: CPS: Have asm/mips-cps.h include CM & CPC headers")
Signed-off-by: Matt Redfearn <matt.redfearn@mips.com>
---

 arch/mips/generic/init.c | 2 +-
 arch/mips/kernel/smp.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/generic/init.c b/arch/mips/generic/init.c
index 15a7fb8e2a2e..813c60c73a4c 100644
--- a/arch/mips/generic/init.c
+++ b/arch/mips/generic/init.c
@@ -20,7 +20,7 @@
 #include <asm/fw/fw.h>
 #include <asm/irq_cpu.h>
 #include <asm/machine.h>
-#include <asm/mips-cpc.h>
+#include <asm/mips-cps.h>
 #include <asm/prom.h>
 #include <asm/smp-ops.h>
 #include <asm/time.h>
diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
index bbe19b64def5..3cd2f70d1c18 100644
--- a/arch/mips/kernel/smp.c
+++ b/arch/mips/kernel/smp.c
@@ -42,7 +42,7 @@
 #include <asm/processor.h>
 #include <asm/idle.h>
 #include <asm/r4k-timer.h>
-#include <asm/mips-cpc.h>
+#include <asm/mips-cps.h>
 #include <asm/mmu_context.h>
 #include <asm/time.h>
 #include <asm/setup.h>
-- 
2.7.4
