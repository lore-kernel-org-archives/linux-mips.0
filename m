Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90DACC433E0
	for <linux-mips@archiver.kernel.org>; Fri, 15 Jan 2021 14:59:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 63CDC23877
	for <linux-mips@archiver.kernel.org>; Fri, 15 Jan 2021 14:59:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726983AbhAOO7J (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Fri, 15 Jan 2021 09:59:09 -0500
Received: from elvis.franken.de ([193.175.24.41]:53975 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726918AbhAOO7I (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 15 Jan 2021 09:59:08 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1l0QYS-0006iT-00; Fri, 15 Jan 2021 15:58:24 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id CD94AC057E; Fri, 15 Jan 2021 15:58:12 +0100 (CET)
Date:   Fri, 15 Jan 2021 15:58:12 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Alexander Lobakin <alobakin@pm.me>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Andrew Morton <akpm@linux-foundation.org>,
        Bibo Mao <maobibo@loongson.cn>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Paul Burton <paulburton@kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        Guoyun Sun <sunguoyun@loongson.cn>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH mips-next 0/2] MIPS: fix -Wshadow in include files
Message-ID: <20210115145812.GA15745@alpha.franken.de>
References: <20210114182905.110574-1-alobakin@pm.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210114182905.110574-1-alobakin@pm.me>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jan 14, 2021 at 06:29:26PM +0000, Alexander Lobakin wrote:
> Fix two -Wshadow warnings coming from the include files and thus
> repetitive and very annoying when building lots of sources.
> 
> Alexander Lobakin (2):
>   MIPS: bitops: fix -Wshadow in asm/bitops.h
>   MIPS: pgtable: fix -Wshadow in asm/pgtable.h
> 
>  arch/mips/include/asm/bitops.h  | 10 +++++-----
>  arch/mips/include/asm/pgtable.h | 12 ++++++------
>  2 files changed, 11 insertions(+), 11 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
