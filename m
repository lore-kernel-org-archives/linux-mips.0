Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94D7BC4742C
	for <linux-mips@archiver.kernel.org>; Fri, 13 Nov 2020 11:14:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 53C6B20797
	for <linux-mips@archiver.kernel.org>; Fri, 13 Nov 2020 11:14:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726309AbgKMLOP (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Fri, 13 Nov 2020 06:14:15 -0500
Received: from mx2.suse.de ([195.135.220.15]:33030 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726614AbgKMLKO (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 13 Nov 2020 06:10:14 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 41F8FAF06;
        Fri, 13 Nov 2020 11:10:12 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] MIPS: mm: shorten lines by using macro
Date:   Fri, 13 Nov 2020 12:09:51 +0100
Message-Id: <20201113110952.68086-3-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20201113110952.68086-1-tsbogend@alpha.franken.de>
References: <20201113110952.68086-1-tsbogend@alpha.franken.de>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Introduce helper macro to make lines shorter.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/mm/cache.c | 38 +++++++++++++++++++++-----------------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/arch/mips/mm/cache.c b/arch/mips/mm/cache.c
index 3e81ba000096..f66a8bfc030e 100644
--- a/arch/mips/mm/cache.c
+++ b/arch/mips/mm/cache.c
@@ -155,26 +155,28 @@ void __update_cache(unsigned long address, pte_t pte)
 unsigned long _page_cachable_default;
 EXPORT_SYMBOL(_page_cachable_default);
 
+#define PM(p)	__pgprot(_page_cachable_default | (p))
+
 static inline void setup_protection_map(void)
 {
 	if (cpu_has_rixi) {
-		protection_map[0]  = __pgprot(_page_cachable_default | _PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_NO_READ);
-		protection_map[1]  = __pgprot(_page_cachable_default | _PAGE_PRESENT | _PAGE_NO_EXEC);
-		protection_map[2]  = __pgprot(_page_cachable_default | _PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_NO_READ);
-		protection_map[3]  = __pgprot(_page_cachable_default | _PAGE_PRESENT | _PAGE_NO_EXEC);
-		protection_map[4]  = __pgprot(_page_cachable_default | _PAGE_PRESENT);
-		protection_map[5]  = __pgprot(_page_cachable_default | _PAGE_PRESENT);
-		protection_map[6]  = __pgprot(_page_cachable_default | _PAGE_PRESENT);
-		protection_map[7]  = __pgprot(_page_cachable_default | _PAGE_PRESENT);
-
-		protection_map[8]  = __pgprot(_page_cachable_default | _PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_NO_READ);
-		protection_map[9]  = __pgprot(_page_cachable_default | _PAGE_PRESENT | _PAGE_NO_EXEC);
-		protection_map[10] = __pgprot(_page_cachable_default | _PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_WRITE | _PAGE_NO_READ);
-		protection_map[11] = __pgprot(_page_cachable_default | _PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_WRITE);
-		protection_map[12] = __pgprot(_page_cachable_default | _PAGE_PRESENT);
-		protection_map[13] = __pgprot(_page_cachable_default | _PAGE_PRESENT);
-		protection_map[14] = __pgprot(_page_cachable_default | _PAGE_PRESENT | _PAGE_WRITE);
-		protection_map[15] = __pgprot(_page_cachable_default | _PAGE_PRESENT | _PAGE_WRITE);
+		protection_map[0]  = PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_NO_READ);
+		protection_map[1]  = PM(_PAGE_PRESENT | _PAGE_NO_EXEC);
+		protection_map[2]  = PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_NO_READ);
+		protection_map[3]  = PM(_PAGE_PRESENT | _PAGE_NO_EXEC);
+		protection_map[4]  = PM(_PAGE_PRESENT);
+		protection_map[5]  = PM(_PAGE_PRESENT);
+		protection_map[6]  = PM(_PAGE_PRESENT);
+		protection_map[7]  = PM(_PAGE_PRESENT);
+
+		protection_map[8]  = PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_NO_READ);
+		protection_map[9]  = PM(_PAGE_PRESENT | _PAGE_NO_EXEC);
+		protection_map[10] = PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_WRITE | _PAGE_NO_READ);
+		protection_map[11] = PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_WRITE);
+		protection_map[12] = PM(_PAGE_PRESENT);
+		protection_map[13] = PM(_PAGE_PRESENT);
+		protection_map[14] = PM(_PAGE_PRESENT | _PAGE_WRITE);
+		protection_map[15] = PM(_PAGE_PRESENT | _PAGE_WRITE);
 
 	} else {
 		protection_map[0] = PAGE_NONE;
@@ -196,6 +198,8 @@ static inline void setup_protection_map(void)
 	}
 }
 
+#undef PM
+
 void cpu_cache_init(void)
 {
 	if (cpu_has_3k_cache) {
-- 
2.16.4

