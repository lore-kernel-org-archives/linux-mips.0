Received: from mailapp01.imgtec.com ([195.59.15.196]:10036 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008780AbbIVSMnY2a5U (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 22 Sep 2015 20:12:43 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 00/10] CPS SMP fixes & debug improvements
Date: Tue, 22 Sep 2015 11:12:08 -0700
Message-ID: <1442945538-26141-1-git-send-email-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>, Rusty Russell <rusty@rustcorp.com.au>, "Steven J. Hill" <Steven.Hill@imgtec.com>, Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, "Maciej W. Rozycki" <macro@linux-mips.org>, Andrew Bresticker <abrestic@chromium.org>, linux-kernel@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Bjorn Helgaas <bhelgaas@google.com>, Niklas Cassel <niklas.cassel@axis.com>, James Hogan <james.hogan@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>, Ezequiel Garcia <ezequiel.garcia@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20150922181208.XOq5JUJoAjyxo1ewaIQzwuOE9jDrTGn7MWlv81OgyZo@z>

This series implements some fixes for the CPS SMP implementation on some
systems, and improves debug by allowing exceptions to be handled &
dumped to an ns16550-compatible UART.

Paul Burton (10):
  MIPS: CPS: set Status.BEV bit during early boot
  MIPS: CPS: set Status.KX on entry for MIPS64 kernels
  MIPS: CPS: early debug using an ns16550-compatible UART
  MIPS: CPS: read CM GCR base from cop0
  MIPS: CPS: skip Config1 presence check
  MIPS: CPS: warn if a core doesn't start
  MIPS: CM: fix GCR_Cx_CONFIG PVPE mask
  MIPS: CM: introduce core-other locking functions
  MIPS: CM: make use of mips_cm_{lock,unlock}_other
  MIPS: CM,CPC: ensure core-other GCRs reflect the correct core

 arch/mips/Kconfig.debug            |  26 +++++
 arch/mips/include/asm/mips-cm.h    |  34 ++++++-
 arch/mips/include/asm/mips-cpc.h   |   3 +-
 arch/mips/include/asm/mipsregs.h   |   3 +
 arch/mips/kernel/Makefile          |   1 +
 arch/mips/kernel/cps-vec-ns16550.S | 202 +++++++++++++++++++++++++++++++++++++
 arch/mips/kernel/cps-vec.S         |  44 ++++++--
 arch/mips/kernel/mips-cm.c         |  45 +++++++++
 arch/mips/kernel/mips-cpc.c        |   6 ++
 arch/mips/kernel/smp-cps.c         |  35 ++++++-
 arch/mips/kernel/smp-gic.c         |   2 +
 11 files changed, 386 insertions(+), 15 deletions(-)
 create mode 100644 arch/mips/kernel/cps-vec-ns16550.S

-- 
2.5.3
