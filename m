Received: from mailapp01.imgtec.com ([195.59.15.196]:8911 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011533AbbA0VRWcLkjU (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 27 Jan 2015 22:17:22 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 0/3] Add MIPS CDMM bus support
Date: Tue, 27 Jan 2015 21:16:38 +0000
Message-ID: <1422393401-13543-1-git-send-email-james.hogan@imgtec.com>
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
Cc: linux-kernel@vger.kernel.org, James Hogan <james.hogan@imgtec.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <20150127211638.gsrAO29R4JNV68mXoGMj712FQJPTJnO-jaJGrTQPPGs@z>

This patchset adds basic support for the MIPS Common Device Mapped
Memory (CDMM) region in the form of a bus in the standard Linux device
model.

Since the CDMM region is a feature of the MIPS architecture (since
around MIPSr2) the first patch adds the necessary definitions and
probing to arch/mips.

The second patch adds the actual bus driver (see that patch for lots
more info). 

The final patch just enables CDMM to work on Malta.

Futher patches will follow soon to add TTY/Console/KGDB support for the
EJTAG Fast Debug Channel (FDC) device which is found in the CDMM region.

Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-mips@linux-mips.org

James Hogan (3):
  MIPS: Add arch CDMM definitions and probing
  MIPS: Add CDMM bus support
  MIPS: Malta: Implement mips_cdmm_phys_base()

 arch/mips/include/asm/cdmm.h         |  87 +++++
 arch/mips/include/asm/cpu-features.h |   4 +
 arch/mips/include/asm/cpu.h          |   1 +
 arch/mips/include/asm/mipsregs.h     |  11 +
 arch/mips/kernel/cpu-probe.c         |   2 +
 arch/mips/mti-malta/malta-memory.c   |   7 +
 drivers/bus/Kconfig                  |  13 +
 drivers/bus/Makefile                 |   1 +
 drivers/bus/mips_cdmm.c              | 710 +++++++++++++++++++++++++++++++++++
 include/linux/mod_devicetable.h      |   8 +
 scripts/mod/devicetable-offsets.c    |   3 +
 scripts/mod/file2alias.c             |  16 +
 12 files changed, 863 insertions(+)
 create mode 100644 arch/mips/include/asm/cdmm.h
 create mode 100644 drivers/bus/mips_cdmm.c

-- 
2.0.5
