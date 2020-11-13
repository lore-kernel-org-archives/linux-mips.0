Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51844C4742C
	for <linux-mips@archiver.kernel.org>; Fri, 13 Nov 2020 11:11:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 196DB20709
	for <linux-mips@archiver.kernel.org>; Fri, 13 Nov 2020 11:11:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726455AbgKMLLi (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Fri, 13 Nov 2020 06:11:38 -0500
Received: from mx2.suse.de ([195.135.220.15]:33006 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726588AbgKMLKP (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 13 Nov 2020 06:10:15 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 6B804AED6;
        Fri, 13 Nov 2020 11:10:11 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] MIPS: vdso: Use vma page protection for remapping
Date:   Fri, 13 Nov 2020 12:09:49 +0100
Message-Id: <20201113110952.68086-1-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.16.4
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

MIPS protection bits are setup during runtime so using defines like
PAGE_READONLY ignores these runtime changes. To fix this we simply
use the page protection of the setup vma.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/kernel/vdso.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/vdso.c b/arch/mips/kernel/vdso.c
index 242dc5e83847..7d0b91ad2581 100644
--- a/arch/mips/kernel/vdso.c
+++ b/arch/mips/kernel/vdso.c
@@ -161,7 +161,7 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 		gic_pfn = virt_to_phys(mips_gic_base + MIPS_GIC_USER_OFS) >> PAGE_SHIFT;
 
 		ret = io_remap_pfn_range(vma, base, gic_pfn, gic_size,
-					 pgprot_noncached(PAGE_READONLY));
+					 pgprot_noncached(vma->vm_page_prot));
 		if (ret)
 			goto out;
 	}
@@ -169,7 +169,7 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 	/* Map data page. */
 	ret = remap_pfn_range(vma, data_addr,
 			      virt_to_phys(vdso_data) >> PAGE_SHIFT,
-			      PAGE_SIZE, PAGE_READONLY);
+			      PAGE_SIZE, vma->vm_page_prot);
 	if (ret)
 		goto out;
 
-- 
2.16.4

