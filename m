Received: from mailapp01.imgtec.com ([195.59.15.196]:37972 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011605AbcBANvFk8Tio (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 1 Feb 2016 14:51:05 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 0/2] MIPS: Fix FPU preemption issues
Date: Mon, 1 Feb 2016 13:50:35 +0000
Message-ID: <1454334637-3860-1-git-send-email-james.hogan@imgtec.com>
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
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, Paul Burton <paul.burton@imgtec.com>, James Hogan <james.hogan@imgtec.com>
Message-ID: <20160201135035.TvKCZNPAPRJm-qS-fg6VlYiR0sAS6LqUnRmXZkrMPyA@z>

These patches aim to prevent the FPU being left enabled across a task
context switch due to full kernel preemption. This could result in
returning to a KVM guest with FPU enabled.

Patch 1 fixes a more theoretical case that I spotted where TIF_USEDFPU
is cleared without disabling the FPU in the execve path.

Patch 2 fixes a much easier to hit case (multiple WARNs before reaching
login prompt if only the WARN part of patch is applied) due to saved
Status in interrupt context not being updated when FPU is disabled. In
doing so it also allows an orphaned enabled FPU to remain enabled
through to user mode, hence the new WARN on context switch to catch
future cases of it.

James Hogan (2):
  MIPS: Properly disable FPU in start_thread()
  MIPS: Fix FPU disable with preemption

 arch/mips/include/asm/fpu.h        | 4 ++++
 arch/mips/include/asm/stackframe.h | 4 ++--
 arch/mips/kernel/process.c         | 6 ++----
 3 files changed, 8 insertions(+), 6 deletions(-)

-- 
2.4.10
