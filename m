Return-Path: <linux-mips-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84743C77B62
	for <linux-mips@archiver.kernel.org>; Wed,  5 Apr 2023 08:33:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237385AbjDEIde (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Wed, 5 Apr 2023 04:33:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236910AbjDEIdd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 5 Apr 2023 04:33:33 -0400
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B15B22704;
        Wed,  5 Apr 2023 01:33:32 -0700 (PDT)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1pjyaC-0007rR-01; Wed, 05 Apr 2023 10:33:32 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 86A2EC2424; Wed,  5 Apr 2023 10:29:55 +0200 (CEST)
Date:   Wed, 5 Apr 2023 10:29:55 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] MIPS: Remove no longer used ide.h
Message-ID: <20230405082955.GB6145@alpha.franken.de>
References: <20230403094113.6056-1-tsbogend@alpha.franken.de>
 <20230403094113.6056-2-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230403094113.6056-2-tsbogend@alpha.franken.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Apr 03, 2023 at 11:41:11AM +0200, Thomas Bogendoerfer wrote:
> There are only three drivers left using ide.h, which are all m68k only.
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>  arch/mips/include/asm/ide.h              |  13 ---
>  arch/mips/include/asm/mach-generic/ide.h | 138 -----------------------
>  2 files changed, 151 deletions(-)
>  delete mode 100644 arch/mips/include/asm/ide.h
>  delete mode 100644 arch/mips/include/asm/mach-generic/ide.h

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
