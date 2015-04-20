Received: from mailapp01.imgtec.com ([195.59.15.196]:41762 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011046AbbDTJymuEsVi (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 20 Apr 2015 11:54:42 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id ADD14115CA779
        for <linux-mips@linux-mips.org>; Mon, 20 Apr 2015 10:54:36 +0100 (IST)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH] MIPS: asm: spinlock: Adjust arch_spin_lock back-off time
Date: Mon, 20 Apr 2015 10:54:34 +0100
Message-ID: <1429523674-4335-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20150420095434._RrQeH0FYYNyhhO9P9AlF2u5ysMo2U6LFHWYgOk0GLQ@z>

Make it similar to the trylock and R10000_LLSC_WAR cases.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
I can't find a reference on why this was different compared to the other
cases so I presume it was just an overlook in commit
2a31b03335e570dce5fdd082e0d71d48b2cb4290
---
 arch/mips/include/asm/spinlock.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/spinlock.h b/arch/mips/include/asm/spinlock.h
index 1fca2e0793dc..cc771a21899d 100644
--- a/arch/mips/include/asm/spinlock.h
+++ b/arch/mips/include/asm/spinlock.h
@@ -109,7 +109,7 @@ static inline void arch_spin_lock(arch_spinlock_t *lock)
 		"	 subu	%[ticket], %[my_ticket], %[ticket]	\n"
 		"2:							\n"
 		"	.subsection 2					\n"
-		"4:	andi	%[ticket], %[ticket], 0x1fff		\n"
+		"4:	andi	%[ticket], %[ticket], 0xffff		\n"
 		"	sll	%[ticket], 5				\n"
 		"							\n"
 		"6:	bnez	%[ticket], 6b				\n"
-- 
2.3.5
