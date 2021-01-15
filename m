Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18733C4332B
	for <linux-mips@archiver.kernel.org>; Fri, 15 Jan 2021 14:48:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E89DD239E5
	for <linux-mips@archiver.kernel.org>; Fri, 15 Jan 2021 14:48:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731805AbhAOOrv (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Fri, 15 Jan 2021 09:47:51 -0500
Received: from elvis.franken.de ([193.175.24.41]:53932 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728586AbhAOOru (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 15 Jan 2021 09:47:50 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1l0QNY-0006aU-04; Fri, 15 Jan 2021 15:47:08 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 0D7CAC057E; Fri, 15 Jan 2021 15:46:32 +0100 (CET)
Date:   Fri, 15 Jan 2021 15:46:31 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jinyang He <hejinyang@loongson.cn>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Burton <paulburton@kernel.org>,
        Jun-Ru Chang <jrjang@realtek.com>
Subject: Re: [PATCH 1/4] MIPS: process: Reorder header files
Message-ID: <20210115144631.GE15166@alpha.franken.de>
References: <1610454557-25867-1-git-send-email-hejinyang@loongson.cn>
 <1610454557-25867-2-git-send-email-hejinyang@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1610454557-25867-2-git-send-email-hejinyang@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jan 12, 2021 at 08:29:14PM +0800, Jinyang He wrote:
> Just reorder the header files.

This alone isn't worth a commit, IMHO. I bet there are lots of includes
no longer needed, so removing and sorting them is ok for me.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
