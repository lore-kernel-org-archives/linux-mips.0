Received: from mailapp01.imgtec.com ([195.59.15.196]:44519 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993030AbcJTU1Z7BaEK (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 20 Oct 2016 22:27:25 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 0/6] MIPS: Use thin archives & dead code elimination
Date: Thu, 20 Oct 2016 21:26:59 +0100
Message-ID: <20161020202705.3783-1-paul.burton@imgtec.com>
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
Cc: Ralf Baechle <ralf@linux-mips.org>, Nicholas Piggin <npiggin@gmail.com>, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20161020202659.dM5-2kE6ZmoZhWxfiEFKuQbf6VDc_viepF4iVDyMzhg@z>

This series fixes a few issues with CONFIG_LD_DEAD_CODE_DATA_ELIMINATION
and then enables it, along with CONFIG_THIN_ARCHIVES, for MIPS. This
leads to a typical generic kernel build becoming ~5% smaller:

  add/remove: 0/3028 grow/shrink: 1/14 up/down: 18/-457362 (-457344)
  ...
  Total: Before=9001030, After=8543686, chg -5.08%

Applies atop v4.9-rc1.


Paul Burton (6):
  kbuild: Keep device tree tables though dead code elimination
  kbuild: Keep .init.setup section through dead code elimination
  kbuild: Keep PCI fixups through dead code elimination
  kbuild: Keep earlycon table through dead code elimination
  MIPS: Ensure bss section ends on a long-aligned address
  MIPS: Use thin archives & dead code elimination

 arch/mips/Kconfig                 |  2 ++
 arch/mips/kernel/vmlinux.lds.S    |  7 ++++---
 include/asm-generic/vmlinux.lds.h | 24 ++++++++++++------------
 3 files changed, 18 insertions(+), 15 deletions(-)

-- 
2.10.0
