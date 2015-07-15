Received: from mailapp01.imgtec.com ([195.59.15.196]:32806 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009858AbbGOPRzf6WSK (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 15 Jul 2015 17:17:55 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 0/6] MIPS: dump_tlb cleanups
Date: Wed, 15 Jul 2015 16:17:41 +0100
Message-ID: <1436973467-3877-1-git-send-email-james.hogan@imgtec.com>
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
To: Ralf Baechle <ralf@linux-mips.org>, "Maciej W. Rozycki" <macro@linux-mips.org>, linux-mips@linux-mips.org
Cc: James Hogan <james.hogan@imgtec.com>, Joshua Kinard <kumba@gentoo.org>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Message-ID: <20150715151741.CTdxC2GPCjTEy0kZRXA-wjnlLKL86SkZF8u6MRg-NI0@z>

This patchset addresses the remaining feedback from Joshua and Maciej on
a couple of my dump_tlb patches which were merged in v4.2-rc1.

Commit d1e9a4f54735 ("MIPS: Add SysRq operation to dump TLBs on all
CPUs"):
http://patchwork.linux-mips.org/patch/10072/
- Add to Documentation/sysrq.txt.
- Refactor to separate the TLB register dumping based on TLB type, and
  also remove duplication.
- Be more careful about dumping PageGrain, it might not exists.
- Also dump FrameMask.

Commit 8ab6abcb6aa4 ("MIPS: mipsregs.h: Add EntryLo bit definitions")
http://patchwork.linux-mips.org/patch/10073/
- Rearrange definitions (Maciej: please check).

James Hogan (6):
  Documentation/sysrq.txt: Mention MIPS TLB dump (x)
  MIPS: Refactor dumping of TLB registers for r3k/r4k
  MIPS: Probe for small (1KiB) page support
  MIPS: dump_tlb: Only dump PageGrain if interesting
  MIPS: dump_tlb: Dump FrameMask register if exists
  MIPS: Rearrange ENTRYLO field definitions

 Documentation/sysrq.txt              |  1 +
 arch/mips/include/asm/cpu-features.h |  4 +++
 arch/mips/include/asm/cpu.h          |  1 +
 arch/mips/include/asm/mipsregs.h     | 52 +++++++++++++++++++-----------------
 arch/mips/include/asm/tlbdebug.h     |  1 +
 arch/mips/kernel/cpu-probe.c         |  2 ++
 arch/mips/kernel/sysrq.c             | 14 +---------
 arch/mips/kernel/traps.c             | 16 ++---------
 arch/mips/lib/dump_tlb.c             | 45 ++++++++++++++++++++++++-------
 arch/mips/lib/r3k_dump_tlb.c         | 11 ++++++++
 arch/mips/mm/tlb-r3k.c               |  2 +-
 11 files changed, 87 insertions(+), 62 deletions(-)

Cc: Joshua Kinard <kumba@gentoo.org>
Cc: Maciej W. Rozycki <macro@linux-mips.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-mips@linux-mips.org
Cc: linux-doc@vger.kernel.org

-- 
2.3.6
