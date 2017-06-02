Received: from mailapp01.imgtec.com ([195.59.15.196]:30008 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993906AbdFBVtgTbMRF (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 2 Jun 2017 23:49:36 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 1/7] MIPS: Skip IPI setup if we only have 1 CPU
Date: Fri, 2 Jun 2017 14:48:49 -0700
Message-ID: <20170602214856.4545-2-paul.burton@imgtec.com>
In-Reply-To: <20170602214856.4545-1-paul.burton@imgtec.com>
References: <20170602214856.4545-1-paul.burton@imgtec.com>
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
To: linux-mips@linux-mips.org
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20170602214849.dFUwjzQlJy1DlrMinQJpWVZBwCqP0aTZHS79FXwyeTI@z>

If we're running on a system with only 1 possible CPU then it makes no
sense to reserve or initialise IPIs since we'll never use them. Avoid
doing so.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---

 arch/mips/kernel/smp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
index aba1afb64b62..770d4d1516cb 100644
--- a/arch/mips/kernel/smp.c
+++ b/arch/mips/kernel/smp.c
@@ -335,6 +335,9 @@ int mips_smp_ipi_free(const struct cpumask *mask)
 
 static int __init mips_smp_ipi_init(void)
 {
+	if (num_possible_cpus() == 1)
+		return 0;
+
 	mips_smp_ipi_allocate(cpu_possible_mask);
 
 	call_desc = irq_to_desc(call_virq);
-- 
2.13.0
