Received: from mailapp01.imgtec.com ([195.59.15.196]:18233 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009596AbbGIJlL1tDFh (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 9 Jul 2015 11:41:11 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id B9E1910F43807
        for <linux-mips@linux-mips.org>; Thu,  9 Jul 2015 10:41:03 +0100 (IST)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 00/19] Initial I6400 and CM3 support
Date: Thu, 9 Jul 2015 10:40:34 +0100
Message-ID: <1436434853-30001-1-git-send-email-markos.chandras@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Markos.Chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20150709094034.dYJJ5DoVnT_SS1CIbduMjFOCFSunRnvbegtCEJ6AjTE@z>

Hi,

This patchset adds support for I6400 processor along with the new
Coherent Manager 3.

More information about the I-Class Warrior family can be found below:

http://www.imgtec.com/mips/warrior/iclass.asp

Markos Chandras (15):
  MIPS: Add MIPS I6400 PRid and cputype identifiers
  MIPS: Add cases for CPU_I6400
  MIPS: Add MIPS I6400 probe support
  MIPS: Kconfig: Disable MIPS MT and SMP implementations for R6
  MIPS: Add platform callback before initializing the L2 cache
  MIPS: asm: mips-cm: Extend CM accessors for 64-bit CPUs
  MIPS: kernel: mips-cm: The CMGCRBase register is 64-bit on MIPS64
  MIPS: kernel: mips-cpc: Fix type for GCR CPC base reg for 64-bit
  MIPS: kernel: mips-cm: Add support for reporting CM cache errors
  drivers: irqchip: irq-mips-gic: Extend GIC accessors for 64-bit CMs
  drivers: irqchip: irq-mips-gic: Add support for CM3 64-bit timer irqs
  MIPS: kernel: cpu-probe: Remove cp0 hazard barrier when enabling the
    FTLB
  MIPS: Add default case for the FTLB enable/disable code
  MIPS: kernel: cpu-probe: Fix VTLB/FTLB configuration for R6
  MIPS: Set up FTLB probability for I6400

Paul Burton (4):
  MIPS: asm: mips-cm: Implement mips_cm_revision
  MIPS: asm: add CM GCR_L2_CONFIG register accessors
  MIPS: mm: c-r4k: extend way_string array
  MIPS: support CM3 L2 cache

 arch/mips/Kconfig                    |   6 +-
 arch/mips/include/asm/cpu-type.h     |   4 +
 arch/mips/include/asm/cpu.h          |   2 +
 arch/mips/include/asm/mips-cm.h      |  97 ++++++++++++-
 arch/mips/include/asm/mipsregs.h     |   2 +
 arch/mips/kernel/cpu-probe.c         |  47 +++++--
 arch/mips/kernel/idle.c              |   1 +
 arch/mips/kernel/mips-cm.c           | 257 ++++++++++++++++++++++++++++++++++-
 arch/mips/kernel/mips-cpc.c          |   2 +-
 arch/mips/kernel/perf_event_mipsxx.c |   6 +
 arch/mips/kernel/pm-cps.c            |   2 +
 arch/mips/kernel/spram.c             |   1 +
 arch/mips/kernel/traps.c             |   1 +
 arch/mips/mm/c-r4k.c                 |   5 +-
 arch/mips/mm/sc-mips.c               |  42 ++++++
 arch/mips/mti-malta/malta-init.c     |   7 +
 arch/mips/mti-malta/malta-int.c      | 112 +--------------
 arch/mips/oprofile/common.c          |   1 +
 arch/mips/oprofile/op_model_mipsxx.c |   4 +
 drivers/irqchip/irq-mips-gic.c       | 140 ++++++++++++-------
 include/linux/irqchip/mips-gic.h     |  14 +-
 21 files changed, 573 insertions(+), 180 deletions(-)

-- 
2.4.5
