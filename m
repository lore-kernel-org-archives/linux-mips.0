Return-Path: <linux-mips-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE095C64ED6
	for <linux-mips@archiver.kernel.org>; Sun, 26 Feb 2023 23:23:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbjBZXXn (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Sun, 26 Feb 2023 18:23:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbjBZXXm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 26 Feb 2023 18:23:42 -0500
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C85E0C16F
        for <linux-mips@vger.kernel.org>; Sun, 26 Feb 2023 15:23:40 -0800 (PST)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1pWQMl-00041D-00; Mon, 27 Feb 2023 00:23:39 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 0FB7CC017D; Mon, 27 Feb 2023 00:23:32 +0100 (CET)
Date:   Mon, 27 Feb 2023 00:23:31 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org
Subject: Re: [PATCH 2/2] MIPS: cevt-r4k: Offset counter value for clearing
 compare interrupt
Message-ID: <20230226232331.GA9208@alpha.franken.de>
References: <20230225221008.8520-1-jiaxun.yang@flygoat.com>
 <20230225221008.8520-3-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230225221008.8520-3-jiaxun.yang@flygoat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Feb 25, 2023 at 10:10:08PM +0000, Jiaxun Yang wrote:
> In c0_compare_int_usable we clear compare interrupt by write value
> just read out from counter to compare register.
> 
> However sometimes if those all instructions are graduated together
> then it's possible that at the time compare register is written, the
> counter haven't progressed, thus the interrupt is triggered again.
> 
> It also applies to QEMU that instructions is execuated significantly
> faster then counter.
> 
> Offset the counter value a litlle bit to prevent that happen.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  arch/mips/kernel/cevt-r4k.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/mips/kernel/cevt-r4k.c b/arch/mips/kernel/cevt-r4k.c
> index 32ec67c9ab67..bbc422376e97 100644
> --- a/arch/mips/kernel/cevt-r4k.c
> +++ b/arch/mips/kernel/cevt-r4k.c
> @@ -200,6 +200,8 @@ int c0_compare_int_usable(void)
>  	 */
>  	if (c0_compare_int_pending()) {
>  		cnt = read_c0_count();
> +		// Drawdown a little bit in case counter haven't progressed

no C++ comments

> +		cnt -= COMPARE_INT_SEEN_TICKS;
>  		write_c0_compare(cnt);
>  		back_to_back_c0_hazard();
>  		while (read_c0_count() < (cnt  + COMPARE_INT_SEEN_TICKS))

this doesn't make sense. clearing of the interrupts happes because of
this loop. So either COMPARE_INT_SEEN_TICKS is too small or you are
hunting a different bug.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
