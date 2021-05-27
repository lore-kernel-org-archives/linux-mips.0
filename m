Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FEA0C4707F
	for <linux-mips@archiver.kernel.org>; Thu, 27 May 2021 11:44:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 071F16113B
	for <linux-mips@archiver.kernel.org>; Thu, 27 May 2021 11:44:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234144AbhE0LqN (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Thu, 27 May 2021 07:46:13 -0400
Received: from elvis.franken.de ([193.175.24.41]:51715 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234067AbhE0LqL (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 27 May 2021 07:46:11 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lmERG-0007z5-03; Thu, 27 May 2021 13:44:34 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 293E2C1149; Thu, 27 May 2021 13:43:12 +0200 (CEST)
Date:   Thu, 27 May 2021 13:43:12 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v1 1/3] dt-bindings: vendor-prefixes: Add an entry for
 OpenEmbed
Message-ID: <20210527114312.GD9210@alpha.franken.de>
References: <20210514051743.15248-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210514051743.15248-1-o.rempel@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, May 14, 2021 at 07:17:41AM +0200, Oleksij Rempel wrote:
> Add "openembed" entry for https://www.openembed.com/
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
