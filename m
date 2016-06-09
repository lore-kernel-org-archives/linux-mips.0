Received: from mailapp01.imgtec.com ([195.59.15.196]:1377 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27040897AbcFIMNSyR6jv (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 9 Jun 2016 14:13:18 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH] MIPS: Fix MSA asm warnings in control reg accessors
Date: Thu, 9 Jun 2016 13:13:04 +0100
Message-ID: <1465474384-32742-1-git-send-email-james.hogan@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <James.Hogan@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: James Hogan <james.hogan@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, linux-mips@linux-mips.org
Message-ID: <20160609121304.552kwd9w6cIUadedx4EHX0mTJJlN3WRtoxZLdRe2rxM@z>

Building an MSA capable kernel with a toolchain that supports MSA
produces warnings such as this:

  CC      arch/mips/kernel/cpu-probe.o
{standard input}: Assembler messages:
{standard input}:4786: Warning: the `msa' extension requires 64-bit FPRs

This is due to ".set msa" without ".set fp=64" in the inline assembly of
control register accessors, since MSA requires the 64-bit FPU registers
(FR=1). Add the missing fp=64 in these functions to silence the
warnings.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@imgtec.com>
Cc: linux-mips@linux-mips.org
---
 arch/mips/include/asm/msa.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/include/asm/msa.h b/arch/mips/include/asm/msa.h
index ddf496cb2a2a..8967b475ab10 100644
--- a/arch/mips/include/asm/msa.h
+++ b/arch/mips/include/asm/msa.h
@@ -168,6 +168,7 @@ static inline unsigned int read_msa_##name(void)		\
 	unsigned int reg;					\
 	__asm__ __volatile__(					\
 	"	.set	push\n"					\
+	"	.set	fp=64\n"				\
 	"	.set	msa\n"					\
 	"	cfcmsa	%0, $" #cs "\n"				\
 	"	.set	pop\n"					\
@@ -179,6 +180,7 @@ static inline void write_msa_##name(unsigned int val)		\
 {								\
 	__asm__ __volatile__(					\
 	"	.set	push\n"					\
+	"	.set	fp=64\n"				\
 	"	.set	msa\n"					\
 	"	ctcmsa	$" #cs ", %0\n"				\
 	"	.set	pop\n"					\
-- 
2.4.10
