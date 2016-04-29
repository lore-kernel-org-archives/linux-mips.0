Received: from mailapp01.imgtec.com ([195.59.15.196]:61559 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27027781AbcD2NxVv5Ngi (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 29 Apr 2016 15:53:21 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 0/6] MIPS: Exposure & handling of VZ state
Date: Fri, 29 Apr 2016 14:53:02 +0100
Message-ID: <1461937988-13787-1-git-send-email-james.hogan@imgtec.com>
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
Cc: James Hogan <james.hogan@imgtec.com>, linux-mips@linux-mips.org
Message-ID: <20160429135302.4hlEZ4BSDDmIOMtQbgrjTXzPYjT12ZosOltEbE2RvV0@z>

This patchset is based on the one titled "[PATCH 0/5] MIPS: Add feature
probing ready for KVM/VZ" which I submitted earlier today.

It adds general MIPS handling and exposure of the VZ COP0 and hardware
guest state.

Specifically:
- Access to VZ specific COP0 registers.
- Access to the COP0 registers of the VZ "guest" context (which are
  mostly separate to the normal ("root") COP0 registers).
- Probing and exposure of various VZ features.
- Probing and exposure of various features available in the VZ guest
  context.
- Inline helpers for VZ specific COP0 instructions such as those for
  accessing the guest TLB.
- Handling & dumping of extra root TLB state. Specifically the GuestID,
  which is an optional field added to the root TLB to distinguish the
  normal root virtual address space with a GuestID of 0 from multiple
  guest physical address spaces with non-zero GuestIDs.

James Hogan (6):
  MIPS: Avoid magic numbers probing kscratch_mask
  MIPS: Add register definitions for VZ ASE registers
  MIPS: Add guest CP0 accessors
  MIPS: Add probing & defs for VZ & guest features
  MIPS: dump_tlb: Preserve and dump GuestID
  MIPS: Print GuestCtl1 on machine check exception

 arch/mips/include/asm/cpu-features.h |  98 ++++++++
 arch/mips/include/asm/cpu-info.h     |  14 ++
 arch/mips/include/asm/cpu.h          |   5 +
 arch/mips/include/asm/mipsregs.h     | 461 ++++++++++++++++++++++++++++++++++-
 arch/mips/kernel/cpu-probe.c         | 235 +++++++++++++++++-
 arch/mips/lib/dump_tlb.c             |  19 +-
 6 files changed, 816 insertions(+), 16 deletions(-)

Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
-- 
2.4.10
