Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93ECD318EC5;
	Thu,  1 Oct 2026 16:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790871206; cv=none; b=b1M98okjdFXMOeIaeFs6CUABxHDhCb3vC7eLiZQuCypprhbGyg4Q3LWcHLVXpfxlCF+T3xtTOHuEBJ6tNGbBrMZoskPnrU0HsY0hp4GMaH6hb1Uvi1zSSyjjxSRGWoxcfvKGGVSTiIvWYpywtHCXLiWf7Ca1w8KCw1J8i8xxbTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790871206; c=relaxed/simple;
	bh=OMz3VJHbSZHBF2AYXWFRGSK3T65c/wJ05sN95sygooM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JS7LvYk+Z4Pwx08hZI075uXJG/p4zQqhhH2FBWvxzG2mlwITCzG1p4a7ZZdzhIvsRG9yBTAcD1JfAJ/mrCk4sQXbvW97OcspyxbH90qjO1NIKO2NNiENjSwwx5flAxixnjsW5LCMd7BHLAl/3uu7MOj/gWV1NPPJtqQwXKkKwos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z8S/ZW6M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z8S/ZW6M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F39B01F000FF;
	Thu,  1 Oct 2026 16:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790871204;
	bh=U9VMWUSlpC5BS7EbkDOT5xyyPUIh+xQGowRyPmz0m8E=;
	h=From:To:Cc:Subject:Date;
	b=Z8S/ZW6MYM1LAgWTfbBVJYPotWFAHWzTCIAtg14fpaUvye4PJY8Nmgz/EEz3DSQFV
	 i9z5QkeQdgt68c5ksSeKU5Q0uZUIfv1M0l8eYm5RvuCQ9FFBENWUNkZWbJmLhiBwNj
	 SrW/JUO3W4lCAFUtjKvkvTwvqDhmJqqDEKiJPCWRmIHNlj/yivdqJKo3L5McemUAaM
	 3C7zeRCtcEVfLGKrXFqC7Ujp+cJFT4SV/43MlnBNdV5ma9eqA4/C+nZ03Kz03nmYMx
	 8B+xFHNdwABmdVLqyUb4APRMcQAZNJTuZ8+wj3133cu0jo6MYl57Vv9lfhTnXGzG4w
	 qLJMfC8/hEnAg==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 00/38] MIPS: SGI-IP27: add support for the IP35 (Bedrock hub) machines
Date: Thu,  1 Oct 2026 18:11:35 +0200
Message-ID: <cover.1790857966.git.kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the SGI machines built around the Bedrock
hub (IP35), such as Fuel and Tezro, to the IP27 platform code.


Patches 1-17 teach the IP27 code the Bedrock hub: detection, the node
address layout and register windows, the node id, CPU slots, memory
banks, both PIs and the kernel load address.

Patches 18-27 add the crossbar, bridge and I/O parts of these machines:
PXBow, XBridge, PIC and IOC4.

Patches 28-38 add the L1 system controller and what it provides, the
Odyssey graphics widget, the KLCONFIG console and a topology package
id per CPU.

Tested on SGI Fuel and Tezro. The NMI dump reaches the 8250 console
only with "MIPS: SGI-IP27: print the NMI dump on an nbcon console",
posted separately.

On IP27 (Hub) machines:
- patch 17 moves the kernel up by 144KB, and the 144KB below it stays
  reserved and unused;
- with patch 21 SWIOTLB takes 64MB of node 0 on a multi-node Origin;
- the XBridge DMA window (patch 21) and the w1 change (patch 33) do
  nothing on a Hub with classic Bridges.

Given I have no IP27 boxes, none of this was booted on one.
ip27_defconfig and ip30_defconfig build at every patch.

An XBridge or PIC on a Bedrock hub takes its board setup from the
first board part number the L1 reports that the setup table knows
(patch 30), so on a machine with several bricks every such bridge gets
that one board's setup.

Patch 36 registers the Odyssey graphics widget as the "sgi-odyssey"
platform device used by the Odyssey DRM driver, a separate series.

checkpatch reports "spaces required around that ':'" in patches 9 and
16 for the GAS numeric local labels 1: and 2: in assembler macros.

