Return-Path: <SRS0=ffv7=EM=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F09CC2D0A3
	for <linux-mips@archiver.kernel.org>; Fri,  6 Nov 2020 10:54:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B92A120724
	for <linux-mips@archiver.kernel.org>; Fri,  6 Nov 2020 10:54:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727192AbgKFKyM (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Fri, 6 Nov 2020 05:54:12 -0500
Received: from elvis.franken.de ([193.175.24.41]:41174 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726642AbgKFKxz (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 6 Nov 2020 05:53:55 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kazNQ-0000vt-00; Fri, 06 Nov 2020 11:53:52 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 2895BC4DD9; Fri,  6 Nov 2020 11:48:48 +0100 (CET)
Date:   Fri, 6 Nov 2020 11:48:48 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Chuanhong Guo <gch981213@gmail.com>
Cc:     linux-mips@vger.kernel.org,
        John Thomson <git@johnthomson.fastmail.com.au>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MIPS: zboot: put appended dtb into a section
Message-ID: <20201106104848.GA9806@alpha.franken.de>
References: <20201026122926.1774569-1-gch981213@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201026122926.1774569-1-gch981213@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Oct 26, 2020 at 08:29:25PM +0800, Chuanhong Guo wrote:
> This will make a separated section for dtb appear in ELF, and we can
> then use objcopy to patch a dtb into vmlinuz when RAW_APPENDED_DTB
> is set in kernel config.
> 
> command to patch a dtb:
> objcopy --set-section-flags=.appended_dtb=alloc,contents \
>         --update-section=.appended_dtb=<target>.dtb vmlinuz
> 
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> ---
> Note:
> This should supersede this patch on linux-mips:
> [2/2] mips: boot compressed: add support for vlinuz ELF DTB [0]
> 
> [0] https://patchwork.kernel.org/project/linux-mips/patch/20201015201100.4130-2-git@johnthomson.fastmail.com.au/
>  
>  arch/mips/boot/compressed/ld.script | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
