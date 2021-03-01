Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6644C433DB
	for <linux-mips@archiver.kernel.org>; Mon,  1 Mar 2021 17:21:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7E432651FD
	for <linux-mips@archiver.kernel.org>; Mon,  1 Mar 2021 17:21:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232760AbhCARUq (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Mon, 1 Mar 2021 12:20:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238025AbhCARS1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 1 Mar 2021 12:18:27 -0500
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 12D46C061794
        for <linux-mips@vger.kernel.org>; Mon,  1 Mar 2021 09:17:23 -0800 (PST)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 721E592009C; Mon,  1 Mar 2021 18:17:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 6EAF592009B;
        Mon,  1 Mar 2021 18:17:21 +0100 (CET)
Date:   Mon, 1 Mar 2021 18:17:21 +0100 (CET)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Jinyang He <hejinyang@loongson.cn>
cc:     "open list:MIPS" <linux-mips@vger.kernel.org>
Subject: Re: [Question] How to save_stack_trace_tsk_reliable() on mips?
In-Reply-To: <b0b701ce-5a24-64c6-1124-3af69fb07a08@loongson.cn>
Message-ID: <alpine.DEB.2.21.2103011816551.19637@angie.orcam.me.uk>
References: <a0823990-420f-8091-7866-8ad588ef542d@loongson.cn> <alpine.DEB.2.21.2103010043260.44210@angie.orcam.me.uk> <b0b701ce-5a24-64c6-1124-3af69fb07a08@loongson.cn>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 1 Mar 2021, Jinyang He wrote:

> Thank you for answering patiently. You are always so enthusiastic.
> These are very helpful to me. :-)

 You are welcome! :)

  Maciej
