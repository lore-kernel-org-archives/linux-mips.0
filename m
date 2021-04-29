Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0EFBC433ED
	for <linux-mips@archiver.kernel.org>; Thu, 29 Apr 2021 21:06:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8B86F613B0
	for <linux-mips@archiver.kernel.org>; Thu, 29 Apr 2021 21:06:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233284AbhD2VHe (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Thu, 29 Apr 2021 17:07:34 -0400
Received: from elvis.franken.de ([193.175.24.41]:52404 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232246AbhD2VHe (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 29 Apr 2021 17:07:34 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lcDrx-0003QC-00; Thu, 29 Apr 2021 23:06:45 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id EC111C0D22; Thu, 29 Apr 2021 23:06:32 +0200 (CEST)
Date:   Thu, 29 Apr 2021 23:06:32 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Mike Rapoport <rppt@kernel.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [RFT PATCH] MIPS: Octeon: drop dependency on CONFIG_HOLES_IN_ZONE
Message-ID: <20210429210632.GA11767@alpha.franken.de>
References: <20210418093512.668-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210418093512.668-1-rppt@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Apr 18, 2021 at 12:35:12PM +0300, Mike Rapoport wrote:
> I'd really appreciate if somebody with access to an Octeon system could
> test this patch.

Tested on an Ubiquiti edgerouter 12. Works with problem and I haven't
even seen a change in memory output.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
