Received: from mailapp01.imgtec.com ([195.59.15.196]:37290 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993457AbdFBTaWtHkPn (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 2 Jun 2017 21:30:22 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 0/9] MIPS: SEAD-3 & generic platform fixes
Date: Fri, 2 Jun 2017 12:29:50 -0700
Message-ID: <20170602192959.25435-1-paul.burton@imgtec.com>
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
Message-ID: <20170602192950.3U_BIYhep-qsbl32uzcwQ9FswrFn-B1kwAR1lN9Ac0k@z>

This series includes a bunch of fixes for the generic platform & the
SEAD-3 board which is the first to use it, plus some minor restructuring
to prepare for adding Malta support.

Applies atop v4.12-rc3.

Paul Burton (9):
  MIPS: generic/yamon-dt: Pull YAMON DT shim code out of SEAD-3 board
  MIPS: generic/yamon-dt: Support > 256MB of RAM
  MIPS: generic/yamon-dt: Use serial* rather than uart* aliases
  MIPS: generic: Abstract FDT fixup application
  MIPS: generic: Set RTC_ALWAYS_BCD to 0
  MIPS: generic: Add a MAINTAINERS entry
  MIPS: SEAD-3: Set interrupt-parent per-device, not at root node
  MIPS: SEAD-3: Remove GIC timer from DT
  MIPS: SEAD-3: Fix GIC interrupt specifiers

 MAINTAINERS                                      |   6 +
 arch/mips/boot/dts/mti/sead3.dts                 |  24 ++-
 arch/mips/generic/Kconfig                        |   8 +
 arch/mips/generic/Makefile                       |   1 +
 arch/mips/generic/board-sead3.c                  | 234 ++++------------------
 arch/mips/generic/init.c                         |  27 +++
 arch/mips/generic/yamon-dt.c                     | 240 +++++++++++++++++++++++
 arch/mips/include/asm/mach-generic/mc146818rtc.h |   2 +-
 arch/mips/include/asm/machine.h                  |  31 +++
 arch/mips/include/asm/yamon-dt.h                 |  64 ++++++
 10 files changed, 430 insertions(+), 207 deletions(-)
 create mode 100644 arch/mips/generic/yamon-dt.c
 create mode 100644 arch/mips/include/asm/yamon-dt.h

-- 
2.13.0
