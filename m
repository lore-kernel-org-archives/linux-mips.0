Received: from multi.imgtec.com ([194.200.65.239]:43572 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6827335AbaA0UVgURqXg (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 27 Jan 2014 21:21:36 +0100
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 10/58] MIPS: lib: strnlen_user: Use macro to build the strnlen_user symbol
Date: Mon, 27 Jan 2014 20:18:57 +0000
Message-ID: <1390853985-14246-11-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1390853985-14246-1-git-send-email-markos.chandras@imgtec.com>
References: <1390853985-14246-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20140127201857.JEVGccXuWUr7NnKEYOC-0qvQNiGs81idj_vSxRHJGvA@z>

Build the __strnlen_user symbol using a macro. In EVA mode we will
need to use similar code to do the userspace load operations so
it is better if we use a macro to avoid code duplications.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/lib/strnlen_user.S | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/mips/lib/strnlen_user.S b/arch/mips/lib/strnlen_user.S
index fcacea5..4422160 100644
--- a/arch/mips/lib/strnlen_user.S
+++ b/arch/mips/lib/strnlen_user.S
@@ -25,22 +25,26 @@
  *	 bytes.	 There's nothing secret there.	On 64-bit accessing beyond
  *	 the maximum is a tad hairier ...
  */
-LEAF(__strnlen_user_asm)
+	.macro __BUILD_STRNLEN_ASM func
+LEAF(__strnlen_\func\()_asm)
 	LONG_L		v0, TI_ADDR_LIMIT($28)	# pointer ok?
 	and		v0, a0
-	bnez		v0, .Lfault
+	bnez		v0, .Lfault\@
 
-FEXPORT(__strnlen_user_nocheck_asm)
+FEXPORT(__strnlen_\func\()_nocheck_asm)
 	move		v0, a0
 	PTR_ADDU	a1, a0			# stop pointer
 1:	beq		v0, a1, 1f		# limit reached?
-	EX(lb, t0, (v0), .Lfault)
+	EX(lb, t0, (v0), .Lfault\@)
 	PTR_ADDIU	v0, 1
 	bnez		t0, 1b
 1:	PTR_SUBU	v0, a0
 	jr		ra
-	END(__strnlen_user_asm)
+	END(__strnlen_\func\()_asm)
 
-.Lfault:
+.Lfault\@:
 	move		v0, zero
 	jr		ra
+	.endm
+
+__BUILD_STRNLEN_ASM user
-- 
1.8.5.3
