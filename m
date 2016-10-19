Received: from mailapp01.imgtec.com ([195.59.15.196]:18535 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23991978AbcJSNdfcI0H0 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 19 Oct 2016 15:33:35 +0200
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: [PATCH 2/4] MIPS: traps: Fix output of show_stacktrace
Date: Wed, 19 Oct 2016 14:33:21 +0100
Message-ID: <1476884003-17306-3-git-send-email-matt.redfearn@imgtec.com>
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
Cc: linux-mips@linux-mips.org, Matt Redfearn <matt.redfearn@imgtec.com>, "Maciej W. Rozycki" <macro@imgtec.com>, linux-kernel@vger.kernel.org, James Hogan <james.hogan@imgtec.com>, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20161019133321.HlYtz5c5oq2kzKBAKs0mZMPomT3ynEoQlj3fL4YIaik@z>

Since commit 4bcc595ccd80 ("printk: reinstate KERN_CONT for printing
continuation lines") the output from show_stacktrace on MIPS has been
pretty unreadable due to the lack of KERN_CONT markers. Use pr_cont to
provide the appropriate markers & restore the expected output. Also
start a new line with printk such that the presence of timing
information does not interfere with output.

Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
---

 arch/mips/kernel/traps.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index 6ae5ea752d4c..25ce866b2895 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -174,22 +174,24 @@ static void show_stacktrace(struct task_struct *task,
 	printk("Stack :");
 	i = 0;
 	while ((unsigned long) sp & (PAGE_SIZE - 1)) {
-		if (i && ((i % (64 / field)) == 0))
-			printk("\n	 ");
+		if (i && ((i % (64 / field)) == 0)) {
+			pr_cont("\n");
+			printk("       ");
+		}
 		if (i > 39) {
-			printk(" ...");
+			pr_cont(" ...");
 			break;
 		}
 
 		if (__get_user(stackdata, sp++)) {
-			printk(" (Bad stack address)");
+			pr_cont(" (Bad stack address)");
 			break;
 		}
 
-		printk(" %0*lx", field, stackdata);
+		pr_cont(" %0*lx", field, stackdata);
 		i++;
 	}
-	printk("\n");
+	pr_cont("\n");
 	show_backtrace(task, regs);
 }
 
-- 
2.7.4
