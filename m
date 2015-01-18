Received: from mailapp01.imgtec.com ([195.59.15.196]:33190 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011785AbbARWmkLJHuP (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 18 Jan 2015 23:42:40 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 31/36] devicetree: document ingenic,jz4780-intc binding
Date: Sun, 18 Jan 2015 14:42:25 -0800
Message-ID: <1421620945-25502-1-git-send-email-paul.burton@imgtec.com>
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
Message-ID: <20150118224225.MIFsxxYjMGaCT_q5sPGFQobVEo8hxdZqbY2v77OeQho@z>

Add binding documentation for the Ingenic jz4780 interrupt controller.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>
Cc: devicetree@vger.kernel.org
---
 .../interrupt-controller/ingenic,jz4780-intc.txt   | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ingenic,jz4780-intc.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/ingenic,jz4780-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/ingenic,jz4780-intc.txt
new file mode 100644
index 0000000..c6164d9
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/ingenic,jz4780-intc.txt
@@ -0,0 +1,24 @@
+Ingenic jz4780 SoC Interrupt Controller
+
+Required properties:
+
+- compatible : should be "ingenic,jz4780-intc"
+- reg : Specifies base physical address and size of the registers.
+- interrupt-controller : Identifies the node as an interrupt controller
+- #interrupt-cells : Specifies the number of cells needed to encode an
+  interrupt source. The value shall be 1.
+- interrupt-parent: phandle of the CPU interrupt controller.
+- interrupts - Specifies the CPU interrupt the controller is connected to.
+
+Example:
+
+intc: intc@10001000 {
+	compatible = "ingenic,jz4780-intc";
+	reg = <0x10001000 0x50>;
+
+	interrupt-controller;
+	#interrupt-cells = <1>;
+
+	interrupt-parent = <&cpuintc>;
+	interrupts = <2>;
+};
-- 
2.2.1
