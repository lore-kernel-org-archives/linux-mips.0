Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC537C433E0
	for <linux-mips@archiver.kernel.org>; Sun, 14 Mar 2021 22:32:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6F4F064EB2
	for <linux-mips@archiver.kernel.org>; Sun, 14 Mar 2021 22:32:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229661AbhCNWcV (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Sun, 14 Mar 2021 18:32:21 -0400
Received: from angie.orcam.me.uk ([157.25.102.26]:37692 "EHLO
        angie.orcam.me.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbhCNWbv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 14 Mar 2021 18:31:51 -0400
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 236A392009C; Sun, 14 Mar 2021 23:31:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 173A192009B;
        Sun, 14 Mar 2021 23:31:50 +0100 (CET)
Date:   Sun, 14 Mar 2021 23:31:49 +0100 (CET)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Huang Pei <huangpei@loongson.cn>
cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        ambrosehua@gmail.com, Bibo Mao <maobibo@loongson.cn>,
        linux-mips@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-mm@kvack.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Paul Burton <paulburton@kernel.org>,
        Li Xuefeng <lixuefeng@loongson.cn>,
        Yang Tiezhu <yangtiezhu@loongson.cn>,
        Gao Juxin <gaojuxin@loongson.cn>,
        Huacai Chen <chenhuacai@loongson.cn>,
        Jinyang He <hejinyang@loongson.cn>
Subject: Re: [PATCH V4]: minor cleanup and improvement
In-Reply-To: <20210309080210.25561-1-huangpei@loongson.cn>
Message-ID: <alpine.DEB.2.21.2103142326220.33195@angie.orcam.me.uk>
References: <20210309080210.25561-1-huangpei@loongson.cn>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 9 Mar 2021, Huang Pei wrote:

> [PATCH 1/2] V4 vs V3:

 It will help if you don't change the subject proper of the cover letter 
with every iteration of a patch series, as in that case mail user agents 
(at least the sane ones) will group all iterations together in the thread 
sorting mode.  With the subject changed every time the link is lost and 
submissions are scattered all over the mail folder.

  Maciej
