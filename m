Received: from mailapp01.imgtec.com ([195.59.15.196]:8188 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011886AbbD0XfjT3bRK (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 28 Apr 2015 01:35:39 +0200
Subject: [PATCH] MIPS: R6: memcpy bugfix - zero length overwrites memory
From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Date: Mon, 27 Apr 2015 16:35:29 -0700
Message-ID: <20150427233529.4423.20839.stgit@ubuntu-yegoshin>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-Path: <Leonid.Yegoshin@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org, markos.chandras@imgtec.com, ralf@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20150427233529.yoNqablwAhliJroOSKl4KHdWC5g9RcKSiz2TapXJNLk@z>

MIPS R6 version of memcpy has bug - then length to copy is zero
and addresses are not aligned then it can overwrite a whole memory.

Signed-off-by: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
---
 arch/mips/lib/memcpy.S |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/lib/memcpy.S b/arch/mips/lib/memcpy.S
index 9245e1705e69..7e0250f3aec8 100644
--- a/arch/mips/lib/memcpy.S
+++ b/arch/mips/lib/memcpy.S
@@ -514,6 +514,8 @@
 
 #ifdef CONFIG_CPU_MIPSR6
 .Lcopy_unaligned_bytes\@:
+	beqz    len, .Ldone\@
+	 nop
 1:
 	COPY_BYTE(0)
 	COPY_BYTE(1)
