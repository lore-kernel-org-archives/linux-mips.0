Received: from mailapp01.imgtec.com ([195.59.15.196]:64965 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010642AbbAPKweZsOOq (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 16 Jan 2015 11:52:34 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id D8CACD38A0AD7
        for <linux-mips@linux-mips.org>; Fri, 16 Jan 2015 10:52:23 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH RFC v2 24/70] MIPS: asm: spinlock: Replace sub instruction with addiu
Date: Fri, 16 Jan 2015 10:49:03 +0000
Message-ID: <1421405389-15512-25-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1421405389-15512-1-git-send-email-markos.chandras@imgtec.com>
References: <1421405389-15512-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20150116104903.PPTbiuppkElcD-XL73f9AitOZge8_APotadBD7vyU44@z>

sub $reg, imm is not a real MIPS instruction. The assembler replaces
that with 'addi $reg, -imm'. However, addi has been removed from R6,
so we replace the 'sub' instruction with 'addiu' instead.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/include/asm/spinlock.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/spinlock.h b/arch/mips/include/asm/spinlock.h
index c6d06d383ef9..500050d3bda6 100644
--- a/arch/mips/include/asm/spinlock.h
+++ b/arch/mips/include/asm/spinlock.h
@@ -276,7 +276,7 @@ static inline void arch_read_unlock(arch_rwlock_t *rw)
 		do {
 			__asm__ __volatile__(
 			"1:	ll	%1, %2	# arch_read_unlock	\n"
-			"	sub	%1, 1				\n"
+			"	addiu	%1, -1				\n"
 			"	sc	%1, %0				\n"
 			: "=" GCC_OFF12_ASM() (rw->lock), "=&r" (tmp)
 			: GCC_OFF12_ASM() (rw->lock)
-- 
2.2.1
