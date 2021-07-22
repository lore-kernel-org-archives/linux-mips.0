Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A4E6C63793
	for <linux-mips@archiver.kernel.org>; Thu, 22 Jul 2021 10:10:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BC0126127C
	for <linux-mips@archiver.kernel.org>; Thu, 22 Jul 2021 10:10:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231512AbhGVJ3x (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Thu, 22 Jul 2021 05:29:53 -0400
Received: from elvis.franken.de ([193.175.24.41]:45353 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231487AbhGVJ3x (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 22 Jul 2021 05:29:53 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1m6Ves-0007ey-03; Thu, 22 Jul 2021 12:10:26 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id A834BC11EE; Thu, 22 Jul 2021 12:09:46 +0200 (CEST)
Date:   Thu, 22 Jul 2021 12:09:46 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-mips@linux-mips.org,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Huacai Chen <chenhuacai@kernel.org>, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH 2/2] mips: clean up kvm Makefile
Message-ID: <20210722100946.GB7427@alpha.franken.de>
References: <20210331150658.38919-1-masahiroy@kernel.org>
 <20210331150658.38919-2-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210331150658.38919-2-masahiroy@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Apr 01, 2021 at 12:06:57AM +0900, Masahiro Yamada wrote:
> You can use kvm-y instead of kvm-objs to create the composite module.
> kvm-$(CONFIG_...) looks cleaner.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  arch/mips/kvm/Makefile | 21 +++++++++------------
>  1 file changed, 9 insertions(+), 12 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
