Return-Path: <linux-mips-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ADDEC77B7A
	for <linux-mips@archiver.kernel.org>; Fri, 19 May 2023 22:51:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbjESWvn (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Fri, 19 May 2023 18:51:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbjESWvm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 19 May 2023 18:51:42 -0400
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1BC1A103;
        Fri, 19 May 2023 15:51:41 -0700 (PDT)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 502B692009E; Sat, 20 May 2023 00:51:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 4C90092009D;
        Fri, 19 May 2023 23:51:40 +0100 (BST)
Date:   Fri, 19 May 2023 23:51:40 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        linux-kernel@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: [PATCH 1/3] MIPS: Introduce WAR_4KC_LLSC config option
In-Reply-To: <53043C18-7C75-4D5F-A15E-86D981D19CA8@flygoat.com>
Message-ID: <alpine.DEB.2.21.2305192342180.27887@angie.orcam.me.uk>
References: <20230519164753.72065-1-jiaxun.yang@flygoat.com> <20230519164753.72065-2-jiaxun.yang@flygoat.com> <alpine.DEB.2.21.2305192117230.50034@angie.orcam.me.uk> <53043C18-7C75-4D5F-A15E-86D981D19CA8@flygoat.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 19 May 2023, Jiaxun Yang wrote:

> > Given the circumstances I think this should be `panic'.  You don't want 
> > to continue with a system that can randomly lock up.
> 
> I just checked how other architectures handle such situation, it seems like
> TAINT_CPU_OUT_OF_SPEC is a better option.

 That can be easily missed, just as a random message in the kernel log, 
even at a high priority, and LOGLEVEL_ERR is not particularly high even.  
For a system configuration that qualifies as not usable for any practical 
purpose I find this approach leaving something to desire.

> Panic in cpu_probe can be frustrating for users as it is earlier than initialisation
> of consoles so the panic message can never be read by users.

 Is there no early console support for the systems affected?

  Maciej
