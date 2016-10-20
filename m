Received: from mailapp01.imgtec.com ([195.59.15.196]:45086 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993030AbcJTU1yBnquK (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 20 Oct 2016 22:27:54 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 2/6] kbuild: Keep .init.setup section through dead code elimination
Date: Thu, 20 Oct 2016 21:27:01 +0100
Message-ID: <20161020202705.3783-3-paul.burton@imgtec.com>
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
Message-ID: <20161020202701.rmjdRSRtZw7k2xqYFl7s2qFMo8_YKpOUQSfK4N_YRYo@z>

With CONFIG_LD_DEAD_CODE_DATA_ELIMINATION we must keep the .init.setup
section or we'll throw away support for kernel parameters.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Nicholas Piggin <npiggin@gmail.com>
---

 include/asm-generic/vmlinux.lds.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index b648d97..06673d6 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -688,7 +688,7 @@
 #define INIT_SETUP(initsetup_align)					\
 		. = ALIGN(initsetup_align);				\
 		VMLINUX_SYMBOL(__setup_start) = .;			\
-		*(.init.setup)						\
+		KEEP(*(.init.setup))					\
 		VMLINUX_SYMBOL(__setup_end) = .;
 
 #define INIT_CALLS_LEVEL(level)						\
-- 
2.10.0
