Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87DEF3DA5DC;
	Fri, 21 Aug 2026 09:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787305271; cv=none; b=NY2ssc8UYyrbw8TGEXtB4qqJ9l5t4yqanPLLcXR9sGzPhcaNS+jNeTOoeL06X+TlD3/CSmuGLdNqygqY9DlpnipBRBjZbBSNfq9P0LNToeODSdYTRHCD836fZLcJztLniLGaHAstXwPkmDi3WD3oqhmSSgc3WcO3Qh75SZTCrdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787305271; c=relaxed/simple;
	bh=GjsU8qyiZS6YeZ0SAgy+sWk4jgL17Ks+5kXu9jCXGd4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OLw0QgHhAzow/8EC2adW1F+nN4qD+sAx/PPMcd9Zypmpk1ZlK4E7Wb4iwPPieI+dKC66OofXOnbIwO8Q9yrsql0g8+SB85gLKQ73zKj5s3EaIKeRD8WlpZNqoA/WtK02cdeHl+jc51Nl9FwB3baartSxbnBP9Izmns7QOjrKGoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1wxL21-0008Fk-00; Fri, 21 Aug 2026 10:55:21 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 6C6BBC0110; Fri, 21 Aug 2026 10:55:13 +0200 (CEST)
Date: Fri, 21 Aug 2026 10:55:13 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: torvalds@linux-foundation.org
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] MIPS changes for v7.3
Message-ID: <aogScROchrBsk812@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit a13c140cc289c0b7b3770bce5b3ad42ab35074aa:

  Linux 7.2-rc3 (2026-07-12 14:16:39 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_7.3

for you to fetch changes up to 3b7711be02612845e44b5e9ef7c0b9f203cf29b6:

  mips: dts: econet: Describe dual-VPE 34Kc processor (2026-08-03 15:14:05 +0200)

----------------------------------------------------------------
- switch gpio code to use swnodes
- rework of TXX9 gpio code
- enable multi-vpe for econet
- cleanups and fixes

----------------------------------------------------------------
Caleb James DeLisle (2):
      mips: econet: add multi-vpe capability to EN751221
      mips: dts: econet: Describe dual-VPE 34Kc processor

Dmitry Torokhov (3):
      bcma: gpio: Add and register software node for GPIO controller
      ssb: gpio: Add and register software node for GPIO controller
      MIPS: BCM47XX: Convert buttons to software nodes

Geert Uytterhoeven (9):
      MIPS: TXX9: Remove tx4938_spi_init() and txx9_spi_init()
      MIPS: TXX9: Remove txx9_7segled_*() forward declarations
      MIPS: TXX9: rbtx4927: Use GPIO lookup table for SIO DTR
      MIPS: TXX9: rbtx4927: Use GPIO lookup table for TXx9 LEDs
      MIPS: TXX9: Reduce TXX9_IOCLED_MAXLEDS to 3
      MIPS: TXX9: Use GPIO lookup table for iocled LEDs
      MIPS: TXX9: Drop GPIOLIB_LEGACY select
      MIPS: TXX9: Convert gpio_txx9 to dynamic GPIO base allocation
      MIPS: TXX9: Clean up txx9_iocled_init()

Julian Braha (1):
      mips: remove dead select

Markus Elfring (1):
      MIPS: kernel: proc: Use two seq_putc() calls in show_cpuinfo()

Thomas Bogendoerfer (1):
      MIPS: ptrace: Fix syscall skipping via PTRACE_SYSCALL

Uwe Kleine-König (The Capable Hub) (1):
      MIPS: ip22-gio: Drop #include of <linux/mod_devicetable.h>

 arch/mips/Kconfig                       |   1 -
 arch/mips/bcm47xx/buttons.c             | 442 ++++++++++++++++++--------------
 arch/mips/boot/dts/econet/en751221.dtsi |   7 +
 arch/mips/econet/Kconfig                |   4 +-
 arch/mips/econet/init.c                 |  42 ++-
 arch/mips/include/asm/gio_device.h      |   1 -
 arch/mips/include/asm/txx9/generic.h    |   9 +-
 arch/mips/include/asm/txx9/tx4938.h     |   1 -
 arch/mips/include/asm/txx9pio.h         |   3 +-
 arch/mips/kernel/gpio_txx9.c            |   5 +-
 arch/mips/kernel/proc.c                 |   4 +-
 arch/mips/kernel/ptrace.c               |   6 +-
 arch/mips/txx9/Kconfig                  |   1 -
 arch/mips/txx9/generic/setup.c          |  45 ++--
 arch/mips/txx9/generic/setup_tx4938.c   |   6 -
 arch/mips/txx9/rbtx4927/setup.c         |  41 ++-
 drivers/bcma/driver_gpio.c              |  43 +++-
 drivers/ssb/driver_gpio.c               |  48 +++-
 include/linux/bcma/bcma.h               |   2 +
 include/linux/ssb/ssb.h                 |   2 +
 20 files changed, 446 insertions(+), 267 deletions(-)

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
