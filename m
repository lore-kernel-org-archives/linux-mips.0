Received: from mailapp01.imgtec.com ([195.59.15.196]:23964 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6842557AbaGXLKVCyKwE (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 24 Jul 2014 13:10:21 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id F0D434B4BC0B3
        for <linux-mips@linux-mips.org>; Thu, 24 Jul 2014 12:10:11 +0100 (IST)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 1/2] MIPS: syscall: Fix AUDIT value for O32 processes on MIPS64
Date: Thu, 24 Jul 2014 12:10:01 +0100
Message-ID: <1406200202-10104-2-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1406200202-10104-1-git-send-email-markos.chandras@imgtec.com>
References: <1406200202-10104-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20140724111001.oGgwgImQXwjPq6hPU_FlflCwmaRx1oeOIBxoHDgvFbo@z>

On MIPS64, O32 processes set both TIF_32BIT_ADDR and
TIF_32BIT_REGS so the previous condition treated O32 applications
as N32 when evaluating seccomp filters. Fix the condition to check
both TIF_32BIT_{REGS, ADDR} for the N32 AUDIT flag.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/include/asm/syscall.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/mips/include/asm/syscall.h b/arch/mips/include/asm/syscall.h
index 17960fe7a8ce..cdf68b33bd65 100644
--- a/arch/mips/include/asm/syscall.h
+++ b/arch/mips/include/asm/syscall.h
@@ -131,10 +131,12 @@ static inline int syscall_get_arch(void)
 {
 	int arch = EM_MIPS;
 #ifdef CONFIG_64BIT
-	if (!test_thread_flag(TIF_32BIT_REGS))
+	if (!test_thread_flag(TIF_32BIT_REGS)) {
 		arch |= __AUDIT_ARCH_64BIT;
-	if (test_thread_flag(TIF_32BIT_ADDR))
-		arch |= __AUDIT_ARCH_CONVENTION_MIPS64_N32;
+		/* N32 sets only TIF_32BIT_ADDR */
+		if (test_thread_flag(TIF_32BIT_ADDR))
+			arch |= __AUDIT_ARCH_CONVENTION_MIPS64_N32;
+	}
 #endif
 #if defined(__LITTLE_ENDIAN)
 	arch |=  __AUDIT_ARCH_LE;
-- 
2.0.2
