Return-Path: <linux-mips-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2618C001E0
	for <linux-mips@archiver.kernel.org>; Fri, 28 Jul 2023 09:50:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233594AbjG1JuS (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Fri, 28 Jul 2023 05:50:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234538AbjG1JuO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 28 Jul 2023 05:50:14 -0400
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8F9BD35A9;
        Fri, 28 Jul 2023 02:50:05 -0700 (PDT)
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
        id 1qPK6l-0004ge-00; Fri, 28 Jul 2023 11:50:03 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 8A29BC01D0; Fri, 28 Jul 2023 11:48:44 +0200 (CEST)
Date:   Fri, 28 Jul 2023 11:48:44 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Rob Herring <robh@kernel.org>
Cc:     John Crispin <john@phrozen.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: More explicit DT include clean-ups
Message-ID: <ZMOO/AIP25sxRXHY@alpha.franken.de>
References: <20230727012040.3934021-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230727012040.3934021-1-robh@kernel.org>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jul 26, 2023 at 07:20:39PM -0600, Rob Herring wrote:
> A couple more clean-ups in the MIPS code.
> 
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it was merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> I've now built all MIPS defconfigs in my tree which removes the implicit
> includes. So I found a few more fixes. This can be squashed into the
> previous commit if desired.
> ---
>  arch/mips/cavium-octeon/octeon-platform.c | 2 ++
>  arch/mips/cavium-octeon/octeon-usb.c      | 2 ++
>  arch/mips/ralink/ill_acc.c                | 2 ++
>  3 files changed, 6 insertions(+)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
