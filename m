Return-Path: <linux-mips-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C518C64ED8
	for <linux-mips@archiver.kernel.org>; Mon, 27 Feb 2023 22:56:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbjB0W4L (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Mon, 27 Feb 2023 17:56:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbjB0W4K (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 27 Feb 2023 17:56:10 -0500
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 68C701F930;
        Mon, 27 Feb 2023 14:56:09 -0800 (PST)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1pWmPg-0007zQ-02; Mon, 27 Feb 2023 23:56:08 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id CC315C0F89; Mon, 27 Feb 2023 23:55:04 +0100 (CET)
Date:   Mon, 27 Feb 2023 23:55:04 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        hch@lst.de
Subject: Re: [PATCH v2 1/4] MIPS: Remove DMA_PERDEV_COHERENT
Message-ID: <20230227225504.GB23071@alpha.franken.de>
References: <20230222132425.7442-1-jiaxun.yang@flygoat.com>
 <20230222132425.7442-2-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230222132425.7442-2-jiaxun.yang@flygoat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Feb 22, 2023 at 01:24:22PM +0000, Jiaxun Yang wrote:
> As now we are always managing DMA coherence on per dev bias,
> there is no need to have such option. And it's not selected
> by any platform.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> v2: Remove unrelated change.
> ---
>  arch/mips/Kconfig | 5 -----
>  1 file changed, 5 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
