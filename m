Received: from mailapp01.imgtec.com ([195.59.15.196]:61862 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010957AbbHLJOs2ixvA (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 12 Aug 2015 11:14:48 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 3DF28DE7BF8C2
        for <linux-mips@linux-mips.org>; Wed, 12 Aug 2015 10:14:40 +0100 (IST)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH] MIPS: math-emu: dsemul: Remove unused handle_dsemul function declaration
Date: Wed, 12 Aug 2015 10:14:35 +0100
Message-ID: <1439370875-8660-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20150812091435.Esfq8rklySFGRfq2Y_xE0hLlQMwJuJ7CfoOOXxV2djs@z>

handle_dsemul does not exist and it's not being used in the code at all
so remove its declaration. The deliberate DS emulation exception is
handled by the do_dsemulret C code.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/math-emu/dsemul.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/math-emu/dsemul.c b/arch/mips/math-emu/dsemul.c
index e0b5cc27d78b..cbb36c14b155 100644
--- a/arch/mips/math-emu/dsemul.c
+++ b/arch/mips/math-emu/dsemul.c
@@ -33,7 +33,6 @@ struct emuframe {
 
 int mips_dsemul(struct pt_regs *regs, mips_instruction ir, unsigned long cpc)
 {
-	extern asmlinkage void handle_dsemulret(void);
 	struct emuframe __user *fr;
 	int err;
 
-- 
2.5.0
