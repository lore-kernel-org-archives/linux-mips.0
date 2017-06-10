Received: from mailapp01.imgtec.com ([195.59.15.196]:51486 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993949AbdFJA1Fp7nXt (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 10 Jun 2017 02:27:05 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 00/11] MIPS: cmpxchg(), xchg() fixes & queued locks
Date: Fri, 9 Jun 2017 17:26:32 -0700
Message-ID: <20170610002644.8434-1-paul.burton@imgtec.com>
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
Message-ID: <20170610002632.e5dSS6i32Z0-FfJVI3mhLIsspAaJpqJyhwLtrdbH2V0@z>

This series makes a bunch of cleanups & improvements to the cmpxchg() &
xchg() macros & functions, allowing them to be used on values smaller
than 4 bytes, then switches MIPS over to use generic queued spinlocks &
queued read/write locks.

Applies atop v4.12-rc4.

Paul Burton (11):
  MIPS: cmpxchg: Unify R10000_LLSC_WAR & non-R10000_LLSC_WAR cases
  MIPS: cmpxchg: Pull xchg() asm into a macro
  MIPS: cmpxchg: Use __compiletime_error() for bad cmpxchg() pointers
  MIPS: cmpxchg: Error out on unsupported xchg() calls
  MIPS: cmpxchg: Drop __xchg_u{32,64} functions
  MIPS: cmpxchg: Implement __cmpxchg() as a function
  MIPS: cmpxchg: Implement 1 byte & 2 byte xchg()
  MIPS: cmpxchg: Implement 1 byte & 2 byte cmpxchg()
  MIPS: cmpxchg: Rearrange __xchg() arguments to match xchg()
  MIPS: Use queued read/write locks (qrwlock)
  MIPS: Use queued spinlocks (qspinlock)

 arch/mips/Kconfig                      |   2 +
 arch/mips/include/asm/Kbuild           |   2 +
 arch/mips/include/asm/cmpxchg.h        | 280 ++++++++++------------
 arch/mips/include/asm/spinlock.h       | 426 +--------------------------------
 arch/mips/include/asm/spinlock_types.h |  34 +--
 arch/mips/kernel/Makefile              |   2 +-
 arch/mips/kernel/cmpxchg.c             | 109 +++++++++
 7 files changed, 239 insertions(+), 616 deletions(-)
 create mode 100644 arch/mips/kernel/cmpxchg.c

-- 
2.13.1
