Received: from mailapp01.imgtec.com ([195.59.15.196]:51444 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009154AbaLRPLhIgh9F (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 18 Dec 2014 16:11:37 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id DDE452FD65ECF
        for <linux-mips@linux-mips.org>; Thu, 18 Dec 2014 15:11:28 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH RFC 12/67] MIPS: asm: asmmacro: Replace add instructions with "addui"
Date: Thu, 18 Dec 2014 15:09:21 +0000
Message-ID: <1418915416-3196-13-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1418915416-3196-1-git-send-email-markos.chandras@imgtec.com>
References: <1418915416-3196-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20141218150921.Rb39p_ANumAg5l6CD-nW3DxXJx3PaqAKwpy50pthaSo@z>

The use of "add" instruction for immediate operations is wrong and
relies to gas being smart enough to notice that and replace it with
either addi or addui. However, MIPS R6 removed the addi instruction
so, fix this problem properly by using the correct instruction
directly.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/include/asm/asmmacro.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/asmmacro.h b/arch/mips/include/asm/asmmacro.h
index fe08084f5adb..55c07c40c199 100644
--- a/arch/mips/include/asm/asmmacro.h
+++ b/arch/mips/include/asm/asmmacro.h
@@ -304,7 +304,7 @@
 	.set	push
 	.set	noat
 	SET_HARDFLOAT
-	add	$1, \base, \off
+	addiu	$1, \base, \off
 	.word	LDD_MSA_INSN | (\wd << 6)
 	.set	pop
 	.endm
@@ -313,7 +313,7 @@
 	.set	push
 	.set	noat
 	SET_HARDFLOAT
-	add	$1, \base, \off
+	addiu	$1, \base, \off
 	.word	STD_MSA_INSN | (\wd << 6)
 	.set	pop
 	.endm
-- 
2.2.0
