Received: from exsmtp01.microchip.com ([198.175.253.37]:22451 "EHLO
        email.microchip.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S27029432AbcEQFJUs4i16 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 17 May 2016 07:09:20 +0200
From: Purna Chandra Mandal <purna.mandal@microchip.com>
Subject: [PATCH 10/11] dt/bindings: Correct clk binding example for PIC32 WDT.
Date: Tue, 17 May 2016 10:35:59 +0530
Message-ID: <1463461560-9629-10-git-send-email-purna.mandal@microchip.com>
In-Reply-To: <1463461560-9629-1-git-send-email-purna.mandal@microchip.com>
References: <1463461560-9629-1-git-send-email-purna.mandal@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Purna.Mandal@microchip.com>
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
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, Purna Chandra Mandal <purna.mandal@microchip.com>, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Joshua Henderson <joshua.henderson@microchip.com>, Mark Rutland <mark.rutland@arm.com>
Message-ID: <20160517050559.A9skzbBpbSnbZ2ndRXneyfo1BXOf1FkXTkRbJqhTrIA@z>

Update binding example based on new clock binding scheme.
[1] Documentation/devicetree/bindings/clock/microchip,pic32.txt

Signed-off-by: Purna Chandra Mandal <purna.mandal@microchip.com>
---

 Documentation/devicetree/bindings/watchdog/microchip,pic32-wdt.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/microchip,pic32-wdt.txt b/Documentation/devicetree/bindings/watchdog/microchip,pic32-wdt.txt
index d140103..f03a29a 100644
--- a/Documentation/devicetree/bindings/watchdog/microchip,pic32-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/microchip,pic32-wdt.txt
@@ -7,12 +7,12 @@ Required properties:
 - compatible: must be "microchip,pic32mzda-wdt".
 - reg: physical base address of the controller and length of memory mapped
   region.
-- clocks: phandle of source clk. should be <&LPRC> clk.
+- clocks: phandle of source clk. Should be <&rootclk LPRCCLK>.
 
 Example:
 
 	watchdog@1f800800 {
 		compatible = "microchip,pic32mzda-wdt";
 		reg = <0x1f800800 0x200>;
-		clocks = <&LPRC>;
+		clocks = <&rootclk LPRCCLK>;
 	};
-- 
1.8.3.1
