Return-Path: <SRS0=xoWx=C3=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF53EC43464
	for <linux-mips@archiver.kernel.org>; Fri, 18 Sep 2020 13:57:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C01D120878
	for <linux-mips@archiver.kernel.org>; Fri, 18 Sep 2020 13:57:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726767AbgIRN5d (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Fri, 18 Sep 2020 09:57:33 -0400
Received: from elvis.franken.de ([193.175.24.41]:44588 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726299AbgIRN5d (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 18 Sep 2020 09:57:33 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kJGtG-0002UB-01; Fri, 18 Sep 2020 15:57:30 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 12B43C0FDF; Fri, 18 Sep 2020 15:50:53 +0200 (CEST)
Date:   Fri, 18 Sep 2020 15:50:53 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Necip Fazil Yildiran <fazilyildiran@gmail.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        paul@pgazz.com, jeho@cs.utexas.edu
Subject: Re: [PATCH] MIPS: remove the obsolete RM7000 extended interrupts
 handler
Message-ID: <20200918135053.GB19202@alpha.franken.de>
References: <20200912142306.3604968-1-fazilyildiran@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200912142306.3604968-1-fazilyildiran@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Sep 12, 2020 at 05:23:07PM +0300, Necip Fazil Yildiran wrote:
> IRQ_CPU_RM7K has been a non-visible config selected nowhere since
> PMC-Sierra Yosemite support has been removed with commit bdf20507da11
> ("MIPS: PMC-Sierra Yosemite: Remove support."). By the same token, the
> handler for RM7000 extended interrupts has been obsolete.
> 
> Remove the obsolete code.

not yet;-) I have an RM7000 based system in my basement... I'm also
not sure, if R7k O2s need that.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
