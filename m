Received: from mailapp01.imgtec.com ([195.59.15.196]:46847 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992200AbcHIMWK59cGf (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 9 Aug 2016 14:22:10 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 0/2] MIPS: Memory setup tweaks
Date: Tue, 9 Aug 2016 13:21:47 +0100
Message-ID: <cover.842913b0756706569a896ef308bb5bf98be4f0ce.1470745146.git-series.james.hogan@imgtec.com>
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
Message-ID: <20160809122147.kURWzvTq4ZgesQso4LfpLoou_Zf_SkqcZlvGIwl0wsI@z>

Here are a couple of tweaks for MIPS memory setup, primarily in order to
handle memory which extends right up to the end of physical memory on
32-bit systems with 32-bit phys_addr_t. More specifically we omit the
final page of physical memory to avoid the overflow (see patch 1 for
details).

Patch 2 improves the rounding in the MAAR setup, so as to include the
first full page of an already aligned region, and to avoid a BUG_ON for
regions with non 64-KByte aligned end addresses (which I happened to hit
while working on a different version of patch 1 which wasn't correctly
merging the kernel data section into the main RAM region).

Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@imgtec.com>
Cc: linux-mips@linux-mips.org

James Hogan (2):
  MIPS: Allow memory reaching top of physical
  MIPS: MAAR: Fix address alignment

 arch/mips/kernel/setup.c |  7 +++++++
 arch/mips/mm/init.c      | 13 ++++++-------
 2 files changed, 13 insertions(+), 7 deletions(-)

-- 
git-series 0.8.7
