Received: from exsmtp03.microchip.com ([198.175.253.49]:51221 "EHLO
        email.microchip.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S27012012AbcBAWiiIIWhJ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 1 Feb 2016 23:38:38 +0100
From: Joshua Henderson <joshua.henderson@microchip.com>
Subject: [PATCH 1/2] dt/bindings: Add bindings for the PIC32 random number generator
Date: Mon, 1 Feb 2016 15:41:41 -0700
Message-ID: <1454366511-10640-1-git-send-email-joshua.henderson@microchip.com>
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
Cc: linux-mips@linux-mips.org, Joshua Henderson <joshua.henderson@microchip.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
Message-ID: <20160201224141.aBl-IP1AchzkUBhpCq_-6nA2rNmqu-c9CAQ4lKuZVKQ@z>

Document the devicetree bindings for the random number generator found
on Microchip PIC32 class devices.

Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
---
 .../bindings/rng/microchip,pic32-rng.txt           |   17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rng/microchip,pic32-rng.txt

diff --git a/Documentation/devicetree/bindings/rng/microchip,pic32-rng.txt b/Documentation/devicetree/bindings/rng/microchip,pic32-rng.txt
new file mode 100644
index 0000000..c6d1003
--- /dev/null
+++ b/Documentation/devicetree/bindings/rng/microchip,pic32-rng.txt
@@ -0,0 +1,17 @@
+* Microchip PIC32 Random Number Generator
+
+The PIC32 RNG provides a pseudo random number generator which can be seeded by
+another true random number generator.
+
+Required properties:
+- compatible : should be "microchip,pic32mzda-rng"
+- reg : Specifies base physical address and size of the registers.
+- clocks: clock phandle.
+
+Example:
+
+	rng: rng@1f8e6000 {
+		compatible = "microchip,pic32mzda-rng";
+		reg = <0x1f8e6000 0x1000>;
+		clocks = <&PBCLK5>;
+	};
-- 
1.7.9.5
