Received: from exsmtp03.microchip.com ([198.175.253.49]:56440 "EHLO
        email.microchip.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S27014586AbcAGX5llHBzu (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 8 Jan 2016 00:57:41 +0100
From: Joshua Henderson <joshua.henderson@microchip.com>
Subject: [PATCH v3 09/14] dt/bindings: Add bindings for PIC32 UART driver
Date: Thu, 7 Jan 2016 17:00:24 -0700
Message-ID: <1452211389-31025-10-git-send-email-joshua.henderson@microchip.com>
In-Reply-To: <1452211389-31025-1-git-send-email-joshua.henderson@microchip.com>
References: <1452211389-31025-1-git-send-email-joshua.henderson@microchip.com>
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
Cc: linux-mips@linux-mips.org, ralf@linux-mips.org, Andrei Pistirica <andrei.pistirica@microchip.com>, Joshua Henderson <joshua.henderson@microchip.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
Message-ID: <20160108000024.U874BXFLppnSCEGIO2uT_le_Im2YaJhM_kydCC360Ss@z>

From: Andrei Pistirica <andrei.pistirica@microchip.com>

Document the devicetree bindings for the UART peripheral found on
Microchip PIC32 class devices.

Signed-off-by: Andrei Pistirica <andrei.pistirica@microchip.com>
Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../bindings/serial/microchip,pic32-uart.txt       |   29 ++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/serial/microchip,pic32-uart.txt

diff --git a/Documentation/devicetree/bindings/serial/microchip,pic32-uart.txt b/Documentation/devicetree/bindings/serial/microchip,pic32-uart.txt
new file mode 100644
index 0000000..65b38bf6
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/microchip,pic32-uart.txt
@@ -0,0 +1,29 @@
+* Microchip Universal Asynchronous Receiver Transmitter (UART)
+
+Required properties:
+- compatible: Should be "microchip,pic32mzda-uart"
+- reg: Should contain registers location and length
+- interrupts: Should contain interrupt
+- clocks: Phandle to the clock.
+          See: Documentation/devicetree/bindings/clock/clock-bindings.txt
+- pinctrl-names: A pinctrl state names "default" must be defined.
+- pinctrl-0: Phandle referencing pin configuration of the UART peripheral.
+             See: Documentation/devicetree/bindings/pinctrl/pinctrl-binding.txt
+
+Optional properties:
+- cts-gpios: CTS pin for UART
+
+Example:
+	uart1: serial@1f822000 {
+		compatible = "microchip,pic32mzda-uart";
+		reg = <0x1f822000 0x50>;
+		interrupts = <112 IRQ_TYPE_LEVEL_HIGH>,
+			<113 IRQ_TYPE_LEVEL_HIGH>,
+			<114 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&PBCLK2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_uart1
+				&pinctrl_uart1_cts
+				&pinctrl_uart1_rts>;
+		cts-gpios = <&gpio1 15 0>;
+	};
-- 
1.7.9.5
