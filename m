Received: from mailapp01.imgtec.com ([195.59.15.196]:39205 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993944AbdFBXmgVAx04 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 3 Jun 2017 01:42:36 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH v3 3/7] dt-bindings: net: Document Intel pch_gbe binding
Date: Fri, 2 Jun 2017 16:40:38 -0700
Message-ID: <20170602234042.22782-4-paul.burton@imgtec.com>
In-Reply-To: <20170602234042.22782-1-paul.burton@imgtec.com>
References: <20170602234042.22782-1-paul.burton@imgtec.com>
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
To: netdev@vger.kernel.org
Cc: Tobias Klauser <tklauser@distanz.ch>, "David S . Miller" <davem@davemloft.net>, Jarod Wilson <jarod@redhat.com>, linux-mips@linux-mips.org, Eric Dumazet <edumazet@google.com>, Paul Burton <paul.burton@imgtec.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Message-ID: <20170602234038.7vICVZY1VAzw1ydV1PFXYT6012X8LRnC6Z5Zx7MAygE@z>

Introduce documentation for a device tree binding for the Intel Platform
Controller Hub (PCH) GigaBit Ethernet (GBE) device. Although this is a
PCIe device & thus largely auto-detectable, this binding will be used to
provide the driver with the PHY reset GPIO.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: David S. Miller <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jarod Wilson <jarod@redhat.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Tobias Klauser <tklauser@distanz.ch>
Cc: devicetree@vger.kernel.org
Cc: linux-mips@linux-mips.org
Cc: netdev@vger.kernel.org

---

Changes in v3:
- New patch.

Changes in v2: None

 Documentation/devicetree/bindings/net/pch_gbe.txt | 25 +++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/pch_gbe.txt

diff --git a/Documentation/devicetree/bindings/net/pch_gbe.txt b/Documentation/devicetree/bindings/net/pch_gbe.txt
new file mode 100644
index 000000000000..5de479c26b04
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/pch_gbe.txt
@@ -0,0 +1,25 @@
+Intel Platform Controller Hub (PCH) GigaBit Ethernet (GBE)
+
+Required properties:
+- compatible:		Should be the PCI vendor & device ID, eg. "pci8086,8802".
+- reg:			Should be a PCI device number as specified by the PCI bus
+			binding to IEEE Std 1275-1994.
+- phy-reset-gpios:	Should be a GPIO list containing a single GPIO that
+			resets the attached PHY when active.
+
+Example:
+
+	eg20t_mac@2,0,1 {
+		compatible = "pci8086,8802";
+		reg = <0x00020100 0 0 0 0>;
+		phy-reset-gpios = <&eg20t_gpio 6
+				   GPIO_ACTIVE_LOW>;
+	};
+
+	eg20t_gpio: eg20t_gpio@2,0,2 {
+		compatible = "pci8086,8803";
+		reg = <0x00020200 0 0 0 0>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
-- 
2.13.0
