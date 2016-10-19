Received: from mailapp01.imgtec.com ([195.59.15.196]:9698 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23991986AbcJSNdhTQ-r0 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 19 Oct 2016 15:33:37 +0200
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: [PATCH 4/4] MIPS: Fix __show_regs() output
Date: Wed, 19 Oct 2016 14:33:23 +0100
Message-ID: <1476884003-17306-5-git-send-email-matt.redfearn@imgtec.com>
In-Reply-To: <1476884003-17306-1-git-send-email-matt.redfearn@imgtec.com>
References: <1476884003-17306-1-git-send-email-matt.redfearn@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Matt.Redfearn@imgtec.com>
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
Cc: linux-mips@linux-mips.org, Paul Burton <paul.burton@imgtec.com>, Matt Redfearn <matt.redfearn@imgtec.com>, "Maciej W. Rozycki" <macro@imgtec.com>, linux-kernel@vger.kernel.org, James Hogan <james.hogan@imgtec.com>
Message-ID: <20161019133323.f1mtfs8YUEW6DL6UbwWNKP-YgcNkPyFEck0ShybjCzo@z>

From: Paul Burton <paul.burton@imgtec.com>

Since commit 4bcc595ccd80 ("printk: reinstate KERN_CONT for printing
continuation lines") the output from __show_regs() on MIPS has been
pretty unreadable due to the lack of KERN_CONT markers. Use pr_cont to
provide the appropriate markers & restore the expected register output.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
---

 arch/mips/kernel/traps.c | 42 +++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index 273b4a419f76..b9a910b208f9 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -262,15 +262,15 @@ static void __show_regs(const struct pt_regs *regs)
 		if ((i % 4) == 0)
 			printk("$%2d   :", i);
 		if (i == 0)
-			printk(" %0*lx", field, 0UL);
+			pr_cont(" %0*lx", field, 0UL);
 		else if (i == 26 || i == 27)
-			printk(" %*s", field, "");
+			pr_cont(" %*s", field, "");
 		else
-			printk(" %0*lx", field, regs->regs[i]);
+			pr_cont(" %0*lx", field, regs->regs[i]);
 
 		i++;
 		if ((i % 4) == 0)
-			printk("\n");
+			pr_cont("\n");
 	}
 
 #ifdef CONFIG_CPU_HAS_SMARTMIPS
@@ -291,46 +291,46 @@ static void __show_regs(const struct pt_regs *regs)
 
 	if (cpu_has_3kex) {
 		if (regs->cp0_status & ST0_KUO)
-			printk("KUo ");
+			pr_cont("KUo ");
 		if (regs->cp0_status & ST0_IEO)
-			printk("IEo ");
+			pr_cont("IEo ");
 		if (regs->cp0_status & ST0_KUP)
-			printk("KUp ");
+			pr_cont("KUp ");
 		if (regs->cp0_status & ST0_IEP)
-			printk("IEp ");
+			pr_cont("IEp ");
 		if (regs->cp0_status & ST0_KUC)
-			printk("KUc ");
+			pr_cont("KUc ");
 		if (regs->cp0_status & ST0_IEC)
-			printk("IEc ");
+			pr_cont("IEc ");
 	} else if (cpu_has_4kex) {
 		if (regs->cp0_status & ST0_KX)
-			printk("KX ");
+			pr_cont("KX ");
 		if (regs->cp0_status & ST0_SX)
-			printk("SX ");
+			pr_cont("SX ");
 		if (regs->cp0_status & ST0_UX)
-			printk("UX ");
+			pr_cont("UX ");
 		switch (regs->cp0_status & ST0_KSU) {
 		case KSU_USER:
-			printk("USER ");
+			pr_cont("USER ");
 			break;
 		case KSU_SUPERVISOR:
-			printk("SUPERVISOR ");
+			pr_cont("SUPERVISOR ");
 			break;
 		case KSU_KERNEL:
-			printk("KERNEL ");
+			pr_cont("KERNEL ");
 			break;
 		default:
-			printk("BAD_MODE ");
+			pr_cont("BAD_MODE ");
 			break;
 		}
 		if (regs->cp0_status & ST0_ERL)
-			printk("ERL ");
+			pr_cont("ERL ");
 		if (regs->cp0_status & ST0_EXL)
-			printk("EXL ");
+			pr_cont("EXL ");
 		if (regs->cp0_status & ST0_IE)
-			printk("IE ");
+			pr_cont("IE ");
 	}
-	printk("\n");
+	pr_cont("\n");
 
 	exccode = (cause & CAUSEF_EXCCODE) >> CAUSEB_EXCCODE;
 	printk("Cause : %08x (ExcCode %02x)\n", cause, exccode);
-- 
2.7.4
