Return-Path: <SRS0=JGv4=67=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC943C433E1
	for <linux-mips@archiver.kernel.org>; Sun, 17 May 2020 08:55:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A49ED207EA
	for <linux-mips@archiver.kernel.org>; Sun, 17 May 2020 08:55:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727021AbgEQIzo (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Sun, 17 May 2020 04:55:44 -0400
Received: from elvis.franken.de ([193.175.24.41]:56338 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727050AbgEQIzo (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 17 May 2020 04:55:44 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jaF5B-0003F8-02; Sun, 17 May 2020 10:55:41 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id AF64FC04D6; Sun, 17 May 2020 10:38:47 +0200 (CEST)
Date:   Sun, 17 May 2020 10:38:47 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     WANG Xuerui <kernel@xen0n.name>
Cc:     linux-mips@vger.kernel.org
Subject: Re: [PATCH v2 0/4] CPUCFG emulation on older Loongson64 cores
Message-ID: <20200517083847.GC3939@alpha.franken.de>
References: <20200502133846.40590-1-git@xen0n.name>
 <20200503103304.40678-1-git@xen0n.name>
 <f334c7f1-9165-b4d6-deda-6bb3f9c0e8ff@xen0n.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f334c7f1-9165-b4d6-deda-6bb3f9c0e8ff@xen0n.name>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, May 16, 2020 at 07:29:39PM +0800, WANG Xuerui wrote:
> On 5/3/20 6:33 PM, WANG Xuerui wrote:
> What is the status of this series? I know that I borked the threading of
> replies, I can resend if it's the only thing holding the series.
> 
> And I think the patch may well need to be reorganized, but no replies yet.
> I'm not a professional kernel developer, and any review is appreciated!

I've applied patch 1-3 to mips-next. Patch 4 needs more work...

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
