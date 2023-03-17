Return-Path: <linux-mips-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D324C761A6
	for <linux-mips@archiver.kernel.org>; Fri, 17 Mar 2023 10:25:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbjCQKZw (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Fri, 17 Mar 2023 06:25:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230043AbjCQKZt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 17 Mar 2023 06:25:49 -0400
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 59873E4C65;
        Fri, 17 Mar 2023 03:25:47 -0700 (PDT)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1pd7HN-0002Ik-02; Fri, 17 Mar 2023 11:25:45 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 7BBC9C1B05; Fri, 17 Mar 2023 11:23:09 +0100 (CET)
Date:   Fri, 17 Mar 2023 11:23:09 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: sibyte: Remove unused config option SIBYTE_BCM1x55
Message-ID: <20230317102309.GC7054@alpha.franken.de>
References: <20230315135509.102542-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230315135509.102542-1-tsbogend@alpha.franken.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Mar 15, 2023 at 02:55:09PM +0100, Thomas Bogendoerfer wrote:
> SIBYTE_BCM1x55 is not selected anywhere, so let's get rid of it.
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>  arch/mips/Kbuild.platforms            |  1 -
>  arch/mips/sibyte/Kconfig              | 13 +------------
>  arch/mips/sibyte/Makefile             |  2 --
>  arch/mips/sibyte/Platform             |  4 ----
>  arch/mips/sibyte/common/bus_watcher.c |  4 ++--
>  arch/mips/sibyte/common/cfe.c         |  2 +-
>  arch/mips/sibyte/common/sb_tbprof.c   | 10 +++++-----
>  arch/mips/sibyte/swarm/setup.c        |  6 +++---
>  8 files changed, 12 insertions(+), 30 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
