Received: from mailapp01.imgtec.com ([195.59.15.196]:53378 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993045AbcJTU2WpfWSK (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 20 Oct 2016 22:28:22 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 4/6] kbuild: Keep earlycon table through dead code elimination
Date: Thu, 20 Oct 2016 21:27:03 +0100
Message-ID: <20161020202705.3783-5-paul.burton@imgtec.com>
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
Message-ID: <20161020202703.Kros0pr-ek5WEshIVfctB2bKU0vOkuO4dQDyFiYpk1I@z>

With CONFIG_LD_DEAD_CODE_DATA_ELIMINATION enabled we must ensure that we
keep the earlycon table or we discard all entries leading to no earlycon
devices being found.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Nicholas Piggin <npiggin@gmail.com>
---

 include/asm-generic/vmlinux.lds.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index e710593..abe79e3 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -156,7 +156,7 @@
 #ifdef CONFIG_SERIAL_EARLYCON
 #define EARLYCON_TABLE() STRUCT_ALIGN();			\
 			 VMLINUX_SYMBOL(__earlycon_table) = .;	\
-			 *(__earlycon_table)			\
+			 KEEP(*(__earlycon_table))		\
 			 VMLINUX_SYMBOL(__earlycon_table_end) = .;
 #else
 #define EARLYCON_TABLE()
-- 
2.10.0