Imre Kaloz (38):
  MIPS: Xtalk: guard the widget identification table from assembly
  MIPS: SGI-IP27: dump the NMI save areas the CPU scan recorded
  MIPS: SGI-IP27: add REMOTE_HUB_PI_S()/REMOTE_HUB_PI_L()
  MIPS: SGI-IP27: detect Bedrock hubs at boot
  MIPS: SGI-IP27: widen Kconfig for the Bedrock-based machines
  MIPS: SGI-IP27: fold the dead SN1 arm out of klconfig.h
  MIPS: SGI-IP27: choose the node address layout at runtime
  MIPS: SGI-IP27: add the Bedrock hub register windows
  MIPS: SGI-IP27: decode a Bedrock hub's node id and system size
  MIPS: SGI-IP27: put a Bedrock hub's boot CPU in slot 0
  MIPS: SGI-IP27: lay out node memory in 1GB banks on Bedrock hubs
  MIPS: SGI-IP27: reserve the bottom 64MB of node 0 on Bedrock hubs
  MIPS: SGI-IP27: route interrupt masks and slices through both PIs
  MIPS: SGI-IP27: address a CPU's own PI for NMI, IPI and RT counter
  MIPS: SGI-IP27: take a CPU's node from the CPU table in per_cpu_init()
  MIPS: SGI-IP27: resolve the mapped-kernel node shift at runtime
  MIPS: SGI-IP27: load the kernel at node offset 0x40000
  MIPS: SGI-IP27: xbow_probe(): recognize KLTYPE_PBRICK_XBOW
  MIPS: ip27_defconfig: enable the IOC3 MFD, its cell drivers and tg3
  net: ethernet: sgi: ioc3-eth: apply the DMA attributes only to 64-bit
    addresses
  MIPS: SGI-IP27: route XBridge and PIC DMA through the 32-bit window
  MIPS: SGI-IP27: recognize the PXBow crossbar
  MIPS: PCI: xtalk-bridge: recognize the PIC widget's 64-bit-only
    registers
  MIPS: PCI: xtalk-bridge: match PIC's register-level differences
  rtc: m48t35: support the SGI IP35 timekeeper's 1968 year base
  mfd: ioc3: add support for IOC4
  MIPS: SGI-IP27: dispatch the early console between IOC3 and IOC4
  MIPS: SGI-IP27: add L1 system controller support
  MIPS: SGI-IP27: wire the L1 into reset and the Ethernet address
  MIPS: PCI: xtalk-bridge: take the board part number from the L1
  mfd: ioc3: add IP34 system-board entry to ioc3_infos[]
  net: ethernet: sgi: ioc3-eth: fall back to the platform MAC address
  MIPS: SGI-IP27: don't register a w1 master on an XBridge or PIC
  MIPS: SGI-IP27: report a Bedrock machine as SGI IP35
  MIPS: SGI-IP27: identify the machine by the L1 brick type
  MIPS: SGI-IP27: register the Odyssey graphics widget
  MIPS: SGI-IP27: take the console from the KLCONFIG header on IP35
  MIPS: SGI-IP27: give each CPU its own topology package id

 arch/mips/Kconfig                             |  11 +-
 arch/mips/configs/ip27_defconfig              |   4 +
 .../include/asm/mach-ip27/kernel-entry-init.h |  33 +-
 arch/mips/include/asm/pci/bridge.h            |  83 +-
 arch/mips/include/asm/sn/addrs.h              |  39 +-
 arch/mips/include/asm/sn/agent.h              |   5 +-
 arch/mips/include/asm/sn/arch.h               |   8 +
 arch/mips/include/asm/sn/intr.h               |  14 +-
 arch/mips/include/asm/sn/ioc4.h               | 130 +++
 arch/mips/include/asm/sn/klconfig.h           |  19 +-
 arch/mips/include/asm/sn/kldir.h              |   1 +
 arch/mips/include/asm/sn/l1.h                 |  22 +
 arch/mips/include/asm/sn/mapped_kernel.h      |   6 +-
 arch/mips/include/asm/sn/sn0/addrs.h          |   8 +-
 arch/mips/include/asm/sn/sn0/hub.h            |  37 +-
 arch/mips/include/asm/sn/sn0/hubni.h          |   3 +
 arch/mips/include/asm/sn/sn1/addrs.h          |  22 +
 arch/mips/include/asm/sn/sn1/hub.h            |  40 +
 arch/mips/include/asm/sn/sn1/kldir.h          |  14 +
 arch/mips/include/asm/xtalk/xwidget.h         |  11 +-
 arch/mips/pci/pci-xtalk-bridge.c              | 124 ++-
 arch/mips/sgi-ip27/Makefile                   |   4 +-
 arch/mips/sgi-ip27/Platform                   |  11 +-
 arch/mips/sgi-ip27/ip27-berr.c                |   4 +-
 arch/mips/sgi-ip27/ip27-console.c             |  47 +-
 arch/mips/sgi-ip27/ip27-init.c                | 126 ++-
 arch/mips/sgi-ip27/ip27-irq.c                 |  17 +-
 arch/mips/sgi-ip27/ip27-l1.c                  | 817 ++++++++++++++++++
 arch/mips/sgi-ip27/ip27-memory.c              |  53 +-
 arch/mips/sgi-ip27/ip27-nmi.c                 |  54 +-
 arch/mips/sgi-ip27/ip27-reset.c               |  47 +-
 arch/mips/sgi-ip27/ip27-smp.c                 |  37 +-
 arch/mips/sgi-ip27/ip27-timer.c               |  12 +-
 arch/mips/sgi-ip27/ip27-xtalk.c               | 127 ++-
 drivers/mfd/ioc3.c                            | 335 ++++++-
 drivers/net/ethernet/sgi/ioc3-eth.c           |  37 +-
 drivers/rtc/rtc-m48t35.c                      |  29 +-
 drivers/tty/serial/8250/8250_ioc3.c           |   5 +-
 include/linux/platform_data/sgi-ioc3-serial.h |  13 +
 include/linux/platform_data/xtalk-bridge.h    |   2 +
 40 files changed, 2186 insertions(+), 225 deletions(-)
 create mode 100644 arch/mips/include/asm/sn/ioc4.h
 create mode 100644 arch/mips/include/asm/sn/l1.h
 create mode 100644 arch/mips/include/asm/sn/sn1/addrs.h
 create mode 100644 arch/mips/include/asm/sn/sn1/hub.h
 create mode 100644 arch/mips/include/asm/sn/sn1/kldir.h
 create mode 100644 arch/mips/sgi-ip27/ip27-l1.c
 create mode 100644 include/linux/platform_data/sgi-ioc3-serial.h


base-commit: 5dd1818b15d98d4a20806cd00b1b40320b06004f
-- 
2.47.3

