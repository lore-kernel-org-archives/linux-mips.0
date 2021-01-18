Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A1B4C433DB
	for <linux-mips@archiver.kernel.org>; Mon, 18 Jan 2021 22:12:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 56B6422DFB
	for <linux-mips@archiver.kernel.org>; Mon, 18 Jan 2021 22:12:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727436AbhARWMi (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Mon, 18 Jan 2021 17:12:38 -0500
Received: from elvis.franken.de ([193.175.24.41]:34741 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732848AbhARWMi (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 18 Jan 2021 17:12:38 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1l1cke-00048Q-00; Mon, 18 Jan 2021 23:11:56 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id A6B9DC09A7; Mon, 18 Jan 2021 23:11:37 +0100 (CET)
Date:   Mon, 18 Jan 2021 23:11:37 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jinyang He <hejinyang@loongson.cn>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Burton <paulburton@kernel.org>,
        Jun-Ru Chang <jrjang@realtek.com>
Subject: Re: [PATCH 1/4] MIPS: process: Reorder header files
Message-ID: <20210118221137.GA5818@alpha.franken.de>
References: <1610454557-25867-1-git-send-email-hejinyang@loongson.cn>
 <1610454557-25867-2-git-send-email-hejinyang@loongson.cn>
 <20210115144631.GE15166@alpha.franken.de>
 <78c9211d-5304-a2b6-3a94-df9b324b7046@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78c9211d-5304-a2b6-3a94-df9b324b7046@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jan 18, 2021 at 06:02:08PM +0800, Jinyang He wrote:
> On 01/15/2021 10:46 PM, Thomas Bogendoerfer wrote:
> 
> > On Tue, Jan 12, 2021 at 08:29:14PM +0800, Jinyang He wrote:
> > > Just reorder the header files.
> > This alone isn't worth a commit, IMHO. I bet there are lots of includes
> > no longer needed, so removing and sorting them is ok for me.
> > 
> > Thomas.
> > 
> 
> Hi, Thomas,
> 
> Thanks for your advice. I analyzed majority of the symbols in this file.
> The following are examples of header file references:
> 
> Space indicates that it cannot be found. (Maybe I missed it.)
> 
>     Header files                                Examples in this file
>     #include <linux/completion.h>
> *   #include <linux/cpu.h> get_online_cpus
> *   #include <linux/errno.h>                    EOPNOTSUPP
> [..]

thank you for doing this.

> By including only these header files which marked by '*', I have been able
> to compile and use certain functions (unwind_stack) normally. So are other
> header files no longer needed?
> 
> In addition, <linux/cpu.h> includes <linux/cpumask.h>, and <linux/cpumask.h>
> includes <linux/kernel.h>. What should we do?

send a patch, which deletes the not needed #includes ;-)

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
