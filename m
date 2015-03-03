Received: from mailapp01.imgtec.com ([195.59.15.196]:40264 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011606AbbCCStxQw6cg (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 3 Mar 2015 19:49:53 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 6A512E5403E9D
        for <linux-mips@linux-mips.org>; Tue,  3 Mar 2015 18:49:44 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 4/4] MIPS; asm: bitops: Add missing ISA levels for MIPS R6
Date: Tue, 3 Mar 2015 18:48:50 +0000
Message-ID: <1425408530-21613-5-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1425408530-21613-1-git-send-email-markos.chandras@imgtec.com>
References: <1425408530-21613-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20150303184850.nJHF1YBzpuyjPT-lY07QmDzjSzEReQG-PWZjtE7Hptw@z>

Commit 87a927eff4da("MIPS: asm: bitops: update ISA constraints for
MIPS R6 support") replaced hardcoded ISA levels in order to support
MIPS R6 new opcodes but it missed a few cases.

Fixes: 87a927eff4da("MIPS: asm: bitops: update ISA constraints for MIPS R6 support")
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/include/asm/bitops.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/include/asm/bitops.h b/arch/mips/include/asm/bitops.h
index 9f935f6aa996..077bc8b9dcc5 100644
--- a/arch/mips/include/asm/bitops.h
+++ b/arch/mips/include/asm/bitops.h
@@ -85,6 +85,7 @@ static inline void set_bit(unsigned long nr, volatile unsigned long *addr)
 	} else if (kernel_uses_llsc && __builtin_constant_p(bit)) {
 		do {
 			__asm__ __volatile__(
+			"	.set	"MIPS_ISA_ARCH_LEVEL"		\n"
 			"	" __LL "%0, %1		# set_bit	\n"
 			"	" __INS "%0, %3, %2, 1			\n"
 			"	" __SC "%0, %1				\n"
@@ -137,6 +138,7 @@ static inline void clear_bit(unsigned long nr, volatile unsigned long *addr)
 	} else if (kernel_uses_llsc && __builtin_constant_p(bit)) {
 		do {
 			__asm__ __volatile__(
+			"	.set	"MIPS_ISA_ARCH_LEVEL"		\n"
 			"	" __LL "%0, %1		# clear_bit	\n"
 			"	" __INS "%0, $0, %2, 1			\n"
 			"	" __SC "%0, %1				\n"
@@ -365,6 +367,7 @@ static inline int test_and_clear_bit(unsigned long nr,
 
 		do {
 			__asm__ __volatile__(
+			"	.set	"MIPS_ISA_ARCH_LEVEL"		\n"
 			"	" __LL	"%0, %1 # test_and_clear_bit	\n"
 			"	" __EXT "%2, %0, %3, 1			\n"
 			"	" __INS "%0, $0, %3, 1			\n"
-- 
2.3.1
