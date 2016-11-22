Received: from mailapp01.imgtec.com ([195.59.15.196]:58177 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993169AbcKVRw46sTPE (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 22 Nov 2016 18:52:56 +0100
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Subject: [PATCH 4/6] MIPS: xilfpga: Add DT node for AXI I2C
Date: Tue, 22 Nov 2016 17:52:41 +0000
Message-ID: <20161122175243.8853-5-Zubair.Kakakhel@imgtec.com>
In-Reply-To: <20161122175243.8853-1-Zubair.Kakakhel@imgtec.com>
References: <20161122175243.8853-1-Zubair.Kakakhel@imgtec.com>
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
To: ralf@linux-mips.org
Cc: Zubair.Kakakhel@imgtec.com, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20161122175241.3M5jsrVow-MKW9wHJLfO60zX162IUCiqAr_AUmOwrGs@z>

The xilfpga platform has an AXI I2C Bus master with a temperature
sensor connected to it.

Add the device tree node to use them.

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
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
2.10.2
