Return-Path: <SRS0=vgrG=DN=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5741BC4363D
	for <linux-mips@archiver.kernel.org>; Tue,  6 Oct 2020 11:31:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0D92920866
	for <linux-mips@archiver.kernel.org>; Tue,  6 Oct 2020 11:31:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726096AbgJFLbn (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Tue, 6 Oct 2020 07:31:43 -0400
Received: from elvis.franken.de ([193.175.24.41]:47836 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725946AbgJFLbn (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 6 Oct 2020 07:31:43 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kPlC2-0006R2-02; Tue, 06 Oct 2020 13:31:42 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 27E6EC10EF; Tue,  6 Oct 2020 13:31:31 +0200 (CEST)
Date:   Tue, 6 Oct 2020 13:31:31 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: pgtable: Remove used PAGE_USERIO define
Message-ID: <20201006113131.GC8673@alpha.franken.de>
References: <20201005112846.66430-1-tsbogend@alpha.franken.de>
 <20201005112846.66430-2-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201005112846.66430-2-tsbogend@alpha.franken.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Oct 05, 2020 at 01:28:46PM +0200, Thomas Bogendoerfer wrote:
> There are no users of PAGE_USERIO.
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>  arch/mips/include/asm/pgtable.h | 2 --
>  1 file changed, 2 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
