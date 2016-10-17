Received: from mailapp02.imgtec.com ([217.156.133.132]:39692 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23990864AbcJQO4qIaAh4 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 17 Oct 2016 16:56:46 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH] MIPS: Use generic asm/unaligned.h
Date: Mon, 17 Oct 2016 15:56:21 +0100
Message-ID: <20161017145621.21415-1-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20161017145621.qQkkClKaQcHuow_LzHkHYeuND9pKkbVIWLbExYn1wn8@z>

The MIPS-specific asm/unaligned.h provides nothing that the generic
version doesn't - it simply uses MIPS-specific endianness macros in
place of generic ones & lacks support for
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS. Remove it & switch to using the
generic version to remove duplication.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: linux-mips@linux-mips.org
Cc: Ralf Baechle <ralf@linux-mips.org>
---

 arch/mips/include/asm/Kbuild      |  1 +
 arch/mips/include/asm/unaligned.h | 28 ----------------------------
 2 files changed, 1 insertion(+), 28 deletions(-)
 delete mode 100644 arch/mips/include/asm/unaligned.h

diff --git a/arch/mips/include/asm/Kbuild b/arch/mips/include/asm/Kbuild
index 9740066..96b5be5 100644
--- a/arch/mips/include/asm/Kbuild
+++ b/arch/mips/include/asm/Kbuild
@@ -17,6 +17,7 @@ generic-y += sections.h
 generic-y += segment.h
 generic-y += serial.h
 generic-y += trace_clock.h
+generic-y += unaligned.h
 generic-y += user.h
 generic-y += word-at-a-time.h
 generic-y += xor.h
diff --git a/arch/mips/include/asm/unaligned.h b/arch/mips/include/asm/unaligned.h
deleted file mode 100644
index 42f66c3..0000000
--- a/arch/mips/include/asm/unaligned.h
+++ /dev/null
@@ -1,28 +0,0 @@
-/*
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file "COPYING" in the main directory of this archive
- * for more details.
- *
- * Copyright (C) 2007 Ralf Baechle (ralf@linux-mips.org)
- */
-#ifndef _ASM_MIPS_UNALIGNED_H
-#define _ASM_MIPS_UNALIGNED_H
-
-#include <linux/compiler.h>
-#if defined(__MIPSEB__)
-# include <linux/unaligned/be_struct.h>
-# include <linux/unaligned/le_byteshift.h>
-# define get_unaligned	__get_unaligned_be
-# define put_unaligned	__put_unaligned_be
-#elif defined(__MIPSEL__)
-# include <linux/unaligned/le_struct.h>
-# include <linux/unaligned/be_byteshift.h>
-# define get_unaligned	__get_unaligned_le
-# define put_unaligned	__put_unaligned_le
-#else
-#  error "MIPS, but neither __MIPSEB__, nor __MIPSEL__???"
-#endif
-
-# include <linux/unaligned/generic.h>
-
-#endif /* _ASM_MIPS_UNALIGNED_H */
-- 
2.10.0
