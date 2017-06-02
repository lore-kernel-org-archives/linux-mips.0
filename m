Received: from mailapp01.imgtec.com ([195.59.15.196]:49052 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993914AbdFBWidLmeM3 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 3 Jun 2017 00:38:33 +0200
Received: from hhmail02.hh.imgtec.org (unknown [10.100.10.20])
        by Forcepoint Email with ESMTPS id 9A20889132F47
        for <linux-mips@linux-mips.org>; Fri,  2 Jun 2017 23:38:22 +0100 (IST)
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 0/6] MIPS: TLB exception handler fixes & optimisation
Date: Fri, 2 Jun 2017 15:38:00 -0700
Message-ID: <20170602223806.5078-1-paul.burton@imgtec.com>
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
Message-ID: <20170602223800.bAJ8_Rnf2FAw8RXf08TLygb_H-fdTVXfoj3mYLcAKX8@z>

This series fixes a race condition during in TLB exceptions for I6400 &
I6500 CPUs where TLB RAMs are shared between threads/VPs within a core,
and implements a few optimisations & cleanups for TLB exception
handling.

Applies atop v4.12-rc3.

Paul Burton (6):
  MIPS: Add CPU shared FTLB feature detection
  MIPS: Handle tlbex-tlbp race condition
  MIPS: Allow storing pgd in C0_CONTEXT for MIPSr6
  MIPS: Use current_cpu_type() in m4kc_tlbp_war()
  MIPS: tlbex: Use ErrorEPC as scratch when KScratch isn't available
  MIPS: tlbex: Remove struct work_registers

 arch/mips/Kconfig                    |   2 +-
 arch/mips/include/asm/cpu-features.h |  41 ++++++
 arch/mips/include/asm/cpu.h          |   4 +
 arch/mips/kernel/cpu-probe.c         |  11 ++
 arch/mips/mm/tlbex.c                 | 234 +++++++++++++++++------------------
 5 files changed, 169 insertions(+), 123 deletions(-)

-- 
2.13.0
