Return-Path: <linux-mips-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3712BC001E0
	for <linux-mips@archiver.kernel.org>; Tue, 25 Jul 2023 09:00:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232454AbjGYJAA (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Tue, 25 Jul 2023 05:00:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232488AbjGYI77 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 25 Jul 2023 04:59:59 -0400
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id F3E599B;
        Tue, 25 Jul 2023 01:59:53 -0700 (PDT)
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
        id 1qODtR-0008Gn-00; Tue, 25 Jul 2023 10:59:45 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 50418C01C7; Tue, 25 Jul 2023 10:44:46 +0200 (CEST)
Date:   Tue, 25 Jul 2023 10:44:46 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc:     Jan-Benedict Glaw <jbglaw@lug-owl.de>,
        Guillaume Tucker <guillaume.tucker@collabora.com>,
        Huacai Chen <chenhuacai@loongson.cn>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] MIPS: Fix build issues from the introduction of
 `need-compiler'
Message-ID: <ZL+LfqvL/tBGnUF3@alpha.franken.de>
References: <alpine.DEB.2.21.2307180025120.62448@angie.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2307180025120.62448@angie.orcam.me.uk>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jul 18, 2023 at 03:37:13PM +0100, Maciej W. Rozycki wrote:
> Hi,
> 
>  With the addition of the `need-compiler' variable the `Makefile.compiler' 
> fragment is not included with no-build targets such as `modules_install', 
> which in turn means $(call cc-option,), etc. are no-ops with these targets 
> and any attempt to evaluate these function calls causes all kinds of weird 
> behaviour to happen.
> 
>  The solution is to avoid making these calls in the first place, as they 
> are surely irrelevant where the compiler is not going to be otherwise 
> invoked.  This small patch series fixes two places known-affected in the 
> MIPS Makefile fragment and also included a follow-up revert of an earlier 
> misguided attempt.  See individual change descriptions for details.
> 
>  Verified with `decstation_64_defconfig' and `fuloong2e_defconfig' using 
> `modules_install'.  Please apply.

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
