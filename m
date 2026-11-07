Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.175.24.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794088630;
	b=sMykbg3zz15gmexSwuW3VxtNrrRNxHI8+tqctcnrSGMHceHAn4DXJZoRLRlCWTlVhl0S
	 ohS5SJlxHCkba6KEz41aHulPFEKuUFRCNu3x+s8FezVOPt8I1ZSQuItQlXDj/9JLd6l+p
	 T03Pr/asobaoeINpBdMEHX3ALO8kNyfLK4F4zdJvDGdnj2nbW6p4tqbeSJUIAu1A5e+Od
	 c4K8kce1QogqMMsKSppuDzSC/AIdPQrE7L1C6O8QgSbVtlO9zl+EgAqKXXrq/lbVjkray
	 8j71LNYOHEIXT8qJ672CYCIQCr04Y8RfkW2mN8NiOthyyHGza8m9OkjhJhR68fzI3XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794088630;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=hdEhg7CYhTTbiuvyFW5nMDp664FFDITQvXjDF3ZAncc=;
	b=xOgcehy+FMEau/ngs55PRQDnkhm6kOMM31c76zWZ/s77IeVNYkRSyEc2utvyybPSjdIs
	 SXopAEdEfEIoR+7xIdPp/dIqhVHM1XwlQMqeXHox6/jl/eHqvfWhvqgvx+HlKKZ1VQAI4
	 oPkrCihcye7VYWFImYYmWpGLBH2dfykmqH0HpgukMytiZC2aJuOfUGxy7RuwXokE2kV1Z
	 Iayzw6zWTCqnhHtcQMGZ5ZZxKj9a9KeEKVKtCgVQ8fZJTQO5Gf4a0HYUfX57CGBGvJXJs
	 +31coMX0rcyeCS3ZHKsi3er+3POf1vfR3Ahbc73qATGVTzsB1BXh/Jj01Ofd/C6WohQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=alpha.franken.de;
	spf=pass smtp.mailfrom=alpha.franken.de;
	arc=none smtp.remote-ip=193.175.24.41
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71B5E606A326;
	Sat,  7 Nov 2026 21:57:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71B5E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xPoPE-0004r7-00; Sat, 07 Nov 2026 22:57:00 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 92B82C01A0; Sat,  7 Nov 2026 22:56:44 +0100 (CET)
Date: Sat, 7 Nov 2026 22:56:44 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: torvalds@linux-foundation.org
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] MIPS fixes for v7.4
Message-ID: <au-enPQhQVCrdXWw@alpha.franken.de>
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

The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_7.4_1

for you to fetch changes up to 456c965ca46c59a4a241c755e6565fd883a522f4:

  MIPS: SB1250: Validate and update IRQ affinity (2026-11-05 15:36:25 +0100)

----------------------------------------------------------------
Alchemy:
  Fix /proc/interrups
  Preserve ethernet address from PROM

SGI:
  IP27: Fix NMI dump
  IP30: make defconfig more useful
  IP32: added workarounds for crime revision 1.1

Others:
  Fix compressed kernel linked with ld.lld
  Fix IDE ports on Cobalt devices
  Reject wrong affinity settings on SB1250 platforms

----------------------------------------------------------------
Florian Fainelli (4):
      MIPS: Alchemy: Register interrupt chips with the IRQ core
      MIPS: Alchemy: Save the Ethernet address before reusing PROM memory
      MIPS: Cobalt: Include legacy IDE ports in the PCI I/O window
      MIPS: SB1250: Validate and update IRQ affinity

Imre Kaloz (6):
      MIPS: SGI-IP27: print the NMI dump on an nbcon console
      MIPS: SGI-IP30: fix the defconfig defaults for the Bridge PROM and RTC
      MIPS: mm: Fix the cache error vector jump for XKPHYS kernels
      MIPS: sgi-ip32: Mask MACE PCI interrupts in CRIME only
      MIPS: sgi-ip32: Leave MACE PCI control alone in config accesses
      MIPS: sgi-ip32: Report the real CRIME revision

Rosen Penev (3):
      MIPS: Avoid dead code/data elimination when using recordmcount
      MIPS: boot: compressed: place .rodata.* and discard .MIPS.abiflags
      MIPS: boot: compressed: fix the vmlinuz link with ld.lld

 arch/mips/Kconfig                          |  2 +-
 arch/mips/alchemy/common/irq.c             | 11 ++++++--
 arch/mips/alchemy/common/prom.c            | 23 +++++++++++++--
 arch/mips/boot/compressed/Makefile         | 10 ++++++-
 arch/mips/boot/compressed/ld.script        |  4 ++-
 arch/mips/cobalt/pci.c                     | 11 ++++----
 arch/mips/cobalt/setup.c                   |  4 ++-
 arch/mips/configs/ip30_defconfig           |  9 +++---
 arch/mips/include/asm/ip32/crime.h         |  2 +-
 arch/mips/include/asm/mach-cobalt/cobalt.h |  1 +
 arch/mips/mm/cex-gen.S                     | 16 +++++++++++
 arch/mips/pci/ops-mace.c                   | 26 ++++++++++++-----
 arch/mips/pci/pci-ip32.c                   |  9 ++++--
 arch/mips/sgi-ip27/ip27-nmi.c              |  8 ++++++
 arch/mips/sgi-ip32/crime.c                 | 26 +++++++++++++----
 arch/mips/sgi-ip32/ip32-irq.c              | 45 ++----------------------------
 arch/mips/sibyte/sb1250/irq.c              |  3 ++
 17 files changed, 133 insertions(+), 77 deletions(-)

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
