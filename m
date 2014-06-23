Received: from mailapp01.imgtec.com ([195.59.15.196]:56327 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6859939AbaFWJjaYOv76 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 23 Jun 2014 11:39:30 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 18900FB2E8B0F
        for <linux-mips@linux-mips.org>; Mon, 23 Jun 2014 10:39:22 +0100 (IST)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 03/17] MIPS: mm: uasm: Fix lh micro-assembler instruction
Date: Mon, 23 Jun 2014 10:38:46 +0100
Message-ID: <1403516340-22997-4-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1403516340-22997-1-git-send-email-markos.chandras@imgtec.com>
References: <1403516340-22997-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20140623093846.Uv3CwQyYHbgc8jaBRZD4tiEye2CH0vllmD-iRoxkbys@z>

Commit d6b3314b49e12e8c349deb4ca28e7028db00728f
"MIPS: uasm: Add lh uam instruction"

added the 'lh' micro-assembler instruction but it used the 'lw' opcode
for it. Fix it by using the correct 'lh' opcode.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/mm/uasm-mips.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/mm/uasm-mips.c b/arch/mips/mm/uasm-mips.c
index 4535a9d19ea5..6708a2dbf934 100644
--- a/arch/mips/mm/uasm-mips.c
+++ b/arch/mips/mm/uasm-mips.c
@@ -89,7 +89,7 @@ static struct insn insn_table[] = {
 	{ insn_lb, M(lb_op, 0, 0, 0, 0, 0), RS | RT | SIMM },
 	{ insn_ld,  M(ld_op, 0, 0, 0, 0, 0),  RS | RT | SIMM },
 	{ insn_ldx, M(spec3_op, 0, 0, 0, ldx_op, lx_op), RS | RT | RD },
-	{ insn_lh,  M(lw_op, 0, 0, 0, 0, 0),  RS | RT | SIMM },
+	{ insn_lh,  M(lh_op, 0, 0, 0, 0, 0),  RS | RT | SIMM },
 	{ insn_lld,  M(lld_op, 0, 0, 0, 0, 0),	RS | RT | SIMM },
 	{ insn_ll,  M(ll_op, 0, 0, 0, 0, 0),  RS | RT | SIMM },
 	{ insn_lui,  M(lui_op, 0, 0, 0, 0, 0),	RT | SIMM },
-- 
2.0.0
