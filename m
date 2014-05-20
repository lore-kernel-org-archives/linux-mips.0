Received: from mail-bl2lp0205.outbound.protection.outlook.com ([207.46.163.205]:38185
        "EHLO na01-bl2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6854988AbaETOsbj9A8a (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 20 May 2014 16:48:31 +0200
From: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
Subject: [PATCH 00/15] MIPS: Add mips_paravirt
Date: Tue, 20 May 2014 16:47:01 +0200
Message-ID: <1400597236-11352-1-git-send-email-andreas.herrmann@caviumnetworks.com>
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
Cc: David Daney <ddaney.cavm@gmail.com>, Andreas Herrmann <andreas.herrmann@caviumnetworks.com>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <james.hogan@imgtec.com>, kvm@vger.kernel.org
Message-ID: <20140520144701.Uk2iJ5LodloKfv3piKU2KkynxRPApOZ_63FAD8SY_Xw@z>

Hi,

Following patches add support for paravirtualized guest on mips
(mips_paravirt). Some of the patches add basic support to run it on
octeon3.

The core of mips_paravirt is David's work.
I rebased his code, rearranged it somewhat (e.g. split it into the
current patches) and added some minor modifications.

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

Patches are against v3.15-rc5. Diffstat is

 arch/mips/Kbuild.platforms                         |    1 +
 arch/mips/Kconfig                                  |   30 +-
 arch/mips/cavium-octeon/Kconfig                    |   30 +-
 arch/mips/configs/mips_paravirt_defconfig          | 1521 ++++++++++++++++++++
 arch/mips/include/asm/cpu-features.h               |    9 +-
 arch/mips/include/asm/cpu-type.h                   |    1 +
 .../asm/mach-cavium-octeon/cpu-feature-overrides.h |    1 -
 .../asm/mach-paravirt/cpu-feature-overrides.h      |   36 +
 arch/mips/include/asm/mach-paravirt/irq.h          |   19 +
 .../include/asm/mach-paravirt/kernel-entry-init.h  |   49 +
 arch/mips/include/asm/mach-paravirt/war.h          |   25 +
 arch/mips/include/asm/mipsregs.h                   |   72 +
 arch/mips/include/asm/r4kcache.h                   |    2 +
 arch/mips/kernel/Makefile                          |    2 +-
 arch/mips/kernel/branch.c                          |    6 +-
 arch/mips/kernel/octeon_switch.S                   |   84 +-
 arch/mips/kernel/r4k_switch.S                      |    3 +
 arch/mips/math-emu/cp1emu.c                        |   12 +-
 arch/mips/mm/c-r4k.c                               |   32 +
 arch/mips/mm/tlbex.c                               |    8 +-
 arch/mips/paravirt/Kconfig                         |    6 +
 arch/mips/paravirt/Makefile                        |   14 +
 arch/mips/paravirt/Platform                        |    9 +
 arch/mips/paravirt/paravirt-irq.c                  |  388 +++++
 arch/mips/paravirt/paravirt-smp.c                  |  149 ++
 arch/mips/paravirt/serial.c                        |   38 +
 arch/mips/paravirt/setup.c                         |   67 +
 arch/mips/pci/Makefile                             |    2 +-
 arch/mips/pci/pci-virtio-guest.c                   |  140 ++
 29 files changed, 2709 insertions(+), 47 deletions(-)


Comments are welcome.


Thanks,

Andreas
