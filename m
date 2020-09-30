Return-Path: <SRS0=h9v5=DH=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1EA1C4727E
	for <linux-mips@archiver.kernel.org>; Wed, 30 Sep 2020 13:23:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7D49020754
	for <linux-mips@archiver.kernel.org>; Wed, 30 Sep 2020 13:23:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729767AbgI3NXt (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Wed, 30 Sep 2020 09:23:49 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:40492 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728232AbgI3NXs (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 30 Sep 2020 09:23:48 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id F0ECF803086A;
        Wed, 30 Sep 2020 13:23:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id BtZmEDqfdmd8; Wed, 30 Sep 2020 16:23:46 +0300 (MSK)
Date:   Wed, 30 Sep 2020 16:23:45 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
CC:     Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Vadim Vlasov <V.Vlasov@baikalelectronics.ru>,
        "Maciej W . Rozycki" <macro@linux-mips.org>,
        <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/2] mips: Introduce some IO-accessors optimizations
Message-ID: <20200930132345.kcgbzjv7kg6475va@mobilestation>
References: <20200920110010.16796-1-Sergey.Semin@baikalelectronics.ru>
 <20200929211232.t4yw2d33jokmzb4i@mobilestation>
 <20200930101532.GA17271@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200930101532.GA17271@alpha.franken.de>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Sep 30, 2020 at 12:15:32PM +0200, Thomas Bogendoerfer wrote:
> On Wed, Sep 30, 2020 at 12:12:32AM +0300, Serge Semin wrote:
> > Thomas,
> > Any comment on the series? The changes aren't that comprehensive, so it would
> > be great to merge it in before the 5.10 merge window is opened.
> 
> for the both patches there is no user for it, so I don't see a reason
> to apply it.

@Thomas. I see your point. I'll merge them into my repo with Baikal-T1 CSP/BSP
patches and will deliver all at once when the kernel is ready to accept the
changes (most likely in 3 - 5 months).

@Jiaxun, if you've any hardware which for sure supports the strong UC
ordering, feel free to submit a patchset which activates the proposed here
config together with my STRONG_UC_ORDERING-alteration applied before your
changes.

-Sergey

> 
> Thomas.
> 
> -- 
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]
