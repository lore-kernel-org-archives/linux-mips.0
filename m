Return-Path: <SRS0=xoWx=C3=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1E73C43463
	for <linux-mips@archiver.kernel.org>; Fri, 18 Sep 2020 01:41:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5807F21734
	for <linux-mips@archiver.kernel.org>; Fri, 18 Sep 2020 01:41:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726112AbgIRBl5 (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Thu, 17 Sep 2020 21:41:57 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:38206 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726009AbgIRBl5 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 17 Sep 2020 21:41:57 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id A35D3E89DDAC21828D22;
        Fri, 18 Sep 2020 09:41:54 +0800 (CST)
Received: from euler.huawei.com (10.175.124.27) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.487.0; Fri, 18 Sep 2020 09:41:44 +0800
From:   Wei Li <liwei391@huawei.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC:     <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <guohanjun@huawei.com>
Subject: [PATCH] MIPS: Correct the header guard of r4k-timer.h
Date:   Fri, 18 Sep 2020 09:41:11 +0800
Message-ID: <20200918014111.46747-1-liwei391@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Rename the header guard of r4k-timer.h from __ASM_R4K_TYPES_H to
__ASM_R4K_TIMER_H what corresponding with the file name.

Signed-off-by: Wei Li <liwei391@huawei.com>
---
 arch/mips/include/asm/r4k-timer.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/mips/include/asm/r4k-timer.h b/arch/mips/include/asm/r4k-timer.h
index afe9e0e03fe9..6e7361629348 100644
--- a/arch/mips/include/asm/r4k-timer.h
+++ b/arch/mips/include/asm/r4k-timer.h
@@ -5,8 +5,8 @@
  *
  * Copyright (C) 2008 by Ralf Baechle (ralf@linux-mips.org)
  */
-#ifndef __ASM_R4K_TYPES_H
-#define __ASM_R4K_TYPES_H
+#ifndef __ASM_R4K_TIMER_H
+#define __ASM_R4K_TIMER_H
 
 #include <linux/compiler.h>
 
@@ -27,4 +27,4 @@ static inline void synchronise_count_slave(int cpu)
 
 #endif
 
-#endif /* __ASM_R4K_TYPES_H */
+#endif /* __ASM_R4K_TIMER_H */
-- 
2.17.1

