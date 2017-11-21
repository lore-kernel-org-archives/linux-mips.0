Received: from 19pmail.ess.barracuda.com ([64.235.150.245]:37823 "EHLO
        19pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992280AbdKUAEPECysn (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 21 Nov 2017 01:04:15 +0100
From: James Hogan <james.hogan@mips.com>
Subject: [PATCH] MIPS: Fix CPS SMP NS16550 UART defaults
Date: Tue, 21 Nov 2017 00:02:40 +0000
Message-ID: <20171121000240.4058-1-james.hogan@mips.com>
In-Reply-To: <5e88e3d4-3c4b-b5eb-0b32-d0c0902e14c2@roeck-us.net>
References: <5e88e3d4-3c4b-b5eb-0b32-d0c0902e14c2@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <James.Hogan@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>, Guenter Roeck <linux@roeck-us.net>
Cc: Paul Burton <paul.burton@imgtec.com>, linux-kernel@vger.kernel.org, James Hogan <jhogan@kernel.org>, linux-mips@linux-mips.org
Message-ID: <20171121000240.ov8VTN5GKxDOLYEYc5kq_ezAt59-Y_eFfN2YReEc5Ko@z>

From: James Hogan <jhogan@kernel.org>

The MIPS_CPS_NS16550_BASE and MIPS_CPS_NS16550_SHIFT options have no
defaults for non-Malta platforms which select SYS_SUPPORTS_MIPS_CPS
(i.e. the pistachio and generic platforms). This is problematic for
automated allyesconfig and allmodconfig builds based on these platforms,
since make silentoldconfig tries to ask the user for values, and
especially since v4.15 where the default platform was switched to
generic.

Default these options to 0 and arrange for MIPS_CPS_NS16550 to be no
when using that default base address, so that the option only has an
effect when the default is provided (i.e. Malta) or when a value is
provided by the user.

Fixes: 609cf6f2291a ("MIPS: CPS: Early debug using an ns16550-compatible UART")
Signed-off-by: James Hogan <jhogan@kernel.org>
Reviewed-by: Paul Burton <paul.burton@mips.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: linux-mips@linux-mips.org
---
Guenter: I'm guessing this is the problem you're referring to.
---
 arch/mips/Kconfig.debug | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/mips/Kconfig.debug b/arch/mips/Kconfig.debug
index 464af5e025d6..0749c3724543 100644
--- a/arch/mips/Kconfig.debug
+++ b/arch/mips/Kconfig.debug
@@ -124,30 +124,36 @@ config SCACHE_DEBUGFS
 
 	  If unsure, say N.
 
-menuconfig MIPS_CPS_NS16550
+menuconfig MIPS_CPS_NS16550_BOOL
 	bool "CPS SMP NS16550 UART output"
 	depends on MIPS_CPS
 	help
 	  Output debug information via an ns16550 compatible UART if exceptions
 	  occur early in the boot process of a secondary core.
 
-if MIPS_CPS_NS16550
+if MIPS_CPS_NS16550_BOOL
+
+config MIPS_CPS_NS16550
+	def_bool MIPS_CPS_NS16550_BASE != 0
 
 config MIPS_CPS_NS16550_BASE
 	hex "UART Base Address"
 	default 0x1b0003f8 if MIPS_MALTA
+	default 0
 	help
 	  The base address of the ns16550 compatible UART on which to output
 	  debug information from the early stages of core startup.
 
+	  This is only used if non-zero.
+
 config MIPS_CPS_NS16550_SHIFT
 	int "UART Register Shift"
-	default 0 if MIPS_MALTA
+	default 0
 	help
 	  The number of bits to shift ns16550 register indices by in order to
 	  form their addresses. That is, log base 2 of the span between
 	  adjacent ns16550 registers in the system.
 
-endif # MIPS_CPS_NS16550
+endif # MIPS_CPS_NS16550_BOOL
 
 endmenu
-- 
2.14.1
