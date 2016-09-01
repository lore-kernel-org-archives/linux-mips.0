Received: from mailapp01.imgtec.com ([195.59.15.196]:43847 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992307AbcIAQbJdz-l2 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 1 Sep 2016 18:31:09 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 7/9] MIPS: uprobes: Flush icache via kernel address
Date: Thu, 1 Sep 2016 17:30:13 +0100
Message-ID: <0d915756776de050b8a92b5bb5d4e7ffbe784d66.1472747205.git-series.james.hogan@imgtec.com>
In-Reply-To: <cover.d93e43428f3c573bdd18d7c874830705b39c3a8a.1472747205.git-series.james.hogan@imgtec.com>
References: <cover.d93e43428f3c573bdd18d7c874830705b39c3a8a.1472747205.git-series.james.hogan@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <James.Hogan@imgtec.com>
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
Cc: James Hogan <james.hogan@imgtec.com>, Leonid Yegoshin <leonid.yegoshin@imgtec.com>, linux-mips@linux-mips.org
Message-ID: <20160901163013.8zffJHCXzxdAZ1GXPkGonUFqE5jqrhBvzDQlCFB9rUU@z>

Update arch_uprobe_copy_ixol() to use the kmap_atomic() based kernel
address to flush the icache with flush_icache_range(), rather than the
user mapping. We have the kernel mapping available anyway and this
avoids having to switch to using the new __flush_icache_user_range() for
the sake of Enhanced Virtual Addressing (EVA) where flush_icache_range()
will become ineffective on user addresses.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Leonid Yegoshin <leonid.yegoshin@imgtec.com>
Cc: linux-mips@linux-mips.org
---
 arch/mips/kernel/uprobes.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/mips/kernel/uprobes.c b/arch/mips/kernel/uprobes.c
index 8452d933a645..9a507ab1ea38 100644
--- a/arch/mips/kernel/uprobes.c
+++ b/arch/mips/kernel/uprobes.c
@@ -301,19 +301,14 @@ int set_orig_insn(struct arch_uprobe *auprobe, struct mm_struct *mm,
 void __weak arch_uprobe_copy_ixol(struct page *page, unsigned long vaddr,
 				  void *src, unsigned long len)
 {
-	void *kaddr;
+	void *kaddr, kstart;
 
 	/* Initialize the slot */
 	kaddr = kmap_atomic(page);
-	memcpy(kaddr + (vaddr & ~PAGE_MASK), src, len);
+	kstart = kaddr + (vaddr & ~PAGE_MASK);
+	memcpy(kstart, src, len);
+	flush_icache_range(kstart, kstart + len);
 	kunmap_atomic(kaddr);
-
-	/*
-	 * The MIPS version of flush_icache_range will operate safely on
-	 * user space addresses and more importantly, it doesn't require a
-	 * VMA argument.
-	 */
-	flush_icache_range(vaddr, vaddr + len);
 }
 
 /**
-- 
git-series 0.8.10
