Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2249EC433ED
	for <linux-mips@archiver.kernel.org>; Thu, 22 Apr 2021 20:36:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D50C8613CD
	for <linux-mips@archiver.kernel.org>; Thu, 22 Apr 2021 20:36:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236877AbhDVUgk (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Thu, 22 Apr 2021 16:36:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236851AbhDVUgi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 22 Apr 2021 16:36:38 -0400
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0EB6EC06174A;
        Thu, 22 Apr 2021 13:36:03 -0700 (PDT)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 3845292009C; Thu, 22 Apr 2021 22:36:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 2EBC592009B;
        Thu, 22 Apr 2021 22:36:01 +0200 (CEST)
Date:   Thu, 22 Apr 2021 22:36:01 +0200 (CEST)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc:     Huacai Chen <chenhuacai@kernel.org>,
        Huacai Chen <chenhuacai@loongson.cn>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] MIPSr6 `do_div' support and typo fixes
Message-ID: <alpine.DEB.2.21.2104222124010.44318@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

 As discussed over the last couple of days here are fixes for the MIPS 
`do_div' handler and the test module.

 As my Malta does not work at the moment I have only run-time verified 
these with a DECstation.  For additional verification I have built the 
kernel for a MIPS32r6 configuration as well as a microMIPS one.

 Please apply.

  Maciej
