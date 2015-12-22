Received: from mailapp01.imgtec.com ([195.59.15.196]:12342 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008443AbbLVN452esyV (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 22 Dec 2015 14:56:57 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH] MIPS: ptrace: Drop cp0_tcstatus from regoffset_table[]
Date: Tue, 22 Dec 2015 13:56:39 +0000
Message-ID: <1450792599-3274-1-git-send-email-james.hogan@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <James.Hogan@imgtec.com>
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
Message-ID: <20151222135639.YZ-9Bk0R220N8iouIx1IWEaRkx5ANe_TRV73hPpDJ04@z>

The cp0_tcstatus member of struct pt_regs was removed along with the
rest of SMTC in v3.16, commit b633648c5ad3 ("MIPS: MT: Remove SMTC
support"), however recent uprobes support in v4.3 added back a reference
to it in the regoffset_table[] in ptrace.c. Remove it.

Fixes: 40e084a506eb ("MIPS: Add uprobes support.")
Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---
 arch/mips/kernel/ptrace.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/mips/kernel/ptrace.c b/arch/mips/kernel/ptrace.c
index 4f0ac78d17f1..a5279b2f3198 100644
--- a/arch/mips/kernel/ptrace.c
+++ b/arch/mips/kernel/ptrace.c
@@ -548,9 +548,6 @@ static const struct pt_regs_offset regoffset_table[] = {
 	REG_OFFSET_NAME(c0_badvaddr, cp0_badvaddr),
 	REG_OFFSET_NAME(c0_cause, cp0_cause),
 	REG_OFFSET_NAME(c0_epc, cp0_epc),
-#ifdef CONFIG_MIPS_MT_SMTC
-	REG_OFFSET_NAME(c0_tcstatus, cp0_tcstatus),
-#endif
 #ifdef CONFIG_CPU_CAVIUM_OCTEON
 	REG_OFFSET_NAME(mpl0, mpl[0]),
 	REG_OFFSET_NAME(mpl1, mpl[1]),
-- 
2.4.10
