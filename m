Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D87DBC4320A
	for <linux-mips@archiver.kernel.org>; Tue,  3 Aug 2021 21:40:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9566B61107
	for <linux-mips@archiver.kernel.org>; Tue,  3 Aug 2021 21:40:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232384AbhHCVkR (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Tue, 3 Aug 2021 17:40:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:52432 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232768AbhHCVkR (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 3 Aug 2021 17:40:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id B78356105A;
        Tue,  3 Aug 2021 21:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628026805;
        bh=SeBOOVHqpljrUUPRiBqGRbCd5MLXu2hyxG7yH/9GdRg=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=PUTLJEAU5NnlnMjY0log4ZdM+Oze7MSCYldrQxn3dhX19P4q7egfbfFb8c4K03KlP
         4DPXmhn1Yv9caKQIH+hxQra8GOjU3R1sLDbsQlljwXV+Py80oklQAeDSTfzHk6A6ZD
         eq0XXtdSQhMMbaN6I8lQSGaBvuCyE1cJhQbQbVSfWMyR7C/m5OBNqDFaxKFbKtnUIO
         aZpybB7Yb7uVZbCvBnN0igzR/WW8dwM2Uns8QxdCT2n8xgBX3ciWfFmYeaNqlCf6YT
         pp3A/IHQ2211VU57WXTrNudlWVwaYRGQ4t/ffjqVB7uGl/+OnHs8I6GUtd2VSFvP6C
         Hiu6OSNqlrIaA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net 1/1] net: dsa: qca: ar9331: reorder MDIO write sequence
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <162802680570.18812.8483353906615372549.git-patchwork-notify@kernel.org>
Date:   Tue, 03 Aug 2021 21:40:05 +0000
References: <20210803063746.3600-1-o.rempel@pengutronix.de>
In-Reply-To: <20210803063746.3600-1-o.rempel@pengutronix.de>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     andrew@lunn.ch, vivien.didelot@gmail.com, f.fainelli@gmail.com,
        olteanv@gmail.com, davem@davemloft.net, kuba@kernel.org,
        linux@armlinux.org.uk, kernel@pengutronix.de,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (refs/heads/master):

On Tue,  3 Aug 2021 08:37:46 +0200 you wrote:
> In case of this switch we work with 32bit registers on top of 16bit
> bus. Some registers (for example access to forwarding database) have
> trigger bit on the first 16bit half of request and the result +
> configuration of request in the second half. Without this patch, we would
> trigger database operation and overwrite result in one run.
> 
> To make it work properly, we should do the second part of transfer
> before the first one is done.
> 
> [...]

Here is the summary with links:
  - [net,1/1] net: dsa: qca: ar9331: reorder MDIO write sequence
    https://git.kernel.org/netdev/net/c/d1a58c013a58

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


