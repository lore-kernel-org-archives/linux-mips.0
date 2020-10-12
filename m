Return-Path: <SRS0=bvV5=DT=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 926D8C43457
	for <linux-mips@archiver.kernel.org>; Mon, 12 Oct 2020 10:38:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 42A8D20E65
	for <linux-mips@archiver.kernel.org>; Mon, 12 Oct 2020 10:38:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387669AbgJLKik (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Mon, 12 Oct 2020 06:38:40 -0400
Received: from elvis.franken.de ([193.175.24.41]:58417 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387569AbgJLKiS (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 12 Oct 2020 06:38:18 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kRvDc-0008KW-06; Mon, 12 Oct 2020 12:38:16 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 39336C1140; Mon, 12 Oct 2020 12:31:43 +0200 (CEST)
Date:   Mon, 12 Oct 2020 12:31:43 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: cpu-probe: remove MIPS_CPU_BP_GHIST option bit
Message-ID: <20201012103143.GF7765@alpha.franken.de>
References: <20201009122649.85490-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201009122649.85490-1-tsbogend@alpha.franken.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Oct 09, 2020 at 02:26:48PM +0200, Thomas Bogendoerfer wrote:
> MIPS_CPU_BP_GHIST is only set two times and more or less immediately
> used in cpu-probe.c itself. Remove this option to make room in options
> word.
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>  arch/mips/include/asm/cpu-features.h                      |  3 ---
>  arch/mips/include/asm/cpu.h                               |  1 -
>  arch/mips/include/asm/mach-au1x00/cpu-feature-overrides.h |  1 -
>  arch/mips/kernel/cpu-probe.c                              | 10 ++++------
>  4 files changed, 4 insertions(+), 11 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
