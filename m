Received: from mailapp01.imgtec.com ([195.59.15.196]:59794 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993193AbcKVRxABt2vE (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 22 Nov 2016 18:53:00 +0100
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Subject: [PATCH 5/6] MIPS: xilfpga: Add DT node for AXI emaclite
Date: Tue, 22 Nov 2016 17:52:42 +0000
Message-ID: <20161122175243.8853-6-Zubair.Kakakhel@imgtec.com>
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
Message-ID: <20161122175242.BSogOBneumWbXxlhUMDC18n1u6IxBF7cI_twerORCIo@z>

The xilfpga platform has a Xilinx AXI emaclite block.

Add the DT node to use it.

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
---
 arch/mips/boot/dts/xilfpga/nexys4ddr.dts | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/mips/boot/dts/xilfpga/nexys4ddr.dts b/arch/mips/boot/dts/xilfpga/nexys4ddr.dts
index f5ebab8..09a62f2 100644
--- a/arch/mips/boot/dts/xilfpga/nexys4ddr.dts
+++ b/arch/mips/boot/dts/xilfpga/nexys4ddr.dts
@@ -42,6 +42,32 @@
 		xlnx,tri-default = <0xffffffff>;
 	} ;
 
+	axi_ethernetlite: ethernet@10e00000 {
+		compatible = "xlnx,xps-ethernetlite-3.00.a";
+		device_type = "network";
+		interrupt-parent = <&axi_intc>;
+		interrupts = <1>;
+		phy-handle = <&phy0>;
+		reg = <0x10e00000 0x10000>;
+		xlnx,duplex = <0x1>;
+		xlnx,include-global-buffers = <0x1>;
+		xlnx,include-internal-loopback = <0x0>;
+		xlnx,include-mdio = <0x1>;
+		xlnx,instance = "axi_ethernetlite_inst";
+		xlnx,rx-ping-pong = <0x1>;
+		xlnx,s-axi-id-width = <0x1>;
+		xlnx,tx-ping-pong = <0x1>;
+		xlnx,use-internal = <0x0>;
+		mdio {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			phy0: phy@1 {
+				device_type = "ethernet-phy";
+				reg = <1>;
+			};
+		};
+	};
+
 	axi_uart16550: serial@10400000 {
 		compatible = "ns16550a";
 		reg = <0x10400000 0x10000>;
-- 
2.10.2
