Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38C4037E5C8;
	Fri, 18 Sep 2026 07:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789716086; cv=none; b=pI15K6nfqq5FjGUezXAM+Aj/zyiM+Cp0+fVP245bjUReWJ7fYrQztZ6v1EFqMnq9eYg7Rw4oqLK2urF4gldG9Y/HWEqowVS8A2b/ZkZcEoMZ0AHgROafLMBWSfSJn581qByixsTW+sKJ4mTD1GCVWZ3aCTAHfDGZtPDoDnZVlAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789716086; c=relaxed/simple;
	bh=x2sVaTWOFD61sNdfKdoLUpnvWMHdA9w97PDFsIwYWGA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BcK4xFr2p4GRwTlM8D93cbH7MtPaLvgPy+hB0yug6haNKjLvMQn4WAqhaM1PwX8xi5BSsqqwPdc/NHkhcb/3HrywUZ/JppYqthBhBkkumgnokr1XTEmAI1kzVE/uH2xtHgtKzQ0aKWF06kiZdAifpuWNRMpHe7HjULpONI8dBQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1x7SuI-0004Fa-00; Fri, 18 Sep 2026 09:21:14 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id B91C8C0110; Fri, 18 Sep 2026 09:21:03 +0200 (CEST)
Date: Fri, 18 Sep 2026 09:21:03 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: torvalds@linux-foundation.org
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] MIPS fixes for v7.3
Message-ID: <aqzmX0yjaJ0kJXgQ@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_7.3_1

for you to fetch changes up to 126f16e0a1b353c2ba5c7e2c8626cfa865934f9f:

  MIPS: Octeon: apply USB FDT fixups also when USB is modular (2026-09-08 16:12:20 +0200)

----------------------------------------------------------------
- Fix kconfig dependencies for ECONET
- Enable weak reordering for EYEQ
- Include USB FDT fixup for Octeon even when USB is modular

----------------------------------------------------------------
Caleb James DeLisle (1):
      MIPS: config: Add EcoNet EN751221 defconfig

Julian Braha (1):
      mips: econet: fix unmet dependencies for ECONET

Orgad Shaneh (1):
      MIPS: Octeon: apply USB FDT fixups also when USB is modular

Théo Lebrun (1):
      mips: select CONFIG_WEAK_REORDERING_BEYOND_LLSC from CONFIG_EYEQ

 MAINTAINERS                                 |   1 +
 arch/mips/Kconfig                           |   4 +-
 arch/mips/cavium-octeon/octeon-platform.c   |   4 +-
 arch/mips/configs/econet_en751221_defconfig | 264 ++++++++++++++++++++++++++++
 4 files changed, 268 insertions(+), 5 deletions(-)
 create mode 100644 arch/mips/configs/econet_en751221_defconfig

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
