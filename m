Received: from mailapp01.imgtec.com ([195.59.15.196]:48858 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009217AbaLRPNlGsgFN (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 18 Dec 2014 16:13:41 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id E17C43F068DF6
        for <linux-mips@linux-mips.org>; Thu, 18 Dec 2014 15:13:32 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH RFC 65/67] MIPS: Malta: malta-int: Set correct asm ISA level
Date: Thu, 18 Dec 2014 15:10:14 +0000
Message-ID: <1418915416-3196-66-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1418915416-3196-1-git-send-email-markos.chandras@imgtec.com>
References: <1418915416-3196-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20141218151014.PngpgVskfuC4tINSz2nst-3idQSeOujA31FxPX0E3TY@z>

MIPS R6 changed the opcode for the clz instruction so we need
to properly instruct the assembler when using inline asm.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/mti-malta/malta-int.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/mti-malta/malta-int.c b/arch/mips/mti-malta/malta-int.c
index e4f43baa8f67..eada9eb0d44e 100644
--- a/arch/mips/mti-malta/malta-int.c
+++ b/arch/mips/mti-malta/malta-int.c
@@ -207,7 +207,7 @@ static inline int clz(unsigned long x)
 {
 	__asm__(
 	"	.set	push					\n"
-	"	.set	mips32					\n"
+	"	.set	"MIPS_ISA_LEVEL"			\n"
 	"	clz	%0, %1					\n"
 	"	.set	pop					\n"
 	: "=r" (x)
-- 
2.2.0
