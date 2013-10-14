Received: from multi.imgtec.com ([194.200.65.239]:48530 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6817315Ab3JNItPi0d-5 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 14 Oct 2013 10:49:15 +0200
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH] MIPS: Malta: Remove ttyS2 serial for CMP platforms
Date: Mon, 14 Oct 2013 09:49:25 +0100
Message-ID: <1381740565-17243-1-git-send-email-markos.chandras@imgtec.com>
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
Cc: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20131014084925.UhWOEy0xul1JKjsuzNQUxz4-CdmB_N7FAvK8IKi-Tzk@z>

From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>

Commit 225ae5fd9a320e22841410049c3bdb6cf14a5841
"MIPS: Malta: Fix interupt number of CBUS UART"

fixed the IRQ number for the ttyS2 CBUS UART. However, this now
conflicts with the GIC IPI1 interrupt in CMP platforms. The Malta
interrupt code arbitrarily binds IPIs to INT2 and INT3 and since
ttyS2 uses the INT2 IRQ line, closing the device disables the
INT2 interrupt and this effectively disables the IPI1 interrupt
as well. This patch is mainly a workaround until the Malta code
is fixed properly.

Signed-off-by: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/mti-malta/malta-platform.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/mti-malta/malta-platform.c b/arch/mips/mti-malta/malta-platform.c
index 132f866..e1dd1c1 100644
--- a/arch/mips/mti-malta/malta-platform.c
+++ b/arch/mips/mti-malta/malta-platform.c
@@ -47,6 +47,7 @@
 static struct plat_serial8250_port uart8250_data[] = {
 	SMC_PORT(0x3F8, 4),
 	SMC_PORT(0x2F8, 3),
+#ifndef CONFIG_MIPS_CMP
 	{
 		.mapbase	= 0x1f000900,	/* The CBUS UART */
 		.irq		= MIPS_CPU_IRQ_BASE + MIPSCPU_INT_MB2,
@@ -55,6 +56,7 @@ static struct plat_serial8250_port uart8250_data[] = {
 		.flags		= CBUS_UART_FLAGS,
 		.regshift	= 3,
 	},
+#endif
 	{ },
 };
 
-- 
1.8.3.2
