Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B60A3C4708D
	for <linux-mips@archiver.kernel.org>; Thu, 27 May 2021 23:21:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 88A3C613D4
	for <linux-mips@archiver.kernel.org>; Thu, 27 May 2021 23:21:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234964AbhE0XWt (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Thu, 27 May 2021 19:22:49 -0400
Received: from aposti.net ([89.234.176.197]:35876 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236567AbhE0XWs (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 27 May 2021 19:22:48 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <mripard@kernel.org>
Cc:     list@opendingux.net, linux-mips@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 00/11] ingenic-drm cleanups and doublescan feature
Date:   Fri, 28 May 2021 00:20:54 +0100
Message-Id: <20210527232104.152577-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

Here is a set of 11 patches for the ingenic-drm driver.

Patches 1-7 are mostly generic cleanups, which will grease up the way
for bigger changes to be introduced.

Patch 3 adds support for a private state structure, which is then used
to store state-specific information, which was previously stored in the
driver's private structure directly.

Patch 10 is the big one; it adds a double-scan feature emulated with DMA
descriptors. This trick makes it possible to support a handful of boards
which have strange panels with non-square pixels (320x480 4:3).

Patch 11 updates the driver to support one top-level bridge per encoder,
as it seems to be the norm now.

Cheers,
-Paul

Paul Cercueil (11):
  drm/ingenic: Remove dead code
  drm/ingenic: Simplify code by using hwdescs array
  drm/ingenic: Add support for private objects
  drm/ingenic: Move no_vblank to private state
  drm/ingenic: Move IPU scale settings to private state
  drm/ingenic: Set DMA descriptor chain register when starting CRTC
  drm/ingenic: Upload palette before frame
  drm/ingenic: Support custom GEM object
  drm/ingenic: Add ingenic_drm_gem_fb_destroy() function
  drm/ingenic: Add doublescan feature
  drm/ingenic: Attach bridge chain to encoders

 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 414 ++++++++++++++++++----
 drivers/gpu/drm/ingenic/ingenic-ipu.c     | 127 ++++++-
 2 files changed, 458 insertions(+), 83 deletions(-)

-- 
2.30.2

