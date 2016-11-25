Received: from mailapp01.imgtec.com ([195.59.15.196]:16972 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23991894AbcKYSqlT0sTI (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 25 Nov 2016 19:46:41 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 0/3] MIPS: A few DMA & caching fixes
Date: Fri, 25 Nov 2016 18:46:08 +0000
Message-ID: <20161125184611.28396-1-paul.burton@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Paul.Burton@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20161125184608.WFm7nH3DK_HlTOIQp4RO2-B1LMcFKh7wHyL2ysApgDI@z>

This series fixes a few issues with caching around DMA operations.
Please see individual commit messages for further details &
descriptions.

The series applies atop v4.9-rc6.


Paul Burton (3):
  MIPS: WARN_ON invalid DMA cache maintenance, not BUG_ON
  MIPS: Don't writeback when cache-invalidating DMA buffers
  MIPS: Sanitise DMA unmapping cache sync operations

 arch/mips/mm/c-r4k.c       | 13 +++++++++++--
 arch/mips/mm/dma-default.c |  4 ++--
 arch/mips/mm/sc-mips.c     | 36 ++++++++++++++++++++++++++++++++++--
 3 files changed, 47 insertions(+), 6 deletions(-)

-- 
2.10.2
