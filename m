Return-Path: <linux-mips-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E56CEB64D8
	for <linux-mips@archiver.kernel.org>; Tue, 20 Jun 2023 12:53:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232236AbjFTMw7 (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Tue, 20 Jun 2023 08:52:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230253AbjFTMw6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 20 Jun 2023 08:52:58 -0400
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8F5A510FA;
        Tue, 20 Jun 2023 05:52:56 -0700 (PDT)
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
        id 1qBaqt-00087v-00; Tue, 20 Jun 2023 14:52:55 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 5461DC0301; Tue, 20 Jun 2023 14:50:17 +0200 (CEST)
Date:   Tue, 20 Jun 2023 14:50:17 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: mm: Remove special handling for OCTEON CPUs
Message-ID: <20230620125017.GB10520@alpha.franken.de>
References: <20230615093933.121329-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230615093933.121329-1-tsbogend@alpha.franken.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jun 15, 2023 at 11:39:33AM +0200, Thomas Bogendoerfer wrote:
> Macro cpu_has_mips_r2_exec_hazard correctly handles OCTEON CPUs,
> so we don't need the extra switch cases for them.
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>  arch/mips/mm/tlbex.c | 24 ++++--------------------
>  1 file changed, 4 insertions(+), 20 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
