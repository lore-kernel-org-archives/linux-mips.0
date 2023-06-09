Return-Path: <linux-mips-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D9CDC7EE25
	for <linux-mips@archiver.kernel.org>; Fri,  9 Jun 2023 11:10:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239280AbjFILKm (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Fri, 9 Jun 2023 07:10:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231182AbjFILKT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 9 Jun 2023 07:10:19 -0400
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8A0692113;
        Fri,  9 Jun 2023 04:10:18 -0700 (PDT)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1q7a0U-0005gn-00; Fri, 09 Jun 2023 13:10:14 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 9781DC02F4; Fri,  9 Jun 2023 12:24:28 +0200 (CEST)
Date:   Fri, 9 Jun 2023 12:24:28 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] mips: dts: ralink: mt7628a: Unify pinctrl-single pin
 group nodes
Message-ID: <20230609102428.GA12327@alpha.franken.de>
References: <20230523065959.15831-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230523065959.15831-1-tony@atomide.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, May 23, 2023 at 09:59:58AM +0300, Tony Lindgren wrote:
> We want to unify the pinctrl-single pin group nodes to use naming "pins".
> Otherwise non-standad pin group names will add make dtbs checks errors
> when the pinctrl-single yaml binding gets merged.
> 
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  arch/mips/boot/dts/ralink/mt7628a.dtsi | 40 +++++++++++++-------------

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
