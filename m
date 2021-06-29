Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C430FC11F66
	for <linux-mips@archiver.kernel.org>; Tue, 29 Jun 2021 14:11:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A7F5C61DE8
	for <linux-mips@archiver.kernel.org>; Tue, 29 Jun 2021 14:11:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234156AbhF2ON5 (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Tue, 29 Jun 2021 10:13:57 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:13042 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233052AbhF2ON4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 29 Jun 2021 10:13:56 -0400
Received: from dggeme754-chm.china.huawei.com (unknown [172.30.72.54])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GDmXh45XjzZlDp;
        Tue, 29 Jun 2021 22:08:20 +0800 (CST)
Received: from localhost.localdomain (10.175.103.91) by
 dggeme754-chm.china.huawei.com (10.3.19.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 29 Jun 2021 22:11:25 +0800
From:   Wei Li <liwei391@huawei.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Daniel Silsby <dansilsby@gmail.com>,
        Paul Burton <paulburton@kernel.org>
CC:     <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <huawei.libin@huawei.com>
Subject: [PATCH RESEND] MIPS: Fix PKMAP with 32-bit MIPS huge page support
Date:   Tue, 29 Jun 2021 22:14:20 +0800
Message-ID: <20210629141420.1790569-1-liwei391@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggeme754-chm.china.huawei.com (10.3.19.100)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

When 32-bit MIPS huge page support is enabled, we halve the number of
pointers a PTE page holds, making its last half go to waste.
Correspondingly, we should halve the number of kmap entries, as we just
initialized only a single pte table for that in pagetable_init().

Fixes: 35476311e529 ("MIPS: Add partial 32-bit huge page support")
Signed-off-by: Wei Li <liwei391@huawei.com>
---
 arch/mips/include/asm/highmem.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/highmem.h b/arch/mips/include/asm/highmem.h
index 292d0425717f..92a380210017 100644
--- a/arch/mips/include/asm/highmem.h
+++ b/arch/mips/include/asm/highmem.h
@@ -36,7 +36,7 @@ extern pte_t *pkmap_page_table;
  * easily, subsequent pte tables have to be allocated in one physical
  * chunk of RAM.
  */
-#ifdef CONFIG_PHYS_ADDR_T_64BIT
+#if defined(CONFIG_PHYS_ADDR_T_64BIT) || defined(CONFIG_MIPS_HUGE_TLB_SUPPORT)
 #define LAST_PKMAP 512
 #else
 #define LAST_PKMAP 1024
-- 
2.25.1

