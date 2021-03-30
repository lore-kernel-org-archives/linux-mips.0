Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C7AFC433C1
	for <linux-mips@archiver.kernel.org>; Tue, 30 Mar 2021 20:47:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E7B94619C5
	for <linux-mips@archiver.kernel.org>; Tue, 30 Mar 2021 20:47:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbhC3Uqh (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Tue, 30 Mar 2021 16:46:37 -0400
Received: from elvis.franken.de ([193.175.24.41]:38591 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232286AbhC3UqC (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 30 Mar 2021 16:46:02 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lRLFQ-0007z3-00; Tue, 30 Mar 2021 22:46:00 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 32656C1E48; Tue, 30 Mar 2021 22:02:08 +0200 (CEST)
Date:   Tue, 30 Mar 2021 22:02:08 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Christoph Hellwig <hch@lst.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] MIPS: uaccess: Added __get/__put_kernel_nofault
Message-ID: <20210330200208.GA18146@alpha.franken.de>
References: <20210330172702.146909-1-tsbogend@alpha.franken.de>
 <20210330172702.146909-2-tsbogend@alpha.franken.de>
 <20210330174835.GA15145@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210330174835.GA15145@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Mar 30, 2021 at 07:48:35PM +0200, Christoph Hellwig wrote:
> On Tue, Mar 30, 2021 at 07:26:58PM +0200, Thomas Bogendoerfer wrote:
> > Added __get/__put_kernel_nofault as preparation for removing
> > get/set_fs.
> 
> For !CONFIG_EVA __get_user_common is simply defined to
> __get_kernel_common, which probably does the wrong thing here
> as it would allow access to user space addresses, won't it?

it does, so I'm missing a copy_from_kernel_nofault_allowed() function,
which only allows kernel access, right ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
