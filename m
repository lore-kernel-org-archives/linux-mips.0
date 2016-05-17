Received: from mailapp01.imgtec.com ([195.59.15.196]:19842 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27028812AbcEQObplgUeo (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 17 May 2016 16:31:45 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 1/3] MIPS: Clear Status IPL field when using EIC
Date: Tue, 17 May 2016 15:31:04 +0100
Message-ID: <1463495466-29689-2-git-send-email-paul.burton@imgtec.com>
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
Cc: Matt Redfearn <matt.redfearn@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, Guenter Roeck <linux@roeck-us.net>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>, James Hogan <james.hogan@imgtec.com>
Message-ID: <20160517143104.wgWXv4CZ-rUHaI0ghi2b0d16yLdkhXXEaHDhyWJHaIs@z>

When using an external interrupt controller (EIC) the interrupt mask
bits in the cop0 Status register are reused for the Interrupt Priority
Level, and any interrupts with a priority lower than the field will be
ignored. Clear the field to 0 by default such that all interrupts are
serviced. Without doing so we default to arbitrarily ignoring all or
some subset of interrupts.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 arch/mips/kernel/irq.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/kernel/irq.c b/arch/mips/kernel/irq.c
index 8eb5af8..f25f7ea 100644
--- a/arch/mips/kernel/irq.c
+++ b/arch/mips/kernel/irq.c
@@ -54,6 +54,9 @@ void __init init_IRQ(void)
 	for (i = 0; i < NR_IRQS; i++)
 		irq_set_noprobe(i);
 
+	if (cpu_has_veic)
+		clear_c0_status(ST0_IM);
+
 	arch_init_irq();
 }
 
-- 
2.8.2
