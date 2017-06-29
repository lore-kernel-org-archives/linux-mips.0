Received: from mailapp01.imgtec.com ([195.59.15.196]:45336 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992054AbdF2JM5VTdTW (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 29 Jun 2017 11:12:57 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 0/4] MIPS: Syscall tracing fixes
Date: Thu, 29 Jun 2017 10:12:32 +0100
Message-ID: <cover.7467c3bd7867c61afc334e409c93dac28541f5e6.1498727356.git-series.james.hogan@imgtec.com>
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
Cc: James Hogan <james.hogan@imgtec.com>, Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>, linux-mips@linux-mips.org, stable@vger.kernel.org
Message-ID: <20170629091232.PX_uX1pQihSPPuRv8upET1vqJOXhjsPI5Dpkwcsko_4@z>

These patches fix several issues in the MIPS syscall tracing support.
They are based on mips-for-linux-next (152e63e374cd).

Patch 1 drops a harmless redundant select in Kconfig.

Patch 2 ensures erroring syscalls have negated return value in the
sys_exit trace event, so errors can be distinguished from success
(tagged for stable).

Patch 3 corrects a probably harmless inconsistency between normal
syscall error return ($a3=1) and modified error return via
syscall_set_return_value() ($a3=-1), e.g. due to seccomp
SECCOMP_RET_ERRNO.

Patch 4 fixes the probably harmless broken error return from negative
syscall numbers when syscall tracing is enabled.

Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: linux-mips@linux-mips.org
Cc: stable@vger.kernel.org

James Hogan (4):
  MIPS: Drop duplicate HAVE_SYSCALL_TRACEPOINTS select
  MIPS: Negate error syscall return in trace
  MIPS: Correct forced syscall errors
  MIPS: Traced negative syscalls should return -ENOSYS

 arch/mips/Kconfig               |  1 -
 arch/mips/include/asm/syscall.h |  2 +-
 arch/mips/kernel/ptrace.c       |  9 ++++++++-
 3 files changed, 9 insertions(+), 3 deletions(-)

-- 
git-series 0.8.10
