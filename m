Received: from mailapp01.imgtec.com ([195.59.15.196]:15239 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27026159AbbD0OHggeM7S (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 27 Apr 2015 16:07:36 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 0/4] MIPS: Misc fixes (mostly relating to KVM guests)
Date: Mon, 27 Apr 2015 15:07:15 +0100
Message-ID: <1430143639-22580-1-git-send-email-james.hogan@imgtec.com>
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
Cc: James Hogan <james.hogan@imgtec.com>, "Steven J. Hill" <Steven.Hill@imgtec.com>
Message-ID: <20150427140715.YYrc2owgsuLHc_pGI0vt7814wVhR2MFUcaUX1Fxkd5U@z>

Here are a few miscellaneous MIPS fixes, which were mostly found by
running an up to date KVM guest kernel.

Patch 1 fixes the fixmap address for KVM guests, which was never updated
to reside in USEG.

Patch 2 fixes a bug in the XPA patches, which seems to manifest in KVM
guests in particular (for unclear reasons).
Patch 3 makes a tweak related to patch 2.
(Steven's review of these two patches in particular would be
appreciated).

Finally patch 4 enables ZONE_DMA32 on 64-bit Malta kernels to prevent
exhaustion of the 16MiB DMA zone being a problem (try enabling
KVM_PROVE_LOCKING in a recent kernel).

James Hogan (4):
  MIPS: Fix KVM guest fixmap address
  MIPS: tlbex: Fix broken offsets on r2 without XPA
  MIPS: tlbex: Avoid unnecessary _PAGE_PRESENT shifts
  MIPS: Malta: Select 32bit DMA zone for 64-bit kernels

 arch/mips/Kconfig                           |  1 +
 arch/mips/include/asm/mach-generic/spaces.h |  4 ++++
 arch/mips/mm/tlbex.c                        | 31 +++++++++++++++++++++--------
 3 files changed, 28 insertions(+), 8 deletions(-)

Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Steven J. Hill <Steven.Hill@imgtec.com>
Cc: linux-mips@linux-mips.org
-- 
2.0.5
