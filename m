Received: from mailapp01.imgtec.com ([195.59.15.196]:40074 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27013346AbaKLJW1rAblS (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 12 Nov 2014 10:22:27 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id DCFAB982F95D4
        for <linux-mips@linux-mips.org>; Wed, 12 Nov 2014 09:22:19 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH v2 1/3] MIPS: kernel: traps: Replace printk with pr_err for MC exceptions
Date: Wed, 12 Nov 2014 09:22:15 +0000
Message-ID: <1415784135-6358-1-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1415636404-11979-2-git-send-email-markos.chandras@imgtec.com>
References: <1415636404-11979-2-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20141112092215.fwWZaaTC28e4rlH_wEIbZ2-Dlq07E93dxazmRx34G0Q@z>

printk should not be used without a KERN_ facility level

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
Changes since v1:
- Replace pr_info() with pr_err()
---
 arch/mips/kernel/traps.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index 22b19c275044..88075fecf306 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -1380,12 +1380,12 @@ asmlinkage void do_mcheck(struct pt_regs *regs)
 	show_regs(regs);
 
 	if (multi_match) {
-		printk("Index	: %0x\n", read_c0_index());
-		printk("Pagemask: %0x\n", read_c0_pagemask());
-		printk("EntryHi : %0*lx\n", field, read_c0_entryhi());
-		printk("EntryLo0: %0*lx\n", field, read_c0_entrylo0());
-		printk("EntryLo1: %0*lx\n", field, read_c0_entrylo1());
-		printk("\n");
+		pr_err("Index	: %0x\n", read_c0_index());
+		pr_err("Pagemask: %0x\n", read_c0_pagemask());
+		pr_err("EntryHi : %0*lx\n", field, read_c0_entryhi());
+		pr_err("EntryLo0: %0*lx\n", field, read_c0_entrylo0());
+		pr_err("EntryLo1: %0*lx\n", field, read_c0_entrylo1());
+		pr_err("\n");
 		dump_tlb_all();
 	}
 
-- 
2.1.3
