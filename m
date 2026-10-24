Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.175.24.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792831093;
	b=QLbh0Dd/xVWxLfCYZYCDWXsr29zJ5OexVseHE0+T1CE3sYf7lbxuVNFd61iZSY40csM5
	 K8gl7tTOj9Bsmw+abainLI8wae0Y6G4TQXMgQmTyjbLs9yHkNja2R36uVAP/c6c/kp+ue
	 W88RWAoWEmBkCKHFwwbuhnTp0HETOYU7hMdgPsKs5xTP/kanaFYaCIWBKoFsRhrNd7Vup
	 vKqs+KChemkLs5TVdENFQAYEeJ4CegoE8TD/s1a1BAe6npOVhDIffVrEf/doE+3mGFyeZ
	 waL9+04FQx+MRh3iJ7v28yM/+3EoGX2jvgCQ+0vnieQrvD5gh36+CuwseSbxiMiA6eQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792831093;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=nMIrckuoErtPiP2juJrZaSVCRsBWrm+uYdWQv67J+jQ=;
	b=oRSSvwI6lYtIrUawAWXHeVmSpPVhfs75jCKrW79/TVUXIW4vDFMjk6DvINN6pi+xtsyC
	 C4ywb6Q8IV+fISjnhvLRbaedK0G+pkQKKczWuMJYVfzkbxvbCoBdmfO2oe4r/2i3Aa5kF
	 B7x8YK2EAW3Fkv9sYxMddCDHNN5QKdhZP2hJvMG9ScsNlxwXOBXrkyWEq6nDhrYdkgHXX
	 p9qF5f0SuHAIj+nQ629RqIj99FXBDlLm5fMGvFZTktdA+q+6zf7wIG9NtYGlZlBxi7dl2
	 6dY9Aw6rPy456RUKzPihY7Evy7+uqFXc5YxQudB5Fod+yNiPQ1+rTOIK9EnkBlR3jjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=alpha.franken.de;
	spf=pass smtp.mailfrom=alpha.franken.de;
	arc=none smtp.remote-ip=193.175.24.41
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6630F606A31D;
	Sat, 24 Oct 2026 08:38:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6630F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xKXGN-0004sX-00; Sat, 24 Oct 2026 10:38:03 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 1CEAFC0423; Sat, 24 Oct 2026 10:37:54 +0200 (CEST)
