Received: from exsmtp01.microchip.com ([198.175.253.37]:22241 "EHLO
        email.microchip.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S27029447AbcEQFIsBBZc6 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 17 May 2016 07:08:48 +0200
From: Purna Chandra Mandal <purna.mandal@microchip.com>
Subject: [PATCH 07/11] dt/bindings: Correct clk binding example for PIC32 pinctrl
Date: Tue, 17 May 2016 10:35:56 +0530
Message-ID: <1463461560-9629-7-git-send-email-purna.mandal@microchip.com>
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
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, Purna Chandra Mandal <purna.mandal@microchip.com>, devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Joshua Henderson <joshua.henderson@microchip.com>, Mark Rutland <mark.rutland@arm.com>
Message-ID: <20160517050556.bzT2CiVjzGR-SO5OQ-y5HhDLvdwCivP1uPqmvrQ1uiY@z>

Update binding example based on new clock binding scheme.
[1] Documentation/devicetree/bindings/clock/microchip,pic32.txt

Signed-off-by: Purna Chandra Mandal <purna.mandal@microchip.com>
---

 Documentation/devicetree/bindings/pinctrl/microchip,pic32-pinctrl.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/microchip,pic32-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/microchip,pic32-pinctrl.txt
index 4b5efa5..29b72e3 100644
--- a/Documentation/devicetree/bindings/pinctrl/microchip,pic32-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/microchip,pic32-pinctrl.txt
@@ -34,7 +34,7 @@ pic32_pinctrl: pinctrl@1f801400{
 	#size-cells = <1>;
 	compatible = "microchip,pic32mzda-pinctrl";
 	reg = <0x1f801400 0x400>;
-	clocks = <&PBCLK1>;
+	clocks = <&rootclk PB1CLK>;
 
 	pinctrl_uart2: pinctrl_uart2 {
 		uart2-tx {
-- 
1.8.3.1
