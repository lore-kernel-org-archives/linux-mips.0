Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A91A1C433DB
	for <linux-mips@archiver.kernel.org>; Tue, 30 Mar 2021 13:00:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 893B2619C9
	for <linux-mips@archiver.kernel.org>; Tue, 30 Mar 2021 13:00:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231622AbhC3NAY (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Tue, 30 Mar 2021 09:00:24 -0400
Received: from mail-40136.protonmail.ch ([185.70.40.136]:55911 "EHLO
        mail-40136.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232138AbhC3NAS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 30 Mar 2021 09:00:18 -0400
Date:   Tue, 30 Mar 2021 12:59:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
        s=protonmail3; t=1617109216;
        bh=nQumvZO7k2adxWbuuWRUUjrAO0hDimI1WyGmzZ72k6Y=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=MXEFZuKv9U1YOGPmBHoOT1TB7fu7j1AXDA20G3PQzfLp1iei5Diip2TDX2yZDLwtg
         tXfYzD/Rsk0PXApszamq4O4HVVjHSeRbSbZb6v4/Z9A9/33mIflziROwyxbT0LPDcE
         YoLZvbgqDlS8jINRANGrVJnEOa46QKDPNZOJyEUk4H8Mwg2UmIWOZZJLJ7iN2LDsbt
         BWJOuH8q4lj0Pjj7f7j3BNcFX38hU12lEXdIjcY/Jd+Zv0XTR5QlAv4CiMYbpCSsc7
         Dnfv7n4LFoe3xLAN/0JgBH2S7H95LAG42GL6pduD0lUEcmlEs8s5Lyrn7qYwYFEH+G
         R47kopOnny1nQ==
To:     Paul Cercueil <paul@crapouillou.net>
From:   Simon Ser <contact@emersion.fr>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sam Ravnborg <sam@ravnborg.org>, od@zcrc.me,
        linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Reply-To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 1/2] drm/ingenic: Switch IPU plane to type OVERLAY
Message-ID: <X2G0dUjYzRbISgSRQgMfjkybzYl-AXZR8nUGHdzBk6Wi_aQFCiir_c9fmBM2fV9N9FIxYl5emBtyGrDk0AfpFx4RRNys4Grco3CKsNZsxPU=@emersion.fr>
In-Reply-To: <GC6SQQ.1R937FBY9A9A1@crapouillou.net>
References: <20210329175046.214629-1-paul@crapouillou.net> <20210329175046.214629-2-paul@crapouillou.net> <BH3N8QICMyp64pmUQyXLwYMnCNBvXxThwvKJIOmyMU0XIgTtorcGd7s7AjnIFXQrLGEoJMuvPcWTiv38syiYOTCDv-bSxswFBX6y3UYqTwE=@emersion.fr> <GC6SQQ.1R937FBY9A9A1@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tuesday, March 30th, 2021 at 1:53 PM, Paul Cercueil <paul@crapouillou.ne=
t> wrote:

> > I don't know about this driver but=E2=80=A6 is this really the same as =
the
> > previous
> > condition? The previous condition would match two planes, this one
> > seems to
> > match only a single plane. What am I missing?
>
> There are three planes, which we will call here f0, f1, and ipu.
> Previously, the "plane->type =3D=3D DRM_PLANE_TYPE_PRIMARY" matched f1 an=
d
> ipu. Since ipu is now OVERLAY we have to change the condition or the
> behaviour will be different, as otherwise it would only match the f1
> plane.

Oh okay, I thought f0 was one of the primary planes, but it's not.
Thanks for the explanation.

For the user-space visible change:

Acked-by: Simon Ser <contact@emersion.fr>
