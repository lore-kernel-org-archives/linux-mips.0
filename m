Received: from mailapp01.imgtec.com ([195.59.15.196]:48863 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27026632AbcDUNFeMEYwj (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 21 Apr 2016 15:05:34 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 00/11] FP emulation fixes
Date: Thu, 21 Apr 2016 14:04:44 +0100
Message-ID: <1461243895-30371-1-git-send-email-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>, Adam Buchbinder <adam.buchbinder@gmail.com>, "Maciej W. Rozycki" <macro@imgtec.com>, Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, linux-kernel@vger.kernel.org, James Hogan <james.hogan@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20160421130444.MHtuvoDrBTjq8Iyy84rXBCVdN2n06iAy2h7LGXTfX14@z>

This series fixes up some issues with FPU emulation, ranging from
missing instructions to outright backwards branches to a non-zero zero
register. Some cleanups are made along the way, reducing unnecessary
duplication of code.

There are still issues around the R6 maddf & msubf instructions, which
currently appear to have been formed by duplicating the existing
multiply & addition code then gluing it together & thus don't implement
true fused multiply-addition, but those fixes need more testing so will
come later.

This series applies atop v4.6-rc4.

Paul Burton (11):
  MIPS: math-emu: Fix BC1{EQ,NE}Z emulation
  MIPS: Fix BC1{EQ,NE}Z return offset calculation
  MIPS: inst: Declare fsel_op for sel.fmt instruction
  MIPS: math-emu: Emulate MIPSr6 sel.fmt instruction
  MIPS: math-emu: Unify ieee754sp_m{add,sub}f
  MIPS: math-emu: Unify ieee754dp_m{add,sub}f
  MIPS: math-emu: Add z argument macros
  MIPS: math-emu: Fix bit-width in ieee754dp_{mul,maddf,msubf} comments
  MIPS: math-emu: Fix code indentation
  MIPS: math-emu: Fix m{add,sub}.s shifts
  MIPS: math-emu: Fix jalr emulation when rd == $0

 arch/mips/include/uapi/asm/inst.h |   1 +
 arch/mips/kernel/branch.c         |  18 +--
 arch/mips/math-emu/Makefile       |   4 +-
 arch/mips/math-emu/cp1emu.c       |  45 +++++--
 arch/mips/math-emu/dp_maddf.c     |  35 +++--
 arch/mips/math-emu/dp_msubf.c     | 269 --------------------------------------
 arch/mips/math-emu/dp_mul.c       |   4 +-
 arch/mips/math-emu/ieee754dp.h    |   1 +
 arch/mips/math-emu/ieee754int.h   |  10 ++
 arch/mips/math-emu/ieee754sp.c    |   3 +-
 arch/mips/math-emu/ieee754sp.h    |  17 ++-
 arch/mips/math-emu/sp_add.c       |   6 +-
 arch/mips/math-emu/sp_maddf.c     |  43 ++++--
 arch/mips/math-emu/sp_msubf.c     | 258 ------------------------------------
 arch/mips/math-emu/sp_sub.c       |   6 +-
 15 files changed, 130 insertions(+), 590 deletions(-)
 delete mode 100644 arch/mips/math-emu/dp_msubf.c
 delete mode 100644 arch/mips/math-emu/sp_msubf.c

-- 
2.8.0
