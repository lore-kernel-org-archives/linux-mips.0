Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4171C433ED
	for <linux-mips@archiver.kernel.org>; Mon, 12 Apr 2021 14:06:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B3BE6128B
	for <linux-mips@archiver.kernel.org>; Mon, 12 Apr 2021 14:06:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240501AbhDLOGb (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Mon, 12 Apr 2021 10:06:31 -0400
Received: from angie.orcam.me.uk ([157.25.102.26]:38796 "EHLO
        angie.orcam.me.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242116AbhDLOGb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 12 Apr 2021 10:06:31 -0400
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 8371792009C; Mon, 12 Apr 2021 16:06:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 7CA1392009B;
        Mon, 12 Apr 2021 16:06:12 +0200 (CEST)
Date:   Mon, 12 Apr 2021 16:06:12 +0200 (CEST)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Huacai Chen <chenhuacai@kernel.org>
cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhuacai@loongson.cn>, stable@vger.kernel.org
Subject: Re: [PATCH] MIPS: Remove unused and erroneous div64.h
In-Reply-To: <20210412033451.215379-1-chenhuacai@loongson.cn>
Message-ID: <alpine.DEB.2.21.2104121604150.65251@angie.orcam.me.uk>
References: <20210412033451.215379-1-chenhuacai@loongson.cn>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 12 Apr 2021, Huacai Chen wrote:

> 5, As Nikolaus, Yunqiang Su and Yanjie Zhou said, the MIPS-specific
>    __div64_32() sometimes produces wrong results, which makes 32bit
>    kernel boot fails.
> 
> I have tried to fix theses errors but I have failed with the last one.

 I think this is a weak argument for removal, isn't it?

  Maciej
