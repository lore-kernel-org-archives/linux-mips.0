Received: from multi.imgtec.com ([194.200.65.239]:48889 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6865342Ab3HOM7qaRbT- (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 15 Aug 2013 14:59:46 +0200
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH v2] MIPS: netlogic: xlr: Serial support depends on CONFIG_SERIAL_8250
Date: Thu, 15 Aug 2013 13:59:35 +0100
Message-ID: <1376571575-29037-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20130815125935.B6Qs7tBb2b2mnrEMIJ54LBqE800lM6fT9eVq2jZHUIg@z>

The nlm_early_serial_setup code needs the early_serial_setup symbol
which is only available if CONFIG_SERIAL_8250 is selected.
Fixes the following build problem:

arch/mips/built-in.o: In function `nlm_early_serial_setup':
setup.c:(.init.text+0x274): undefined reference to `early_serial_setup'
make: *** [vmlinux] Error 1

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/netlogic/xlr/setup.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/mips/netlogic/xlr/setup.c b/arch/mips/netlogic/xlr/setup.c
index 214d123..6d7d75e 100644
--- a/arch/mips/netlogic/xlr/setup.c
+++ b/arch/mips/netlogic/xlr/setup.c
@@ -60,6 +60,7 @@ unsigned int  nlm_threads_per_core = 1;
 struct nlm_soc_info nlm_nodes[NLM_NR_NODES];
 cpumask_t nlm_cpumask = CPU_MASK_CPU0;
 
+#ifdef CONFIG_SERIAL_8250
 static void __init nlm_early_serial_setup(void)
 {
 	struct uart_port s;
@@ -78,6 +79,9 @@ static void __init nlm_early_serial_setup(void)
 	s.membase	= (unsigned char __iomem *)uart_base;
 	early_serial_setup(&s);
 }
+#else
+static inline void nlm_early_serial_setup(void) {}
+#endif
 
 static void nlm_linux_exit(void)
 {
-- 
1.8.3.2
