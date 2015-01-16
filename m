Received: from mailapp01.imgtec.com ([195.59.15.196]:60734 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010531AbbAPKwFS3KFP (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 16 Jan 2015 11:52:05 +0100
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH RFC v2 12/70] MIPS: asm: asmmacro: Replace add instructions with "addui"
Date: Fri, 16 Jan 2015 10:48:51 +0000
Message-ID: <1421405389-15512-13-git-send-email-markos.chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>, "Maciej W. Rozycki" <macro@linux-mips.org>
Message-ID: <20150116104851.-BREGB51jfkULyygs18FYPo0TganCTCOs3_TBoR76cw@z>

The use of "add" instruction for immediate operations can result to
build failures for MIPS R6. This is because, the 'add' is a macro in
binutils and depending on the size of the immediate it can expand to
an 'addi' instruction which has been removed from MIPS R6.
Thus, we will be using the 'addu' macro instead, which also
accepts immediate operands.

Link: http://www.linux-mips.org/archives/linux-mips/2015-01/msg00121.html
Cc: Maciej W. Rozycki <macro@linux-mips.org>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
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
