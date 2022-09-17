Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32D5AECAAA1
	for <linux-mips@archiver.kernel.org>; Sat, 17 Sep 2022 23:25:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229471AbiIQXZv (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Sat, 17 Sep 2022 19:25:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbiIQXZu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 17 Sep 2022 19:25:50 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF416240AC;
        Sat, 17 Sep 2022 16:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=4CeMSeGu8mqt6Tja4d6+EjB0nUj456QImQOHJgoZ8e0=; b=gSvarRKMQwWddivqHfa7OaaRHY
        uSgVP1ZNLHJ9kqhr2WSNbomY25Pnpzx1CtF/luq0cKrrNyeOrfcqdLeNuBjJSMqob2IrvcO7G+jRc
        EruGGNzks0rezRIp6UJkgtY1tkKl7uDk/rH/0w5BGtKqya0F/RxQEdKEDcOuhdpIBSWMEu/8afnFQ
        4VJNa8NInHZafJecmenin1hvL92VgFbzt3PqL7hLfznykZQmfG3izxbyYuqUbYUAEynn3kghQO3BB
        DqEUAlN9P9jScUT2vDzo5Ze76Q5GCKjs1iZUzybTN14wDjxJk3vjRrlzmPTqxIkJrWTWvvaQYY3aR
        4p5aOfVQ==;
Received: from [2601:1c2:d80:3110::a2e7] (helo=casper.infradead.org)
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1oZhBz-003bK4-AQ; Sat, 17 Sep 2022 23:25:47 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        kernel test robot <lkp@intel.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        John Crispin <john@phrozen.org>, linux-mips@vger.kernel.org
Subject: [PATCH] MIPS: lantiq: export clk_get_io() for lantiq_wdt.ko
Date:   Sat, 17 Sep 2022 16:25:40 -0700
Message-Id: <20220917232540.25436-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The lantiq WDT driver uses clk_get_io(), which is not exported,
so export it to fix a build error:

ERROR: modpost: "clk_get_io" [drivers/watchdog/lantiq_wdt.ko] undefined!

Fixes: 287e3f3f4e68 ("MIPS: lantiq: implement support for clkdev api")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: John Crispin <john@phrozen.org>
Cc: linux-mips@vger.kernel.org
---
 arch/mips/lantiq/clk.c |    1 +
 1 file changed, 1 insertion(+)

--- a/arch/mips/lantiq/clk.c
+++ b/arch/mips/lantiq/clk.c
@@ -50,6 +50,7 @@ struct clk *clk_get_io(void)
 {
 	return &cpu_clk_generic[2];
 }
+EXPORT_SYMBOL_GPL(clk_get_io);
 
 struct clk *clk_get_ppe(void)
 {
