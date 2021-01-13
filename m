Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7AF7C433E6
	for <linux-mips@archiver.kernel.org>; Wed, 13 Jan 2021 10:45:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A20E722D58
	for <linux-mips@archiver.kernel.org>; Wed, 13 Jan 2021 10:45:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727633AbhAMKor (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Wed, 13 Jan 2021 05:44:47 -0500
Received: from elvis.franken.de ([193.175.24.41]:47752 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727324AbhAMKoq (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 13 Jan 2021 05:44:46 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kzddE-00021m-04; Wed, 13 Jan 2021 11:44:04 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id E3415C02B1; Wed, 13 Jan 2021 11:09:16 +0100 (CET)
Date:   Wed, 13 Jan 2021 11:09:16 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Aleksander Jan Bajkowski <olek2@wp.pl>
Cc:     robh+dt@kernel.org, john@phrozen.org, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mips: lantiq: Document Lantiq Xway PMU
 bindings
Message-ID: <20210113100916.GE10351@alpha.franken.de>
References: <20201231163153.4512-1-olek2@wp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201231163153.4512-1-olek2@wp.pl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Dec 31, 2020 at 05:31:53PM +0100, Aleksander Jan Bajkowski wrote:
> Document the Lantiq Xway SoC series Power Management Unit (PMU) bindings.
> 
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
>  .../bindings/mips/lantiq/lantiq,pmu.yaml      | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mips/lantiq/lantiq,pmu.yaml

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
