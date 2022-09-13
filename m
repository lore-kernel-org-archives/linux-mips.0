Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71A70C6FA82
	for <linux-mips@archiver.kernel.org>; Tue, 13 Sep 2022 09:36:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231464AbiIMJgi (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Tue, 13 Sep 2022 05:36:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231264AbiIMJgg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 13 Sep 2022 05:36:36 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB6787664;
        Tue, 13 Sep 2022 02:36:34 -0700 (PDT)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.53])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MRdZS5Vs9znVHQ;
        Tue, 13 Sep 2022 17:33:52 +0800 (CST)
Received: from dggpemm100009.china.huawei.com (7.185.36.113) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 13 Sep 2022 17:36:33 +0800
Received: from huawei.com (10.175.113.32) by dggpemm100009.china.huawei.com
 (7.185.36.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 13 Sep
 2022 17:36:32 +0800
From:   Liu Shixin <liushixin2@huawei.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        John Crispin <john@phrozen.org>
CC:     <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Liu Shixin <liushixin2@huawei.com>,
        Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: [PATCH 0/3] mips: use DEFINE_SHOW_ATTRIBUTE to simplify code
Date:   Tue, 13 Sep 2022 18:10:35 +0800
Message-ID: <20220913101038.1902389-1-liushixin2@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.32]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm100009.china.huawei.com (7.185.36.113)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Use DEFINE_SHOW_ATTRIBUTE to simplify code.

Liu Shixin (3):
  mips: cavium: convert to DEFINE_SHOW_ATTRIBUTE
  mips: kernel: convert to DEFINE_SHOW_ATTRIBUTE
  mips: ralink: convert to DEFINE_SHOW_ATTRIBUTE

 arch/mips/cavium-octeon/oct_ilm.c | 17 +++--------------
 arch/mips/kernel/segment.c        | 15 ++-------------
 arch/mips/ralink/bootrom.c        | 15 ++-------------
 3 files changed, 7 insertions(+), 40 deletions(-)

-- 
2.25.1

