Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D417C433DB
	for <linux-mips@archiver.kernel.org>; Mon,  8 Feb 2021 14:51:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0EB4E64DE9
	for <linux-mips@archiver.kernel.org>; Mon,  8 Feb 2021 14:51:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233027AbhBHOvY (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Mon, 8 Feb 2021 09:51:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232908AbhBHOvL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 8 Feb 2021 09:51:11 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBA81C06178B;
        Mon,  8 Feb 2021 06:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=ukIhxkMJ7jM46pKd8JWUZEJrVcqrPrCav3ZtJdF4cz4=; b=i88GvXARBqn5eJUyVUW2EXCrrT
        kbcFODQpKdLYONmRdIP8ActDgTb+XTOO3xa1fUrPSXQL97P5m1zvYXBfNZhtoSSWGCUN1wGxxOB0R
        hI0TXmPbvNhkFxJwEjM6MyQHqyezs/EQp3XZw8k0iWChrBadu8u7QbnuOKLXXioxwJGzZsqzNX/SB
        DMsBaErSRg4cI27jrKlHTswqQJkA8ArvJi1daRhpdTcU7wboqDvldKxvnSkLa/QZKzd+R2NRX9wNj
        pu8P+MpZAldUTmi3l7U2/zWRvVBRZxLSX+5M5ORO2yJlLXHdGacW3c3wDgfQ5DKcLHDLTzwwUMz0m
        k7bx61Qg==;
Received: from [2001:4bb8:184:7d04:e3ed:f9d6:78e2:6f0f] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1l97rv-0066dT-88; Mon, 08 Feb 2021 14:50:27 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org
Subject: MIPS noncoherent DMA cleanups
Date:   Mon,  8 Feb 2021 15:50:18 +0100
Message-Id: <20210208145024.3320420-1-hch@lst.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Thomas,

this series cleans up some of the mips (maybe) noncoherent support.
It also remove the need for the special <asm/dma-coherence.h> header only
provided by mips.
