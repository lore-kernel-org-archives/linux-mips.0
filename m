Received: from mailapp01.imgtec.com ([195.59.15.196]:5718 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993866AbdF2JNCqg87W (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 29 Jun 2017 11:13:02 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 1/4] MIPS: Drop duplicate HAVE_SYSCALL_TRACEPOINTS select
Date: Thu, 29 Jun 2017 10:12:33 +0100
Message-ID: <013df3113da2ad1d4f95b528a54df971ee342f6d.1498727356.git-series.james.hogan@imgtec.com>
In-Reply-To: <cover.7467c3bd7867c61afc334e409c93dac28541f5e6.1498727356.git-series.james.hogan@imgtec.com>
References: <cover.7467c3bd7867c61afc334e409c93dac28541f5e6.1498727356.git-series.james.hogan@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <James.Hogan@imgtec.com>
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
Cc: James Hogan <james.hogan@imgtec.com>, linux-mips@linux-mips.org
Message-ID: <20170629091233.RnJKh8yWHw0h-p88YS6O8K4gpksEJKagJHLlzxRPW6Y@z>

MIPS selects HAVE_SYSCALL_TRACEPOINTS twice. The first was added back in
v3.13 by commit 2d7bf993e073 ("MIPS: ftrace: Add support for syscall
tracepoints."), but then a second redundant one was added in v4.2 by
commit fb59e394c30c ("MIPS: ftrace: Enable support for syscall
tracepoints.").

Drop the duplicate select.

Fixes: fb59e394c30c ("MIPS: ftrace: Enable support for syscall tracepoints.")
Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---
 arch/mips/Kconfig | 1 -
 1 file changed, 0 insertions(+), 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 609986e8b21e..55e48a3e7f05 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -64,7 +64,6 @@ config MIPS
 	select HAVE_PERF_EVENTS
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_SYSCALL_TRACEPOINTS
-	select HAVE_SYSCALL_TRACEPOINTS
 	select HAVE_VIRT_CPU_ACCOUNTING_GEN
 	select IRQ_FORCED_THREADING
 	select MODULES_USE_ELF_RELA if MODULES && 64BIT
-- 
git-series 0.8.10
