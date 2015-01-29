Received: from mailapp01.imgtec.com ([195.59.15.196]:49116 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012181AbbA2LOkN9159 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 29 Jan 2015 12:14:40 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 6/9] MIPS: idle: Workaround wait + FDC problems
Date: Thu, 29 Jan 2015 11:14:11 +0000
Message-ID: <1422530054-7976-7-git-send-email-james.hogan@imgtec.com>
In-Reply-To: <1422530054-7976-1-git-send-email-james.hogan@imgtec.com>
References: <1422530054-7976-1-git-send-email-james.hogan@imgtec.com>
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
To: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Cc: linux-kernel@vger.kernel.org, James Hogan <james.hogan@imgtec.com>
Message-ID: <20150129111411.n-p_idkOXKHQhlfQK32K7whEXnXQjLXXNSWubFG7QEk@z>

On certain cores (namely proAptiv and P5600) incoming data via a Fast
Debug Channel (FDC) while the core is blocked on a wait instruction will
cause the wait not to wake up even when another interrupt is received.
This makes an idle target stop as soon as you send FDC data to it, until
the debug probe interrupts it and restarts the wait instruction.

This is worked around by avoiding using r4k_wait on these cores if
CONFIG_MIPS_EJTAG_FDC_TTY is enabled (which would imply the user intends
to use the FDC).

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---
 arch/mips/kernel/idle.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/idle.c b/arch/mips/kernel/idle.c
index 0b9082b6b683..3db277ea9e8d 100644
--- a/arch/mips/kernel/idle.c
+++ b/arch/mips/kernel/idle.c
@@ -176,6 +176,17 @@ void __init check_wait(void)
 		cpu_wait = rm7k_wait_irqoff;
 		break;
 
+	case CPU_PROAPTIV:
+	case CPU_P5600:
+		/*
+		 * Incoming Fast Debug Channel (FDC) data during a wait
+		 * instruction causes the wait never to resume, even if an
+		 * interrupt is received. Avoid using wait at all if FDC data is
+		 * likely to be received.
+		 */
+		if (IS_ENABLED(CONFIG_MIPS_EJTAG_FDC_TTY))
+			break;
+		/* fall through */
 	case CPU_M14KC:
 	case CPU_M14KEC:
 	case CPU_24K:
@@ -183,8 +194,6 @@ void __init check_wait(void)
 	case CPU_1004K:
 	case CPU_1074K:
 	case CPU_INTERAPTIV:
-	case CPU_PROAPTIV:
-	case CPU_P5600:
 	case CPU_M5150:
 		cpu_wait = r4k_wait;
 		if (read_c0_config7() & MIPS_CONF7_WII)
-- 
2.0.5
