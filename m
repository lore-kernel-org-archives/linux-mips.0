Received: from 19pmail.ess.barracuda.com ([64.235.150.244]:57998 "EHLO
        19pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990430AbdKVLbkdHNI8 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 22 Nov 2017 12:31:40 +0100
From: James Hogan <james.hogan@mips.com>
Subject: [PATCH 5/7] MIPS: XPA: Allow use of $0 (zero) to MTHC0
Date: Wed, 22 Nov 2017 11:30:31 +0000
Message-ID: <2a8639bf9ef2e5d5ea91fcd2ec3bc37cc8413cfb.1511349998.git-series.jhogan@kernel.org>
In-Reply-To: <cover.41391a6cc5670b90bb8e77eadd07c712793eab03.1511349998.git-series.jhogan@kernel.org>
References: <cover.41391a6cc5670b90bb8e77eadd07c712793eab03.1511349998.git-series.jhogan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <James.Hogan@mips.com>
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
Cc: Marcin Nowakowski <marcin.nowakowski@mips.com>, James Hogan <jhogan@kernel.org>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20171122113031.l8_DcCMRE4RczX8V-V26Yv8XJEZgNso1384ABDZXxpI@z>

From: James Hogan <jhogan@kernel.org>

Tweak __writex_32bit_c0_register() to allow the compiler to use $0 (the
zero register) as an input to the mthc0 instruction.

Signed-off-by: James Hogan <jhogan@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---
 arch/mips/include/asm/mipsregs.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
index 02f8ae1fac04..f2b9af887e83 100644
--- a/arch/mips/include/asm/mipsregs.h
+++ b/arch/mips/include/asm/mipsregs.h
@@ -1520,10 +1520,10 @@ do {									\
 	"	.set	push					\n"	\
 	"	.set	mips32r2				\n"	\
 	_ASM_SET_XPA							\
-	"	mthc0	%0, $%1					\n"	\
+	"	mthc0	%z0, $%1				\n"	\
 	"	.set	pop					\n"	\
 	:								\
-	: "r" (value), "i" (register));					\
+	: "Jr" (value), "i" (register));				\
 } while (0)
 
 #define read_c0_index()		__read_32bit_c0_register($0, 0)
-- 
git-series 0.9.1
