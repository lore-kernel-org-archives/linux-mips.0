Return-Path: <SRS0=MUgy=DE=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E711C4346E
	for <linux-mips@archiver.kernel.org>; Sun, 27 Sep 2020 09:11:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 45A4E23998
	for <linux-mips@archiver.kernel.org>; Sun, 27 Sep 2020 09:11:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726412AbgI0JLR (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Sun, 27 Sep 2020 05:11:17 -0400
Received: from elvis.franken.de ([193.175.24.41]:59884 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726387AbgI0JLQ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 27 Sep 2020 05:11:16 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kMShv-0001nG-00; Sun, 27 Sep 2020 11:10:59 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id CFAAAC1021; Sun, 27 Sep 2020 11:03:40 +0200 (CEST)
Date:   Sun, 27 Sep 2020 11:03:40 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     =?utf-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>
Cc:     robh+dt@kernel.org, paul@crapouillou.net, paulburton@kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, jiaxun.yang@flygoat.com,
        Sergey.Semin@baikalelectronics.ru, akpm@linux-foundation.org,
        rppt@kernel.org, dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, yanfei.li@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Subject: Re: [PATCH v3 0/3] Repair Ingenic SoCs L2 cache capacity detection.
Message-ID: <20200927090340.GA4929@alpha.franken.de>
References: <20200922012444.44089-1-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200922012444.44089-1-zhouyanjie@wanyeetech.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Sep 22, 2020 at 09:24:41AM +0800, 周琰杰 (Zhou Yanjie) wrote:
> 1.The X1000E SoC has a 4-way L2 cache with a capacity of 128 KiB.
>   The current code cannot detect its correctly, which will cause the
>   CU1000-Neo board using the X1000E SoC to report that it has found
>   a 5-way 320KiB L2 cache at boot time.
> 2.The JZ4775 SoC has a 4-way L2 cache with a capacity of 256 KiB.
>   The current code cannot detect its correctly, which will cause the
>   Mensa board using the JZ4775 SoC to report that it has found a 5-way
>   320KiB L2 cache at boot time.
> 
> This series of patches is to fix this problem.
> 
> v2->v3:
> Fix the warning that appears when running checkpatch, add relevant
> compatible string.
> 
> 周琰杰 (Zhou Yanjie) (3):
>   dt-bindings: MIPS: Add X2000E based CU2000-Neo.
>   MIPS: Ingenic: Add system type for new Ingenic SoCs.
>   MIPS: Ingenic: Fix bugs when detecting L2 cache of JZ4775 and X1000E.
> 
>  Documentation/devicetree/bindings/mips/ingenic/devices.yaml |  5 +++++
>  arch/mips/generic/board-ingenic.c                           | 12 ++++++++++++
>  arch/mips/include/asm/bootinfo.h                            |  2 ++
>  arch/mips/mm/sc-mips.c                                      |  2 ++
>  4 files changed, 21 insertions(+)

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
