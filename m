Received: from mailapp01.imgtec.com ([195.59.15.196]:31321 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23990521AbcLMJskdkdJk (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 13 Dec 2016 10:48:40 +0100
Received: from HHMAIL01.hh.imgtec.org (unknown [10.100.10.19])
        by Forcepoint Email with ESMTPS id 1C1F1EC156A1B
        for <linux-mips@linux-mips.org>; Tue, 13 Dec 2016 09:48:31 +0000 (GMT)
From: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Subject: [PATCH] MIPS: uprobes: remove __weak attribute from arch_uprobe_copy_ixol
Date: Tue, 13 Dec 2016 10:48:30 +0100
Message-ID: <1481622510-19708-1-git-send-email-marcin.nowakowski@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Marcin.Nowakowski@imgtec.com>
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
Message-ID: <20161213094830.WlpnAMzl2gOWQkcMKTQm1pltdAQQFPYWXAV0KwZKdV4@z>

Arch-specific implementation of arch_uprobe_copy_ixol is expected to
override the weak implementation in generic code.
As currently both implementations are marked as weak, it is up to the
linker to chose one. Remove the __weak attribute from MIPS code to make
sure the correct version is used.

Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
---
 arch/mips/kernel/uprobes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kernel/uprobes.c b/arch/mips/kernel/uprobes.c
index dbb9174..e99e3fae 100644
--- a/arch/mips/kernel/uprobes.c
+++ b/arch/mips/kernel/uprobes.c
@@ -226,7 +226,7 @@ int __weak set_swbp(struct arch_uprobe *auprobe, struct mm_struct *mm,
 	return uprobe_write_opcode(mm, vaddr, UPROBE_SWBP_INSN);
 }
 
-void __weak arch_uprobe_copy_ixol(struct page *page, unsigned long vaddr,
+void arch_uprobe_copy_ixol(struct page *page, unsigned long vaddr,
 				  void *src, unsigned long len)
 {
 	unsigned long kaddr, kstart;
-- 
2.7.4
