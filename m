Received: from mailapp01.imgtec.com ([195.59.15.196]:35521 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011723AbbARWlMpdAW4 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 18 Jan 2015 23:41:12 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 24/36] devicetree: document ingenic,jz4740-uart binding
Date: Sun, 18 Jan 2015 14:40:59 -0800
Message-ID: <1421620859-24991-1-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1421620067-23933-1-git-send-email-paul.burton@imgtec.com>
References: <1421620067-23933-1-git-send-email-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>, Lars-Peter Clausen <lars@metafoo.de>, devicetree@vger.kernel.org
Message-ID: <20150118224059.YpfUkmqzuW_NsAUXBcahkF9bqRYI0tffkOzbhCET7QM@z>

Add binding documentation for Ingenic jz4740 UARTs.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>
Cc: devicetree@vger.kernel.org
---
 .../bindings/serial/ingenic,jz4740-uart.txt        | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/serial/ingenic,jz4740-uart.txt

diff --git a/Documentation/devicetree/bindings/serial/ingenic,jz4740-uart.txt b/Documentation/devicetree/bindings/serial/ingenic,jz4740-uart.txt
new file mode 100644
index 0000000..cdb21d4
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/ingenic,jz4740-uart.txt
@@ -0,0 +1,22 @@
+* Ingenic jz4740 UART
+
+Required properties:
+- compatible : "ingenic,jz4740-uart"
+- reg : offset and length of the register set for the device.
+- interrupts : should contain uart interrupt.
+- clocks : phandles to the module & baud clocks.
+- clock-names: tuple listing input clock names.
+	Required elements: "baud", "module"
+
+Example:
+
+uart0: serial@10030000 {
+	compatible = "ingenic,jz4740-uart";
+	reg = <0x10030000 0x100>;
+
+	interrupt-parent = <&intc>;
+	interrupts = <9>;
+
+	clocks = <&ext>, <&cgu JZ4740_CLK_UART0>;
+	clock-names = "baud", "module";
+};
-- 
2.2.1
