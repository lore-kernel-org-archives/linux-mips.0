Received: from mailapp01.imgtec.com ([195.59.15.196]:53791 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993419AbdEaPUJ7GGOT (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 31 May 2017 17:20:09 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 4/4] MIPS: Branch straight to ll in mips_atomic_set()
Date: Wed, 31 May 2017 16:19:50 +0100
Message-ID: <c17c30b035caec45c1de97f4d069ab31fec2067e.1496240182.git-series.james.hogan@imgtec.com>
In-Reply-To: <cover.5633df325dbcbc41dbf9cc60df22b38f7812e73a.1496240182.git-series.james.hogan@imgtec.com>
References: <cover.5633df325dbcbc41dbf9cc60df22b38f7812e73a.1496240182.git-series.james.hogan@imgtec.com>
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
Cc: James Hogan <james.hogan@imgtec.com>, linux-mips@linux-mips.org
Message-ID: <20170531151950.CRQuiBrP5i_gh1iQqBRrvtOyERlC1OZX2Cgqtnj3OGI@z>

Adjust the atomic loop in the MIPS_ATOMIC_SET operation of the sysmips
system call to branch straight back to the linked load rather than
jumping via a different subsection (whose purpose remains a mystery to
me).

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---
 arch/mips/kernel/syscall.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/mips/kernel/syscall.c b/arch/mips/kernel/syscall.c
index ca54ac40252b..6c6bf43d681b 100644
--- a/arch/mips/kernel/syscall.c
+++ b/arch/mips/kernel/syscall.c
@@ -137,13 +137,9 @@ static inline int mips_atomic_set(unsigned long addr, unsigned long new)
 		"	move	%[tmp], %[new]				\n"
 		"2:							\n"
 		user_sc("%[tmp]", "(%[addr])")
-		"	beqz	%[tmp], 4f				\n"
+		"	beqz	%[tmp], 1b				\n"
 		"3:							\n"
 		"	.insn						\n"
-		"	.subsection 2					\n"
-		"4:	b	1b					\n"
-		"	.previous					\n"
-		"							\n"
 		"	.section .fixup,\"ax\"				\n"
 		"5:	li	%[err], %[efault]			\n"
 		"	j	3b					\n"
-- 
git-series 0.8.10
