Received: from multi.imgtec.com ([194.200.65.239]:24627 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6825866AbaAVOkS1mtgZ (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 22 Jan 2014 15:40:18 +0100
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 0/8] Improved seccomp-bpf support for MIPS
Date: Wed, 22 Jan 2014 14:39:56 +0000
Message-ID: <1390401604-11830-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20140122143956.hrk5o4nkX4wip3yW9eSGb8X4eU5wD7XN9-rEK9SLgmY@z>

Hi,

This patch improves the existing seccomp-bpf support for MIPS.
It fixes a bug when copying system call arguments for the filter
checks and it also moves away from strict filtering to actually
use the filter supplied by the userspace process.

This patchset has been tested with libseccomp
(MIPS support not upstream yet) on mips, mipsel and mips64
and with Chromium test suite (MIPS support not upstream yet)
on mipsel.

This patchset is based on the upstream-sfr/mips-for-linux-next tree.

Markos Chandras (8):
  MIPS: asm: syscall: Fix copying system call arguments
  MIPS: asm: syscall: Add the syscall_rollback function
  MIPS: asm: syscall: Define syscall_get_arch
  MIPS: asm: thread_info: Add _TIF_SECCOMP flag
  MIPS: ptrace: Move away from secure_computing_strict
  MIPS: kernel: scalls: Skip the syscall if denied by the seccomp filter
  MIPS: seccomp: Handle indirect system calls (o32)
  MIPS: Select HAVE_ARCH_SECCOMP_FILTER

 arch/mips/Kconfig                   |  1 +
 arch/mips/include/asm/ptrace.h      |  2 +-
 arch/mips/include/asm/syscall.h     | 35 ++++++++++++++++++++++++++++++-----
 arch/mips/include/asm/thread_info.h |  3 ++-
 arch/mips/kernel/ptrace.c           | 11 ++++++-----
 arch/mips/kernel/scall32-o32.S      | 15 +++++++++++++--
 arch/mips/kernel/scall64-64.S       |  5 ++++-
 arch/mips/kernel/scall64-n32.S      |  5 ++++-
 arch/mips/kernel/scall64-o32.S      | 17 +++++++++++++++--
 9 files changed, 76 insertions(+), 18 deletions(-)

-- 
1.8.5.3