Date: Sat, 24 Oct 2026 10:37:54 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: torvalds@linux-foundation.org
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] MIPS changes for v7.4
Message-ID: <atxuYis0T7kTy5SG@alpha.franken.de>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 93f51579e7df248780214094418f205253383cc5:

  Linux 7.3-rc4 (2026-09-20 13:48:15 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_7.4

for you to fetch changes up to bfe97f12a0a64c3682be21a02404238e3b91e945:

  MIPS: octeon: Add detection of UBNT Edgeroute Lite devices (2026-10-01 12:52:37 +0200)

----------------------------------------------------------------
MM:
  fix huge TLB handling

OCTEON:
  correct register access for CN6xxxx SOCs
  provide DTs for platforms where U-Boot doesn't have a DT

Decstation:
  fix 64bit kernels
  build cleanups

Others
  cleanups and fixes

----------------------------------------------------------------
Aristo Chen (1):
      MIPS: GT64120: Remove duplicate GT_PCI1M1LD_OFS and GT_PCI1M1HD_OFS

Ethan Nelson-Moore (3):
      MIPS: remove unused <asm/amon.h> header
      MIPS: remove unused <asm/mips-boards/sead3-addr.h> header
      MIPS: remove unused <asm/cmp.h> header

Geert Uytterhoeven (1):
      MIPS: Alchemy: clock: Make sure clk_init_data is fully initialized

Hemanth Selam (2):
      MIPS: fix typos in comments
      MIPS: fix repeated words in comments

Jeff Johnson (1):
      MIPS: generic: Remove undefined image 'ramdisk'

Maciej W. Rozycki (1):
      MIPS: Reword KBUILD_SYM32 documentation for clarity

Orgad Shaneh (9):
      MIPS: OCTEON: cvmx-l2c: use the OCTEON II register model on all CN6XXX
      MIPS: OCTEON: cvmx-l2c: add the CN66XX L2 geometry
      MIPS: OCTEON: read the L2 crippled fuses from MIO_FUS_DAT3 on OCTEON II
      MIPS: OCTEON: program L2C_CTL, not L2C_CFG, on OCTEON II
      MIPS: OCTEON: require the Core-14449 workaround only on CN63XX pass 1
      MIPS: mm: align hugetlb mappings in arch_get_unmapped_area()
      MIPS: mm: do not write a huge TLB entry when the probe misses
      MIPS: Octeon: size the swiotlb for a modular OHCI platform driver
      MIPS: Octeon: offer the RedBoot parser when it is modular

Randy Dunlap (2):
      docs: ABI: lefi: use literal blocks
      docs: ABI: lefi: drop "ROM Size" in sysfs file doc.

Rosen Penev (1):
      mips: rb532: use devm_platform_ioremap_resource in gpio probe

Thomas Bogendoerfer (2):
      MIPS: octeon: Use MIPS_MACHINE for boards without provided device tree
      MIPS: octeon: Add detection of UBNT Edgeroute Lite devices

Udaya Kiran Challa (1):
      mips: dts: pic32: pic32mzda: Remove unused address-cells, size-cells property

WangYuli (6):
      MIPS: Only check -msym32 when need-compiler
      MIPS: dec: Add missing <linux/interrupt.h> inclusion to reset.h
      MIPS: decstation_64_defconfig: Regenerate for 7.x
      MIPS: decstation_64_defconfig: Compile the kernel with warnings as errors
      MIPS: Eliminate redundant KBUILD_SYM32 check
      MIPS: dec: Reorder header inclusions in setup.c

 .../ABI/testing/sysfs-firmware-lefi-boardinfo      | 21 +++---
 arch/mips/Makefile                                 | 32 +++++----
 arch/mips/alchemy/common/clock.c                   |  8 +--
 arch/mips/boot/dts/cavium-octeon/Makefile          |  1 +
 arch/mips/boot/dts/pic32/pic32mzda.dtsi            |  2 -
 arch/mips/cavium-octeon/Kconfig                    |  5 ++
 arch/mips/cavium-octeon/Makefile                   |  2 +
 arch/mips/cavium-octeon/board-ubnt.c               | 16 +++++
 arch/mips/cavium-octeon/dma-octeon.c               |  2 +-
 arch/mips/cavium-octeon/executive/cvmx-helper.c    | 20 ++++--
 arch/mips/cavium-octeon/executive/cvmx-l2c.c       | 31 ++++----
 arch/mips/cavium-octeon/flash_setup.c              |  2 +-
 arch/mips/cavium-octeon/octeon-memcpy.S            |  2 +-
 arch/mips/cavium-octeon/setup.c                    | 51 ++++++++++---
 arch/mips/configs/decstation_64_defconfig          | 40 ++++-------
 arch/mips/dec/setup.c                              |  4 +-
 arch/mips/generic/board-jaguar2.its.S              |  2 -
 arch/mips/generic/board-serval.its.S               |  1 -
 arch/mips/include/asm/amon.h                       | 12 ----
 arch/mips/include/asm/cmp.h                        | 10 ---
 arch/mips/include/asm/dec/reset.h                  |  1 +
 arch/mips/include/asm/gt64120.h                    |  2 -
 arch/mips/include/asm/mach-loongson64/boot_param.h |  2 +-
 arch/mips/include/asm/mips-boards/sead3-addr.h     | 83 ----------------------
 arch/mips/lib/memcpy.S                             |  2 +-
 arch/mips/mm/mmap.c                                |  6 +-
 arch/mips/mm/tlb-r4k.c                             | 21 ++++--
 arch/mips/n64/init.c                               |  2 +-
 arch/mips/rb532/gpio.c                             |  7 +-
 29 files changed, 178 insertions(+), 212 deletions(-)
 create mode 100644 arch/mips/cavium-octeon/board-ubnt.c
 delete mode 100644 arch/mips/include/asm/amon.h
 delete mode 100644 arch/mips/include/asm/cmp.h
 delete mode 100644 arch/mips/include/asm/mips-boards/sead3-addr.h

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
