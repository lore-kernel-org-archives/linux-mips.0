Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52A7DC43381
	for <linux-mips@archiver.kernel.org>; Mon,  8 Feb 2021 17:59:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2325964ED1
	for <linux-mips@archiver.kernel.org>; Mon,  8 Feb 2021 17:59:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234282AbhBHR6t (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Mon, 8 Feb 2021 12:58:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235061AbhBHR5m (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 8 Feb 2021 12:57:42 -0500
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4043EC0617A9;
        Mon,  8 Feb 2021 09:56:54 -0800 (PST)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 556E29200B4; Mon,  8 Feb 2021 18:56:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 4E5E49200B3;
        Mon,  8 Feb 2021 18:56:53 +0100 (CET)
Date:   Mon, 8 Feb 2021 18:56:53 +0100 (CET)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: vpe: Remove vpe_getcwd
In-Reply-To: <20210122114449.19423-1-tsbogend@alpha.franken.de>
Message-ID: <alpine.DEB.2.21.2102081853330.35623@angie.orcam.me.uk>
References: <20210122114449.19423-1-tsbogend@alpha.franken.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 22 Jan 2021, Thomas Bogendoerfer wrote:

> I couldn't find any user of the dubious vpe_getcwd so far. So remove it and
> get rid of another set_fs(KERNEL_DS).

 IIRC it served as the path for the SP-side program to load in the AP/SP 
model.  Or something like that.  There may have been an application note 
available describing how to use this stuff.  Chances are some of the code 
may have already been removed in previous cuts.

  Maciej
