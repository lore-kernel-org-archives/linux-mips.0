Received: from mailapp01.imgtec.com ([195.59.15.196]:62981 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992864AbdHWSSX3VeDI (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 23 Aug 2017 20:18:23 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 00/11] MIPS: Fix various sparse warnings
Date: Wed, 23 Aug 2017 11:17:43 -0700
Message-ID: <20170823181754.24044-1-paul.burton@imgtec.com>
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
To: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, trivial@kernel.org
Cc: Paul Burton <paul.burton@imgtec.com>
Message-ID: <20170823181743._KO-Q5-KonaRdmBzU21ZQIZbGg0kMnOSfGwVhwdo9BA@z>

This series fixes various sparse warnings, mostly low hanging fruit.

Patches 1-7 include headers providing declarations of functions or
variables in files which provide their definitions. This clears up
sparse warnings & ensures that the prototypes of declarations &
definitions match.

Patch 8 fixes the type of a fault_addr argument used in the FPU
emulation code to be correct & avoid a lot of sparse warnings.

Patches 9 & 10 remove some dead code.

Patch 11 declares a bunch of things which we don't use outside of the
translation unit that defines them static.

Applies atop v4.13-rc6.

Paul Burton (11):
  MIPS: generic: Include asm/bootinfo.h for plat_fdt_relocated()
  MIPS: generic: Include asm/time.h for get_c0_*_int()
  MIPS: Include asm/setup.h for cpu_cache_init()
  MIPS: Include linux/cpu.h for arch_cpu_idle()
  MIPS: Include asm/delay.h for __{,n,u}delay()
  MIPS: Include elf-randomize.h for arch_mmap_rnd() &
    arch_randomize_brk()
  MIPS: Include linux/initrd.h for free_initrd_mem()
  MIPS: math-emu: Correct user fault_addr type
  MIPS: Remove __invalidate_kernel_vmap_range
  MIPS: Remove plat_timer_setup()
  MIPS: Declare various variables & functions static

 arch/mips/generic/init.c              |  5 +++++
 arch/mips/generic/irq.c               |  1 +
 arch/mips/include/asm/fpu_emulator.h  |  2 +-
 arch/mips/kernel/cpu-probe.c          |  2 +-
 arch/mips/kernel/idle.c               |  1 +
 arch/mips/kernel/mips-r2-to-r6-emul.c |  6 +++---
 arch/mips/kernel/pm-cps.c             |  2 +-
 arch/mips/kernel/time.c               | 14 --------------
 arch/mips/kernel/unaligned.c          |  2 +-
 arch/mips/lib/delay.c                 |  1 +
 arch/mips/math-emu/cp1emu.c           |  8 ++++----
 arch/mips/mm/cache.c                  |  2 +-
 arch/mips/mm/dma-default.c            |  4 ++--
 arch/mips/mm/init.c                   |  1 +
 arch/mips/mm/mmap.c                   |  1 +
 15 files changed, 24 insertions(+), 28 deletions(-)

-- 
2.14.1
