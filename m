Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B46EEC6379D
	for <linux-mips@archiver.kernel.org>; Wed, 18 Nov 2020 10:26:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2BE8A22227
	for <linux-mips@archiver.kernel.org>; Wed, 18 Nov 2020 10:26:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727599AbgKRK0A (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Wed, 18 Nov 2020 05:26:00 -0500
Received: from elvis.franken.de ([193.175.24.41]:41015 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726077AbgKRK0A (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 18 Nov 2020 05:26:00 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kfKer-00027K-00; Wed, 18 Nov 2020 11:25:49 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 03591C021C; Wed, 18 Nov 2020 09:55:57 +0100 (CET)
Date:   Wed, 18 Nov 2020 09:55:57 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     =?utf-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>
Cc:     robh+dt@kernel.org, paul@crapouillou.net,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, ak@linux.intel.com, krzk@kernel.org,
        ebiederm@xmission.com, hns@goldelico.com, paulburton@kernel.org,
        nixiaoming@huawei.com, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        yanfei.li@ingenic.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com
Subject: Re: [PATCH v2 0/2] Add missing nodes and refresh defconfig for
 Ingenic SoCs based boards.
Message-ID: <20201118085557.GA8140@alpha.franken.de>
References: <20201116175508.51943-1-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201116175508.51943-1-zhouyanjie@wanyeetech.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Nov 17, 2020 at 01:55:06AM +0800, 周琰杰 (Zhou Yanjie) wrote:
> v1->v2:
> 1.Add the otg_power node for otg_phy's vcc_supply.
> 2.Move assigned-clocks in the otg node into the cgu node.
> 3.Move the position of the SSI node.
> 4.Select CONFIG_JZ4780_EFUSE as default.
> 
> 周琰杰 (Zhou Yanjie) (2):
>   MIPS: Ingenic: Add missing nodes for Ingenic SoCs and boards.
>   MIPS: Ingenic: Refresh defconfig for Ingenic SoCs based boards.
> 
>  arch/mips/boot/dts/ingenic/ci20.dts       | 45 +++++++++++++++++++--
>  arch/mips/boot/dts/ingenic/cu1000-neo.dts | 62 ++++++++++++++++++++++++++---
>  arch/mips/boot/dts/ingenic/cu1830-neo.dts | 66 ++++++++++++++++++++++++++++---
>  arch/mips/boot/dts/ingenic/jz4780.dtsi    | 45 ++++++++++++++++++++-
>  arch/mips/boot/dts/ingenic/x1000.dtsi     | 56 +++++++++++++++++++++++++-
>  arch/mips/boot/dts/ingenic/x1830.dtsi     | 58 ++++++++++++++++++++++++++-
>  arch/mips/configs/ci20_defconfig          | 15 ++++++-
>  arch/mips/configs/cu1000-neo_defconfig    | 28 ++++++++++---
>  arch/mips/configs/cu1830-neo_defconfig    | 32 +++++++++++----
>  9 files changed, 374 insertions(+), 33 deletions(-)

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
