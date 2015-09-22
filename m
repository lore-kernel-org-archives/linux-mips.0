Received: from mailapp01.imgtec.com ([195.59.15.196]:60953 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008792AbbIVSnXCHd3P (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 22 Sep 2015 20:43:23 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 0/6] Support RIXI without fill bits
Date: Tue, 22 Sep 2015 11:42:47 -0700
Message-ID: <1442947373-13345-1-git-send-email-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>, "Steven J. Hill" <Steven.Hill@imgtec.com>, Joshua Kinard <kumba@gentoo.org>, Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, "Maciej W. Rozycki" <macro@linux-mips.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, linux-kernel@vger.kernel.org, James Hogan <james.hogan@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20150922184247.xLZjs0GI_KmfRbHXvTWDIejRcENbVgqdsXIOdjGMpJ4@z>

This series fixes up the generated TLB exception handlers to take into
account cases where there are less fill bits in the Entry{Lo,Hi}
registers than there are software defined bits in a PTE. The most
notable case of this is when running a MIPS32 kernel on a MIPS64 system,
and given that RIXI is required on MIPSr6 support for it is required in
order to run MIPS32 kernels on MIPS64r6 CPUs.

Paul Burton (6):
  MIPS: tlbex: stop open-coding build_convert_pte_to_entrylo
  MIPS: tlbex: remove some RIXI redundancy
  MIPS: tlbex: share MIPS32 32 bit phys & MIPS64 64 bit phys code
  MIPS: tidy EntryLo bit definitions, add PFN
  MIPS: tlbex: avoid placing software PTE bits in Entry* PFN fields
  MIPS: allow RIXI for 32-bit kernels on MIPS64

 arch/mips/include/asm/cpu-features.h |  6 +--
 arch/mips/include/asm/mipsregs.h     | 12 ++---
 arch/mips/mm/tlbex.c                 | 89 ++++++++++++++++++++++--------------
 3 files changed, 59 insertions(+), 48 deletions(-)

-- 
2.5.3
