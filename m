Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A4B2280A51;
	Sun,  5 Apr 2026 09:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775382159; cv=none; b=tSTewqRzMTw+gk+h+zPxyRZMyLFJdzRt2OO1yHkc5QjxrVjY2/VS9W90ND5/3kCROztsULNIc0Hveacnri8WzJf1pHrsevd0/T5ugF3mJITF9kXw2wr7yJXMDpoWxaQCtWpHbe04pJgqLHNOovFXN6cGvVb7UwgjxeVVPHdR9pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775382159; c=relaxed/simple;
	bh=+MIgobqHwI8cKs01G+MOgDG+G+BqWWQXl9sVR+PTRd0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oe86euzw4xPjpi+3EzdCqpH1korC2PiXFln3BiUjgWrZWHjSNl4VXRhNqsw4nUimEuzw4mQNTxzC+3PLwdig47NJeaY3ujNDU3ERAModE3rZSOM7Qqitxxc4YnqTJqnZFzMZp+ukt417p+eJpKKwdbgNnT3KbwkgFclR5Hsg6VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1w9Jzv-0002gj-00; Sun, 05 Apr 2026 11:42:27 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 44AC6C0256; Sun,  5 Apr 2026 11:42:19 +0200 (CEST)
Date: Sun, 5 Apr 2026 11:42:19 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: torvalds@linux-foundation.org
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] MIPS fixes for v7.0
Message-ID: <adIue0LFnmaPer6F@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_7.0_1

for you to fetch changes up to 01cc50ea5167bb14117257ec084637abe9e5f691:

  mips: mm: Allocate tlb_vpn array atomically (2026-04-01 22:24:36 +0200)

----------------------------------------------------------------
Fix TLB uniquification for systems with TLB not initialised by firmware
Fix allocation in TLB uniquification
Fix SiByte cache initialisation
Check uart parameters from firmware on Loongson64 systems
Fix clock id mismatch for Ralink SoCs
Fix GCC version check for __mutli3 workaround

----------------------------------------------------------------
Maciej W. Rozycki (5):
      MIPS: SiByte: Bring back cache initialisation
      MIPS: Fix the GCC version check for `__multi3' workaround
      MIPS: Always record SEGBITS in cpu_data.vmbits
      MIPS: mm: Suppress TLB uniquification on EHINV hardware
      MIPS: mm: Rewrite TLB uniquification for the hidden bit feature

Rong Zhang (1):
      MIPS: Loongson64: env: Check UARTs passed by LEFI cautiously

Shiji Yang (1):
      mips: ralink: update CPU clock index

Stefan Wiehler (1):
      mips: mm: Allocate tlb_vpn array atomically

 arch/mips/include/asm/cpu-features.h |   1 -
 arch/mips/include/asm/cpu-info.h     |   2 -
 arch/mips/include/asm/mipsregs.h     |   2 +
 arch/mips/kernel/cpu-probe.c         |  13 +-
 arch/mips/kernel/cpu-r3k-probe.c     |   2 +
 arch/mips/lib/multi3.c               |   6 +-
 arch/mips/loongson64/env.c           |  18 ++-
 arch/mips/mm/cache.c                 |   3 +-
 arch/mips/mm/tlb-r4k.c               | 285 ++++++++++++++++++++++++++++-------
 arch/mips/ralink/clk.c               |   8 +-
 10 files changed, 268 insertions(+), 72 deletions(-)

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
