Received: from mailapp01.imgtec.com ([195.59.15.196]:28744 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27013242AbaKJQUSZwqvF (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 10 Nov 2014 17:20:18 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id F3E9D2DF84B84
        for <linux-mips@linux-mips.org>; Mon, 10 Nov 2014 16:20:09 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 1/3] MIPS: kernel: traps: Replace printk with pr_info for MC exceptions
Date: Mon, 10 Nov 2014 16:20:02 +0000
Message-ID: <1415636404-11979-2-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1415636404-11979-1-git-send-email-markos.chandras@imgtec.com>
References: <1415636404-11979-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20141110162002.653-wR4a6BciC-vBab2Yzhv_Ty4hsxwGyPN-UDy1Sb8@z>

printk should not be used without a KERN_ facility level

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/kernel/traps.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index 22b19c275044..51fa5c3aa4fe 100644
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
+		pr_info("Index	: %0x\n", read_c0_index());
+		pr_info("Pagemask: %0x\n", read_c0_pagemask());
+		pr_info("EntryHi : %0*lx\n", field, read_c0_entryhi());
+		pr_info("EntryLo0: %0*lx\n", field, read_c0_entrylo0());
+		pr_info("EntryLo1: %0*lx\n", field, read_c0_entrylo1());
+		pr_info("\n");
 		dump_tlb_all();
 	}
 
-- 
2.1.3
