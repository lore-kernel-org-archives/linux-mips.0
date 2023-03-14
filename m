Return-Path: <linux-mips-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3088C74A4B
	for <linux-mips@archiver.kernel.org>; Tue, 14 Mar 2023 16:27:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230140AbjCNQ1Q (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Tue, 14 Mar 2023 12:27:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230131AbjCNQ1K (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 14 Mar 2023 12:27:10 -0400
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7920186DCE
        for <linux-mips@vger.kernel.org>; Tue, 14 Mar 2023 09:26:58 -0700 (PDT)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1pc7UG-00048S-04; Tue, 14 Mar 2023 17:26:56 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 3BB58C131B; Tue, 14 Mar 2023 17:21:55 +0100 (CET)
Date:   Tue, 14 Mar 2023 17:21:55 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Hauke Mehrtens <hauke@hauke-m.de>, linux-mips@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH] MIPS: BCM47XX: Add support for Huawei B593u-12
Message-ID: <20230314162155.GE18446@alpha.franken.de>
References: <20230227080911.15039-1-zajec5@gmail.com>
 <7731bf3a-b9ce-9020-6d6d-a13d39a9088c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7731bf3a-b9ce-9020-6d6d-a13d39a9088c@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Feb 28, 2023 at 01:54:30PM -0800, Florian Fainelli wrote:
> 
> 
> On 2/27/2023 12:09 AM, Rafał Miłecki wrote:
> > From: Rafał Miłecki <rafal@milecki.pl>
> > 
> > It's a BCM5358 based home router. One of very few bcm47xx devices with
> > cellular modems (here: LTE).
> > 
> > Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> 
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
> -- 
> Florian

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
