Received: from mailapp01.imgtec.com ([195.59.15.196]:21861 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23994850AbdHGXBlzdfSI (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 8 Aug 2017 01:01:41 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 0/7] MIPS: generic kernel config improvements
Date: Mon, 7 Aug 2017 16:01:11 -0700
Message-ID: <20170807230119.10629-1-paul.burton@imgtec.com>
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
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20170807230111.u2KgICPnW6sG1FwOvUoAAtIA7UmvGkg_1L-EM3wnFiE@z>

This series introduces support for filtering which board support is
enabled based upon the ISA, endianness or other configuration. This
allows us to only include board support in kernels that it makes sense
for - eg. there's no point including support for systems that have 32
bit CPUs in 64 bit kernels.

It then makes a few tweaks to generic_defconfig & prevents direct use of
generic_defconfig, which is almost certainly not what a user wants.

Applies atop mips-for-linux-next at 246edadb70f7.


Paul Burton (7):
  MIPS: generic: Allow filtering enabled boards by requirements
  MIPS: SEAD-3: Only include in 32 bit kernels by default
  MIPS: NI 169445: Only include in 32r2el kernels
  MIPS: Prevent direct use of generic_defconfig
  MIPS: Make CONFIG_MIPS_MT_SMP default y
  MIPS: generic: Don't explicitly disable CONFIG_USB_SUPPORT
  MIPS: generic: Bump default NR_CPUS to 16

 MAINTAINERS                                     |  1 +
 arch/mips/Kconfig                               |  1 +
 arch/mips/Makefile                              | 23 ++++++-
 arch/mips/configs/generic/board-ni169445.config |  3 +
 arch/mips/configs/generic/board-sead-3.config   |  2 +
 arch/mips/configs/generic_defconfig             |  3 +-
 arch/mips/configs/malta_defconfig               |  1 -
 arch/mips/configs/malta_kvm_defconfig           |  1 -
 arch/mips/configs/malta_kvm_guest_defconfig     |  1 +
 arch/mips/configs/maltasmvp_defconfig           |  1 -
 arch/mips/configs/maltasmvp_eva_defconfig       |  1 -
 arch/mips/tools/generic-board-config.sh         | 90 +++++++++++++++++++++++++
 12 files changed, 120 insertions(+), 8 deletions(-)
 create mode 100755 arch/mips/tools/generic-board-config.sh

-- 
2.14.0
