Received: from 9pmail.ess.barracuda.com ([64.235.150.225]:60188 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992176AbdLLJ6jFLhNC (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 12 Dec 2017 10:58:39 +0100
From: Matt Redfearn <matt.redfearn@mips.com>
Subject: [RFC PATCH 00/16] MIPS: Enable CONFIG_THREAD_INFO_IN_TASK
Date: Tue, 12 Dec 2017 09:57:46 +0000
Message-ID: <1513072682-1371-1-git-send-email-matt.redfearn@mips.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Matt.Redfearn@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20171212095746.9L_lQGhc86kf5pqKtr-OgUEZVsNo0eDkqSseDIDKczc@z>


This series has the aim of enabling CONFIG_THREAD_INFO_IN_TASK for MIPS.
CONFIG_THREAD_INFO_IN_TASK embeds the thread_info at the start of the
task struct, rather than locating it at the bottom of the kernel stack.
This is a step towards allowing mapped kernel stacks, and is in general
a kernel hardening feature because a kernel stack overflow will not
overwrite the thread_info (of course, it might overwrite something else
below the stack page, but that's where mapped stacks come in...).

The series is quite invasive as it needs to change some key
functionality.
- The first patch prevents the use of smp_processor_id() in the VDSO.
  This is necessary to prevent build errors when the logic behind
  smp_processor_id() is changed.
- The next few patches change the the logic backing smp_processor_id().
  Currently thread_info->cpu is used for smp_processor_id, however,
  thread_info->cpu ceases to exist with CONFIG_THREAD_INFO_IN_TASK. A copy
  of the processor id is already held in a CP0 register (Context /
  XContext) for exception entry, so we switch to using this instead. Non
  asm volatile accessors are added, since the CPU ID in the register is
  constant, and this allows the compiler to optimise multiple accesses.
- The KASLR implementation is updated such that the C code does not
  modify the state of the relocated kernel, that is all done in
  assembly.
- The next 2 patches fix a couple of places which assume that
  current_thread_info() will get them the bottom of the kernel stack.
  Since this will no longer be the case once CONFIG_THREAD_INFO_IN_TASK
  is active, these must be fixed.
- The next 3 patches tidy up the exception entry code to ease the
  necessary modifications to enable CONFIG_THREAD_INFO_IN_TASK.
- With the ground work laid, we can start the real modifications.
  The next 3 patches migrate from keeping a copy of the kernels task
  stack pointer around for kernel entry, to keeping a copy of the thread
  info. From that the kernel stack can be found, and the thread_info can
  be restored into register $28 for it's kernel conventional use.
- The stack walking code needs a modification to cope with the fact that
  kernel stacks may be freed while the task still exists, which could
  not happen before.
- The final patch enables CONFIG_THREAD_INFO_IN_TASK, removing
  thread_info->cpu & thread_info->task and changing the context
  switching code to expect this.

This series applies on 4.15-rc1 and has been tested on QEMU malta,
Boston, Ci40 & Octeon.

It depends on James Hogan's patch "MIPS: mipsregs.h: Add read const Cop0
macros" (https://patchwork.linux-mips.org/patch/17922/)



Matt Redfearn (15):
  MIPS: bpf: Add emit_load_cpu helper to load current CPU ID
  MIPS: bpf: Use CP0 register for CPU ID
  MIPS: Add constant accessors for CP0.Context / CP0.XContext
  MIPS: Use CP0 register for smp_processor_id()
  MIPS: KASLR: Change relocate_kernel to return applied offset.
  MIPS: kprobes: Remove unused definitions
  MIPS: compat: Don't use current_thread_info for stack base
  MIPS: Introduce setup_kernel_mode macro
  MIPS: Move the CONFIG_CPU_JUMP_WORKAROUNDS into setup_kernel_mode
  MIPS: Move the CONFIG_EVA workaround into setup_kernel_mode
  MIPS: Keep a copy of each CPU's current_thread
  MIPS: Rename TASK_THREAD_INFO to TASK_STACK
  MIPS: Determine kernel thread stack from task_struct
  MIPS: prep stack walkers for THREAD_INFO_IN_TASK
  MIPS: Activate CONFIG_THREAD_INFO_IN_TASK

Paul Burton (1):
  MIPS: VDSO: Prevent use of smp_processor_id()

 arch/mips/Kconfig                       |   1 +
 arch/mips/cavium-octeon/octeon-memcpy.S |   6 +-
 arch/mips/include/asm/Kbuild            |   1 -
 arch/mips/include/asm/compat.h          |   8 +-
 arch/mips/include/asm/current.h         |  22 ++++
 arch/mips/include/asm/kprobes.h         |   8 --
 arch/mips/include/asm/mipsregs.h        |   2 +
 arch/mips/include/asm/smp.h             |  15 ++-
 arch/mips/include/asm/stackframe.h      | 208 +++++++++++++++++---------------
 arch/mips/include/asm/switch_to.h       |   5 +-
 arch/mips/include/asm/thread_info.h     |  13 +-
 arch/mips/kernel/asm-offsets.c          |   4 +-
 arch/mips/kernel/cps-vec.S              |   5 +-
 arch/mips/kernel/genex.S                |   8 +-
 arch/mips/kernel/head.S                 |  25 ++--
 arch/mips/kernel/octeon_switch.S        |  11 +-
 arch/mips/kernel/process.c              |   3 +-
 arch/mips/kernel/r2300_switch.S         |  11 +-
 arch/mips/kernel/r4k_switch.S           |  10 +-
 arch/mips/kernel/relocate.c             |  20 +--
 arch/mips/kernel/setup.c                |   2 +-
 arch/mips/kernel/smp.c                  |  11 +-
 arch/mips/kernel/stacktrace.c           |   5 +
 arch/mips/kvm/entry.c                   |   4 +-
 arch/mips/lib/csum_partial.S            |   7 +-
 arch/mips/lib/memcpy.S                  |   8 +-
 arch/mips/lib/memset.S                  |   6 +-
 arch/mips/net/bpf_jit.c                 |  24 ++--
 arch/mips/vdso/Makefile                 |   3 +-
 29 files changed, 244 insertions(+), 212 deletions(-)
 create mode 100644 arch/mips/include/asm/current.h

-- 
2.7.4
