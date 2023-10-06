Return-Path: <linux-mips-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 350D9E92FF8
	for <linux-mips@archiver.kernel.org>; Fri,  6 Oct 2023 08:24:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230493AbjJFIYx (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Fri, 6 Oct 2023 04:24:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230406AbjJFIYx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 6 Oct 2023 04:24:53 -0400
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C4523FC;
        Fri,  6 Oct 2023 01:24:51 -0700 (PDT)
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
        id 1qog8g-0002lX-00; Fri, 06 Oct 2023 10:24:50 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 67E78C0198; Fri,  6 Oct 2023 10:20:05 +0200 (CEST)
Date:   Fri, 6 Oct 2023 10:20:05 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mips@vger.kernel.org, Jonas Gorski <jonas.gorski@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] MIPS: AR7: remove platform
Message-ID: <ZR/DNeUMn+BD2NMD@alpha.franken.de>
References: <20230922061530.3121-1-wsa+renesas@sang-engineering.com>
 <20230922061530.3121-7-wsa+renesas@sang-engineering.com>
 <ZRUl6+i/o0cqCV+6@ninjato>
 <ZRUrVgHyJvvhteGs@alpha.franken.de>
 <ZRUwEjpfILlF5dgE@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZRUwEjpfILlF5dgE@ninjato>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Sep 28, 2023 at 09:49:38AM +0200, Wolfram Sang wrote:
> 
> > > most people involved in this series think that it will be best to take
> > > the whole series via the MIPS tree. Do you agree?
> > 
> > I'm fine taking it.
> 
> Awesome, thank you!

the series doesn't apply to mips-next, can you rebase it top of it ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
