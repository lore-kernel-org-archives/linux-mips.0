Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40B66C433DB
	for <linux-mips@archiver.kernel.org>; Mon, 28 Dec 2020 10:52:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 04BA222583
	for <linux-mips@archiver.kernel.org>; Mon, 28 Dec 2020 10:52:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727086AbgL1Kwx (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Mon, 28 Dec 2020 05:52:53 -0500
Received: from elvis.franken.de ([193.175.24.41]:43079 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727030AbgL1Kwx (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 28 Dec 2020 05:52:53 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1ktq8K-00054l-02; Mon, 28 Dec 2020 11:52:12 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id CC49EC0565; Mon, 28 Dec 2020 11:51:51 +0100 (CET)
Date:   Mon, 28 Dec 2020 11:51:51 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Lauri Kasanen <cand@gmx.com>
Cc:     linux-mips@vger.kernel.org
Subject: Re: [PATCH 1/6] Revert "MIPS: Remove unused R4300 CPU support"
Message-ID: <20201228105151.GC3606@alpha.franken.de>
References: <20201225185946.d67607fe16e324c56f9a2f46@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201225185946.d67607fe16e324c56f9a2f46@gmx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Dec 25, 2020 at 06:59:46PM +0200, Lauri Kasanen wrote:
> This reverts commit f9065b54d437c4660e3d974ad9ce5188c068cd76.

Please add a reason for the revert. It's clear when looking at your
series, but not from pure looking later via git at this commit.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
