Return-Path: <SRS0=In0w=IF=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71C92C433DB
	for <linux-mips@archiver.kernel.org>; Sun,  7 Mar 2021 19:29:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 42849650B4
	for <linux-mips@archiver.kernel.org>; Sun,  7 Mar 2021 19:29:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232190AbhCGT3J (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Sun, 7 Mar 2021 14:29:09 -0500
Received: from aposti.net ([89.234.176.197]:36842 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230394AbhCGT3A (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 7 Mar 2021 14:29:00 -0500
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>
Cc:     od@zcrc.me, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 2/2] MIPS: ingenic: gcw0: SPI panel does not require active-high CS
Date:   Sun,  7 Mar 2021 19:28:30 +0000
Message-Id: <20210307192830.208245-2-paul@crapouillou.net>
In-Reply-To: <20210307192830.208245-1-paul@crapouillou.net>
References: <20210307192830.208245-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The NT39016 panel is a fun beast, even though the documentation states
that the CS line is active-low, it will work just fine if the CS line is
configured as active-high, but it won't work if the CS line is forced
low or forced high.

Since it did actually work with the spi-cs-high property, this is not a
bugfix, but we should nonetheless remove that property to match the
documentation.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/boot/dts/ingenic/gcw0.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/boot/dts/ingenic/gcw0.dts b/arch/mips/boot/dts/ingenic/gcw0.dts
index bc72304a2440..f4c04f2263ea 100644
--- a/arch/mips/boot/dts/ingenic/gcw0.dts
+++ b/arch/mips/boot/dts/ingenic/gcw0.dts
@@ -345,7 +345,6 @@ nt39016@0 {
 
 			spi-max-frequency = <3125000>;
 			spi-3wire;
-			spi-cs-high;
 
 			reset-gpios = <&gpe 2 GPIO_ACTIVE_LOW>;
 
-- 
2.30.1

