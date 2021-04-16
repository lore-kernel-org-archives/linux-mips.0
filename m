Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E68AAC433ED
	for <linux-mips@archiver.kernel.org>; Fri, 16 Apr 2021 23:07:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B6F77610E7
	for <linux-mips@archiver.kernel.org>; Fri, 16 Apr 2021 23:07:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230489AbhDPXIN (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Fri, 16 Apr 2021 19:08:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229719AbhDPXIN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 16 Apr 2021 19:08:13 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6FC9C061574;
        Fri, 16 Apr 2021 16:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=mbIW7FDOiEKRuwEXnsOYQIYqDQHUf6UllHx7WSCAIjI=; b=lxU48mq458bF7JV1aZ6L3Zo2UR
        I585HQrHxlGeweJsLkRKCYSCqoFhHxnYj7gGJ39liWPLTQfWA2ajmWmKMkjA3Z0VTIOSaFEWoqv+g
        ksAAAbmBr7Y58UiFpMY9kGMNAA7SSWLAld8PZaACTYfsZKQ0YTQLayBMcepZBZpoQfoixfm1eQJzi
        9JPDz6/LgxP88bdj+7aikBJTkOBO4kN5ye3LclnZjCY9axF+/s3S+7ev/MqsAbrxEYieXycizyc6g
        hQU35iOkWcVessGC+PK9aR+/kafdQoaygcZji5k3N5WJfQmWMMYu40YcWG69i1HQUBftuOxgDpZpA
        l+QkiMeg==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1lXXYb-00AZO9-Jr; Fri, 16 Apr 2021 23:07:27 +0000
From:   "Matthew Wilcox (Oracle)" <willy@infradead.org>
To:     brouer@redhat.com
Cc:     "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        ilias.apalodimas@linaro.org, mcroce@linux.microsoft.com,
        grygorii.strashko@ti.com, arnd@kernel.org, hch@lst.de,
        linux-snps-arc@lists.infradead.org, mhocko@kernel.org,
        mgorman@suse.de
Subject: [PATCH 0/2] Change struct page layout for page_pool
Date:   Sat, 17 Apr 2021 00:07:22 +0100
Message-Id: <20210416230724.2519198-1-willy@infradead.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The first patch here fixes two bugs on ppc32, and mips32.  It fixes one
bug on arc and arm32 (in certain configurations).  It probably makes
sense to get it in ASAP through the networking tree.  I'd like to see
testing on those four architectures if possible?

The second patch enables new functionality.  It is much less urgent.
I'd really like to see Mel & Michal's thoughts on it.

I have only compile-tested these patches.

Matthew Wilcox (Oracle) (2):
  mm: Fix struct page layout on 32-bit systems
  mm: Indicate pfmemalloc pages in compound_head

 include/linux/mm.h       | 12 +++++++-----
 include/linux/mm_types.h |  9 ++++-----
 include/net/page_pool.h  | 12 +++++++++++-
 net/core/page_pool.c     | 12 +++++++-----
 4 files changed, 29 insertions(+), 16 deletions(-)

-- 
2.30.2

