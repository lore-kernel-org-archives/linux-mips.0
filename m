Received: from mailapp01.imgtec.com ([195.59.15.196]:32131 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27029638AbcEQOcAaqC8o (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 17 May 2016 16:32:00 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 2/3] MIPS: smp-cps: Clear Status IPL field when using EIC
Date: Tue, 17 May 2016 15:31:05 +0100
Message-ID: <1463495466-29689-3-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1463495466-29689-1-git-send-email-paul.burton@imgtec.com>
References: <1463495466-29689-1-git-send-email-paul.burton@imgtec.com>
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
To: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Cc: Matt Redfearn <matt.redfearn@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, Qais Yousef <qais.yousef@imgtec.com>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20160517143105.D6JbsejwdCyNuucR7Y59ZE5KTxPnvL6AMm0k5048umg@z>

When using an external interrupt controller (EIC) the interrupt mask
bits in the cop0 Status register are reused for the Interrupt Priority
Level, and any interrupts with a priority lower than the field will be
ignored. Clear the field to 0 by default such that all interrupts are
serviced.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 arch/mips/kernel/smp-cps.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
index 253e140..f19f0d3 100644
--- a/arch/mips/kernel/smp-cps.c
+++ b/arch/mips/kernel/smp-cps.c
@@ -307,8 +307,12 @@ static void cps_init_secondary(void)
 	if (cpu_has_mipsmt)
 		dmt();
 
-	change_c0_status(ST0_IM, STATUSF_IP2 | STATUSF_IP3 | STATUSF_IP4 |
-				 STATUSF_IP5 | STATUSF_IP6 | STATUSF_IP7);
+	if (cpu_has_veic)
+		clear_c0_status(ST0_IM);
+	else
+		change_c0_status(ST0_IM, STATUSF_IP2 | STATUSF_IP3 |
+					 STATUSF_IP4 | STATUSF_IP5 |
+					 STATUSF_IP6 | STATUSF_IP7);
 }
 
 static void cps_smp_finish(void)
-- 
2.8.2
