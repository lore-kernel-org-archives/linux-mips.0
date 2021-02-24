Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3D84C433E0
	for <linux-mips@archiver.kernel.org>; Wed, 24 Feb 2021 14:25:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B519D64DFF
	for <linux-mips@archiver.kernel.org>; Wed, 24 Feb 2021 14:25:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235345AbhBXOUK convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@archiver.kernel.org>);
        Wed, 24 Feb 2021 09:20:10 -0500
Received: from aposti.net ([89.234.176.197]:58208 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237757AbhBXNrV (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 24 Feb 2021 08:47:21 -0500
Date:   Wed, 24 Feb 2021 13:44:37 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 0/4] Fixes to bridge/panel and ingenic-drm
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc:     Sam Ravnborg <sam@ravnborg.org>, od@zcrc.me,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
Message-Id: <DUC1PQ.KO33KJE3BP5L@crapouillou.net>
In-Reply-To: <20210124085552.29146-1-paul@crapouillou.net>
References: <20210124085552.29146-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

Some feedback for patches 1-3? Laurent?

Cheers,
-Paul


Le dim. 24 janv. 2021 à 8:55, Paul Cercueil <paul@crapouillou.net> a 
écrit :
> Hi,
> 
> Here are three independent fixes. The first one addresses a
> use-after-free in bridge/panel.c; the second one addresses a
> use-after-free in the ingenic-drm driver; finally, the third one makes
> the ingenic-drm driver work again on older Ingenic SoCs.
> 
> Changes from v2:
> - patch [1/4] added a FIXME.
> - patch [2/4] is new. It introduces a 
> drmm_plain_simple_encoder_alloc()
>   macro that will be used in patch [3/4].
> - patch [3/4] uses the macro introduced in patch [2/4].
> - patch [4/4] is unmodified.
> 
> Note to linux-stable guys: patch [v2 2/3] will only apply on the 
> current
> drm-misc-next branch, to fix it for v5.11 and older kernels, use the 
> V1
> of that patch.
> 
> Cheers,
> -Paul
> 
> Paul Cercueil (4):
>   drm: bridge/panel: Cleanup connector on bridge detach
>   drm/simple_kms_helper: Add macro drmm_plain_simple_encoder_alloc()
>   drm/ingenic: Register devm action to cleanup encoders
>   drm/ingenic: Fix non-OSD mode
> 
>  drivers/gpu/drm/bridge/panel.c            | 12 +++++++++++
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 26 
> +++++++++++------------
>  include/drm/drm_simple_kms_helper.h       | 17 +++++++++++++++
>  3 files changed, 42 insertions(+), 13 deletions(-)
> 
> --
> 2.29.2
> 


