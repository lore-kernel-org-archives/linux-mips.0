Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90E82C433E0
	for <linux-mips@archiver.kernel.org>; Tue, 23 Feb 2021 13:26:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6098864E3F
	for <linux-mips@archiver.kernel.org>; Tue, 23 Feb 2021 13:26:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232825AbhBWN0F (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Tue, 23 Feb 2021 08:26:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232801AbhBWN0E (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 23 Feb 2021 08:26:04 -0500
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8615DC061574;
        Tue, 23 Feb 2021 05:25:24 -0800 (PST)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id DBE6B92009E; Tue, 23 Feb 2021 14:25:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id CD90392009D;
        Tue, 23 Feb 2021 14:25:23 +0100 (CET)
Date:   Tue, 23 Feb 2021 14:25:23 +0100 (CET)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Tiezhu Yang <yangtiezhu@loongson.cn>,
        Willy Tarreau <w@1wt.eu>, linux-edac@vger.kernel.org,
        linux-hams@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] MIPS: SGI-IP27: fix spelling in Copyright
In-Reply-To: <20210222161905.1153-6-lukas.bulwahn@gmail.com>
Message-ID: <alpine.DEB.2.21.2102231424490.1900@angie.orcam.me.uk>
References: <20210222161905.1153-1-lukas.bulwahn@gmail.com> <20210222161905.1153-6-lukas.bulwahn@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 22 Feb 2021, Lukas Bulwahn wrote:

> This is a Copyright line, and just a typo slipped through.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---

Reviewed-by: Maciej W. Rozycki <macro@orcam.me.uk>

  Maciej
