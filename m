Received: from mailapp01.imgtec.com ([195.59.15.196]:53979 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008292AbcCAWT6AFR0- (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 1 Mar 2016 23:19:58 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 0/4] MIPS: Watchpoint fixes and cleanups
Date: Tue, 1 Mar 2016 22:19:35 +0000
Message-ID: <1456870779-21007-1-git-send-email-james.hogan@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <James.Hogan@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: James Hogan <james.hogan@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, linux-mips@linux-mips.org
Message-ID: <20160301221935.fyZ9fQjAOLsKhO7ToeNpv_tTKKoN-CiUhCmqz6r6SSE@z>

Patch 1 fixes watchpoint breakage since v4.3.

Patch 2 enables watchpoints in R6 kernels, where they are inadvertently
disabled.

Patches 3 and 4 are cosmetic cleanups, to replace magic numbers with
preprocessor definitions.

James Hogan (4):
  MIPS: Fix watchpoint restoration
  MIPS: Enable ptrace hw watchpoints on MIPS R6
  MIPS: Add and use CAUSEF_WP definition
  MIPS: Add and use watch register field definitions

 arch/mips/Kconfig                 |  2 +-
 arch/mips/include/asm/mipsregs.h  | 20 ++++++++++
 arch/mips/include/asm/switch_to.h |  2 +-
 arch/mips/include/asm/watch.h     | 10 ++---
 arch/mips/kernel/pm.c             |  2 +-
 arch/mips/kernel/ptrace.c         |  7 ++--
 arch/mips/kernel/traps.c          |  5 +--
 arch/mips/kernel/watch.c          | 79 +++++++++++++++++++++------------------
 8 files changed, 76 insertions(+), 51 deletions(-)

Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@imgtec.com>
Cc: linux-mips@linux-mips.org
-- 
2.4.10
