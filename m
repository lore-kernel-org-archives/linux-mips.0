Received: from mailapp01.imgtec.com ([195.59.15.196]:53099 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011194AbbA3Pkl5YThj (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 30 Jan 2015 16:40:41 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 0/2] MIPS: Fix build errors with binutils 2.24.51+
Date: Fri, 30 Jan 2015 15:40:18 +0000
Message-ID: <1422632420-4973-1-git-send-email-james.hogan@imgtec.com>
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
Cc: James Hogan <james.hogan@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, David Daney <david.daney@cavium.com>
Message-ID: <20150130154018.CwMg3VAYoNj3BRWocnsdN4F4LTrJectFmCNYoDVom0o@z>

Fix the following build error with binutils 2.24.51+ since v3.18-rc4:

{standard input}: Assembler messages:
{standard input}:2913: Error: opcode not supported on this processor: mips32r2 (mips32r2) `ctc1 $2,$31'
scripts/Makefile.build:257: recipe for target 'arch/mips/kernel/traps.o' failed

Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@imgtec.com>
Cc: David Daney <david.daney@cavium.com>
Cc: linux-mips@linux-mips.org

James Hogan (2):
  MIPS: mipsregs.h: Add write_32bit_cp1_register()
  MIPS: traps: Fix inline asm ctc1 missing .set hardfloat

 arch/mips/include/asm/mipsregs.h | 15 +++++++++++++++
 arch/mips/kernel/traps.c         |  3 ++-
 2 files changed, 17 insertions(+), 1 deletion(-)

-- 
2.0.5
