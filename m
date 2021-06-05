Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF6FAC47082
	for <linux-mips@archiver.kernel.org>; Sat,  5 Jun 2021 13:36:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B654761263
	for <linux-mips@archiver.kernel.org>; Sat,  5 Jun 2021 13:36:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229933AbhFENii (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Sat, 5 Jun 2021 09:38:38 -0400
Received: from mail-m964.mail.126.com ([123.126.96.4]:49054 "EHLO
        mail-m964.mail.126.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229931AbhFENii (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 5 Jun 2021 09:38:38 -0400
X-Greylist: delayed 1809 seconds by postgrey-1.27 at vger.kernel.org; Sat, 05 Jun 2021 09:38:38 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id; bh=f9Wj/cFcMSLEZt3a7k
        mUO3fOZsRQwFcAJUxx6KOO8rY=; b=dgBcVpYkyLhYg+wZ891XWY1D3GEcnPbNxE
        7IigG2C8/d4bBBu3O7NJHZ/7XXUQftsQ9FurkSi90nOra6S+vzH36rA7+9NFz2H2
        S6QCOL2P35aI6iF9/ykNmYhUBoG5Df2wyhaLIFNh+IRbunua6U6vx3cZWiTNbODn
        evH3vjh1M=
Received: from localhost.localdomain (unknown [122.194.9.184])
        by smtp9 (Coremail) with SMTP id NeRpCgCn1__cdrtgbpN7XA--.36462S3;
        Sat, 05 Jun 2021 21:06:37 +0800 (CST)
From:   chenxb_99091@126.com
To:     yanh@lemote.com, linux-mips@vger.kernel.org
Cc:     Kailong <wkailong1993@163.com>
Subject: [PATCH] MIPS:Loongson2F:delete mutex defined but not used
Date:   Sat,  5 Jun 2021 21:06:33 +0800
Message-Id: <1622898393-3777-1-git-send-email-chenxb_99091@126.com>
X-Mailer: git-send-email 2.7.4
X-CM-TRANSID: NeRpCgCn1__cdrtgbpN7XA--.36462S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7Wr4UKrWrWry8Xry7tr43ZFb_yoW3JFXEgF
        y2kw48urWrAF1fu3sruF15Kw429a4ruFnxCF93Gr95Za1FvF9xCF4vvry8Wrn0gFnIv34r
        WF48Cr45uF47tjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU86uWJUUUUU==
X-Originating-IP: [122.194.9.184]
X-CM-SenderInfo: hfkh05lebzmiizr6ij2wof0z/1tbiWBqoxV1w6hTzowAAss
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Kailong <wkailong1993@163.com>

For 4.19.X, mutex clock_list_sem defined in
 arch/mips/loongson64/lemote-2f/clock.c never be used.  So delete it

Signed-off-by: Kailong <wkailong1993@163.com>
---
 arch/mips/loongson64/lemote-2f/clock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/loongson64/lemote-2f/clock.c b/arch/mips/loongson64/lemote-2f/clock.c
index 8281334..aff58b0 100644
--- a/arch/mips/loongson64/lemote-2f/clock.c
+++ b/arch/mips/loongson64/lemote-2f/clock.c
@@ -19,7 +19,7 @@
 
 static LIST_HEAD(clock_list);
 static DEFINE_SPINLOCK(clock_lock);
-static DEFINE_MUTEX(clock_list_sem);
+
 
 /* Minimum CLK support */
 enum {
-- 
2.7.4

