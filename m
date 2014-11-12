Received: from mailapp01.imgtec.com ([195.59.15.196]:22887 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27013480AbaKLJXVpVdb9 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 12 Nov 2014 10:23:21 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id B77CBEE5803FD
        for <linux-mips@linux-mips.org>; Wed, 12 Nov 2014 09:23:14 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH v2 3/3] MIPS: kernel: traps: Dump the PageGrain and Wired registers on MC
Date: Wed, 12 Nov 2014 09:23:11 +0000
Message-ID: <1415784191-6462-1-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1415636404-11979-4-git-send-email-markos.chandras@imgtec.com>
References: <1415636404-11979-4-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20141112092311.EiLehQD6kMjTyBfzdXxA9cPC5fX5ncgBo7u4o2Qsij4@z>

They can be useful to determine how the MMU is configured on a MC
exception.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
Changes since v1:
- Replace pr_info() with pr_err()
---
 arch/mips/kernel/traps.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index bced37c0a188..5b1601819592 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -1385,6 +1385,8 @@ asmlinkage void do_mcheck(struct pt_regs *regs)
 		pr_err("EntryHi : %0*lx\n", field, read_c0_entryhi());
 		pr_err("EntryLo0: %0*lx\n", field, read_c0_entrylo0());
 		pr_err("EntryLo1: %0*lx\n", field, read_c0_entrylo1());
+		pr_err("Wired   : %0x\n", read_c0_wired());
+		pr_err("Pagegrain: %0x\n", read_c0_pagegrain());
 		if (cpu_has_htw) {
 			pr_err("PWField : %0*lx\n", field, read_c0_pwfield());
 			pr_err("PWSize  : %0*lx\n", field, read_c0_pwsize());
-- 
2.1.3
