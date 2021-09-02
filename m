Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C430DC432BE
	for <linux-mips@archiver.kernel.org>; Thu,  2 Sep 2021 09:27:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A4F41610A1
	for <linux-mips@archiver.kernel.org>; Thu,  2 Sep 2021 09:27:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245489AbhIBJ2I (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Thu, 2 Sep 2021 05:28:08 -0400
Received: from elvis.franken.de ([193.175.24.41]:60767 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245378AbhIBJ2H (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 2 Sep 2021 05:28:07 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1mLizz-0001ZP-00; Thu, 02 Sep 2021 11:27:07 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id BF8E2C0955; Thu,  2 Sep 2021 11:03:24 +0200 (CEST)
Date:   Thu, 2 Sep 2021 11:03:24 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     Rob Herring <robh@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>
Subject: Re: [PATCH v1] MIPS: Malta: fix alignment of the devicetree buffer
Message-ID: <20210902090324.GA6429@alpha.franken.de>
References: <20210902071951.28722-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210902071951.28722-1-o.rempel@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Sep 02, 2021 at 09:19:51AM +0200, Oleksij Rempel wrote:
> Starting with following patch MIPS Malta is not able to boot:
> | commit 79edff12060fe7772af08607eff50c0e2486c5ba
> | Author: Rob Herring <robh@kernel.org>
> | scripts/dtc: Update to upstream version v1.6.0-51-g183df9e9c2b9
> 
> The reason is the alignment test added to the fdt_ro_probe_(). To fix
> this issue, we need to make sure that fdt_buf is aligned.
> 
> Since the dtc patch was designed to uncover potential issue, I handle
> initial MIPS Malta patch as initial bug.
> 
> Fixes: e81a8c7dabac ("MIPS: Malta: Setup RAM regions via DT")
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  arch/mips/mti-malta/malta-dtshim.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
