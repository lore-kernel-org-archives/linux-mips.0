Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27853C433DB
	for <linux-mips@archiver.kernel.org>; Sat, 23 Jan 2021 14:11:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EA80122C9F
	for <linux-mips@archiver.kernel.org>; Sat, 23 Jan 2021 14:11:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725883AbhAWOLm (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Sat, 23 Jan 2021 09:11:42 -0500
Received: from aposti.net ([89.234.176.197]:60846 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725769AbhAWOLi (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 23 Jan 2021 09:11:38 -0500
From:   Paul Cercueil <paul@crapouillou.net>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc:     od@zcrc.me, Christophe Branchereau <cbranchereau@gmail.com>,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 2/3] ASoC: codec/ingenic: Depend on MACH_INGENIC
Date:   Sat, 23 Jan 2021 14:09:57 +0000
Message-Id: <20210123140958.12895-2-paul@crapouillou.net>
In-Reply-To: <20210123140958.12895-1-paul@crapouillou.net>
References: <20210123140958.12895-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

No need to show the options to build Ingenic-specific drivers on all
MIPS kernel configurations if Ingenic SoCs support is not enabled.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 sound/soc/codecs/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 9bf6bfdaf11e..7c66fda7fa2b 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -712,7 +712,7 @@ config SND_SOC_CX2072X
 	  Enable support for Conexant CX20721 and CX20723 codec chips.
 
 config SND_SOC_JZ4740_CODEC
-	depends on MIPS || COMPILE_TEST
+	depends on MACH_INGENIC || COMPILE_TEST
 	depends on OF
 	select REGMAP_MMIO
 	tristate "Ingenic JZ4740 internal CODEC"
@@ -724,7 +724,7 @@ config SND_SOC_JZ4740_CODEC
 	  will be called snd-soc-jz4740-codec.
 
 config SND_SOC_JZ4725B_CODEC
-	depends on MIPS || COMPILE_TEST
+	depends on MACH_INGENIC || COMPILE_TEST
 	depends on OF
 	select REGMAP
 	tristate "Ingenic JZ4725B internal CODEC"
@@ -736,7 +736,7 @@ config SND_SOC_JZ4725B_CODEC
 	  will be called snd-soc-jz4725b-codec.
 
 config SND_SOC_JZ4770_CODEC
-	depends on MIPS || COMPILE_TEST
+	depends on MACH_INGENIC || COMPILE_TEST
 	depends on OF
 	select REGMAP
 	tristate "Ingenic JZ4770 internal CODEC"
-- 
2.29.2

