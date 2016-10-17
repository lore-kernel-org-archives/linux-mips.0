Received: from mailapp02.imgtec.com ([217.156.133.132]:55966 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23992993AbcJQQxQ39O9z (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 17 Oct 2016 18:53:16 +0200
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Subject: [Patch v5 10/12] MIPS: xilfpga: Add DT node for AXI I2C
Date: Mon, 17 Oct 2016 17:52:54 +0100
Message-ID: <1476723176-39891-11-git-send-email-Zubair.Kakakhel@imgtec.com>
In-Reply-To: <1476723176-39891-1-git-send-email-Zubair.Kakakhel@imgtec.com>
References: <1476723176-39891-1-git-send-email-Zubair.Kakakhel@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Zubair.Kakakhel@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: monstr@monstr.eu, ralf@linux-mips.org, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, alistair@popple.id.au, mporter@kernel.crashing.org
Cc: soren.brinkmann@xilinx.com, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, michal.simek@xilinx.com, linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, paulus@samba.org, benh@kernel.crashing.org
Message-ID: <20161017165254.fzdKbjxhuzcLXuXmXR62uEDUwF6ZMfhmdFFOLj7qw6o@z>

The xilfpga platform has an AXI I2C Bus master with a temperature
sensor connected to it.

Add the device tree node to use them.

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>

---
V3 -> V4
changed compatible string from "adt7420" to "adi,adt7420"

V2 -> V3
No change

V1 -> V2

No change
---
 arch/mips/boot/dts/xilfpga/nexys4ddr.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/mips/boot/dts/xilfpga/nexys4ddr.dts b/arch/mips/boot/dts/xilfpga/nexys4ddr.dts
index d285c8d..f5ebab8 100644
--- a/arch/mips/boot/dts/xilfpga/nexys4ddr.dts
+++ b/arch/mips/boot/dts/xilfpga/nexys4ddr.dts
@@ -54,6 +54,28 @@
 		interrupt-parent = <&axi_intc>;
 		interrupts = <0>;
 	};
+
+	axi_i2c: i2c@10A00000 {
+	    compatible = "xlnx,xps-iic-2.00.a";
+	    interrupt-parent = <&axi_intc>;
+	    interrupts = <4>;
+	    reg = < 0x10A00000 0x10000 >;
+	    clocks = <&ext>;
+	    xlnx,clk-freq = <0x5f5e100>;
+	    xlnx,family = "Artix7";
+	    xlnx,gpo-width = <0x1>;
+	    xlnx,iic-freq = <0x186a0>;
+	    xlnx,scl-inertial-delay = <0x0>;
+	    xlnx,sda-inertial-delay = <0x0>;
+	    xlnx,ten-bit-adr = <0x0>;
+	    #address-cells = <1>;
+	    #size-cells = <0>;
+
+	    ad7420@4B {
+		compatible = "adi,adt7420";
+		reg = <0x4B>;
+	    };
+	} ;
 };
 
 &ext {
-- 
1.9.1
