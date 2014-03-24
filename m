Received: from mailapp01.imgtec.com ([195.89.28.114]:49249 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6816503AbaCXKUAcLLTm (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 24 Mar 2014 11:20:00 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 2B55DDDC4CE6F
        for <linux-mips@linux-mips.org>; Mon, 24 Mar 2014 10:19:52 +0000 (GMT)
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 00/12] CPS SMP fixes
Date: Mon, 24 Mar 2014 10:19:23 +0000
Message-ID: <1395656375-9300-1-git-send-email-paul.burton@imgtec.com>
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

This series provides a few fixes & cleanups mostly related to the
MIPS CPS SMP implementation, fixing a few potential build errors &
allowing use on cores without the MT ASE & without CONFIG_MIPS_MT.
The final two patches fix use on big endian systems.

Paul Burton (12):
  MIPS: add cpu_vpe_id macro
  MIPS: provide empty mips_mt_set_cpuoptions when CONFIG_MIPS_MT=n
  MIPS: fix core number detection for MT cores
  MIPS: remove ifdef around core number probe
  MIPS: smp-cmp: remove incorrect core number probe
  MIPS: smp-cps: fix build when CONFIG_MIPS_MT_SMP=n
  MIPS: smp-cps: don't run MT instructions if cpu doesn't have MT
  MIPS: smp-mt: use common GIC IPI implementation
  MIPS: Malta: GIC IPIs may be used without MT
  MIPS: fix warning when including smp-ops.h with CONFIG_SMP=n
  MIPS: CM: use __raw_ memory access functions
  MIPS: CPC: use __raw_ memory access functions

 arch/mips/Kconfig                |  1 +
 arch/mips/include/asm/cpu-info.h |  6 ++++++
 arch/mips/include/asm/mips-cm.h  |  4 ++--
 arch/mips/include/asm/mips-cpc.h |  4 ++--
 arch/mips/include/asm/mips_mt.h  |  5 +++++
 arch/mips/include/asm/smp-ops.h  |  6 +++---
 arch/mips/kernel/cpu-probe.c     |  7 ++++---
 arch/mips/kernel/smp-cmp.c       |  3 +--
 arch/mips/kernel/smp-cps.c       | 14 ++++++++++----
 arch/mips/kernel/smp-mt.c        | 23 +----------------------
 arch/mips/mti-malta/malta-int.c  | 19 +++++++++++--------
 11 files changed, 46 insertions(+), 46 deletions(-)

-- 
1.8.5.3
