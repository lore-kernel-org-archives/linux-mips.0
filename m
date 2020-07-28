Return-Path: <SRS0=slhF=BH=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4A34C433EC
	for <linux-mips@archiver.kernel.org>; Tue, 28 Jul 2020 20:57:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AE5F420714
	for <linux-mips@archiver.kernel.org>; Tue, 28 Jul 2020 20:57:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729277AbgG1U50 (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Tue, 28 Jul 2020 16:57:26 -0400
Received: from elvis.franken.de ([193.175.24.41]:52470 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728993AbgG1U50 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 28 Jul 2020 16:57:26 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1k0Wez-0007gK-00; Tue, 28 Jul 2020 22:57:17 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 224ECC0A99; Tue, 28 Jul 2020 22:51:25 +0200 (CEST)
Date:   Tue, 28 Jul 2020 22:51:25 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     WANG Xuerui <git@xen0n.name>
Cc:     linux-mips@vger.kernel.org, Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [PATCH v4 3/3] MIPS: handle Loongson-specific GSExc exception
Message-ID: <20200728205125.GA22052@alpha.franken.de>
References: <20200728100655.3005831-1-git@xen0n.name>
 <20200728100655.3005831-4-git@xen0n.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200728100655.3005831-4-git@xen0n.name>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jul 28, 2020 at 06:06:55PM +0800, WANG Xuerui wrote:
> index a1b966f3578e..5fa87d4b5dca 100644
> --- a/arch/mips/kernel/genex.S
> +++ b/arch/mips/kernel/genex.S
> @@ -498,6 +498,12 @@ NESTED(nmi_handler, PT_SIZE, sp)
>  	KMODE
>  	.endm
>  
> +	.macro __build_clear_gsexc
> +	mfc0	a1, CP0_DIAGNOSTIC1

this doesn't work when building for a legacy core:

/local/tbogendoerfer/korg/linux/arch/mips/kernel/genex.S: Assembler messages:
/local/tbogendoerfer/korg/linux/arch/mips/kernel/genex.S:565: Error: invalid operands `mfc0 $5,$22,1'

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
