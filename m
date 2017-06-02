Received: from mailapp01.imgtec.com ([195.59.15.196]:35750 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993975AbdFBTdLtL2Yn (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 2 Jun 2017 21:33:11 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 9/9] MIPS: SEAD-3: Fix GIC interrupt specifiers
Date: Fri, 2 Jun 2017 12:29:59 -0700
Message-ID: <20170602192959.25435-10-paul.burton@imgtec.com>
In-Reply-To: <20170602192959.25435-1-paul.burton@imgtec.com>
References: <20170602192959.25435-1-paul.burton@imgtec.com>
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
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@imgtec.com>, stable <stable@vger.kernel.org>
Message-ID: <20170602192959.0Td9_GWNB-J4KFeCyR2S0NillLkLXuFIfU9dc7hBpcs@z>

The various interrupt specifiers in the device tree are not in a valid
format for the MIPS GIC interrupt controller binding. Where each
interrupt should provide 3 values - GIC_LOCAL or GIC_SHARED, the
pin number & the type of interrupt - the device tree was only providing
the pin number. This causes interrupts for those devices to not be used
when a GIC is present. SEAD-3 systems without a GIC are unaffected since
the DT fixup code generates interrupt specifiers that are valid for the
CPU interrupt controller.

Fix this by adding the GIC_SHARED & IRQ_TYPE_LEVEL_HIGH values to each
interrupt specifier.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Fixes: c11e3b48dbc3 ("MIPS: SEAD3: Probe UARTs using DT")
Fixes: a34e93882de4 ("MIPS: SEAD3: Probe ethernet controller using DT")
Fixes: 7afd2a5aec2e ("MIPS: SEAD3: Probe EHCI controller using DT")
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Cc: stable <stable@vger.kernel.org> # v4.9+

---

 arch/mips/boot/dts/mti/sead3.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/mips/boot/dts/mti/sead3.dts b/arch/mips/boot/dts/mti/sead3.dts
index cabe256f9a68..4f8bc83c2960 100644
--- a/arch/mips/boot/dts/mti/sead3.dts
+++ b/arch/mips/boot/dts/mti/sead3.dts
@@ -60,7 +60,7 @@
 		reg = <0x1b200000 0x1000>;
 
 		interrupt-parent = <&gic>;
-		interrupts = <0>; /* GIC 0 or CPU 6 */
+		interrupts = <GIC_SHARED 0 IRQ_TYPE_LEVEL_HIGH>; /* GIC 0 or CPU 6 */
 
 		has-transaction-translator;
 	};
@@ -223,7 +223,7 @@
 		clock-frequency = <14745600>;
 
 		interrupt-parent = <&gic>;
-		interrupts = <3>; /* GIC 3 or CPU 4 */
+		interrupts = <GIC_SHARED 3 IRQ_TYPE_LEVEL_HIGH>; /* GIC 3 or CPU 4 */
 
 		no-loopback-test;
 	};
@@ -238,7 +238,7 @@
 		clock-frequency = <14745600>;
 
 		interrupt-parent = <&gic>;
-		interrupts = <2>; /* GIC 2 or CPU 4 */
+		interrupts = <GIC_SHARED 2 IRQ_TYPE_LEVEL_HIGH>; /* GIC 2 or CPU 4 */
 
 		no-loopback-test;
 	};
@@ -249,7 +249,7 @@
 		reg-io-width = <4>;
 
 		interrupt-parent = <&gic>;
-		interrupts = <0>; /* GIC 0 or CPU 6 */
+		interrupts = <GIC_SHARED 0 IRQ_TYPE_LEVEL_HIGH>; /* GIC 0 or CPU 6 */
 
 		phy-mode = "mii";
 		smsc,irq-push-pull;
-- 
2.13.0
