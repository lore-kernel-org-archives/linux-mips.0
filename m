Received: from mailapp01.imgtec.com ([195.59.15.196]:17298 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6838840AbaGKPo6eCwFY (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 11 Jul 2014 17:44:58 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 77B8E98CE292
        for <linux-mips@linux-mips.org>; Fri, 11 Jul 2014 16:44:46 +0100 (IST)
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 00/13] MSA fixes
Date: Fri, 11 Jul 2014 16:44:26 +0100
Message-ID: <1405093479-5123-1-git-send-email-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>
Message-ID: <20140711154426.i8Sr8u_mt-OU6tZTILOpvAGqXkF5y-mbG33bLV_Ezmc@z>

This series fixes a bunch of issues with MSA support the have been
discovered as it has been tested against the P5600 implementation of
MSA, and in light of the recent revert of saving MSA context around
signals it marks the support as experimental. This is not really a
change given that the only hardware implementation is the 32bit P5600
which requires the experimental CONFIG_MIPS_O32_FP64_SUPPORT Kconfig
option be enabled before MSA can actually be used. A replacement for
the signal handling has been written but needs further discussion, so
will be submitted later.

Paul Burton (13):
  MIPS: allow msa.h to be included in assembly files
  MIPS: save/restore MSACSR register on context switch
  MIPS: preserve scalar FP CSR when switching vector context
  MIPS: save/disable MSA in lose_fpu
  MIPS: clear upper 64b of vector registers when MSA is first used
  MIPS: fix MSA context for tasks which don't use FP first
  MIPS: fix read_msa_* & write_msa_* functions on non-MSA toolchains
  MIPS: ensure MSA gets disabled during boot
  MIPS: disable preemption whilst initialising MSA
  MIPS: 16 byte align MSA vector context
  MIPS: consistently clear MSA flags when starting & copying threads
  MIPS: don't build MSA support unless it can be used
  MIPS: mark MSA experimental

 arch/mips/Kconfig                 |  4 ++--
 arch/mips/include/asm/asmmacro.h  | 31 +++++++++++++++++++++++++++++++
 arch/mips/include/asm/fpu.h       | 19 ++++++++++++-------
 arch/mips/include/asm/msa.h       | 31 ++++++++++++++++++-------------
 arch/mips/include/asm/processor.h | 10 ++++++++--
 arch/mips/kernel/asm-offsets.c    |  1 +
 arch/mips/kernel/cpu-probe.c      |  5 ++---
 arch/mips/kernel/process.c        |  3 +++
 arch/mips/kernel/r4k_switch.S     |  9 ++++++++-
 arch/mips/kernel/traps.c          | 29 +++++++++++++++++++++++------
 10 files changed, 108 insertions(+), 34 deletions(-)

-- 
2.0.1
