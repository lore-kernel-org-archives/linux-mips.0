Received: from mailapp01.imgtec.com ([195.59.15.196]:23604 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009841AbbA2LOf0Pj2z (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 29 Jan 2015 12:14:35 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 0/9] Add MIPS EJTAG Fast Debug Channel TTY driver
Date: Thu, 29 Jan 2015 11:14:05 +0000
Message-ID: <1422530054-7976-1-git-send-email-james.hogan@imgtec.com>
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
Cc: linux-kernel@vger.kernel.org, James Hogan <james.hogan@imgtec.com>, Andrew Bresticker <abrestic@chromium.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.cz>, Jason Wessel <jason.wessel@windriver.com>, kgdb-bugreport@lists.sourceforge.net
Message-ID: <20150129111405.kh86lEInBRvdju_b3iGbbmLv_zjChGd2TjltAz4US_A@z>

This patchset adds a TTY, console, and KGDB driver for the MIPS Fast
Debug Channel (FDC) hardware, for communicating with a debugger via an
EJTAG probe. 16 TTY ports are created per FDC device, corresponding to
the 16 FDC channels. Each VPE usually has its own FDC instance.

This patchset depends on my recent CDMM bus patchset (the FDC is in the
per-CPU CDMM region), and my recent MIPS timer & perf counter IRQ
sharing patchset (the FDC IRQ is a local CPU IRQ which may similarly
share CPU IRQ lines with the other local IRQs).

Patches 1 to 6 add the necessary architecture bits for the FDC
interrupt, and a workaround in the MIPS idle code to avoid the wait
instruction on certain cores if FDC driver is enabled.

Finally patches 7-9 add the main TTY/console driver, wire up some early
console code, and implement KGDB operations & magic sysrq.

Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Andrew Bresticker <abrestic@chromium.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Jason Cooper <jason@lakedaemon.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jslaby@suse.cz>
Cc: Jason Wessel <jason.wessel@windriver.com>
Cc: linux-mips@linux-mips.org
Cc: kgdb-bugreport@lists.sourceforge.net

James Hogan (9):
  MIPS: Add architectural FDC IRQ fields
  MIPS: Read CPU IRQ line that FDC to routed to
  irqchip: mips-gic: Don't treat FDC IRQ as percpu devid
  irqchip: mips-gic: Add function for retrieving FDC IRQ
  MIPS: Malta: Implement get_c0_fdc_int()
  MIPS: idle: Workaround wait + FDC problems
  tty: Add MIPS EJTAG Fast Debug Channel TTY driver
  MIPS, ttyFDC: Add early FDC console support
  ttyFDC: Implement KGDB IO operations.

 arch/mips/include/asm/cdmm.h     |   11 +
 arch/mips/include/asm/irq.h      |    3 +
 arch/mips/include/asm/mipsregs.h |    4 +
 arch/mips/kernel/idle.c          |   13 +-
 arch/mips/kernel/setup.c         |    2 +
 arch/mips/kernel/traps.c         |   11 +
 arch/mips/mti-malta/malta-time.c |   16 +
 drivers/irqchip/irq-mips-gic.c   |   38 +-
 drivers/tty/Kconfig              |   47 ++
 drivers/tty/Makefile             |    1 +
 drivers/tty/mips_ejtag_fdc.c     | 1303 ++++++++++++++++++++++++++++++++++++++
 include/linux/irqchip/mips-gic.h |    1 +
 12 files changed, 1443 insertions(+), 7 deletions(-)
 create mode 100644 drivers/tty/mips_ejtag_fdc.c

-- 
2.0.5
