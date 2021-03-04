Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9B9EC433E0
	for <linux-mips@archiver.kernel.org>; Thu,  4 Mar 2021 23:08:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BD38164FF4
	for <linux-mips@archiver.kernel.org>; Thu,  4 Mar 2021 23:08:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232146AbhCDXIb (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Thu, 4 Mar 2021 18:08:31 -0500
Received: from angie.orcam.me.uk ([157.25.102.26]:37442 "EHLO
        angie.orcam.me.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230403AbhCDXIb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 4 Mar 2021 18:08:31 -0500
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id B42C392009C; Fri,  5 Mar 2021 00:08:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id ADE1C92009B;
        Fri,  5 Mar 2021 00:08:29 +0100 (CET)
Date:   Fri, 5 Mar 2021 00:08:29 +0100 (CET)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH] MIPS: Add comment about CONFIG_MIPS32_O32 in
 loongson3_defconfig when build with Clang
In-Reply-To: <1614820544-10686-1-git-send-email-yangtiezhu@loongson.cn>
Message-ID: <alpine.DEB.2.21.2103042356150.51127@angie.orcam.me.uk>
References: <1614820544-10686-1-git-send-email-yangtiezhu@loongson.cn>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 4 Mar 2021, Tiezhu Yang wrote:

> This is a known bug [2] with Clang, as Simon Atanasyan said,
> "There is no plan on support O32 for MIPS64 due to lack of
> resources".

 Huh?  Is that a joke?  From the o32 psABI's point of view a MIPS64 CPU is 
exactly the same as a MIPS32 one (for whatever ISA revision), so there's 
nothing to support there really other than the CPU/ISA name.

 As much as I dislike all the hacks the Clang community seems to come up 
with for the shortcomings of their tool there has to be a saner workaround 
available rather than forcibly disabling support for the o32 ABI with 
CONFIG_64BIT kernels, but the report is missing the compiler invocation 
line triggering the issue (V=1 perhaps?), which should be included with 
any commit description anyway, so I can't suggest anything based on the 
limited information provided.

  Maciej
