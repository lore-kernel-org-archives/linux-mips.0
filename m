Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B299C4338F
	for <linux-mips@archiver.kernel.org>; Wed, 11 Aug 2021 17:23:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D9EF60FC3
	for <linux-mips@archiver.kernel.org>; Wed, 11 Aug 2021 17:23:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbhHKRXl (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Wed, 11 Aug 2021 13:23:41 -0400
Received: from aposti.net ([89.234.176.197]:37416 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229484AbhHKRXl (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 11 Aug 2021 13:23:41 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc:     "H . Nikolaus Schaller" <hns@goldelico.com>,
        Paul Boddie <paul@boddie.org.uk>,
        Sam Ravnborg <sam@ravnborg.org>, list@opendingux.net,
        linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 0/6] drm/ingenic: Various improvements v2
Date:   Wed, 11 Aug 2021 19:23:03 +0200
Message-Id: <20210811172309.314287-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

A V2 of my patchset for the ingenic-drm driver.

The patches "drm/ingenic: Remove dead code" and
"drm/ingenic: Use standard drm_atomic_helper_commit_tail"
that were present in V1 have been merged in drm-misc-next,
so they are not in this V2.

Changelog:

[PATCH 1/6]:
    dma_hwdesc_addr() extended to support palette hwdesc. The palette
    hwdesc is now hwdesc[3] to simplify things. Add
    ingenic_drm_configure_hwdesc*() functions to factorize code.

Cheers,
-Paul

Paul Cercueil (6):
  drm/ingenic: Simplify code by using hwdescs array
  drm/ingenic: Add support for private objects
  drm/ingenic: Move IPU scale settings to private state
  drm/ingenic: Set DMA descriptor chain register when starting CRTC
  drm/ingenic: Upload palette before frame
  drm/ingenic: Attach bridge chain to encoders

 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 278 +++++++++++++++++-----
 drivers/gpu/drm/ingenic/ingenic-ipu.c     | 127 ++++++++--
 2 files changed, 333 insertions(+), 72 deletions(-)

-- 
2.30.2

