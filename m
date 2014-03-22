Received: from mail-pb0-f45.google.com ([209.85.160.45]:48340 "EHLO
        mail-pb0-f45.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6816015AbaCVJWomr-qp (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 22 Mar 2014 10:22:44 +0100
From: Huacai Chen <chenhc@lemote.com>
Subject: [PATCH] MIPS: Hibernate: flush TLB entries in swsusp_arch_resume()
Date: Sat, 22 Mar 2014 17:21:44 +0800
Message-ID: <1395480105-24622-1-git-send-email-chenhc@lemote.com>
Return-Path: <chenhuacai@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: John Crispin <john@phrozen.org>, "Steven J. Hill" <Steven.Hill@imgtec.com>, Aurelien Jarno <aurelien@aurel32.net>, linux-mips@linux-mips.org, Fuxin Zhang <zhangfx@lemote.com>, Zhangjin Wu <wuzhangjin@gmail.com>, Huacai Chen <chenhc@lemote.com>, stable@vger.kernel.org
Message-ID: <20140322092144.DGvJI7F6LRocbVF8bkOxRfzibLe7H1hXE8lBR4hJ124@z>

The original MIPS hibernate code flushes cache and TLB entries in
swsusp_arch_resume(). But they are removed in Commit 44eeab67416711
(MIPS: Hibernation: Remove SMP TLB and cacheflushing code.). A cross-
CPU flush is surely unnecessary because all but the local CPU have
already been disabled. But a local flush (at least the TLB flush) is
needed. When we do hibernation on Loongson-3 with an E1000E NIC, it is
very easy to produce a kernel panic (kernel page fault, or unaligned
access). The root cause is E1000E driver use vzalloc_node() to allocate
pages, the stale TLB entries of the booting kernel will be misused by
the resumed target kernel.

Signed-off-by: Huacai Chen <chenhc@lemote.com>
Cc: <stable@vger.kernel.org>
---
 arch/mips/power/hibernate.S |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/mips/power/hibernate.S b/arch/mips/power/hibernate.S
index 7e0277a..32a7c82 100644
--- a/arch/mips/power/hibernate.S
+++ b/arch/mips/power/hibernate.S
@@ -43,6 +43,7 @@ LEAF(swsusp_arch_resume)
 	bne t1, t3, 1b
 	PTR_L t0, PBE_NEXT(t0)
 	bnez t0, 0b
+	jal local_flush_tlb_all /* Avoid TLB mismatch after kernel resume */
 	PTR_LA t0, saved_regs
 	PTR_L ra, PT_R31(t0)
 	PTR_L sp, PT_R29(t0)
-- 
1.7.7.3
