Received: from 19pmail.ess.barracuda.com ([64.235.150.245]:59161 "EHLO
        19pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990430AbdKVJ6oIv3kn (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 22 Nov 2017 10:58:44 +0100
From: Matt Redfearn <matt.redfearn@mips.com>
Subject: [PATCH 2/2] MIPS: Add custom serial.h with BASE_BAUD override for generic kernel
Date: Wed, 22 Nov 2017 09:57:29 +0000
Message-ID: <1511344649-27612-2-git-send-email-matt.redfearn@mips.com>
In-Reply-To: <1511344649-27612-1-git-send-email-matt.redfearn@mips.com>
References: <1511344649-27612-1-git-send-email-matt.redfearn@mips.com>
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
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, linux-serial@vger.kernel.org, linux-mips@linux-mips.org, Matt Redfearn <matt.redfearn@mips.com>, "stable # 4 . 14" <stable@vger.kernel.org>, linux-kernel@vger.kernel.org, Paul Burton <paul.burton@mips.com>, Ingo Molnar <mingo@kernel.org>, Frederic Weisbecker <fweisbec@gmail.com>
Message-ID: <20171122095729.YpzCu2ZpVPFNT4Lz70_TthiCt3cNWBBW8vIb9vQp6hs@z>

Add a custom serial.h header for MIPS, allowing platforms to override
the asm-generic version if required.

The generic platform uses this header to set BASE_BAUD to 0. The
generic platform supports multiple boards, which may have different
UART clocks. Also one of the boards supported is the Boston FPGA board,
where the UART clock depends on the loaded FPGA bitfile. As such there
is no way that the generic kernel can set a compile time default
BASE_BAUD.

Commit 31cb9a8575ca ("earlycon: initialise baud field of earlycon device
structure") changed the behavior of of_setup_earlycon such that any baud
rate set in the device tree is now set in the earlycon structure. The
UART driver will then calculate a divisor based on BASE_BAUD and set it.
With MIPS generic kernels this resulted in garbage output due to the
incorrect uart clock rate being used to calculate a divisor. This
commit, combined with "serial: 8250_early: Only set divisor if valid clk
& baud" prevents the earlycon code setting a bad divisor and restores
earlycon output.

Fixes: 31cb9a8575ca ("earlycon: initialise baud field of earlycon device structure")
Cc: stable <stable@vger.kernel.org> # 4.14
Signed-off-by: Matt Redfearn <matt.redfearn@mips.com>

---

 arch/mips/include/asm/Kbuild   |  1 -
 arch/mips/include/asm/serial.h | 21 +++++++++++++++++++++
 2 files changed, 21 insertions(+), 1 deletion(-)
 create mode 100644 arch/mips/include/asm/serial.h

diff --git a/arch/mips/include/asm/Kbuild b/arch/mips/include/asm/Kbuild
index 7c8aab23bce8..b1f66699677d 100644
--- a/arch/mips/include/asm/Kbuild
+++ b/arch/mips/include/asm/Kbuild
@@ -16,7 +16,6 @@ generic-y += qrwlock.h
 generic-y += qspinlock.h
 generic-y += sections.h
 generic-y += segment.h
-generic-y += serial.h
 generic-y += trace_clock.h
 generic-y += unaligned.h
 generic-y += user.h
diff --git a/arch/mips/include/asm/serial.h b/arch/mips/include/asm/serial.h
new file mode 100644
index 000000000000..30be5cd8efdb
--- /dev/null
+++ b/arch/mips/include/asm/serial.h
@@ -0,0 +1,21 @@
+/*
+ * This file is subject to the terms and conditions of the GNU General Public
+ * License.  See the file "COPYING" in the main directory of this archive
+ * for more details.
+ *
+ * Copyright (C) 2017 MIPS Tech, LLC
+ */
+#ifndef __ASM__SERIAL_H
+#define __ASM__SERIAL_H
+
+#ifdef CONFIG_MIPS_GENERIC
+/*
+ * Generic kernels cannot know a correct value for all platforms at
+ * compile time. Set it to 0 to prevent 8250_early using it
+ */
+#define BASE_BAUD 0
+#else
+#include <asm-generic/serial.h>
+#endif
+
+#endif /* __ASM__SERIAL_H */
-- 
2.7.4
