Received: from 19pmail.ess.barracuda.com ([64.235.154.231]:53886 "EHLO
        19pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992911AbdKNPqfs6ZI0 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 14 Nov 2017 16:46:35 +0100
From: Matt Redfearn <matt.redfearn@mips.com>
Subject: [PATCH 1/2] MIPS: RB532: Avoid undefined early_serial_setup() without SERIAL_8250_CONSOLE
Date: Tue, 14 Nov 2017 15:44:22 +0000
Message-ID: <1510674263-14065-1-git-send-email-matt.redfearn@mips.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Matt.Redfearn@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>, James Hogan <james.hogan@mips.com>
Cc: linux-mips@linux-mips.org, Matt Redfearn <matt.redfearn@mips.com>, linux-kernel@vger.kernel.org
Message-ID: <20171114154422.N7oPQczKqu39rkv6Tdpey2y8rcdrEiUxLSpSfl7AoAs@z>

Currently MIPS allnoconfig with CONFIG_MIKROTIK_RB532=y fails to link due to
missing support for early_serial_setup():

  LD      vmlinux
arch/mips/rb532/serial.o: In function `setup_serial_port':
serial.c:(.init.text+0x14): undefined reference to `early_serial_setup'

Rather than adding dependencies to the platform to force inclusion of
SERIAL_8250_CONSOLE together with it's dependencies like TTY, HAS_IOMEM,
etc, just exclude arch/mips/rb532/serial.c from the build when it's
dependency is not selected in the kernel config.

Reported-by: Ralf Baechle <ralf@linux-mips.org>
Signed-off-by: Matt Redfearn <matt.redfearn@mips.com>
---

 arch/mips/rb532/Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/mips/rb532/Makefile b/arch/mips/rb532/Makefile
index efdecdb6e3ea..8186afca2234 100644
--- a/arch/mips/rb532/Makefile
+++ b/arch/mips/rb532/Makefile
@@ -2,4 +2,6 @@
 # Makefile for the RB532 board specific parts of the kernel
 #
 
-obj-y	 += irq.o time.o setup.o serial.o prom.o gpio.o devices.o
+obj-$(CONFIG_SERIAL_8250_CONSOLE) += serial.o
+
+obj-y	 += irq.o time.o setup.o prom.o gpio.o devices.o
-- 
2.7.4
