Received: from 9pmail.ess.barracuda.com ([64.235.154.211]:41265 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23991025AbeBZRMG0m6sO (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 26 Feb 2018 18:12:06 +0100
From: Matt Redfearn <matt.redfearn@mips.com>
Subject: [PATCH 4/4] MIPS: VDSO: Replace __mips_isa_rev with MIPS_ISA_REV
Date: Mon, 26 Feb 2018 17:02:45 +0000
Message-ID: <1519664565-10955-5-git-send-email-matt.redfearn@mips.com>
In-Reply-To: <1519664565-10955-1-git-send-email-matt.redfearn@mips.com>
References: <1519664565-10955-1-git-send-email-matt.redfearn@mips.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Matt.Redfearn@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: James Hogan <jhogan@kernel.org>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, Paul Burton <paul.burton@mips.com>, Matt Redfearn <matt.redfearn@mips.com>, linux-kernel@vger.kernel.org
Message-ID: <20180226170245.S_A2HX1IMnr-lyQgCiexINxK9K77d-HjX21fvKLHsIo@z>

Remove the need to check that __mips_isa_rev is defined by using the
newly added MIPS_ISA_REV.

Signed-off-by: Matt Redfearn <matt.redfearn@mips.com>
---

 arch/mips/vdso/elf.S | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/mips/vdso/elf.S b/arch/mips/vdso/elf.S
index be37bbb1f061..428a1917afc6 100644
--- a/arch/mips/vdso/elf.S
+++ b/arch/mips/vdso/elf.S
@@ -10,6 +10,8 @@
 
 #include "vdso.h"
 
+#include <asm/isa-rev.h>
+
 #include <linux/elfnote.h>
 #include <linux/version.h>
 
@@ -40,11 +42,7 @@ __mips_abiflags:
 	.byte	__mips		/* isa_level */
 
 	/* isa_rev */
-#ifdef __mips_isa_rev
-	.byte	__mips_isa_rev
-#else
-	.byte	0
-#endif
+	.byte	MIPS_ISA_REV
 
 	/* gpr_size */
 #ifdef __mips64
@@ -54,7 +52,7 @@ __mips_abiflags:
 #endif
 
 	/* cpr1_size */
-#if (defined(__mips_isa_rev) && __mips_isa_rev >= 6) || defined(__mips64)
+#if (MIPS_ISA_REV >= 6) || defined(__mips64)
 	.byte	2		/* AFL_REG_64 */
 #else
 	.byte	1		/* AFL_REG_32 */
-- 
2.7.4
