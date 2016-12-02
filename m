Received: from mailapp01.imgtec.com ([195.59.15.196]:37728 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993014AbcLBI6kv7q20 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 2 Dec 2016 09:58:40 +0100
From: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Subject: [PATCH 0/4] Kexec fixes for SMP
Date: Fri, 2 Dec 2016 09:58:27 +0100
Message-ID: <1480669111-15562-1-git-send-email-marcin.nowakowski@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Marcin.Nowakowski@imgtec.com>
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
Message-ID: <20161202085827.1lJmNiR9D2kAbQbjUv3US9DDSOFcGpj6aozu6ghUzDk@z>

Existing kexec code for SMP has been developed and tested on Cavium Octeon CPUs
and doesn't work properly on all platforms.

This series does some minor cleanups in the kexec code (patches 1 & 2), then
makes the current implementation conditional on a new kconfig symbol that is
enabled on Cavium Octeon CPUs.

Finally a new handler for kexec on SMP systems is added to generic platforms.

This patch series should be applied on top of the earlier kexec cleanup
patch series, most notably it won't apply without
https://patchwork.linux-mips.org/patch/14615/

Marcin Nowakowski (4):
  MIPS: kexec: remove SMP_DUMP
  MIPS: Kconfig: fix indentation for kexec-related entries
  MIPS: kexec: make current SMP handling conditional
  MIPS: kexec: add SMP hooks for generic platform

 arch/mips/Kconfig                  | 19 ++++++++++++-------
 arch/mips/generic/kexec.c          |  7 +++++++
 arch/mips/include/asm/kexec.h      |  2 ++
 arch/mips/include/asm/smp.h        |  6 ------
 arch/mips/kernel/crash.c           | 10 ++++++++--
 arch/mips/kernel/machine_kexec.c   |  4 +++-
 arch/mips/kernel/relocate_kernel.S |  6 +++---
 arch/mips/kernel/smp.c             | 17 -----------------
 8 files changed, 35 insertions(+), 36 deletions(-)

-- 
2.7.4
