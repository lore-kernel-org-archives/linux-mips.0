Return-Path: <linux-mips-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 654D3CE7B09
	for <linux-mips@archiver.kernel.org>; Thu, 28 Sep 2023 08:06:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231316AbjI1IGa (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Thu, 28 Sep 2023 04:06:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231335AbjI1IGU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 Sep 2023 04:06:20 -0400
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2771519A8;
        Thu, 28 Sep 2023 01:05:36 -0700 (PDT)
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
        id 1qlm1d-0003em-00; Thu, 28 Sep 2023 10:05:33 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 88EC1C013D; Thu, 28 Sep 2023 10:05:22 +0200 (CEST)
Date:   Thu, 28 Sep 2023 10:05:22 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     torvalds@linux-foundation.org
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] MIPS fixes for v6.6
Message-ID: <ZRUzwtxcT7lD6CCv@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The following changes since commit 6465e260f48790807eef06b583b38ca9789b6072:

  Linux 6.6-rc3 (2023-09-24 14:31:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_6.6_1

for you to fetch changes up to ef8f8f04a0b25e8f294b24350e8463a8d6a9ba0b:

  MIPS: Alchemy: only build mmc support helpers if au1xmmc is enabled (2023-09-25 11:43:55 +0200)

----------------------------------------------------------------
- fix Alchemy build with MMC support disabled

----------------------------------------------------------------
Christoph Hellwig (1):
      MIPS: Alchemy: only build mmc support helpers if au1xmmc is enabled

 arch/mips/alchemy/devboards/db1000.c | 4 ++++
 arch/mips/alchemy/devboards/db1200.c | 6 ++++++
 arch/mips/alchemy/devboards/db1300.c | 4 ++++
 3 files changed, 14 insertions(+)

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
