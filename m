Return-Path: <linux-mips-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D208C7EE25
	for <linux-mips@archiver.kernel.org>; Fri,  9 Jun 2023 09:21:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240740AbjFIJVK (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Fri, 9 Jun 2023 05:21:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240847AbjFIJUm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 9 Jun 2023 05:20:42 -0400
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B9B5C5B88;
        Fri,  9 Jun 2023 02:15:26 -0700 (PDT)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1q7XQE-0004Jv-0A; Fri, 09 Jun 2023 10:24:38 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id AC28EC02EE; Fri,  9 Jun 2023 10:23:48 +0200 (CEST)
Date:   Fri, 9 Jun 2023 10:23:48 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, list@opendingux.net
Subject: Re: [PATCH 0/9] MIPS: CI20: Add WiFi / Bluetooth support
Message-ID: <20230609082348.GK8160@alpha.franken.de>
References: <20230604145642.200577-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230604145642.200577-1-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Jun 04, 2023 at 04:56:33PM +0200, Paul Cercueil wrote:
> Hi,
> 
> Here's a set of patches to add support for the WiFi / Bluetooth chip on
> the CI20.
> 
> WiFi works pretty well, provided it is used with the latest firmware
> provided by linux-firmware. Bluetooth does not work very well here, as
> I cannot get my wireless keyboard to pair; but it does detect it, and it
> does see they key presses when I type the pairing code.
> 
> I only tested with a somewhat recent (~2022) Buildroot-based userspace.
> I enabled WEXT compatibility because the CI20 is typically used with a
> very old userspace, but I did not try to use it with old tools like
> ifconfig/iwconfig.
> 
> Cheers,
> -Paul
> 
> Paul Cercueil (9):
>   MIPS: DTS: CI20: Fix regulators
>   MIPS: DTS: CI20: Fix ACT8600 regulator node names
>   MIPS: DTS: CI20: Add parent supplies to ACT8600 regulators
>   MIPS: DTS: CI20: Do not force-enable CIM and WiFi regulators
>   MIPS: DTS: CI20: Misc. cleanups
>   MIPS: DTS: CI20: Parent MSCMUX clock to MPLL
>   MIPS: DTS: CI20: Enable support for WiFi / Bluetooth
>   MIPS: configs: CI20: Regenerate defconfig
>   MIPS: configs: CI20: Enable WiFi / Bluetooth
> 
>  arch/mips/boot/dts/ingenic/ci20.dts | 148 +++++++++++++++++++---------
>  arch/mips/configs/ci20_defconfig    |  47 ++++++---
>  2 files changed, 133 insertions(+), 62 deletions(-)
> 
> -- 
> 2.39.2

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
