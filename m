Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D538FC433E0
	for <linux-mips@archiver.kernel.org>; Thu,  4 Mar 2021 22:53:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A10A764FF3
	for <linux-mips@archiver.kernel.org>; Thu,  4 Mar 2021 22:53:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232250AbhCDWxI (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Thu, 4 Mar 2021 17:53:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbhCDWxH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 4 Mar 2021 17:53:07 -0500
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0F5F9C061574;
        Thu,  4 Mar 2021 14:53:07 -0800 (PST)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id B91D092009C; Thu,  4 Mar 2021 23:53:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id B608E92009B;
        Thu,  4 Mar 2021 23:53:03 +0100 (CET)
Date:   Thu, 4 Mar 2021 23:53:03 +0100 (CET)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Rob Herring <robh@kernel.org>
cc:     Paul Cercueil <paul@crapouillou.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>, od@zcrc.me,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MIPS: boot/compressed: Copy DTB to aligned address
In-Reply-To: <CAL_JsqLfkjC4c4PYfm6yJLZMH-5WaKA_mr9ziJ1J63UohcgRCw@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2103042349390.51127@angie.orcam.me.uk>
References: <20210303193305.924384-1-paul@crapouillou.net> <CAL_JsqLfkjC4c4PYfm6yJLZMH-5WaKA_mr9ziJ1J63UohcgRCw@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 3 Mar 2021, Rob Herring wrote:

> > Since 5.12-rc1, the Device Tree blob must now be properly aligned.
> 
> I had checked the other built-in cases as microblaze broke too, but
> missed some of the many ways MIPS can have a dtb. Appended and
> built-in DTBs were supposed to be temporary. :(

 How is it supposed to work otherwise when all that a piece of firmware 
loads is an SREC image (over TFTP)?

  Maciej
