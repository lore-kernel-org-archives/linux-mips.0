Received: from exsmtp03.microchip.com ([198.175.253.49]:39349 "EHLO
        email.microchip.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S27029448AbcEQFInT2I96 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 17 May 2016 07:08:43 +0200
From: Purna Chandra Mandal <purna.mandal@microchip.com>
Subject: [PATCH 06/11] dt/bindings: Correct clk binding example for PIC32 SDHCI
Date: Tue, 17 May 2016 10:35:55 +0530
Message-ID: <1463461560-9629-6-git-send-email-purna.mandal@microchip.com>
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
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, Purna Chandra Mandal <purna.mandal@microchip.com>, devicetree@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Joshua Henderson <joshua.henderson@microchip.com>, Andrei Pistirica <andrei.pistirica@microchip.com>, Mark Rutland <mark.rutland@arm.com>, Ulf Hansson <ulf.hansson@linaro.org>
Message-ID: <20160517050555.hYqY4oQ1JAtyvd3q3Yy2fMmJkHeO7fWGaqqy6H3-GLo@z>

Update binding example based on new clock binding documentation.
[1] Documentation/devicetree/bindings/clock/microchip,pic32.txt

Signed-off-by: Purna Chandra Mandal <purna.mandal@microchip.com>
---

 Documentation/devicetree/bindings/mmc/microchip,sdhci-pic32.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/microchip,sdhci-pic32.txt b/Documentation/devicetree/bindings/mmc/microchip,sdhci-pic32.txt
index 71ad57e..3149297 100644
--- a/Documentation/devicetree/bindings/mmc/microchip,sdhci-pic32.txt
+++ b/Documentation/devicetree/bindings/mmc/microchip,sdhci-pic32.txt
@@ -20,7 +20,7 @@ Example:
 		compatible = "microchip,pic32mzda-sdhci";
 		reg = <0x1f8ec000 0x100>;
 		interrupts = <191 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&REFCLKO4>, <&PBCLK5>;
+		clocks = <&rootclk REF4CLK>, <&rootclk PB5CLK>;
 		clock-names = "base_clk", "sys_clk";
 		bus-width = <4>;
 		cap-sd-highspeed;
-- 
1.8.3.1
