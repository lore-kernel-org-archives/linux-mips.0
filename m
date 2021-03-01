Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AE03C433DB
	for <linux-mips@archiver.kernel.org>; Mon,  1 Mar 2021 07:41:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5007F64D8F
	for <linux-mips@archiver.kernel.org>; Mon,  1 Mar 2021 07:41:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232480AbhCAHjc (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Mon, 1 Mar 2021 02:39:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232535AbhCAHj1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 1 Mar 2021 02:39:27 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16BDDC061788
        for <linux-mips@vger.kernel.org>; Sun, 28 Feb 2021 23:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=36CRP/Z+u8BUXJwpr8iveFF2D+TuQY1y+AhUpLyGfvo=; b=JPmt16IfrWjCcABnyVFQkA4+CQ
        G7CpiRHXwB4/FzB3sZXSmxIxFPFQ9zBN8sGp3umRSCE+oNOci+FmGVn+rCaZgqzxSpegT0btguQVu
        x5mPKK5N8KzApN/RSsyoRrdu6sH23bB5IB1L8ZgzfN6/EJlT/6RhToC/PMOx2F86FUo/mbK+n+He3
        ExL+sUX+LbjWg2bma4jVylqeti1CeA/2TUQB1VI/7O9HdMioMjUTvmzOm2SjxHhPb7IiBM9UibNJw
        IfyzNYmWvT1ozLGwRFI7PtJ74Nrfd5vFZ7K7SIC0jPTZOU82eADyB4kJJtLgXU53nArVSPb2gGdwO
        In0AYOjw==;
Received: from [2001:4bb8:19b:e4b7:cdf9:733f:4874:8eb4] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lGd8l-00FQlm-7n; Mon, 01 Mar 2021 07:38:55 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        linux-mips@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
Subject: [PATCH 2/3] MIPS: bmips: include <linux/dma-direct.h> for phys_to_dma
Date:   Mon,  1 Mar 2021 08:38:31 +0100
Message-Id: <20210301073832.919371-3-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210301073832.919371-1-hch@lst.de>
References: <20210301073832.919371-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Ensure this file has a prototype for phys_to_dma and dma_to_phys.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/mips/bmips/dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/bmips/dma.c b/arch/mips/bmips/dma.c
index 49061b870680b9..915ce4b189c15b 100644
--- a/arch/mips/bmips/dma.c
+++ b/arch/mips/bmips/dma.c
@@ -10,7 +10,7 @@
 
 #include <linux/device.h>
 #include <linux/dma-direction.h>
-#include <linux/dma-mapping.h>
+#include <linux/dma-direct.h>
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/of.h>
-- 
2.29.2

