Received: from multi.imgtec.com ([194.200.65.239]:2614 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6817371Ab3KSRcRvG39B (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 19 Nov 2013 18:32:17 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 0/6] Some (mostly FP) cleanups
Date: Tue, 19 Nov 2013 17:30:33 +0000
Message-ID: <1384882239-17965-1-git-send-email-paul.burton@imgtec.com>
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
Message-ID: <20131119173033.Lda3m8_1Tgz5pd0fw1K_yc96T24M3pnwcNviFk2zWaI@z>

This series cleans up some code, primarily related to FP context.
Hopefully that's all it does & I didn't break anything ;)

The series applies atop mips-for-linux-next with my prior "FP
improvements" series applied first.

Paul Burton (6):
  mips: simplify FP context access
  mips: simplify PTRACE_PEEKUSR for FPC_EIR
  mips: simplify ptrace_getfpregs FPU IR retrieval
  mips: clean up resume declaration
  mips: replace open-coded init_dsp
  mips: update outdated comment

 arch/mips/include/asm/fpu.h         |   2 +-
 arch/mips/include/asm/processor.h   |  38 ++++++++++---
 arch/mips/include/asm/switch_to.h   |  16 ++++--
 arch/mips/kernel/process.c          |   3 +-
 arch/mips/kernel/ptrace.c           | 104 ++++++++----------------------------
 arch/mips/kernel/ptrace32.c         |  67 ++++-------------------
 arch/mips/math-emu/cp1emu.c         |  38 ++++++++-----
 arch/mips/math-emu/kernel_linkage.c |  21 ++++----
 8 files changed, 113 insertions(+), 176 deletions(-)

-- 
1.8.4.2
