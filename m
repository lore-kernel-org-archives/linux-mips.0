Received: from mailapp01.imgtec.com ([195.59.15.196]:24165 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009187AbaLRPMo2-xzZ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 18 Dec 2014 16:12:44 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 22A6554393834
        for <linux-mips@linux-mips.org>; Thu, 18 Dec 2014 15:12:36 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH RFC 37/67] MIPS: lib: memcpy: Add MIPS R6 support
Date: Thu, 18 Dec 2014 15:09:46 +0000
Message-ID: <1418915416-3196-38-git-send-email-markos.chandras@imgtec.com>
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
Cc: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20141218150946.HbAOkR8vccoc0yDFHhY4Xp-xYc8IaZlhlQN7PH0YIY8@z>

From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>

MIPS R6 does not support the unaligned load and store instructions
so we add a special MIPS R6 case to copy one byte at a time if we
need to read/write to unaligned memory addresses.

Signed-off-by: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/lib/memcpy.S | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/mips/lib/memcpy.S b/arch/mips/lib/memcpy.S
index 5d3238af9b5c..9245e1705e69 100644
--- a/arch/mips/lib/memcpy.S
+++ b/arch/mips/lib/memcpy.S
@@ -293,9 +293,14 @@
 	 and	t0, src, ADDRMASK
 	PREFS(	0, 2*32(src) )
 	PREFD(	1, 2*32(dst) )
+#ifndef CONFIG_CPU_MIPSR6
 	bnez	t1, .Ldst_unaligned\@
 	 nop
 	bnez	t0, .Lsrc_unaligned_dst_aligned\@
+#else
+	or	t0, t0, t1
+	bnez	t0, .Lcopy_unaligned_bytes\@
+#endif
 	/*
 	 * use delay slot for fall-through
 	 * src and dst are aligned; need to compute rem
@@ -376,6 +381,7 @@
 	bne	rem, len, 1b
 	.set	noreorder
 
+#ifndef CONFIG_CPU_MIPSR6
 	/*
 	 * src and dst are aligned, need to copy rem bytes (rem < NBYTES)
 	 * A loop would do only a byte at a time with possible branch
@@ -477,6 +483,7 @@
 	bne	len, rem, 1b
 	.set	noreorder
 
+#endif /* !CONFIG_CPU_MIPSR6 */
 .Lcopy_bytes_checklen\@:
 	beqz	len, .Ldone\@
 	 nop
@@ -504,6 +511,22 @@
 .Ldone\@:
 	jr	ra
 	 nop
+
+#ifdef CONFIG_CPU_MIPSR6
+.Lcopy_unaligned_bytes\@:
+1:
+	COPY_BYTE(0)
+	COPY_BYTE(1)
+	COPY_BYTE(2)
+	COPY_BYTE(3)
+	COPY_BYTE(4)
+	COPY_BYTE(5)
+	COPY_BYTE(6)
+	COPY_BYTE(7)
+	ADD	src, src, 8
+	b	1b
+	 ADD	dst, dst, 8
+#endif /* CONFIG_CPU_MIPSR6 */
 	.if __memcpy == 1
 	END(memcpy)
 	.set __memcpy, 0
-- 
2.2.0
