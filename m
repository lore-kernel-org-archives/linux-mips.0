Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 979BCC43217
	for <linux-mips@archiver.kernel.org>; Thu,  1 Dec 2022 13:34:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231241AbiLANeK (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Thu, 1 Dec 2022 08:34:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231524AbiLANeJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 1 Dec 2022 08:34:09 -0500
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8F8FCAC1A2;
        Thu,  1 Dec 2022 05:34:08 -0800 (PST)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1p0jhW-000077-01; Thu, 01 Dec 2022 14:34:06 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id CA780C1FB9; Thu,  1 Dec 2022 14:33:18 +0100 (CET)
Date:   Thu, 1 Dec 2022 14:33:18 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     John Thomson <git@johnthomson.fastmail.com.au>
Cc:     Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        John Crispin <john@phrozen.org>,
        =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] mips: ralink: mt7621: soc queries and tests as
 functions
Message-ID: <20221201133318.GB10560@alpha.franken.de>
References: <20221114015658.2873120-1-git@johnthomson.fastmail.com.au>
 <20221114015658.2873120-3-git@johnthomson.fastmail.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221114015658.2873120-3-git@johnthomson.fastmail.com.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Nov 14, 2022 at 11:56:57AM +1000, John Thomson wrote:
> Move the SoC register value queries and tests to specific functions,
> to remove repetition of logic
> No functional changes intended
> 
> Signed-off-by: John Thomson <git@johnthomson.fastmail.com.au>
> ---
>  arch/mips/ralink/mt7621.c | 86 +++++++++++++++++++++++++++------------
>  1 file changed, 61 insertions(+), 25 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
