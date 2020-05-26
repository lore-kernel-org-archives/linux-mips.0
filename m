Return-Path: <SRS0=VU9m=7I=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F7E2C433E0
	for <linux-mips@archiver.kernel.org>; Tue, 26 May 2020 22:44:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 593EF208C3
	for <linux-mips@archiver.kernel.org>; Tue, 26 May 2020 22:44:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391320AbgEZWoh (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Tue, 26 May 2020 18:44:37 -0400
Received: from mail6.webfaction.com ([31.170.123.134]:52732 "EHLO
        smtp.webfaction.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389755AbgEZWoh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 26 May 2020 18:44:37 -0400
Received: from jeremy.localnet (host-37-191-188-128.lynet.no [37.191.188.128])
        by smtp.webfaction.com (Postfix) with ESMTPSA id B75CC600BB8DE;
        Tue, 26 May 2020 22:44:35 +0000 (UTC)
From:   Paul Boddie <paul@boddie.org.uk>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     "H . Nikolaus Schaller" <hns@goldelico.com>,
        =?utf-8?B?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>,
        linux-mips <linux-mips@vger.kernel.org>
Subject: Re: JZ4780 LCD controller initialisation (was Re: [PATCH] clocksource: Ingenic: Add high resolution timer support for SMP.)
Date:   Wed, 27 May 2020 00:44:17 +0200
Message-ID: <6095840.Tg7rQzGjE8@jeremy>
User-Agent: KMail/4.14.1 (Linux/3.16.0-10-586; KDE/4.14.2; i686; ; )
In-Reply-To: <4T1YAQ.877BANO14QDY2@crapouillou.net>
References: <1589898923-60048-5-git-send-email-zhouyanjie@wanyeetech.com> <2002785.O4FZc3DvTp@jeremy> <4T1YAQ.877BANO14QDY2@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Paul,

Thanks for the reply!

On Tuesday 26. May 2020 17.03.04 Paul Cercueil wrote:
> 
> "lcd0pixclk" and "tve" are for LCD0, "lcd1pixclk" and "lcd" are for
> LCD1.

The 3.0.8 kernel actually uses LCD0 for what the documentation and 3.18 kernel 
call TVE, and it uses LCD1 for what the others call LCD. That earlier kernel 
indicates that LCD1 is the parent clock of LCD0.

I actually found that you can enable LCD0 and not LCD1 and the LCD controller 
(LCDC0) still operates to an extent, but without LCD1 enabled I didn't see a 
DMA command value in the appropriate register, discussed below.

[...]

> OK, indeed the BPP and OSD config is read-only, and it's not a doc
> typo. How annoying.
> 
> I tried to configure the LCD controller for a 8-byte descriptor without
> much success. No IRQs here either.

I had a look at the interrupt controller registers to see whether I was 
missing anything obvious, but the mask was correctly configured to unmask LCD 
interrupts (bit 31 of ICMR0). I did wonder whether the PDMA interrupts might 
need unmasking, just in case there is some interaction between the peripherals 
and that part of the hardware, but unmasking LCD interrupts there (bit 31 of 
DMR0) didn't make any difference.

One observation I can make is that the length or size field of the LCD command 
register (LCDCMD0) does get initialised to the appropriate value as set in a 
descriptor. Since I don't set this register explicitly myself (unlike, I 
think, the current Ingenic DRM driver in the Linux kernel), the value must 
have been set up appropriately by a DMA transfer, as configured using the 
descriptor address register (LCDDA0). However, the command flags I also set in 
the descriptor are not reflected in the register. So, 0x44140000 becomes 
0x00140000.

I thought I should check the interrupt ID register (LCDIID) to see what it 
reveals. Despite setting a value in the appropriate descriptor field, the 
register contains only zero.

I think I must probably tackle the job of initialising the HDMI controller to 
see if that makes a difference. If the interrupts are not working but are also 
not necessary, then maybe I get a visual indication of success.

Thanks for the feedback!

Paul
