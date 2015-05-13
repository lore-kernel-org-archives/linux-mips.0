Received: from mailapp01.imgtec.com ([195.59.15.196]:56985 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27013241AbbEMSz0XotuO (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 13 May 2015 20:55:26 +0200
Subject: [PATCH] MIPS64: 48 bit physaddr support in memory maps
From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Date: Wed, 13 May 2015 11:55:19 -0700
Message-ID: <20150513185519.27601.4253.stgit@ubuntu-yegoshin>
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
To: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, ralf@linux-mips.org
Message-ID: <20150513185519.4dEhHHcjri4ZXIIlXr1uYjEZOicSOvJ78M0MMLutTuE@z>

Originally, it was set to 40bits only but I6400 has 48bits of physaddr.

Signed-off-by: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
---
 arch/mips/include/asm/addrspace.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/addrspace.h b/arch/mips/include/asm/addrspace.h
index ba0925c84b75..d54137602ac5 100644
--- a/arch/mips/include/asm/addrspace.h
+++ b/arch/mips/include/asm/addrspace.h
@@ -53,7 +53,7 @@
  */
 #define CPHYSADDR(a)		((_ACAST32_(a)) & 0x1fffffff)
 #define XPHYSADDR(a)		((_ACAST64_(a)) &			\
-				 _CONST64_(0x000000ffffffffff))
+				 _CONST64_(0x0000ffffffffffff))
 
 #ifdef CONFIG_64BIT
 
