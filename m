Received: from mailapp01.imgtec.com ([195.59.15.196]:33788 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011524AbbAUP0qAY7v5 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 21 Jan 2015 16:26:46 +0100
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH] MIPS: asm: asmmacro: Replace "add" instructions with "addu"
Date: Wed, 21 Jan 2015 15:26:23 +0000
Message-ID: <1421853983-28858-1-git-send-email-markos.chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, "Maciej W. Rozycki" <macro@linux-mips.org>, stable@vger.kernel.org
Message-ID: <20150121152623.Tu7brzdOPy8Y6e0BkNBRs51tLUFhpZh1SQOuwTZDtD0@z>

The "add" instruction is actually a macro in binutils and depending on
the size of the immediate it can expand to an "addi" instruction.
However, the "addi" instruction traps on overflows which is not
something we want on address calculation.

Link: http://www.linux-mips.org/archives/linux-mips/2015-01/msg00121.html
Cc: Paul Burton <paul.burton@imgtec.com>
Cc: Maciej W. Rozycki <macro@linux-mips.org>
Cc: <stable@vger.kernel.org> # v3.15+
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
Moving this out of the R6 patchset as requested by Maciej
---
 arch/mips/include/asm/asmmacro.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/asmmacro.h b/arch/mips/include/asm/asmmacro.h
index fe08084f5adb..42b90c9fd756 100644
--- a/arch/mips/include/asm/asmmacro.h
+++ b/arch/mips/include/asm/asmmacro.h
@@ -304,7 +304,7 @@
 	.set	push
 	.set	noat
 	SET_HARDFLOAT
-	add	$1, \base, \off
+	addu	$1, \base, \off
 	.word	LDD_MSA_INSN | (\wd << 6)
 	.set	pop
 	.endm
@@ -313,7 +313,7 @@
 	.set	push
 	.set	noat
 	SET_HARDFLOAT
-	add	$1, \base, \off
+	addu	$1, \base, \off
 	.word	STD_MSA_INSN | (\wd << 6)
 	.set	pop
 	.endm
-- 
2.2.1
