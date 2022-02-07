Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59E70C35272
	for <linux-mips@archiver.kernel.org>; Mon,  7 Feb 2022 17:49:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230398AbiBGRtZ (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Mon, 7 Feb 2022 12:49:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383621AbiBGRkd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 7 Feb 2022 12:40:33 -0500
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1E54CC0401D9
        for <linux-mips@vger.kernel.org>; Mon,  7 Feb 2022 09:40:32 -0800 (PST)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1nH7yl-0006Gx-00; Mon, 07 Feb 2022 18:39:07 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id E2F8EC20E1; Mon,  7 Feb 2022 18:35:25 +0100 (CET)
Date:   Mon, 7 Feb 2022 18:35:25 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Wenli Looi <wlooi@ucalgary.ca>
Cc:     linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: ath79: add support for QCN550x
Message-ID: <20220207173525.GA16822@alpha.franken.de>
References: <20220124071329.76057-1-wlooi@ucalgary.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220124071329.76057-1-wlooi@ucalgary.ca>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Jan 23, 2022 at 11:13:31PM -0800, Wenli Looi wrote:
> Adds support for QCN550x, which appears to be very similar to QCA956x.
> 
> Signed-off-by: Wenli Looi <wlooi@ucalgary.ca>
> ---
> 
> Notes:
> - OpenWrt pull request: https://github.com/openwrt/openwrt/pull/4271
>   (contains boot log with stock firmware and with this patch)
> - QSDK source: https://source.codeaurora.org/quic/qsdk/oss/system/openwrt/tree/target/linux/ar71xx/patches-3.3/9991-MIPS-ath79-add-SoC-detection-code-for-QCN550X.patch?h=aa/banana
> - QSDK clock init appears identical to QCA956x.
> - Only tested on QCN5502, not sure if it works for QCN5500.
> 
>  arch/mips/ath79/early_printk.c                 | 1 +
>  arch/mips/ath79/setup.c                        | 6 ++++++
>  arch/mips/include/asm/mach-ath79/ar71xx_regs.h | 1 +
>  3 files changed, 8 insertions(+)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
