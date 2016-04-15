Received: from mailapp01.imgtec.com ([195.59.15.196]:48376 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27025228AbcDOJHnKX60c (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 15 Apr 2016 11:07:43 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 0/4] MIPS: MSA fixes
Date: Fri, 15 Apr 2016 10:07:22 +0100
Message-ID: <1460711246-4394-1-git-send-email-james.hogan@imgtec.com>
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
Cc: linux-mips@linux-mips.org, Paul Burton <paul.burton@imgtec.com>, James Hogan <james.hogan@imgtec.com>, stable@vger.kernel.org
Message-ID: <20160415090722.aVBpSsIsGagwmBphh0m7a7zfeDcfl3rdtL4JDSB2rtM@z>

Here are some miscellaneous fixes for MSA (MIPS SIMD Architecture)
support:
1) Fix MSA build with recent toolchains
2) Fix 32-bit pointer additions on 64-bit with non-MSA capable
   toolchain.
3) Fix MSA + 64-bit + lockdep build due to large immediate offsets
4) Fix some MSA assembler warnings due to missing .set fp=64

James Hogan (3):
  MIPS: Fix MSA ld_*/st_* asm macros to use PTR_ADDU
  MIPS: Fix MSA assembly with big thread offsets
  MIPS: Fix MSA assembly warnings

Paul Burton (1):
  MIPS: Use copy_s.fmt rather than copy_u.fmt

 arch/mips/include/asm/asmmacro.h | 193 ++++++++++++++++++++++-----------------
 arch/mips/kernel/r4k_fpu.S       |  10 +-
 2 files changed, 113 insertions(+), 90 deletions(-)

Cc: Paul Burton <paul.burton@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Cc: <stable@vger.kernel.org>
-- 
2.4.10
