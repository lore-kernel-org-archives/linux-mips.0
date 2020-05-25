Return-Path: <SRS0=tUeC=7H=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24C2DC433E0
	for <linux-mips@archiver.kernel.org>; Mon, 25 May 2020 13:37:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0A882207C3
	for <linux-mips@archiver.kernel.org>; Mon, 25 May 2020 13:37:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390781AbgEYNhf (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Mon, 25 May 2020 09:37:35 -0400
Received: from elvis.franken.de ([193.175.24.41]:38392 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388794AbgEYNhf (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 25 May 2020 09:37:35 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jdDIM-0007yZ-00; Mon, 25 May 2020 15:37:34 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id B5F02C0261; Mon, 25 May 2020 15:29:31 +0200 (CEST)
Date:   Mon, 25 May 2020 15:29:31 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Daniel =?iso-8859-1?Q?Gonz=E1lez?= Cabanelas <dgcbueu@gmail.com>
Cc:     f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: BCM63XX: fix BCM6358 GPIO count
Message-ID: <20200525132931.GA12983@alpha.franken.de>
References: <4452917.ZOZUicq8Ig@tool>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4452917.ZOZUicq8Ig@tool>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, May 24, 2020 at 08:59:53PM +0200, Daniel González Cabanelas wrote:
> The BCM6358 SoC has only 38 available GPIOs. Fix it.
> 
> Signed-off-by: Daniel González Cabanelas <dgcbueu@gmail.com>
> ---
>  arch/mips/include/asm/mach-bcm63xx/bcm63xx_gpio.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
