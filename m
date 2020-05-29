Return-Path: <SRS0=FAjd=7L=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00362C433DF
	for <linux-mips@archiver.kernel.org>; Fri, 29 May 2020 11:09:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D4F502074B
	for <linux-mips@archiver.kernel.org>; Fri, 29 May 2020 11:09:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725836AbgE2LJe (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Fri, 29 May 2020 07:09:34 -0400
Received: from elvis.franken.de ([193.175.24.41]:43317 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725306AbgE2LJe (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 29 May 2020 07:09:34 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jectH-0002Kz-00; Fri, 29 May 2020 13:09:31 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 457A6C05C3; Fri, 29 May 2020 13:09:13 +0200 (CEST)
Date:   Fri, 29 May 2020 13:09:13 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     YunQiang Su <syq@debian.org>
Cc:     linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: Re: [PATCH] mips: add o32_fp64 boot param to disable FP64 support
Message-ID: <20200529110913.GA11310@alpha.franken.de>
References: <20200528231628.120171-1-syq@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200528231628.120171-1-syq@debian.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, May 29, 2020 at 07:16:28AM +0800, YunQiang Su wrote:
> When build with CONFIG_O32_FP64_SUPPORTS, even all of the userland
> is FPXX, we cannot run any FP32 binary.

I don't understand what this means. Can you explain what the problem
is ? 

> Then we need to disable FP64 support temporarily with a boot param:
>    o32_fp64=no/disable

A boot parameter should IMHO be last resort. But I need to understand
the problem first to think about different ways to solve this.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
