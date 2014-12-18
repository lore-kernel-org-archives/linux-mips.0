Received: from mailapp01.imgtec.com ([195.59.15.196]:39275 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009134AbaLRPMCG7rUe (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 18 Dec 2014 16:12:02 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 61A1681DBD0B6
        for <linux-mips@linux-mips.org>; Thu, 18 Dec 2014 15:11:53 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH RFC 24/67] MIPS: asm: spinlock: Replace sub instruction with addiu
Date: Thu, 18 Dec 2014 15:09:33 +0000
Message-ID: <1418915416-3196-25-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20141218150933.vLLZNbvvdqEPlg8yvrt_WEJ-we-1s7Bx1fpR_phn68w@z>

sub $reg, imm is not a real MIPS instruction. The assembler replaces
that with 'addi $reg, -imm'. However, addi has been removed from R6,
so we replace the 'sub' instruction with 'addiu' instead.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/include/asm/spinlock.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/spinlock.h b/arch/mips/include/asm/spinlock.h
index f63b3543c1a4..c82fc0eefbec 100644
--- a/arch/mips/include/asm/spinlock.h
+++ b/arch/mips/include/asm/spinlock.h
@@ -277,7 +277,7 @@ static inline void arch_read_unlock(arch_rwlock_t *rw)
 		do {
 			__asm__ __volatile__(
 			"1:	ll	%1, 0(%2)# arch_read_unlock	\n"
-			"	sub	%1, 1				\n"
+			"	addiu	%1, -1				\n"
 			"	sc	%1, 0(%2)			\n"
 			: "+m" (rw->lock), "=&r" (tmp)
 			: "r" (&rw->lock)
-- 
2.2.0
