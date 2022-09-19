Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D29B2C6FA93
	for <linux-mips@archiver.kernel.org>; Mon, 19 Sep 2022 14:51:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229932AbiISOvL (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Mon, 19 Sep 2022 10:51:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbiISOvI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 19 Sep 2022 10:51:08 -0400
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D59D03334D;
        Mon, 19 Sep 2022 07:51:03 -0700 (PDT)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1oaI6u-0005ft-02; Mon, 19 Sep 2022 16:51:00 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 32702C12F2; Mon, 19 Sep 2022 16:48:14 +0200 (CEST)
Date:   Mon, 19 Sep 2022 16:48:14 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Lin Yujun <linyujun809@huawei.com>
Cc:     christophe.jaillet@wanadoo.fr, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] MIPS: SGI-IP30: Fix platform-device leak in
 bridge_platform_create()
Message-ID: <20220919144814.GB7674@alpha.franken.de>
References: <20220914032807.96793-1-linyujun809@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220914032807.96793-1-linyujun809@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Sep 14, 2022 at 11:28:07AM +0800, Lin Yujun wrote:
> In error case in bridge_platform_create after calling
> platform_device_add()/platform_device_add_data()/
> platform_device_add_resources(), release the failed
> 'pdev' or it will be leak, call platform_device_put()
> to fix this problem.
> 
> Besides, 'pdev' is divided into 'pdev_wd' and 'pdev_bd',
> use platform_device_unregister() to release sgi_w1
> resources when xtalk-bridge registration fails.
> 
> Fixes: fd27234f24ae ("MIPS: add support for SGI Octane (IP30)")
> Signed-off-by: Lin Yujun <linyujun809@huawei.com>
> ---
>  arch/mips/sgi-ip30/ip30-xtalk.c | 70 +++++++++++++++++++++++----------
>  1 file changed, 50 insertions(+), 20 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
