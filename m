Return-Path: <SRS0=Y92p=CU=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9974C43461
	for <linux-mips@archiver.kernel.org>; Fri, 11 Sep 2020 02:02:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 98324208FE
	for <linux-mips@archiver.kernel.org>; Fri, 11 Sep 2020 02:02:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725786AbgIKCC0 (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Thu, 10 Sep 2020 22:02:26 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:39272 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725300AbgIKCCZ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 10 Sep 2020 22:02:25 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 60668C3B4F2C63A6AD57;
        Fri, 11 Sep 2020 10:02:21 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0; Fri, 11 Sep 2020
 10:02:11 +0800
From:   Jason Yan <yanaijie@huawei.com>
To:     <tsbogend@alpha.franken.de>, <paulburton@kernel.org>,
        <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Jason Yan <yanaijie@huawei.com>, Hulk Robot <hulkci@huawei.com>
Subject: [PATCH] MIPS: Make setup_elfcorehdr and setup_elfcorehdr_size static
Date:   Fri, 11 Sep 2020 10:01:32 +0800
Message-ID: <20200911020132.1464661-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This addresses the following sparse warning:

arch/mips/kernel/setup.c:446:33: warning: symbol 'setup_elfcorehdr_size'
was not declared. Should it be static?

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 arch/mips/kernel/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 335bd188b8b4..c004a311aaab 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -443,7 +443,7 @@ static int __init early_parse_memmap(char *p)
 early_param("memmap", early_parse_memmap);
 
 #ifdef CONFIG_PROC_VMCORE
-unsigned long setup_elfcorehdr, setup_elfcorehdr_size;
+static unsigned long setup_elfcorehdr, setup_elfcorehdr_size;
 static int __init early_parse_elfcorehdr(char *p)
 {
 	phys_addr_t start, end;
-- 
2.25.4

