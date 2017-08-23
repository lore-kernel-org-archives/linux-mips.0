Received: from mailapp01.imgtec.com ([195.59.15.196]:3734 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23994850AbdHWUxnv0gSs (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 23 Aug 2017 22:53:43 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 0/2] MIPS: Clean up halt/restart/power off code
Date: Wed, 23 Aug 2017 13:53:15 -0700
Message-ID: <20170823205317.4828-1-paul.burton@imgtec.com>
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
To: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@imgtec.com>
Message-ID: <20170823205315.-MMI2stgVRNb-QGFmgSnNVsEg45qb-cFcFQ9yLKmn90@z>

This series cleans up duplication between platforms in the area of
machine halt, restart & power off callbacks. First it adapts the generic
code path to provide a suitably generic version of functionality
currently duplicated by many platforms, then it removes those custom
implementations from platforms such that they make use of the generic
code.

Applies atop v4.13-rc6.

Paul Burton (2):
  MIPS: Hang more efficiently on halt/powerdown/restart
  MIPS: Remove custom implementations CPU hang implementations

 arch/mips/alchemy/board-gpr.c          |  8 ----
 arch/mips/alchemy/board-mtx1.c         | 11 ------
 arch/mips/alchemy/board-xxs1500.c      | 11 ------
 arch/mips/alchemy/devboards/platform.c |  2 -
 arch/mips/ar7/setup.c                  |  8 ----
 arch/mips/ath25/board.c                |  9 -----
 arch/mips/ath79/setup.c                |  9 -----
 arch/mips/bcm47xx/setup.c              |  4 --
 arch/mips/bcm63xx/setup.c              |  9 -----
 arch/mips/cobalt/reset.c               |  4 --
 arch/mips/emma/markeins/setup.c        |  2 -
 arch/mips/jz4740/reset.c               | 13 -------
 arch/mips/kernel/reset.c               | 68 +++++++++++++++++++++++++++++++---
 arch/mips/lantiq/falcon/reset.c        | 14 -------
 arch/mips/lantiq/xway/reset.c          | 14 -------
 arch/mips/lasat/reset.c                |  1 -
 arch/mips/loongson32/common/reset.c    | 17 ---------
 arch/mips/loongson64/common/reset.c    | 18 ---------
 arch/mips/netlogic/xlp/setup.c         |  2 -
 arch/mips/netlogic/xlr/setup.c         |  2 -
 arch/mips/pic32/common/reset.c         | 22 -----------
 arch/mips/pmcs-msp71xx/msp_setup.c     | 18 ---------
 arch/mips/pnx833x/common/reset.c       | 12 ------
 arch/mips/pnx833x/common/setup.c       |  4 --
 arch/mips/ralink/reset.c               |  7 ----
 arch/mips/rb532/setup.c                |  8 ----
 arch/mips/sgi-ip22/ip22-reset.c        |  1 -
 arch/mips/txx9/generic/setup.c         | 24 ------------
 arch/mips/vr41xx/common/pmu.c          |  1 -
 29 files changed, 62 insertions(+), 261 deletions(-)

-- 
2.14.1
