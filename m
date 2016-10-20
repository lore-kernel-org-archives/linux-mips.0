Received: from mailapp01.imgtec.com ([195.59.15.196]:32790 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993043AbcJTU2hMp2vK (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 20 Oct 2016 22:28:37 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 5/6] MIPS: Ensure bss section ends on a long-aligned address
Date: Thu, 20 Oct 2016 21:27:04 +0100
Message-ID: <20161020202705.3783-6-paul.burton@imgtec.com>
In-Reply-To: <20161020202705.3783-1-paul.burton@imgtec.com>
References: <20161020202705.3783-1-paul.burton@imgtec.com>
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
Cc: Ralf Baechle <ralf@linux-mips.org>, Nicholas Piggin <npiggin@gmail.com>, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20161020202704.f2GGX_o-2i7LUXUAwQ9wcH4crC7_idmWimsaArLBxHs@z>

When clearing the .bss section in kernel_entry we do so using LONG_S
instructions, and branch whilst the current write address doesn't equal
the end of the .bss section minus the size of a long integer. The .bss
section always begins at a long-aligned address and we always increment
the write pointer by the size of a long integer - we therefore rely upon
the .bss section ending at a long-aligned address. If this is not the
case then the long-aligned write address can never be equal to the
non-long-aligned end address & we will continue to increment past the
end of the .bss section, attempting to zero the rest of memory.

Despite this requirement that .bss end at a long-aligned address we pass
0 as the end alignment requirement to the BSS_SECTION macro and thus
don't guarantee any particular alignment, allowing us to hit the error
condition described above.

Fix this by instead passing LONGSIZE as the end alignment argument to
the BSS_SECTION macro.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: linux-mips@linux-mips.org
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Nicholas Piggin <npiggin@gmail.com>
---

 arch/mips/kernel/vmlinux.lds.S | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/vmlinux.lds.S b/arch/mips/kernel/vmlinux.lds.S
index d5de675..d1f5401 100644
--- a/arch/mips/kernel/vmlinux.lds.S
+++ b/arch/mips/kernel/vmlinux.lds.S
@@ -1,3 +1,4 @@
+#include <asm/asm.h>
 #include <asm/asm-offsets.h>
 #include <asm/thread_info.h>
 
@@ -182,7 +183,7 @@ SECTIONS
 	 * Force .bss to 64K alignment so that .bss..swapper_pg_dir
 	 * gets that alignment.	 .sbss should be empty, so there will be
 	 * no holes after __init_end. */
-	BSS_SECTION(0, 0x10000, 0)
+	BSS_SECTION(0, 0x10000, LONGSIZE)
 
 	_end = . ;
 
-- 
2.10.0
