Return-Path: <SRS0=ffv7=EM=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26A1CC55178
	for <linux-mips@archiver.kernel.org>; Fri,  6 Nov 2020 10:09:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CE5AA221FA
	for <linux-mips@archiver.kernel.org>; Fri,  6 Nov 2020 10:09:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726765AbgKFKJD (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Fri, 6 Nov 2020 05:09:03 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:48811 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726422AbgKFKJD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 6 Nov 2020 05:09:03 -0500
X-Originating-IP: 91.175.115.186
Received: from localhost (91-175-115-186.subs.proxad.net [91.175.115.186])
        (Authenticated sender: gregory.clement@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 7701760009;
        Fri,  6 Nov 2020 10:09:00 +0000 (UTC)
From:   Gregory CLEMENT <gregory.clement@bootlin.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org
Cc:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        <Steen.Hegelund@microchip.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH 4/9] MIPS: mscc: Fix configuration name for ocelot legacy boards
Date:   Fri,  6 Nov 2020 11:08:44 +0100
Message-Id: <20201106100849.969240-6-gregory.clement@bootlin.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201106100849.969240-1-gregory.clement@bootlin.com>
References: <20201106100849.969240-1-gregory.clement@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Ocelots is supported by the generic MIPS build so make it clears that
LEGACY_BOARD_OCELOT is only needed for legacy boards which didn't have
bootloader supporting device tree.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 arch/mips/generic/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/generic/Kconfig b/arch/mips/generic/Kconfig
index 45431b88dded..eb2a3fa9fcd7 100644
--- a/arch/mips/generic/Kconfig
+++ b/arch/mips/generic/Kconfig
@@ -31,7 +31,7 @@ comment "MSCC Ocelot doesn't work with SEAD3 enabled"
 	depends on LEGACY_BOARD_SEAD3
 
 config LEGACY_BOARD_OCELOT
-	bool "Support MSCC Ocelot boards"
+	bool "Legacy support for Ocelot based boards"
 	depends on LEGACY_BOARD_SEAD3=n
 	select LEGACY_BOARDS
 	select SOC_VCOREIII
-- 
2.28.0

