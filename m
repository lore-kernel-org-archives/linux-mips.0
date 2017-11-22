Received: from 19pmail.ess.barracuda.com ([64.235.150.244]:51306 "EHLO
        19pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990424AbdKVLbfqKj78 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 22 Nov 2017 12:31:35 +0100
From: James Hogan <james.hogan@mips.com>
Subject: [PATCH 0/7] MIPS: Add asm macros for unsupported instructions
Date: Wed, 22 Nov 2017 11:30:26 +0000
Message-ID: <cover.41391a6cc5670b90bb8e77eadd07c712793eab03.1511349998.git-series.jhogan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <James.Hogan@mips.com>
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
Cc: Marcin Nowakowski <marcin.nowakowski@mips.com>, James Hogan <jhogan@kernel.org>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20171122113026.kGYeoTC4i1adYaDTe2_vPLDqc3ub83QJyHYCeicN7tQ@z>

From: James Hogan <jhogan@kernel.org>

This patch series implements Ralf's idea[1] for better supporting older
assembler versions which don't implement newer instructions, in inline
assembly. It has a number of benefits which are described in the
individual patches, but its also particularly beneficial for Marcin's
CRC patchset.

So far I've converted the VZ, XPA, and MSA abstractions to use it.
Old style abstractions remain for MT and DSP instructions, which are
left for future patches.

There are also other abstraction macros in <asm/asmmacro.h> for use in
.S files (particularly for MSA), which similarly don't handle $n
register naming and use the $at move trick. Cleaning these up to use
something like parse_r is also left for future patches.

[1] https://www.linux-mips.org/archives/linux-mips/2017-10/msg00043.html

Patch overview:

Patch 1 adds some helpers to streamline the construction of assembler
macros for instructions unimplemented in the current assembler. It is
needed for the other patches.

Patches 2-3 update the VZ helpers to make use of the new assembler macro
helpers, and make the VZ helpers consistent with the normal c0 register
helpers now that it is possible to do so.

Patches 4-6 update the XPA helpers to make use of the new assembler
macro helpers, and to use the instructions provided by the assembler if
they are available. These are also changed to be consistent with the
normal register helpers now that it is possible to do so.

Patch 7 updates the MSA control register helpers to make use of the new
assembler macro helpers.

Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Marcin Nowakowski <marcin.nowakowski@mips.com>
Cc: linux-mips@linux-mips.org

James Hogan (7):
  MIPS: Add helpers for assembler macro instructions
  MIPS: VZ: Update helpers to use new asm macros
  MIPS: VZ: Pass GC0 register names in $n format
  MIPS: XPA: Use XPA instructions in assembly
  MIPS: XPA: Allow use of $0 (zero) to MTHC0
  MIPS: XPA: Standardise readx/writex accessors
  MIPS: MSA: Update helpers to use new asm macros

 arch/mips/Makefile               |   6 +-
 arch/mips/include/asm/mipsregs.h | 663 +++++++++++++++-----------------
 arch/mips/include/asm/msa.h      |  63 +---
 3 files changed, 356 insertions(+), 376 deletions(-)

base-commit: e0c5f36b2a638fc3298200c385af7f196d3b5cd4
-- 
git-series 0.9.1
