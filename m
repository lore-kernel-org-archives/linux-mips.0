Received: from exsmtp03.microchip.com ([198.175.253.49]:34633 "EHLO
        email.microchip.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S27012012AbcBAX76DdZNi (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 2 Feb 2016 00:59:58 +0100
From: Joshua Henderson <joshua.henderson@microchip.com>
Subject: [PATCH 1/2] dt/bindings: Add bindings for PIC32 watchdog peripheral
Date: Mon, 1 Feb 2016 17:02:56 -0700
Message-ID: <1454371381-25160-1-git-send-email-joshua.henderson@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Joshua.Henderson@microchip.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-kernel@vger.kernel.org
Cc: linux-mips@linux-mips.org, ralf@linux-mips.org, Joshua Henderson <joshua.henderson@microchip.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
Message-ID: <20160202000256.RFCx_VoJ6jWci13xU2f0LyLwfxqvQL5dBcmHxtRlUXQ@z>

Document the devicetree bindings for the watchdog peripheral found on Microchip
PIC32 SoC class devices.

Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: <linux-mips@linux-mips.org>
---
Note: Please merge this patch series through the MIPS tree.
---
 .../bindings/watchdog/microchip,pic32-wdt.txt      |   18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/microchip,pic32-wdt.txt

diff --git a/Documentation/devicetree/bindings/watchdog/microchip,pic32-wdt.txt b/Documentation/devicetree/bindings/watchdog/microchip,pic32-wdt.txt
new file mode 100644
index 0000000..3ce2839
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/microchip,pic32-wdt.txt
@@ -0,0 +1,18 @@
+* Microchip PIC32 Watchdog Timer
+
+When enabled, the watchdog peripheral can be used to reset the device if the
+WDT is not cleared periodically in software.
+
+Required properties:
+- compatible: must be "microchip,pic32mzda-wdt".
+- reg: physical base address of the controller and length of memory mapped
+  region.
+- clocks: phandle of source clk. should be <&LPRC> clk.
+
+Example:
+
+	watchdog0: wdt@1f800800 {
+		compatible = "microchip,pic32mzda-wdt";
+		reg = <0x1f800800 0x200>;
+		clocks = <&LPRC>;
+	};
--
1.7.9.5
