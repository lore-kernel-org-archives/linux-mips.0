Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73D1EC433F5
	for <linux-mips@archiver.kernel.org>; Tue, 14 Sep 2021 22:40:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5291161178
	for <linux-mips@archiver.kernel.org>; Tue, 14 Sep 2021 22:40:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235693AbhINWlm (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Tue, 14 Sep 2021 18:41:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235464AbhINWll (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 14 Sep 2021 18:41:41 -0400
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [IPv6:2001:67c:2050::465:201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07266C061574;
        Tue, 14 Sep 2021 15:40:23 -0700 (PDT)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [80.241.60.245])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4H8JFy3Q9mzQk4q;
        Wed, 15 Sep 2021 00:40:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hauke-m.de; s=MBO0001;
        t=1631659220;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gOanFGnzd70xddgIbFhvpYypTGbga6lbzZldRrxkK4U=;
        b=KbcUIPaWx3ZU5tAfqJoFx1G6QLdASPBnllZc9tm+FtLw6NX26gymiW9Vx97iVKcK6T0AFo
        iHXkqSNGPJEckM5PVb4/xKJ0E6XAKIG268hALmnBaAusbBF2rsucJqK2Ge5uVojit/TBun
        jpEtcxZhFFyS6HNn1flUZM3zgsSdsd57bhkwN57D6yqe55paNiVLx+BAfY1yp2bImgTJIP
        GrJ7Ib3vJvCAJ9plo99jxh5Wfw+wVMJgYLaXSUwMJ62YvCettsTgM5qPwv4NYEpWz8k4jq
        puPsZ7JkzBepbY11rgamaWq7qfL08vCi17ZGhR5OFDKnG1QIpts/qRJrmsh2+A==
Subject: Re: [PATCH net-next 4/8] MIPS: lantiq: dma: make the burst length
 configurable by the drivers
To:     Aleksander Jan Bajkowski <olek2@wp.pl>, john@phrozen.org,
        tsbogend@alpha.franken.de, maz@kernel.org, ralf@linux-mips.org,
        ralph.hempel@lantiq.com, davem@davemloft.net, kuba@kernel.org,
        robh+dt@kernel.org, dev@kresin.me, arnd@arndb.de, jgg@ziepe.ca,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210914212105.76186-1-olek2@wp.pl>
 <20210914212105.76186-4-olek2@wp.pl>
From:   Hauke Mehrtens <hauke@hauke-m.de>
Message-ID: <5ca6a683-47b2-cb4e-aa79-9005bd55465e@hauke-m.de>
Date:   Wed, 15 Sep 2021 00:40:14 +0200
MIME-Version: 1.0
In-Reply-To: <20210914212105.76186-4-olek2@wp.pl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 4274826F
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 9/14/21 11:21 PM, Aleksander Jan Bajkowski wrote:
> Make the burst length configurable by the drivers.
> 
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>

Acked-by: Hauke Mehrtens <hauke@hauke-m.de>
For all 4 "MIPS: lantiq: dma:" changes.

> ---
>   .../include/asm/mach-lantiq/xway/xway_dma.h   |  2 +-
>   arch/mips/lantiq/xway/dma.c                   | 38 ++++++++++++++++---
>   2 files changed, 34 insertions(+), 6 deletions(-)
> 

The DMA changes are looking good.

There is also a DMA API driver for this IP core now:
https://elixir.bootlin.com/linux/v5.15-rc1/source/drivers/dma/lgm/lgm-dma.c
I do not know if it works fully with these older MIPS SoCs.
Changing the drivers to use the standard DMA API is a bigger change, 
which could be done later.

Hauke
