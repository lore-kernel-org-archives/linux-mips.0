Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60288C47089
	for <linux-mips@archiver.kernel.org>; Thu, 27 May 2021 23:21:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 40FFD613D4
	for <linux-mips@archiver.kernel.org>; Thu, 27 May 2021 23:21:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236604AbhE0XW6 (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Thu, 27 May 2021 19:22:58 -0400
Received: from aposti.net ([89.234.176.197]:35906 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236593AbhE0XWz (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 27 May 2021 19:22:55 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <mripard@kernel.org>
Cc:     list@opendingux.net, linux-mips@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 01/11] drm/ingenic: Remove dead code
Date:   Fri, 28 May 2021 00:20:55 +0100
Message-Id: <20210527232104.152577-2-paul@crapouillou.net>
In-Reply-To: <20210527232104.152577-1-paul@crapouillou.net>
References: <20210527232104.152577-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The priv->ipu_plane would get a different value further down the code,
without the first assigned value being read first; so the first
assignation can be dropped.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 5244f4763477..93c099e7464d 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -988,9 +988,6 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 	priv->dma_hwdescs->hwdesc_pal.cmd = JZ_LCD_CMD_ENABLE_PAL
 		| (sizeof(priv->dma_hwdescs->palette) / 4);
 
-	if (soc_info->has_osd)
-		priv->ipu_plane = drm_plane_from_index(drm, 0);
-
 	primary = priv->soc_info->has_osd ? &priv->f1 : &priv->f0;
 
 	drm_plane_helper_add(primary, &ingenic_drm_plane_helper_funcs);
-- 
2.30.2

