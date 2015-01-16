Received: from mailapp01.imgtec.com ([195.59.15.196]:44694 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010689AbbAPKxOZdx2n (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 16 Jan 2015 11:53:14 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 2C32D9B23A023
        for <linux-mips@linux-mips.org>; Fri, 16 Jan 2015 10:53:06 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH RFC v2 37/70] MIPS: kernel: syscall: Set the appropriate ISA level for MIPS R6
Date: Fri, 16 Jan 2015 10:49:16 +0000
Message-ID: <1421405389-15512-38-git-send-email-markos.chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>, Matthew Fortune <Matthew.Fortune@imgtec.com>
Message-ID: <20150116104916.r91Kgm3q-ZBxeVQUUPlESuLwIKyysxgkQRHQhfvhTuc@z>

MIPS R6 changed the opcodes for LL/SC instructions so we need to set
the appropriate ISA level.

Cc: Matthew Fortune <Matthew.Fortune@imgtec.com>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/kernel/syscall.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kernel/syscall.c b/arch/mips/kernel/syscall.c
index 604b558809c4..53a7ef9a8f32 100644
--- a/arch/mips/kernel/syscall.c
+++ b/arch/mips/kernel/syscall.c
@@ -136,7 +136,7 @@ static inline int mips_atomic_set(unsigned long addr, unsigned long new)
 		: "memory");
 	} else if (cpu_has_llsc) {
 		__asm__ __volatile__ (
-		"	.set	arch=r4000				\n"
+		"	.set	"MIPS_ISA_ARCH_LEVEL"			\n"
 		"	li	%[err], 0				\n"
 		"1:	ll	%[old], (%[addr])			\n"
 		"	move	%[tmp], %[new]				\n"
-- 
2.2.1
