Received: from mailapp01.imgtec.com ([195.59.15.196]:54019 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27006532AbbBSQRzL0J0N (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 19 Feb 2015 17:17:55 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id BEA73BECBE570
        for <linux-mips@linux-mips.org>; Thu, 19 Feb 2015 16:17:46 +0000 (GMT)
From: "Steven J. Hill" <Steven.Hill@imgtec.com>
Subject: [PATCH V2 0/3] HIGHMEM and cache flush fixes.
Date: Thu, 19 Feb 2015 10:17:41 -0600
Message-ID: <1424362664-30303-1-git-send-email-Steven.Hill@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Steven.Hill@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: IMG-MIPSLinuxKerneldevelopers@imgtec.com, linux-mips@linux-mips.org
Message-ID: <20150219161741.Bw54mnukEH0COcH91-KI5-l1jGlbj3YRo7pIWUg2Szk@z>

This patchset fixes HIGHMEM and utilizes kmap coloring support. The
other two patches fix some cache flushing corner cases.

Changes from V1:
 - Rebased against upstream 3.19-rc4 tag.

Leonid Yegoshin (3):
  MIPS: Fix cache flushing for swap pages with non-DMA I/O.
  MIPS: Highmem: Fixes for cache aliasing and color.
  MIPS: Fix I-cache flushing for kmap'd pages.

 arch/mips/Kconfig                    |    1 +
 arch/mips/include/asm/cacheflush.h   |    3 +-
 arch/mips/include/asm/cpu-features.h |    6 ++
 arch/mips/include/asm/fixmap.h       |   18 +++++-
 arch/mips/include/asm/highmem.h      |   33 +++++++++++
 arch/mips/include/asm/page.h         |    5 +-
 arch/mips/include/asm/pgtable.h      |    5 ++
 arch/mips/mm/c-r4k.c                 |   44 ++++++++++++--
 arch/mips/mm/cache.c                 |  108 ++++++++++++++++++++++------------
 arch/mips/mm/highmem.c               |   43 +++++---------
 arch/mips/mm/init.c                  |   35 ++++++-----
 arch/mips/mm/sc-mips.c               |    1 +
 12 files changed, 210 insertions(+), 92 deletions(-)

-- 
1.7.10.4
