Return-Path: <SRS0=Lit2=C2=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FE23C433E2
	for <linux-mips@archiver.kernel.org>; Thu, 17 Sep 2020 14:49:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 08E8D22241
	for <linux-mips@archiver.kernel.org>; Thu, 17 Sep 2020 14:49:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="n3gCcN44"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727521AbgIQOtG (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Thu, 17 Sep 2020 10:49:06 -0400
Received: from crapouillou.net ([89.234.176.41]:47348 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727495AbgIQOs5 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 17 Sep 2020 10:48:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1600349734; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:references; bh=lBb3TOEvYTkTn6E8NDi25RMW8ck/fLPNUgjrdQ80fVc=;
        b=n3gCcN44Id6GF1h+GPHnzbCt1sWWGZD6oGucZBuUTV2yTdSRYBl3S69Hd1uKPzET4yuAbz
        CYA42QyqTmCtCpxqE1T2PMXLBl1pBDF0XR+hGjxdbqYa+PqbOfmddWM6f+nx4U1ZFGUs+N
        m3Jf+ES5Xsj4K8HhyJiMqXTiJmK78hA=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     od@zcrc.me, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH] MIPS: Increase range of CONFIG_FORCE_MAX_ZONEORDER
Date:   Thu, 17 Sep 2020 15:35:28 +0200
Message-Id: <20200917133528.83091-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

There is nothing that prevents us from using lower maximum values.
It's something that we actually want, when using bigger page sizes on
devices with low RAM.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 632fe8fe68c4..dca2bbdbfc24 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2251,7 +2251,7 @@ config FORCE_MAX_ZONEORDER
 	default "13" if MIPS_HUGE_TLB_SUPPORT && PAGE_SIZE_32KB
 	range 12 64 if MIPS_HUGE_TLB_SUPPORT && PAGE_SIZE_16KB
 	default "12" if MIPS_HUGE_TLB_SUPPORT && PAGE_SIZE_16KB
-	range 11 64
+	range 0 64
 	default "11"
 	help
 	  The kernel memory allocator divides physically contiguous memory
-- 
2.28.0

