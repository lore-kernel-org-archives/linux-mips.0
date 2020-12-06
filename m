Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64629C4361B
	for <linux-mips@archiver.kernel.org>; Sun,  6 Dec 2020 14:34:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 22F7D23159
	for <linux-mips@archiver.kernel.org>; Sun,  6 Dec 2020 14:34:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726298AbgLFOex (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Sun, 6 Dec 2020 09:34:53 -0500
Received: from [157.25.102.26] ([157.25.102.26]:54072 "EHLO orcam.me.uk"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726203AbgLFOex (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 6 Dec 2020 09:34:53 -0500
Received: from bugs.linux-mips.org (eddie.linux-mips.org [IPv6:2a01:4f8:201:92aa::3])
        by orcam.me.uk (Postfix) with ESMTPS id 0470E2BE0EC;
        Sun,  6 Dec 2020 14:34:20 +0000 (GMT)
Date:   Sun, 6 Dec 2020 14:33:33 +0000 (GMT)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Anders Roxell <anders.roxell@linaro.org>
cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        natechancellor@gmail.com, ndesaulniers@google.com,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com
Subject: Re: [PATCH] mips: lib: uncached: fix uninitialized variable 'sp'
In-Reply-To: <alpine.LFD.2.21.2012060915460.656242@eddie.linux-mips.org>
Message-ID: <alpine.LFD.2.21.2012061431190.656242@eddie.linux-mips.org>
References: <20201127083938.2666770-1-anders.roxell@linaro.org> <alpine.LFD.2.21.2012060915460.656242@eddie.linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, 6 Dec 2020, Maciej W. Rozycki wrote:

>  I think this should be OK once the issues I mentioned here have been 
> addressed.

 Or alternatively making the variable global would possibly be a better 
fix as it would let the compiler decide if to waste another register to 
keep a copy of $sp.

  Maciej

