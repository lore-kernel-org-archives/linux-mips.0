Return-Path: <linux-mips-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29C87C04FE1
	for <linux-mips@archiver.kernel.org>; Tue, 25 Jul 2023 09:00:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232590AbjGYJAC (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Tue, 25 Jul 2023 05:00:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232505AbjGYI77 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 25 Jul 2023 04:59:59 -0400
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 33E9D131;
        Tue, 25 Jul 2023 01:59:56 -0700 (PDT)
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
        id 1qODtS-0008Gt-00; Tue, 25 Jul 2023 10:59:46 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 6A349C01E6; Tue, 25 Jul 2023 10:48:03 +0200 (CEST)
Date:   Tue, 25 Jul 2023 10:48:03 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linke li <lilinke99@gmail.com>
Cc:     Markus Elfring <Markus.Elfring@web.de>, linux-mips@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Linke Li <lilinke99@foxmail.com>
Subject: Re: [PATCH] MIPS: Fix undefined behavior in PAGE_MASK calculation
Message-ID: <ZL+MQwq31kDcLI80@alpha.franken.de>
References: <tencent_54C2A2746A83BA29EE92248CE9683F0C6509@qq.com>
 <f7fab4fc-a8db-d2f7-52e9-3522f7c298b8@web.de>
 <CAKdjhyAOfbsxthU38=vSPJ080YxQvbGpbc5pupbz1gUQ=USwrQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKdjhyAOfbsxthU38=vSPJ080YxQvbGpbc5pupbz1gUQ=USwrQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jul 10, 2023 at 02:02:00PM +0800, linke li wrote:
> > How do you think about a wording variant like the following?
> 
> What you said is exactly what I want to express.
> 
> > Would you like to add the tag “Fixes”?
> 
> I agree with that.
> 
> Thank you for your feedback and suggestion.

plesas resend with this changes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
