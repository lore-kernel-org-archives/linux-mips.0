Received: from mailapp01.imgtec.com ([195.59.15.196]:42963 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992127AbdGHPA0V1ONU (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 8 Jul 2017 17:00:26 +0200
Date: Sat, 8 Jul 2017 16:00:09 +0100
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: [PATCH v2 3/4] MIPS16e2: Report ASE presence in /proc/cpuinfo
Message-ID: <alpine.DEB.2.00.1707081545550.3339@tp.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej.Rozycki@imgtec.com>
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
Message-ID: <20170708150009.el0XemKqKL6qubrKEDf2SBI8Im844eNp54UWK_pqbRQ@z>

Only now that both feature determination and unaligned emulation is in 
place add reporting to /proc/cpuinfo, so that the presence of "mips16e2" 
there not only indicates our recognition of the hardware feature, but 
correct unaligned emulation as well.

Signed-off-by: Maciej W. Rozycki <macro@imgtec.com>
---
Changes from v1:

- Clarify in the description what the presence of "mips16e2" in 
  /proc/cpuinfo indicates.

 proc.c |    1 +
 1 file changed, 1 insertion(+)

linux-mips16e2-ase-report.diff
Index: linux-sfr-test/arch/mips/kernel/proc.c
===================================================================
--- linux-sfr-test.orig/arch/mips/kernel/proc.c	2017-05-22 22:42:16.000000000 +0100
+++ linux-sfr-test/arch/mips/kernel/proc.c	2017-05-22 22:56:31.000000000 +0100
@@ -109,6 +109,7 @@ static int show_cpuinfo(struct seq_file 
 
 	seq_printf(m, "ASEs implemented\t:");
 	if (cpu_has_mips16)	seq_printf(m, "%s", " mips16");
+	if (cpu_has_mips16e2)	seq_printf(m, "%s", " mips16e2");
 	if (cpu_has_mdmx)	seq_printf(m, "%s", " mdmx");
 	if (cpu_has_mips3d)	seq_printf(m, "%s", " mips3d");
 	if (cpu_has_smartmips)	seq_printf(m, "%s", " smartmips");
