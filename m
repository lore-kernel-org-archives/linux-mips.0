Received: from mailapp01.imgtec.com ([195.59.15.196]:11149 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993038AbcJTU1jyy2OK (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 20 Oct 2016 22:27:39 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 1/6] kbuild: Keep device tree tables though dead code elimination
Date: Thu, 20 Oct 2016 21:27:00 +0100
Message-ID: <20161020202705.3783-2-paul.burton@imgtec.com>
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
Message-ID: <20161020202700.pE1-1Sh1eFqzTe4ZQc3YVMipgf0AYaP7EUcFa4Ms-EY@z>

When CONFIG_LD_DEAD_CODE_DATA_ELIMINATION is enabled we must ensure that
we still keep the device tree tables, otherwise we end up unable to
probe drivers on systems that do so using device tree & we throw away
the bulk of those drivers because they cease to be referenced.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Nicholas Piggin <npiggin@gmail.com>
---

 include/asm-generic/vmlinux.lds.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 3074796..b648d97 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -169,8 +169,8 @@
 #define _OF_TABLE_1(name)						\
 	. = ALIGN(8);							\
 	VMLINUX_SYMBOL(__##name##_of_table) = .;			\
-	*(__##name##_of_table)						\
-	*(__##name##_of_table_end)
+	KEEP(*(__##name##_of_table))					\
+	KEEP(*(__##name##_of_table_end))
 
 #define CLKSRC_OF_TABLES()	OF_TABLE(CONFIG_CLKSRC_OF, clksrc)
 #define IRQCHIP_OF_MATCH_TABLE() OF_TABLE(CONFIG_IRQCHIP, irqchip)
-- 
2.10.0
