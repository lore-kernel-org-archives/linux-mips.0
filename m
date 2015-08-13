Received: (from localhost user: 'mchandras' uid#10145 fake: STDIN
        (mchandras@eddie.linux-mips.org)) by eddie.linux-mips.org
        id S27010918AbbHMH4vhab34 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 13 Aug 2015 09:56:51 +0200
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 00/10] Add emulation support for FPU R6 instructions
Date: Thu, 13 Aug 2015 09:56:26 +0200
Message-ID: <1439452596-16759-1-git-send-email-markos.chandras@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-Path: <mchandras@linux-mips.org>
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
Message-ID: <20150813075626.4RtTwe3wq4c2uOn0XoqnmHOSohOk7cfSNg_yuYiHUa4@z>

Hi,

This patch adds support for the new R6 FPU instructions. It has been
tested on a 32-bit R6 QEMU using the nofpu kernel parameter.

I have also pushed my patches to the following branch:
git://git.linux-mips.org/pub/scm/mchandras/linux.git v4.3-fpu-r6

Markos Chandras (10):
  MIPS: include: uapi: inst: Add new MIPS R6 FPU opcodes
  MIPS: math-emu: cp1emu: Add support for the CMP.condn.fmt R6
    instruction
  MIPS: math-emu: cp1emu: Add support for the MIPS R6 SELEQZ FPU
    instruction
  MIPS: math-emu: cp1emu: Add support for the MIPS R6 SELNEZ FPU
    instruction
  MIPS: math-emu: Add support for the MIPS R6 MADDF FPU instruction
  MIPS: math-emu: Add support for the MIPS R6 MSUBF FPU instruction
  MIPS: math-emu: Add support for the MIPS R6 RINT FPU instruction
  MIPS: math-emu: Add support for the MIPS R6 CLASS FPU instruction
  MIPS: math-emu: Add support for the MIPS R6 MIN{,A} FPU instruction
  MIPS: math-emu: Add support for the MIPS R6 MAX{,A} FPU instruction

 arch/mips/include/uapi/asm/inst.h |   9 +-
 arch/mips/math-emu/Makefile       |   4 +-
 arch/mips/math-emu/cp1emu.c       | 371 +++++++++++++++++++++++++++++++++++++-
 arch/mips/math-emu/dp_2008class.c |  55 ++++++
 arch/mips/math-emu/dp_fmax.c      | 213 ++++++++++++++++++++++
 arch/mips/math-emu/dp_fmin.c      | 213 ++++++++++++++++++++++
 arch/mips/math-emu/dp_maddf.c     | 265 +++++++++++++++++++++++++++
 arch/mips/math-emu/dp_msubf.c     | 269 +++++++++++++++++++++++++++
 arch/mips/math-emu/ieee754.h      |  19 ++
 arch/mips/math-emu/sp_2008class.c |  55 ++++++
 arch/mips/math-emu/sp_fmax.c      | 213 ++++++++++++++++++++++
 arch/mips/math-emu/sp_fmin.c      | 213 ++++++++++++++++++++++
 arch/mips/math-emu/sp_maddf.c     | 255 ++++++++++++++++++++++++++
 arch/mips/math-emu/sp_msubf.c     | 258 ++++++++++++++++++++++++++
 14 files changed, 2399 insertions(+), 13 deletions(-)
 create mode 100644 arch/mips/math-emu/dp_2008class.c
 create mode 100644 arch/mips/math-emu/dp_fmax.c
 create mode 100644 arch/mips/math-emu/dp_fmin.c
 create mode 100644 arch/mips/math-emu/dp_maddf.c
 create mode 100644 arch/mips/math-emu/dp_msubf.c
 create mode 100644 arch/mips/math-emu/sp_2008class.c
 create mode 100644 arch/mips/math-emu/sp_fmax.c
 create mode 100644 arch/mips/math-emu/sp_fmin.c
 create mode 100644 arch/mips/math-emu/sp_maddf.c
 create mode 100644 arch/mips/math-emu/sp_msubf.c

-- 
2.5.0
