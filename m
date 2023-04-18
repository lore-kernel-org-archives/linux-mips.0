Return-Path: <linux-mips-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA3AAC77B75
	for <linux-mips@archiver.kernel.org>; Tue, 18 Apr 2023 13:13:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232297AbjDRNNv (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Tue, 18 Apr 2023 09:13:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232335AbjDRNNt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 18 Apr 2023 09:13:49 -0400
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6C86612C94
        for <linux-mips@vger.kernel.org>; Tue, 18 Apr 2023 06:13:48 -0700 (PDT)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1pol9R-0000YG-01; Tue, 18 Apr 2023 15:13:41 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id D72A4C0116; Tue, 18 Apr 2023 15:09:45 +0200 (CEST)
Date:   Tue, 18 Apr 2023 15:09:45 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, llvm@lists.linux.dev,
        ndesaulniers@google.com, nathan@kernel.org
Subject: Re: [PATCH v2 3/7] MIPS: Detect toolchain support of workarounds in
 Kconfig
Message-ID: <20230418130945.GB12456@alpha.franken.de>
References: <20230414080701.15503-1-jiaxun.yang@flygoat.com>
 <20230414080701.15503-4-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230414080701.15503-4-jiaxun.yang@flygoat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Apr 14, 2023 at 09:06:57AM +0100, Jiaxun Yang wrote:
> LLVM toolchain does not support most of workarounds, detect
> those supports in Kconfig so we can hide unsupported workarounds
> to user.

again hiding something, which then needs to be digged out is IMHO not
a good way.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
