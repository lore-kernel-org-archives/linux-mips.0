Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FA21C4338F
	for <linux-mips@archiver.kernel.org>; Thu,  5 Aug 2021 19:21:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 882BB61050
	for <linux-mips@archiver.kernel.org>; Thu,  5 Aug 2021 19:21:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242509AbhHETVr (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Thu, 5 Aug 2021 15:21:47 -0400
Received: from aposti.net ([89.234.176.197]:54888 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242592AbhHETVm (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 5 Aug 2021 15:21:42 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     list@opendingux.net, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 2/2] gpu/drm: ingenic: Add workaround for disabled drivers
Date:   Thu,  5 Aug 2021 21:21:09 +0200
Message-Id: <20210805192110.90302-3-paul@crapouillou.net>
In-Reply-To: <20210805192110.90302-1-paul@crapouillou.net>
References: <20210805192110.90302-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

When the drivers of remote devices (e.g. HDMI chip) are disabled in the
config, we want the ingenic-drm driver to be able to probe nonetheless
with the other devices (e.g. internal LCD panel) that are enabled.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index d261f7a03b18..5e1fdbb0ba6b 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -1058,6 +1058,18 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 	for (i = 0; ; i++) {
 		ret = drm_of_find_panel_or_bridge(dev->of_node, 0, i, &panel, &bridge);
 		if (ret) {
+			/*
+			 * Workaround for the case where the drivers for the
+			 * remote devices are not enabled. When that happens,
+			 * drm_of_find_panel_or_bridge() returns -EPROBE_DEFER
+			 * endlessly, which prevents the ingenic-drm driver from
+			 * working at all.
+			 */
+			if (ret == -EPROBE_DEFER) {
+				ret = driver_deferred_probe_check_state(dev);
+				if (ret == -ENODEV || ret == -ETIMEDOUT)
+					continue;
+			}
 			if (ret == -ENODEV)
 				break; /* we're done */
 			if (ret != -EPROBE_DEFER)
-- 
2.30.2

