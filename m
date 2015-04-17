Received: from mailapp01.imgtec.com ([195.59.15.196]:26319 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009737AbbDQJo2vbYLg (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 17 Apr 2015 11:44:28 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 0/2] MIPS: Add Pistachio Fast Debug Channel support
Date: Fri, 17 Apr 2015 10:44:14 +0100
Message-ID: <1429263856-30471-1-git-send-email-james.hogan@imgtec.com>
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
To: Ralf Baechle <ralf@linux-mips.org>, Andrew Bresticker <abrestic@chromium.org>
Cc: James Hartley <james.hartley@imgtec.com>, James Hogan <james.hogan@imgtec.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, linux-mips@linux-mips.org
Message-ID: <20150417094414.msNGmPIRxGnXYYf7a7e42AZFMTYu_MVopkKaHhOPaJY@z>

These patches add support for the per-VPE Fast Debug Channels (FDC) [1]
in the interAptiv VPEs on Pistachio. I'd like to get these into v4.1 via
the MIPS tree as they're pretty simple and they just allow useful new
functionality (FDC console output etc) to be enabled on a new platform
(Pistachio), so the risk is minimal.

The first patch moves a workaround from the GIC IRQ driver to the Malta
platform code, since the problem doesn't affect Pistachio so it must be
Malta specific.

The second patch enables the Common Device Memory Maps (CDMM), and the
FDC IRQs on Pistachio to allow the FDC TTY driver to be discovered and
to work without polling.

[1] http://www.linux-mips.org/wiki/FDC

James Hogan (2):
  MIPS: Malta: Make GIC FDC IRQ workaround Malta specific
  MIPS: Pistachio: Support CDMM & Fast Debug Channel

 arch/mips/mti-malta/malta-time.c | 20 +++++++++++++-------
 arch/mips/pistachio/init.c       |  8 +++++++-
 arch/mips/pistachio/time.c       |  5 +++++
 drivers/irqchip/irq-mips-gic.c   | 10 ----------
 4 files changed, 25 insertions(+), 18 deletions(-)

Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Andrew Bresticker <abrestic@chromium.org>
Cc: James Hartley <james.hartley@imgtec.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Jason Cooper <jason@lakedaemon.net>
Cc: linux-mips@linux-mips.org
-- 
2.0.5
