Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD929C433FE
	for <linux-mips@archiver.kernel.org>; Fri,  4 Nov 2022 03:41:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229579AbiKDDld (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Thu, 3 Nov 2022 23:41:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229950AbiKDDlJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 3 Nov 2022 23:41:09 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C6D46437
        for <linux-mips@vger.kernel.org>; Thu,  3 Nov 2022 20:41:07 -0700 (PDT)
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.56])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4N3RH13FyTzHvVj;
        Fri,  4 Nov 2022 11:40:45 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 4 Nov 2022 11:41:05 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 4 Nov
 2022 11:41:05 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-mips@vger.kernel.org>
CC:     <tsbogend@alpha.franken.de>, <dengcheng.zhu@imgtec.com>,
        <Steven.Hill@imgtec.com>, <Qais.Yousef@imgtec.com>,
        <blogic@openwrt.org>, <yangyingliang@huawei.com>
Subject: [PATCH v2 0/2] MIPS: fix possible memory leak while module exiting
Date:   Fri, 4 Nov 2022 11:39:43 +0800
Message-ID: <20221104033945.1120044-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This patchset fixes two device name leaks while module exiting
in normal or error path.

v1 -> v2:
  Add fix tag in patch #1.

Yang Yingliang (2):
  MIPS: vpe-mt: fix possible memory leak while module exiting
  MIPS: vpe-cmp: fix possible memory leak while module exiting

 arch/mips/kernel/vpe-cmp.c | 4 ++--
 arch/mips/kernel/vpe-mt.c  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.25.1

