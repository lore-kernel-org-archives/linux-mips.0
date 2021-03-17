Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2312C433DB
	for <linux-mips@archiver.kernel.org>; Wed, 17 Mar 2021 12:35:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 51CC664F75
	for <linux-mips@archiver.kernel.org>; Wed, 17 Mar 2021 12:35:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229796AbhCQMep (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Wed, 17 Mar 2021 08:34:45 -0400
Received: from elvis.franken.de ([193.175.24.41]:36288 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229680AbhCQMem (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 17 Mar 2021 08:34:42 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lMVNp-00044z-00; Wed, 17 Mar 2021 13:34:41 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 2925DC0CF6; Wed, 17 Mar 2021 13:34:34 +0100 (CET)
Date:   Wed, 17 Mar 2021 13:34:34 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     torvalds@linux-foundation.org
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] MIPS fixes for v5.12
Message-ID: <20210317123434.GA14230@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The following changes since commit bd67b711bfaa02cf19e88aa2d9edae5c1c1d2739:

  MIPS: kernel: Reserve exception base early to prevent corruption (2021-03-09 11:22:59 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_5.12_2

for you to fetch changes up to 3f6c515d723480bc8afd456b0a52438fe79128a8:

  MIPS: vmlinux.lds.S: Fix appended dtb not properly aligned (2021-03-16 22:53:08 +0100)

----------------------------------------------------------------
Fix for fdt alignment, when image is compressed

----------------------------------------------------------------
Paul Cercueil (1):
      MIPS: vmlinux.lds.S: Fix appended dtb not properly aligned

 arch/mips/kernel/vmlinux.lds.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)


-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
