Received: from mailapp01.imgtec.com ([195.59.15.196]:18505 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992126AbcKGLSiGltSd (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 7 Nov 2016 12:18:38 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 1/7] MIPS: lib: Split lib-y to a line per file
Date: Mon, 7 Nov 2016 11:17:56 +0000
Message-ID: <20161107111802.12071-2-paul.burton@imgtec.com>
In-Reply-To: <20161107111802.12071-1-paul.burton@imgtec.com>
References: <20161107111802.12071-1-paul.burton@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Paul.Burton@imgtec.com>
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
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20161107111756.ZhhDOY6p7rnbO9uVqsPTzRCzZYpDuLiMmqtmzQpbMJ8@z>

Split the lib-y assignment in arch/mips/lib/Makefile to a line per file
such that we can modify the list more easily, with clearer diffs.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 arch/mips/lib/Makefile | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/mips/lib/Makefile b/arch/mips/lib/Makefile
index 0344e57..c0f0d1d 100644
--- a/arch/mips/lib/Makefile
+++ b/arch/mips/lib/Makefile
@@ -2,9 +2,16 @@
 # Makefile for MIPS-specific library files..
 #
 
-lib-y	+= bitops.o csum_partial.o delay.o memcpy.o memset.o \
-	   mips-atomic.o strlen_user.o strncpy_user.o \
-	   strnlen_user.o uncached.o
+lib-y += bitops.o
+lib-y += csum_partial.o
+lib-y += delay.o
+lib-y += memcpy.o
+lib-y += memset.o
+lib-y += mips-atomic.o
+lib-y += strlen_user.o
+lib-y += strncpy_user.o
+lib-y += strnlen_user.o
+lib-y += uncached.o
 
 obj-y			+= iomap.o
 obj-$(CONFIG_PCI)	+= iomap-pci.o
-- 
2.10.2
