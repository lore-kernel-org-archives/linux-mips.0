Received: from mail1.windriver.com ([147.11.146.13]:36201 "EHLO
        mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007304AbaKRGfGl0UmF (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 18 Nov 2014 07:35:06 +0100
From: <bin.jiang@windriver.com>
Subject: [PATCH] MIPS: get_user: set the parameter @x to zero on error
Date: Tue, 18 Nov 2014 14:34:56 +0800
Message-ID: <1416292496-6149-1-git-send-email-bin.jiang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Bin.Jiang@windriver.com>
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
Cc: bin.jiang@windriver.com, ralf@linux-mips.org
Message-ID: <20141118063456.9cOqzY3eNbubP8u4-zDdMTTEPdgOqKh_M8IZhMwrKoQ@z>

From: Bin Jiang <bin.jiang@windriver.com>

The following compile warning is caused to use uninitialized variables:

fs/compat_ioctl.c: In function 'compat_SyS_ioctl':
arch/mips/include/asm/uaccess.h:451:2: warning: 'length' may be used \
                uninitialized in this function [-Wmaybe-uninitialized]
  __asm__ __volatile__(      \
  ^
fs/compat_ioctl.c:208:6: note: 'length' was declared here
  int length, err;
      ^

In get_user function, the parameter @x is used to store result. If the
function return error, the @x won't be set and cause above warning.

According to the description of get_user function, the parameter @x should
be set to zero on error.

Signed-off-by: Bin Jiang <bin.jiang@windriver.com>
---
 arch/mips/include/asm/uaccess.h |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/uaccess.h b/arch/mips/include/asm/uaccess.h
index a109510..07e9755 100644
--- a/arch/mips/include/asm/uaccess.h
+++ b/arch/mips/include/asm/uaccess.h
@@ -301,7 +301,8 @@ do {									\
 			__get_kernel_common((x), size, __gu_ptr);	\
 		else							\
 			__get_user_common((x), size, __gu_ptr);		\
-	}								\
+	} else								\
+		(x) = (__typeof__(*(ptr)))0;				\
 									\
 	__gu_err;							\
 })
-- 
1.7.10.4
