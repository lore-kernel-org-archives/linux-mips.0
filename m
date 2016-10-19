Received: from mailapp01.imgtec.com ([195.59.15.196]:48304 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23991984AbcJSNdgOQf70 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 19 Oct 2016 15:33:36 +0200
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: [PATCH 3/4] MIPS: traps: Fix output of show_code
Date: Wed, 19 Oct 2016 14:33:22 +0100
Message-ID: <1476884003-17306-4-git-send-email-matt.redfearn@imgtec.com>
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
Message-ID: <20161019133322.yoEd80U8PtYKIH9teVH4XSi76MqBwD18b38bIdghHFw@z>

Since commit 4bcc595ccd80 ("printk: reinstate KERN_CONT for printing
continuation lines") the output from show_code on MIPS has been
pretty unreadable due to the lack of KERN_CONT markers. Use pr_cont to
provide the appropriate markers & restore the expected output.

Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
---

 arch/mips/kernel/traps.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index 25ce866b2895..273b4a419f76 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -231,18 +231,19 @@ static void show_code(unsigned int __user *pc)
 	long i;
 	unsigned short __user *pc16 = NULL;
 
-	printk("\nCode:");
+	printk("Code:");
 
 	if ((unsigned long)pc & 1)
 		pc16 = (unsigned short __user *)((unsigned long)pc & ~1);
 	for(i = -3 ; i < 6 ; i++) {
 		unsigned int insn;
 		if (pc16 ? __get_user(insn, pc16 + i) : __get_user(insn, pc + i)) {
-			printk(" (Bad address in epc)\n");
+			pr_cont(" (Bad address in epc)\n");
 			break;
 		}
-		printk("%c%0*x%c", (i?' ':'<'), pc16 ? 4 : 8, insn, (i?' ':'>'));
+		pr_cont("%c%0*x%c", (i?' ':'<'), pc16 ? 4 : 8, insn, (i?' ':'>'));
 	}
+	pr_cont("\n");
 }
 
 static void __show_regs(const struct pt_regs *regs)
-- 
2.7.4
