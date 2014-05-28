Received: from mail-bn1lp0139.outbound.protection.outlook.com ([207.46.163.139]:49654
        "EHLO na01-bn1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6854783AbaE1WI4Qww1N (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 29 May 2014 00:08:56 +0200
From: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
Subject: [PATCH v2 00/13] MIPS: Add mips_paravirt
Date: Wed, 28 May 2014 23:52:03 +0200
Message-ID: <1401313936-11867-1-git-send-email-andreas.herrmann@caviumnetworks.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Andreas.Herrmann@caviumnetworks.com>
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
Cc: David Daney <ddaney.cavm@gmail.com>, Andreas Herrmann <andreas.herrmann@caviumnetworks.com>, James Hogan <james.hogan@imgtec.com>, kvm@vger.kernel.org
Message-ID: <20140528215203.eLn9nOz-sXehf2xPmSOfteCjsQEkYIDaVmZTR50fKsg@z>

Hi,

This is v2 of patches to add support for paravirtualized guest on mips
(mips_paravirt). Some of the patches add basic support to run it on
octeon3.

The core of mips_paravirt is David's work.

I've run it using lkvm on a host with KVM MIPS-VZ support (on
octeon3). I've tested guest kernels built for CPU_MIPS64_R2 and
CPU_MIPS32_R2.

When the guest kernel is built for CPU_CAVIUM_OCTEON it requires an
additional patch to avoid usage of octeon_send_ipi_single in
octeon_flush_icache_all_cores. Latest patch for this is not yet
included as it caused a regression and needs some rework.

To built a mips_paravirt guest kernel it's easiest to start with
mips_paravirt_defconfig, check/modify CPU selection (defconfig has
CPU_MIPS64_R2), and kick off kernel built.

Patches are against linux-next/master as of today (next-20140528).
(To make use of __BITFIELD_FIELD macro.)

Diffstat is

 arch/mips/Kbuild.platforms                         |    1 +
 arch/mips/Kconfig                                  |   30 +-
 arch/mips/cavium-octeon/Kconfig                    |   23 +-
 arch/mips/configs/mips_paravirt_defconfig          |  103 ++++++
 arch/mips/include/asm/cpu-features.h               |    9 +-
 arch/mips/include/asm/cpu-type.h                   |    1 +
 arch/mips/include/asm/kvm_para.h                   |   91 +++++
 .../asm/mach-cavium-octeon/cpu-feature-overrides.h |    1 -
 .../asm/mach-paravirt/cpu-feature-overrides.h      |   36 ++
 arch/mips/include/asm/mach-paravirt/irq.h          |   19 +
 .../include/asm/mach-paravirt/kernel-entry-init.h  |   50 +++
 arch/mips/include/asm/mach-paravirt/war.h          |   25 ++
 arch/mips/include/asm/mipsregs.h                   |    9 +
 arch/mips/include/asm/r4kcache.h                   |    2 +
 arch/mips/include/uapi/asm/kvm_para.h              |    6 +-
 arch/mips/kernel/Makefile                          |    2 +-
 arch/mips/kernel/branch.c                          |    6 +-
 arch/mips/kernel/cpu-probe.c                       |    2 +-
 arch/mips/kernel/octeon_switch.S                   |   84 +++--
 arch/mips/kernel/r4k_switch.S                      |    3 +
 arch/mips/math-emu/cp1emu.c                        |    6 +-
 arch/mips/mm/c-r4k.c                               |   48 ++-
 arch/mips/mm/tlbex.c                               |    2 +-
 arch/mips/paravirt/Kconfig                         |    6 +
 arch/mips/paravirt/Makefile                        |   14 +
 arch/mips/paravirt/Platform                        |    9 +
 arch/mips/paravirt/paravirt-irq.c                  |  369 ++++++++++++++++++++
 arch/mips/paravirt/paravirt-smp.c                  |  148 ++++++++
 arch/mips/paravirt/serial.c                        |   40 +++
 arch/mips/paravirt/setup.c                         |   67 ++++
 arch/mips/pci/Makefile                             |    2 +-
 arch/mips/pci/pci-virtio-guest.c                   |  131 +++++++
 include/uapi/linux/kvm_para.h                      |    3 +
 33 files changed, 1295 insertions(+), 53 deletions(-)

Changelog:
v2:
 - Rebased patches on latest linux-next
 - Define hypercalls and HC numbers for MIPS in kvm_para.h header files
 - Misc changes to pci-virtio-guest.c:
   * Make use of __BITFIELD_FIELD macro
   * Calculate IO address for in[lwb] and out[lwb] depending on size
     as usually done throughout the kernel.
   * I still kept this driver version. Once that "Generic
     Configuration Access Mechanism support"
     (https://lkml.org/lkml/2014/5/18/54) is mainline I might have to
     think about how to make use of that instead.
 - Provide minimal defconfig
 - Renaming mips_cpunum to get_ebase_cpunum
 - Provide _machine_halt function with initial patch of paravirt code
   * No _machine_restart so far. I have to look into this separately
     from this initial patch set -- I think it requires additionl
     kvm-tool changes.
 - Fix barriers when booting secondary CPUs
 - Replace check for 64-bit kernel by common macro
 - Remove R4600_HIT_CACHEOP_WAR_IMPL from r4k_blast_dcache_page_dc128()
 - Use switch statement in r4k_blast_dcache_page_setup()]
 - Remove mistakenly introduced config options from patch
  "MIPS: OCTEON: Move CAVIUM_OCTEON_CVMSEG_SIZE to CPU_CAVIUM_OCTEON"
 - Use on_each_cpu unconditionally in irq_core_bus_sync_unlock
 - Misc minor changes after review of v1
 - Remove call to irq_reserve_irq from irq_init_core as linux-next
   contains a patches to remove this function and friends
v1:
 - http://marc.info/?i=1400597236-11352-1-git-send-email-andreas.herrmann@caviumnetworks.com

Comments are welcome.


Thanks,

Andreas

PS: 1, or 2 comments from mailing list after 1st submission are still
not addressed. I'll look into this asap but I thought sending out v2
shouldn't be delayed.
