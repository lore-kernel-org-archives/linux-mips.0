Received: from mail-bl2lp0203.outbound.protection.outlook.com ([207.46.163.203]:1940
        "EHLO na01-bl2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6854780AbaE1UJ5OdIvo (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 28 May 2014 22:09:57 +0200
From: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
Subject: [PATCH v3 00/12] kvm tools: Misc patches (mips support)
Date: Wed, 28 May 2014 22:08:43 +0200
Message-ID: <1401307735-16195-1-git-send-email-andreas.herrmann@caviumnetworks.com>
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
To: Pekka Enberg <penberg@kernel.org>
Cc: David Daney <ddaney.cavm@gmail.com>, Andreas Herrmann <andreas.herrmann@caviumnetworks.com>, kvm@vger.kernel.org, linux-mips@linux-mips.org, James Hogan <james.hogan@imgtec.com>
Message-ID: <20140528200843.yFkU0f3MfgQKn0GyYDY9Rg4mX4WInC_os0IyI06-s2w@z>

Hi,

This is v3 of my patch set to run lkvm on MIPS.

It's rebased on v3.13-rc1-1436-g1fc83c5 of
git://github.com/penberg/linux-kvm.git

Diffstat is:

 tools/kvm/Makefile                           |    9 +-
 tools/kvm/arm/fdt.c                          |    7 -
 tools/kvm/arm/include/arm-common/kvm-arch.h  |    2 +
 tools/kvm/builtin-run.c                      |   12 +-
 tools/kvm/builtin-stat.c                     |    2 +-
 tools/kvm/disk/core.c                        |    4 +-
 tools/kvm/hw/pci-shmem.c                     |    5 +-
 tools/kvm/include/kvm/kvm.h                  |    1 +
 tools/kvm/include/kvm/term.h                 |    2 +
 tools/kvm/kvm.c                              |   20 +-
 tools/kvm/mips/include/kvm/barrier.h         |   20 ++
 tools/kvm/mips/include/kvm/kvm-arch.h        |   38 +++
 tools/kvm/mips/include/kvm/kvm-config-arch.h |    7 +
 tools/kvm/mips/include/kvm/kvm-cpu-arch.h    |   42 ++++
 tools/kvm/mips/irq.c                         |   10 +
 tools/kvm/mips/kvm-cpu.c                     |  219 +++++++++++++++++
 tools/kvm/mips/kvm.c                         |  328 ++++++++++++++++++++++++++
 tools/kvm/mmio.c                             |    5 +-
 tools/kvm/pci.c                              |   16 +-
 tools/kvm/powerpc/include/kvm/kvm-arch.h     |    2 +
 tools/kvm/powerpc/kvm.c                      |    7 -
 tools/kvm/term.c                             |   10 +-
 tools/kvm/util/util.c                        |    4 +-
 tools/kvm/virtio/pci.c                       |    6 +-
 tools/kvm/x86/include/kvm/kvm-arch.h         |    2 +
 25 files changed, 742 insertions(+), 38 deletions(-)

Changelog:
v3:
 - Rebased to v3.13-rc1-1436-g1fc83c5
 - Moved patch "kvm tools: Provide per arch macro to specify type for
   KVM_CREATE_VM" before patch "kvm tools, mips: Enable build of mips
   support" to avoid broken built.
 - Added macro for hypercall number (KVM_HC_MIPS_CONSOLE_OUTPUT)
   (Once mips-paravirt is upstream and its changes merged into your
   tree this should be replaced by including the appropriate kernel
   header file.)
v2:
 - http://marc.info/?i=1400518411-9759-1-git-send-email-andreas.herrmann@caviumnetworks.com
v1:
 - http://marc.info/?i=1399391491-5021-1-git-send-email-andreas.herrmann@caviumnetworks.com


Please apply.


Thanks,

Andreas
