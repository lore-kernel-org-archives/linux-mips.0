Received: from mailapp01.imgtec.com ([195.59.15.196]:46630 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992028AbcH2JajK9HPp (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 29 Aug 2016 11:30:39 +0200
From: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Subject: [PATCH 2/2] MIPS: set NR_syscall_tables appropriately
Date: Mon, 29 Aug 2016 11:30:07 +0200
Message-ID: <1472463007-6469-2-git-send-email-marcin.nowakowski@imgtec.com>
In-Reply-To: <1472463007-6469-1-git-send-email-marcin.nowakowski@imgtec.com>
References: <1472463007-6469-1-git-send-email-marcin.nowakowski@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Marcin.Nowakowski@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, "open list:MIPS" <linux-mips@linux-mips.org>, open list <linux-kernel@vger.kernel.org>
Cc: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Message-ID: <20160829093007.y-vOTZvHHr6yLOkf8rGtfoDGDRO5Eqnayq96lvfB4KY@z>

Depending on the kernel configuration, up to 3 syscall tables can be
used in parallel - so set the number properly to ensure syscall tracing
is set up properly.

Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
---
 arch/mips/include/asm/unistd.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/mips/include/asm/unistd.h b/arch/mips/include/asm/unistd.h
index e558130..71162f3d 100644
--- a/arch/mips/include/asm/unistd.h
+++ b/arch/mips/include/asm/unistd.h
@@ -22,6 +22,10 @@
 #define NR_syscalls  (__NR_O32_Linux + __NR_O32_Linux_syscalls)
 #endif
 
+#define NR_syscall_tables (1 + \
+	IS_ENABLED(CONFIG_MIPS32_O32) + \
+	IS_ENABLED(CONFIG_MIPS32_N32))
+
 #ifndef __ASSEMBLY__
 
 #define __ARCH_WANT_OLD_READDIR
-- 
2.7.4
