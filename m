Received: from mail-pb0-f49.google.com ([209.85.160.49]:47687 "EHLO
        mail-pb0-f49.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1903662Ab2EOAFB (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 15 May 2012 02:05:01 +0200
From: David Daney <ddaney.cavm@gmail.com>
Subject: [PATCH v2 0/5] MIPS: Move cache setup earlier.
Date: Mon, 14 May 2012 17:04:45 -0700
Message-ID: <1337040290-16015-1-git-send-email-ddaney.cavm@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: linux-mips@linux-mips.org, ralf@linux-mips.org
Cc: David Daney <david.daney@cavium.com>
Message-ID: <20120515000445.Tx5k-BhEpsPf-WWMNCAaPVwB3hjiQtA6bvXHdKv7wfs@z>

From: David Daney <david.daney@cavium.com>

v2: Rebased to 3.4-rc7

From v1:

Found on 3.2-rc4, if jump label things are enabled, the kernel will
not boot on MIPS.

As noted in patch 5/5, this was caused by: commit
97ce2c88f9ad42e3c60a9beb9fca87abf3639faa (jump-label: initialize
jump-label subsystem much earlier).

The fix is to make flush_icache_range() usable earlier.  I do this by
calling cpu_cache_init() from setup_arch().  For the boot CPU we can
no longer call this from per_cpu_trap_init(), so I add a flag to that
function so we can skip the call if on the boot CPU.

Some of the code in the various cpu_cache_init() functions however
could not be called this early, so I moved it into functions called by
the new board_cache_error_setup() hook.

Tested on Octeon and ip32-R5000

David Daney (5):
  MIPS: Introduce board_cache_error_setup() hook.
  MIPS: Make set_handler() __cpuinit.
  MIPS: Octeon: Use board_cache_error_setup for cache error handler
    setup.
  MIPS: Use board_cache_error_setup for r4k cache error handler setup.
  MIPS: Move cache setup to setup_arch().

 arch/mips/include/asm/setup.h |    3 ++-
 arch/mips/include/asm/traps.h |    1 +
 arch/mips/kernel/setup.c      |    2 ++
 arch/mips/kernel/smp.c        |    2 +-
 arch/mips/kernel/traps.c      |   16 ++++++++++------
 arch/mips/mm/c-octeon.c       |   14 ++++++++------
 arch/mips/mm/c-r4k.c          |   14 ++++++++++----
 7 files changed, 34 insertions(+), 18 deletions(-)

-- 
1.7.2.3
