Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C80D2FFF8D;
	Sat,  4 Jul 2026 07:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783151667; cv=none; b=AIEk5gTrOht+AEdbT0W0d/uNl30DzkxNfpeRDmhXEJzrcyGbMmZxNJFmMWWYsZPQYcwPIjKDwFwA2XmgjDlL3x+FO6ci+nq+GeHR0QmcUfVEyyBKKSsrQpeArfNR11AebfpsyXCJdQyByudKhyamI0SRwELnXZOjZu97ro33muM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783151667; c=relaxed/simple;
	bh=lC6LPJMTcgIJehafB7vv9QEh0AHXGXFAnjGAsjqxIdA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OE7NP2wrQseLQcUpu7XjNeLil9/ATlxEA26QaH7nwkowp2LGVuJuE3z2ZKrva2ppz4Lwo+pNLUjdliP2Q9Hb4c08i+w+vM1zai9Qh27Atz+f8nZ6IlNiN9pi67W5uXaxUvNQaWRV5BoP/d9+eT5t1O4nMFdxhwH+PAQRKQDMBfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1wfvCR-000729-00; Sat, 04 Jul 2026 09:54:07 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 51050C00E8; Sat,  4 Jul 2026 09:54:00 +0200 (CEST)
Date: Sat, 4 Jul 2026 09:54:00 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: torvalds@linux-foundation.org
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] MIPS fixes for v7.2
Message-ID: <aki8GEGE36Ho7S9s@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_7.2_1

for you to fetch changes up to 0880884b36d1230a80a0322abc9b9c7b26942b65:

  MIPS: configs: Enable the current Ingenic USB PHY symbol (2026-06-29 11:37:00 +0200)

----------------------------------------------------------------
collected fixes for 7.2

----------------------------------------------------------------
Bastian Blank (1):
      mips: Add build salt to the vDSO

Kyle Hendry (1):
      MIPS: mm: Add check for highmem before removing memory block

Maciej W. Rozycki (1):
      MIPS: DEC: Ensure RTC platform device deregistration upon failure

Pengpeng Hou (1):
      MIPS: configs: Enable the current Ingenic USB PHY symbol

Xi Ruoyao (1):
      MIPS: loongson64: add IRQ work based on self-IPI

 arch/mips/configs/cu1000-neo_defconfig |  2 +-
 arch/mips/configs/cu1830-neo_defconfig |  2 +-
 arch/mips/configs/gcw0_defconfig       |  2 +-
 arch/mips/dec/platform.c               |  6 +++++-
 arch/mips/include/asm/irq_work.h       |  9 +++++++++
 arch/mips/include/asm/smp.h            |  2 ++
 arch/mips/loongson64/smp.c             | 10 ++++++++++
 arch/mips/mm/init.c                    |  5 +++--
 arch/mips/vdso/elf.S                   |  3 +++
 9 files changed, 35 insertions(+), 6 deletions(-)
 create mode 100644 arch/mips/include/asm/irq_work.h

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
