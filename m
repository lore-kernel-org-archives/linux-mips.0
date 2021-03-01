Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B20FC433E0
	for <linux-mips@archiver.kernel.org>; Mon,  1 Mar 2021 07:40:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 21AE464D8F
	for <linux-mips@archiver.kernel.org>; Mon,  1 Mar 2021 07:40:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232533AbhCAHj0 (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Mon, 1 Mar 2021 02:39:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232547AbhCAHjS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 1 Mar 2021 02:39:18 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46B51C061756
        for <linux-mips@vger.kernel.org>; Sun, 28 Feb 2021 23:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=/1+tmiu9RqtJrm56ACP52XDJLqoZKPUXuO5xRZ3/O8M=; b=v2RGTgo++VFwKPiu80hjCA5asZ
        3Or+zB+ijsS1h6qV66uch/7qQ+tHRGDYEbRmK1jeHlbU6CsmAKti8YBhbOBLmB8up0eLuGz/j6TPJ
        2S1V8+OdZaER9+vnbZ6dHDumSPIGT/XlCb/n1s4cb3z9yGZzOcak+rz91pQnAOh5gQUfnrvlBrWSM
        M+s44UZj6vGOI5bzFfmSsd4pqkd9sAJLMFZZo6eRLKFPW5nWlqsurBkWDiuiAuZgdIy6hPgOZXmCH
        XQnN5L42nCRESFFrRhBDXCyRSWakAdopDMtZERm2PYpJh4z/gz9J6PyONKUz86sVmS3FS8CERC7GM
        /V/2d75g==;
Received: from [2001:4bb8:19b:e4b7:cdf9:733f:4874:8eb4] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lGd8U-00FQlO-Kj; Mon, 01 Mar 2021 07:38:37 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        linux-mips@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
Subject: mips DMA buildbot fixes
Date:   Mon,  1 Mar 2021 08:38:29 +0100
Message-Id: <20210301073832.919371-1-hch@lst.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Thomas,

this series fixes a few trivial warnings in the mips DMA code that the
buildbot keeps complaining about.
