Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7864DC433E0
	for <linux-mips@archiver.kernel.org>; Thu,  4 Mar 2021 16:56:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4B94664F5B
	for <linux-mips@archiver.kernel.org>; Thu,  4 Mar 2021 16:56:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238654AbhCDQzs (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Thu, 4 Mar 2021 11:55:48 -0500
Received: from angie.orcam.me.uk ([157.25.102.26]:37396 "EHLO
        angie.orcam.me.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238732AbhCDQzW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 4 Mar 2021 11:55:22 -0500
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id AD7AF92009C; Thu,  4 Mar 2021 17:54:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id A6C6192009B;
        Thu,  4 Mar 2021 17:54:40 +0100 (CET)
Date:   Thu, 4 Mar 2021 17:54:40 +0100 (CET)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
cc:     Jim Wilson <jimw@sifive.com>, GCC Development <gcc@gcc.gnu.org>,
        syq@debian.org, "open list:MIPS" <linux-mips@vger.kernel.org>,
        Matthew Fortune <mfortune@gmail.com>,
        Binutils <binutils@sourceware.org>
Subject: Re: HELP: MIPS PC Relative Addressing
In-Reply-To: <c890859e-f306-62df-0462-5a2eb6a5cbcc@flygoat.com>
Message-ID: <alpine.DEB.2.21.2103041744010.51127@angie.orcam.me.uk>
References: <3ddc0595-c443-868e-c0a4-08ae8934f116@flygoat.com> <CAFyWVab4Z4BH5RxZWXJnxerjAYDNnCndMvksCHsKkFUU1q1w9g@mail.gmail.com> <7494335f-703e-f9f8-30dd-6e41249c3873@flygoat.com> <alpine.DEB.2.21.2103021335450.19637@angie.orcam.me.uk>
 <c890859e-f306-62df-0462-5a2eb6a5cbcc@flygoat.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 4 Mar 2021, Jiaxun Yang wrote:

> >   I'm not sure though why you try to avoid composed relocations given we've
> > had them for 20+ years now.  Relocations are just calculation operators
> > for expressions evaluated at link time rather than assembly or high-level
> > language compilation time.  And just like we don't invent single operators
> > for complex combinations of `+', `&', `%', `<<', etc. and instead compose
> > the exiting ones in expressions used in various programming languages to
> > get the desired calculation, we don't need to do that for relocation and
> > we can just have a collection of simple relocation operators to choose
> > from and combine.
> 
> Well just because binutils code drives me crazy:-(
> I tired very hard to understand those stuff but when I trying to modify them
> I just got endless assert failure or other unreasonable errors :-/

 The code certainly has decades of baggage, it can be complicated and even 
hairy at places.  I guess nobody knows it all or understands all parts 
right away.  However you'll get better with getting around it as you work 
with it longer and get experience, you just need patience.  Nobody says 
learning tough stuff is easy.

 But difficulty with understanding one particular implementation mustn't
drive psABI design decisions!

  Maciej
