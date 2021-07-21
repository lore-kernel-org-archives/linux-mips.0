Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_NONE,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10B84C636C9
	for <linux-mips@archiver.kernel.org>; Wed, 21 Jul 2021 16:17:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F257D6127C
	for <linux-mips@archiver.kernel.org>; Wed, 21 Jul 2021 16:17:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232911AbhGUPgz (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Wed, 21 Jul 2021 11:36:55 -0400
Received: from elvis.franken.de ([193.175.24.41]:43886 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232785AbhGUPgz (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 21 Jul 2021 11:36:55 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1m6EuY-00011A-00; Wed, 21 Jul 2021 18:17:30 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 29583C0EF7; Wed, 21 Jul 2021 18:17:19 +0200 (CEST)
Date:   Wed, 21 Jul 2021 18:17:19 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        list@opendingux.net, Kees Cook <keescook@chromium.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Subject: Re: [PATCH] MIPS: Avoid macro redefinitions
Message-ID: <20210721161719.GA9805@alpha.franken.de>
References: <20210718130748.230758-1-paul@crapouillou.net>
 <CAKwvOdkVEa-CxbVschn5Tnh7-Ynvzcz+zChhP3LL3Q745wE7_A@mail.gmail.com>
 <7YIIWQ.1TU3IBLL4KNC2@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7YIIWQ.1TU3IBLL4KNC2@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jul 19, 2021 at 11:10:55PM +0100, Paul Cercueil wrote:
> > >   #ifndef TOOLCHAIN_SUPPORTS_VIRT
> > 
> > Same question for GAS version support for virt?
> > Documentation/process/changes.rst
> > says GNU binutils 2.23+ is required for building the kernel.
> > If we still need to support, have you tested this change on such an
> > older version of GNU binutils?
> 
> I have no idea about virt support - I hope Thomas can answer this.

virt support was added in 2.24 and xpa in 2.25. So we still need the
TOOLCHAIN defines for it.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
