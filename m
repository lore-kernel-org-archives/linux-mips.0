Received: from mailapp01.imgtec.com ([195.59.15.196]:33376 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6861301AbaGPPvyYOfCQ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 16 Jul 2014 17:51:54 +0200
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Subject: [PATCH 0/4] mips: Add cma support to mips
Date: Wed, 16 Jul 2014 16:51:28 +0100
Message-ID: <1405525892-60383-1-git-send-email-Zubair.Kakakhel@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Zubair.Kakakhel@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: ralf@linux-mips.org, catalin.marinas@arm.com, will.deacon@arm.com, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, arnd@arndb.de, gregkh@linuxfoundation.org, m.szyprowski@samsung.com, mina86@mina86.com
Cc: x86@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, linux-arch@vger.kernel.org
Message-ID: <20140716155128.2tbqomWZEiSb9k_E0X3alvW9Ojd573Z__vNiH6RmI4Q@z>

Here we have 4 patches that add cma support to mips.

Patch 1 adds dma-contiguous.h to asm-generic
Patch 2 and 3 make arm64 and x86 use dma-contiguous from asm-generic
Patch 4 adds cma to mips.

I'd like to request ralf to take these set of 4 patches via his tree.

acks from asm-generic, arm64 and x86 welcome.

patches based on linux-next b997a07604562f1a54cc531fe1cf7447f0ed6078

Zubair Lutfullah Kakakhel (4):
  asm-generic: Add dma-contiguous.h
  arm64: use generic dma-contiguous.h
  x86: use generic dma-contiguous.h
  mips: dma: Add cma support

 arch/arm64/include/asm/Kbuild           |  1 +
 arch/arm64/include/asm/dma-contiguous.h | 28 -------------------------
 arch/mips/Kconfig                       |  1 +
 arch/mips/include/asm/Kbuild            |  1 +
 arch/mips/kernel/setup.c                |  9 ++++++++
 arch/mips/mm/dma-default.c              | 37 ++++++++++++++++++++++-----------
 arch/x86/include/asm/Kbuild             |  1 +
 arch/x86/include/asm/dma-contiguous.h   | 12 -----------
 include/asm-generic/dma-contiguous.h    |  9 ++++++++
 9 files changed, 47 insertions(+), 52 deletions(-)
 delete mode 100644 arch/arm64/include/asm/dma-contiguous.h
 delete mode 100644 arch/x86/include/asm/dma-contiguous.h
 create mode 100644 include/asm-generic/dma-contiguous.h

-- 
1.9.1
