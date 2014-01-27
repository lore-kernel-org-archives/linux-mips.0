Received: from multi.imgtec.com ([194.200.65.239]:43665 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6870558AbaA0UYdX6-0J (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 27 Jan 2014 21:24:33 +0100
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 37/58] MIPS: asm: checksum: Add MIPS specific csum_and_copy_from_user function
Date: Mon, 27 Jan 2014 20:19:24 +0000
Message-ID: <1390853985-14246-38-git-send-email-markos.chandras@imgtec.com>
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
Cc: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20140127201924.c5VP-CvhAoX1LFa4FDw6p_Zv0LZeX86XAggrAqS76A4@z>

From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>

A MIPS specific csum_and_copy_from_user function is necessary because
the generic one from include/net/checksum.h will not work for EVA.
This is because the generic one will link to symbols from lib/checksum.c
which are not EVA aware.

Signed-off-by: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/include/asm/checksum.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/mips/include/asm/checksum.h b/arch/mips/include/asm/checksum.h
index f5602c6..3418c51 100644
--- a/arch/mips/include/asm/checksum.h
+++ b/arch/mips/include/asm/checksum.h
@@ -54,6 +54,20 @@ __wsum csum_partial_copy_from_user(const void __user *src, void *dst, int len,
 						     len, sum, err_ptr);
 }
 
+#define _HAVE_ARCH_COPY_AND_CSUM_FROM_USER
+static inline
+__wsum csum_and_copy_from_user(const void __user *src, void *dst,
+			       int len, __wsum sum, int *err_ptr)
+{
+	if (access_ok(VERIFY_READ, src, len))
+		return csum_partial_copy_from_user(src, dst, len, sum,
+						   err_ptr);
+	if (len)
+		*err_ptr = -EFAULT;
+
+	return sum;
+}
+
 /*
  * Copy and checksum to user
  */
-- 
1.8.5.3
