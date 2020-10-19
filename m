Return-Path: <SRS0=Dk9a=D2=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9525C433DF
	for <linux-mips@archiver.kernel.org>; Mon, 19 Oct 2020 06:14:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 743CE22260
	for <linux-mips@archiver.kernel.org>; Mon, 19 Oct 2020 06:14:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="mvUG9dj6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726555AbgJSGOv (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Mon, 19 Oct 2020 02:14:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726553AbgJSGOv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 19 Oct 2020 02:14:51 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45E58C061755;
        Sun, 18 Oct 2020 23:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=fTtha486nmU3JfzvFGVWTw5Gr8n1FWF280/B5ZiqWwI=; b=mvUG9dj6nxZOMxFYLdjbyMF7/i
        K8VvUt63za6/ar2z/aTECQlN4f6RV2yoXUDF8F+EQnfCwT07pCAaYZTRHM6jf1BKNOPNIF+2YOTLN
        lXMMZuoBj4IzbosFScdr2ZeXk2KVS/H437w8+m6BmrjkaIMYJDsj65M/hZHYLZfogXd/tkWhMhPb3
        xPaG9Vej738SI5mWMW6SrX2rQ9orgyuLPai7fZMYdXL4OpA01hvtlBvOIpkjSkNPlEISNMJHvIZml
        xbSQaAFC0ZPH6ZUYSH8JFxoK7/tFZLJuKM5Kifh6BsXWXe7UXdTpoXsMSyCI3M7WaZciFr0V13AUK
        RIupb/zg==;
Received: from [2601:1c0:6280:3f0::507c] (helo=smtpauth.infradead.org)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kUORR-0001BD-Or; Mon, 19 Oct 2020 06:14:46 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        kernel test robot <lkp@intel.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>, linux-mips@vger.kernel.org
Subject: [PATCH] mips: export spurious_interrupt() to fix MFD build error
Date:   Sun, 18 Oct 2020 23:14:39 -0700
Message-Id: <20201019061439.10571-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Fix a build error in drivers/mfd/ioc3.o by exporting
spurious_interrupt().

ERROR: modpost: "spurious_interrupt" [drivers/mfd/ioc3.ko] undefined!

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Burton <paulburton@kernel.org>
Cc: linux-mips@vger.kernel.org
---
 arch/mips/kernel/irq.c |    2 ++
 1 file changed, 2 insertions(+)

--- linux-next-20201016.orig/arch/mips/kernel/irq.c
+++ linux-next-20201016/arch/mips/kernel/irq.c
@@ -10,6 +10,7 @@
  */
 #include <linux/kernel.h>
 #include <linux/delay.h>
+#include <linux/export.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/kernel_stat.h>
@@ -48,6 +49,7 @@ asmlinkage void spurious_interrupt(void)
 {
 	atomic_inc(&irq_err_count);
 }
+EXPORT_SYMBOL(spurious_interrupt);
 
 void __init init_IRQ(void)
 {
