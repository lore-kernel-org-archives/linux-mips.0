Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B06D3C4338F
	for <linux-mips@archiver.kernel.org>; Sun,  8 Aug 2021 13:45:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9267B60FC1
	for <linux-mips@archiver.kernel.org>; Sun,  8 Aug 2021 13:45:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231503AbhHHNqI (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Sun, 8 Aug 2021 09:46:08 -0400
Received: from aposti.net ([89.234.176.197]:55764 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231466AbhHHNqI (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 8 Aug 2021 09:46:08 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc:     "H . Nikolaus Schaller" <hns@goldelico.com>,
        Paul Boddie <paul@boddie.org.uk>, list@opendingux.net,
        Sam Ravnborg <sam@ravnborg.org>, linux-mips@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 0/8] gpu/drm: ingenic-drm: Various improvements
Date:   Sun,  8 Aug 2021 15:45:18 +0200
Message-Id: <20210808134526.119198-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

This patchset rework the ingenic-drm driver, improving the code in
various places.

The most important change is the last patch, which updates the
ingenic-drm driver to use a top-level bridge per output, making use of
the bus format and flag negociation implemented in the bridge code. All
the external bridges are now attached with
DRM_BRIDGE_ATTACH_NO_CONNECTOR.

Cheers,
-Paul

Paul Cercueil (8):
  drm/ingenic: Remove dead code
  drm/ingenic: Simplify code by using hwdescs array
  drm/ingenic: Use standard drm_atomic_helper_commit_tail
  drm/ingenic: Add support for private objects
  drm/ingenic: Move IPU scale settings to private state
  drm/ingenic: Set DMA descriptor chain register when starting CRTC
  drm/ingenic: Upload palette before frame
  drm/ingenic: Attach bridge chain to encoders

 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 287 ++++++++++++++++------
 drivers/gpu/drm/ingenic/ingenic-ipu.c     | 127 ++++++++--
 2 files changed, 322 insertions(+), 92 deletions(-)

-- 
2.30.2

