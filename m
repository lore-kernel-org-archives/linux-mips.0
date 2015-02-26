Received: from mailapp01.imgtec.com ([195.59.15.196]:29820 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007218AbbBZLL5ni047 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 26 Feb 2015 12:11:57 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 8CC1FAB4C02C3
        for <linux-mips@linux-mips.org>; Thu, 26 Feb 2015 11:11:50 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH] MIPS: asm: elf: Set O32 default FPU flags
Date: Thu, 26 Feb 2015 11:11:30 +0000
Message-ID: <1424949090-20682-1-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <6D39441BF12EF246A7ABCE6654B0235320FBCA7C@LEMAIL01.le.imgtec.org>
References: <6D39441BF12EF246A7ABCE6654B0235320FBCA7C@LEMAIL01.le.imgtec.org>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>, Matthew Fortune <Matthew.Fortune@imgtec.com>, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20150226111130.FjZbl1KpsGjNMXIWwjyL049WqIb9p_pKEWRIbVvI5X0@z>

Set good default FPU flags (FR0) for O32 binaries similar to what the
kernel does for the N64/N32 ones. This also fixes a regression
introduced in commit 46490b572544 ("MIPS: kernel: elf: Improve the
overall ABI and FPU mode checks") when MIPS_O32_FP64_SUPPORT is
disabled. In that case, the mips_set_personality_fp() did not set the
FPU mode at all because it assumed that the FPU mode was already set
properly. That led to O32 userland problems.

Cc: Matthew Fortune <Matthew.Fortune@imgtec.com>
Cc: Paul Burton <paul.burton@imgtec.com>
Reported-by: Mans Rullgard <mans@mansr.com>
Fixes: 46490b572544 ("MIPS: kernel: elf: Improve the overall ABI and FPU mode checks")
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/include/asm/elf.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/mips/include/asm/elf.h b/arch/mips/include/asm/elf.h
index 535f196ffe02..694925a26924 100644
--- a/arch/mips/include/asm/elf.h
+++ b/arch/mips/include/asm/elf.h
@@ -294,6 +294,9 @@ do {									\
 	if (personality(current->personality) != PER_LINUX)		\
 		set_personality(PER_LINUX);				\
 									\
+	clear_thread_flag(TIF_HYBRID_FPREGS);				\
+	set_thread_flag(TIF_32BIT_FPREGS);				\
+									\
 	mips_set_personality_fp(state);					\
 									\
 	current->thread.abi = &mips_abi;				\
@@ -319,6 +322,8 @@ do {									\
 	do {								\
 		set_thread_flag(TIF_32BIT_REGS);			\
 		set_thread_flag(TIF_32BIT_ADDR);			\
+		clear_thread_flag(TIF_HYBRID_FPREGS);			\
+		set_thread_flag(TIF_32BIT_FPREGS);			\
 									\
 		mips_set_personality_fp(state);				\
 									\
-- 
2.3.0
