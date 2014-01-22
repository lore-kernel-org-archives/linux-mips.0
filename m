Received: from multi.imgtec.com ([194.200.65.239]:21299 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6825729AbaAVQUYBC5uJ (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 22 Jan 2014 17:20:24 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH v2 0/5] Add basic MIPS P5600 core support
Date: Wed, 22 Jan 2014 16:19:36 +0000
Message-ID: <1390407581-24238-1-git-send-email-james.hogan@imgtec.com>
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
To: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Cc: James Hogan <james.hogan@imgtec.com>, Robert Richter <rric@kernel.org>, oprofile-list@lists.sf.net
Message-ID: <20140122161936.tZhNzRSFh9BxiHeCmRAaXe1Nd4qut6KgZiG3pPxjaEI@z>

Add basic support for the MIPS P5600 cores [1]. The P5600 processor ID
now results in the new cputype CPU_P5600 being used. The FTLB is enabled
in the same way as for CPU_PROAPTIV, and an OProfile cputype string is
added.

v2:
- Add whole new CPU type for it (John Crispin).
- Split up the patch into identifiers, cases, probing, ftlb enable, and
  OProfile.

[1]: http://www.imgtec.com/mips/mips-series5-p5600.asp

Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Cc: Robert Richter <rric@kernel.org>
Cc: oprofile-list@lists.sf.net

James Hogan (5):
  MIPS: Add MIPS P5600 PRid and cputype identifiers
  MIPS: Add cases for CPU_P5600
  MIPS: Add MIPS P5600 probe support
  MIPS: Allow FTLB to be turned on for CPU_P5600
  MIPS: OProfile: Add CPU_P5600 cases

 arch/mips/include/asm/cpu-type.h     |  1 +
 arch/mips/include/asm/cpu.h          |  3 ++-
 arch/mips/kernel/cpu-probe.c         | 16 +++++++++++-----
 arch/mips/kernel/idle.c              |  1 +
 arch/mips/kernel/spram.c             |  1 +
 arch/mips/kernel/traps.c             |  1 +
 arch/mips/mm/c-r4k.c                 |  1 +
 arch/mips/mm/sc-mips.c               |  1 +
 arch/mips/mm/tlbex.c                 |  1 +
 arch/mips/oprofile/common.c          |  1 +
 arch/mips/oprofile/op_model_mipsxx.c |  4 ++++
 11 files changed, 25 insertions(+), 6 deletions(-)

-- 
1.8.1.2
