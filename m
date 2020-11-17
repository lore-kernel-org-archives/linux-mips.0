Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B838C2D0E4
	for <linux-mips@archiver.kernel.org>; Tue, 17 Nov 2020 10:41:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 287DF2417E
	for <linux-mips@archiver.kernel.org>; Tue, 17 Nov 2020 10:41:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727846AbgKQKkl (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Tue, 17 Nov 2020 05:40:41 -0500
Received: from elvis.franken.de ([193.175.24.41]:37962 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727811AbgKQKkk (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 17 Nov 2020 05:40:40 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1keyPb-00016U-00; Tue, 17 Nov 2020 11:40:35 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id DF346C0211; Tue, 17 Nov 2020 11:40:06 +0100 (CET)
Date:   Tue, 17 Nov 2020 11:40:06 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huacai Chen <chenhc@lemote.com>
Cc:     Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        kvm <kvm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/4] MIPS: kvm: Use vm_get_page_prot to get protection
 bits
Message-ID: <20201117104006.GA9345@alpha.franken.de>
References: <20201113110952.68086-1-tsbogend@alpha.franken.de>
 <20201113110952.68086-2-tsbogend@alpha.franken.de>
 <CAAhV-H7Sc6tmsfRcxOkx3rPk85Ey6XtxqhDB0RWokk+XSGVJ9A@mail.gmail.com>
 <20201116123009.GA7555@alpha.franken.de>
 <CAAhV-H57XNHurOYw8PG4=praXEWQ7h_TKM08cGBVRgAth1Rx1A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAhV-H57XNHurOYw8PG4=praXEWQ7h_TKM08cGBVRgAth1Rx1A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Nov 17, 2020 at 09:18:15AM +0800, Huacai Chen wrote:
> Hi, Thomas,
> 
> On Mon, Nov 16, 2020 at 8:35 PM Thomas Bogendoerfer
> <tsbogend@alpha.franken.de> wrote:
> >
> > On Sat, Nov 14, 2020 at 03:34:14PM +0800, Huacai Chen wrote:
> > > Hi, Thomas,
> > >
> > > On Fri, Nov 13, 2020 at 7:13 PM Thomas Bogendoerfer
> > > <tsbogend@alpha.franken.de> wrote:
> > > >
> > > > MIPS protection bits are setup during runtime so using defines like
> > > > PAGE_SHARED ignores this runtime changes. Using vm_get_page_prot
> > > > to get correct page protection fixes this.
> > > Is there some visible bugs if without this fix?
> >
> > no exec isn't enabled for these mappings, if cpu supports it.
> The whole series wants to set XI if supported?

that and RI where possible. I want to get rid of the PAGE_* defines,
because they lead to forgetting about RI and XI protection map setup,
which doesn't use the defines and would need another set of defines.
So by using only protection_map[] everything goes via one place.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
