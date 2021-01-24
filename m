Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A9DEC433DB
	for <linux-mips@archiver.kernel.org>; Sun, 24 Jan 2021 22:05:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B9F1A22BF3
	for <linux-mips@archiver.kernel.org>; Sun, 24 Jan 2021 22:05:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726023AbhAXWEq (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Sun, 24 Jan 2021 17:04:46 -0500
Received: from elvis.franken.de ([193.175.24.41]:39482 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725968AbhAXWEq (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 24 Jan 2021 17:04:46 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1l3nUK-0004ko-00; Sun, 24 Jan 2021 23:04:04 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 4CFE3C0C0E; Sun, 24 Jan 2021 20:12:02 +0100 (CET)
Date:   Sun, 24 Jan 2021 20:12:02 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Lauri Kasanen <cand@gmx.com>
Cc:     linux-mips@vger.kernel.org, Takashi Iwai <tiwai@suse.de>,
        perex@perex.cz
Subject: Re: [PATCH 2/3 v7] sound: Add n64 driver
Message-ID: <20210124191202.GA21974@alpha.franken.de>
References: <20210115133500.c5affc0131313e1165acb2a1@gmx.com>
 <20210124094437.529881d014970d7f3909d76f@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210124094437.529881d014970d7f3909d76f@gmx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Jan 24, 2021 at 09:44:37AM +0200, Lauri Kasanen wrote:
> On Fri, 15 Jan 2021 13:35:00 +0200
> Lauri Kasanen <cand@gmx.com> wrote:
> 
> > This adds support for the Nintendo 64 console's sound.
> >
> > Signed-off-by: Lauri Kasanen <cand@gmx.com>
> > ---
> >
> > v7:
> > use devm_*
> 
> Hi Thomas,
> 
> Since v6 had Takashi's ack, and you asked for the devm change, does
> this mean v7 is waiting for your review?

I'll apply it probably tomorrow, I just need to dig out the reviewed-by from
Takashi. 

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
