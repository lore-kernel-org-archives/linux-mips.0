Received: from mailapp01.imgtec.com ([195.59.15.196]:1559 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993359AbdFBVtTmyfZF (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 2 Jun 2017 23:49:19 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 0/7] MIPS: CPS SMP fixes & improvements
Date: Fri, 2 Jun 2017 14:48:48 -0700
Message-ID: <20170602214856.4545-1-paul.burton@imgtec.com>
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
Message-ID: <20170602214848.JhPL7vppubEMmrwRMM3KqsMXNTd54TdUz7HmDGoed8s@z>

This series includes a bunch of fixes & improvements for the MIPS SMP
code, and in particular the MIPS Coherent Processing System (CPS) SMP
implementation.

Applies atop v4.12-rc3.

Paul Burton (7):
  MIPS: Skip IPI setup if we only have 1 CPU
  MIPS: CM: Avoid per-core locking with CM3 & higher
  MIPS: CM: WARN on attempt to lock invalid VP, not BUG
  MIPS: CPS: Select CONFIG_SYS_SUPPORTS_SCHED_SMT for MIPSr6
  MIPS: CPS: Prevent multi-core with dcache aliasing
  MIPS: CPS: Handle cores not powering down more gracefully
  MIPS: CPS: Handle spurious VP starts more gracefully

 arch/mips/Kconfig          |  1 +
 arch/mips/kernel/cps-vec.S |  7 ++++++-
 arch/mips/kernel/mips-cm.c | 40 +++++++++++++++++++++++++++++++++-------
 arch/mips/kernel/smp-cps.c | 35 +++++++++++++++++++++++++++++------
 arch/mips/kernel/smp.c     |  3 +++
 5 files changed, 72 insertions(+), 14 deletions(-)

-- 
2.13.0
