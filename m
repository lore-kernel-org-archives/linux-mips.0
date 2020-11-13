Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CD1AC2D0E4
	for <linux-mips@archiver.kernel.org>; Fri, 13 Nov 2020 03:28:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B06E922201
	for <linux-mips@archiver.kernel.org>; Fri, 13 Nov 2020 03:28:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726038AbgKMD2Q (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Thu, 12 Nov 2020 22:28:16 -0500
Received: from [157.25.102.26] ([157.25.102.26]:59778 "EHLO orcam.me.uk"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725965AbgKMD2Q (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 12 Nov 2020 22:28:16 -0500
Received: from bugs.linux-mips.org (eddie.linux-mips.org [IPv6:2a01:4f8:201:92aa::3])
        by orcam.me.uk (Postfix) with ESMTPS id 916CB2BE0EC;
        Fri, 13 Nov 2020 03:28:13 +0000 (GMT)
Date:   Fri, 13 Nov 2020 03:27:10 +0000 (GMT)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Nick Desaulniers <ndesaulniers@google.com>
cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        linux-mips@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MIPS: remove GCC < 4.9 support
In-Reply-To: <CAKwvOdnqcKGqSAS0BmTP70M-5e+gOvzRefuL9rBNGvm+jpR==Q@mail.gmail.com>
Message-ID: <alpine.LFD.2.21.2011130322040.4064799@eddie.linux-mips.org>
References: <20201111032105.2346303-1-ndesaulniers@google.com> <20201111230314.GB19275@alpha.franken.de> <alpine.LFD.2.21.2011130017330.4064799@eddie.linux-mips.org> <CAKwvOdnqcKGqSAS0BmTP70M-5e+gOvzRefuL9rBNGvm+jpR==Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 12 Nov 2020, Nick Desaulniers wrote:

> >  It probably makes sense to get rid of GCC_OFF_SMALL_ASM altogether, as
> > this syntactical indirection brings us nothing at this point and only
> > obfuscates sources.
> 
> Sure, that sounds good. Send a patch!

 Well, I have felt satisfied enough with making the original patch, commit 
b0984c43702f ("MIPS: Fix microMIPS LL/SC immediate offsets"), so I'll give 
someone else the chance to take the pride of undoing it now, now that it's 
not needed anymore.

  Maciej

