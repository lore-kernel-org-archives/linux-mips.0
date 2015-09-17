Received: from mailapp01.imgtec.com ([195.59.15.196]:5644 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008168AbbIQQufh-ByP (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 17 Sep 2015 18:50:35 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 0/2] Fix FTLB detection on R6
Date: Thu, 17 Sep 2015 17:49:19 +0100
Message-ID: <1442508561-12260-1-git-send-email-james.hogan@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <James.Hogan@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Cc: James Hogan <james.hogan@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20150917164919.Cysg3k2BoV7krR66Z5Uw_5D4Jg_QtLAOR0t8EdJyhjc@z>

These patches fix FTLB detection on R6 cores. Currently an FTLB will be
assumed to exist, so if not then the setting of the FTLB page size will
likely fail during boot.

The first patch adds cpu_has_ftlb, based on Config.MT (MMU type), which
distinguishes a traditional TLB from a VTLB+FTLB configuration.

The second patch fixes the probe logic to use cpu_has_ftlb for R6.

James Hogan (2):
  MIPS: cpu-features: Add cpu_has_ftlb
  MIPS: Fix FTLB detection for R6

 arch/mips/include/asm/cpu-features.h |  3 +++
 arch/mips/include/asm/cpu.h          |  1 +
 arch/mips/include/asm/mipsregs.h     |  2 ++
 arch/mips/kernel/cpu-probe.c         | 23 ++++++++++++++---------
 4 files changed, 20 insertions(+), 9 deletions(-)

Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Markos Chandras <markos.chandras@imgtec.com>
Cc: linux-mips@linux-mips.org
-- 
2.4.6
