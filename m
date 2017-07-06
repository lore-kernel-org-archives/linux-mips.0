Received: from mail-wr0-x243.google.com ([IPv6:2a00:1450:400c:c0c::243]:35692
        "EHLO mail-wr0-x243.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23993941AbdGFWZGRosMb (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 7 Jul 2017 00:25:06 +0200
From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH v3 1/4] dt-bindings: ARM: brcmstb: Update Broadcom STB Power Management binding
Date: Thu,  6 Jul 2017 15:22:22 -0700
Message-ID: <20170706222225.9758-2-f.fainelli@gmail.com>
In-Reply-To: <20170706222225.9758-1-f.fainelli@gmail.com>
References: <20170706222225.9758-1-f.fainelli@gmail.com>
Return-Path: <f.fainelli@gmail.com>
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
Cc: Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Brian Norris <computersforpeace@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, "maintainer:BROADCOM BCM7XXX ARM
        ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, Markus Mayer <mmayer@broadcom.com>, Arnd Bergmann <arnd@arndb.de>, Eric Anholt <eric@anholt.net>, Justin Chen <justinpopo6@gmail.com>, Doug Berger <opendmb@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:BROADCOM BCM7XXX
        ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:BROADCOM BCM47XX MIPS ARCHITECTURE" <linux-mips@linux-mips.org>, linux-pm@vger.kernerl.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Message-ID: <20170706222222.kJ5u0qFaGDNGkSlHDvJu4IR5ExfpS6EO-diRi9L0Yu8@z>

Update the Broadcom STB Power Management binding document with new
compatible strings for the DDR PHY and memory controller found on newer
chips.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 Documentation/devicetree/bindings/arm/bcm/brcm,brcmstb.txt | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,brcmstb.txt b/Documentation/devicetree/bindings/arm/bcm/brcm,brcmstb.txt
index 0d0c1ae81bed..790e6b0b8306 100644
--- a/Documentation/devicetree/bindings/arm/bcm/brcm,brcmstb.txt
+++ b/Documentation/devicetree/bindings/arm/bcm/brcm,brcmstb.txt
@@ -164,6 +164,8 @@ Control registers for this memory controller's DDR PHY.
 
 Required properties:
 - compatible     : should contain one of these
+	"brcm,brcmstb-ddr-phy-v71.1"
+	"brcm,brcmstb-ddr-phy-v72.0"
 	"brcm,brcmstb-ddr-phy-v225.1"
 	"brcm,brcmstb-ddr-phy-v240.1"
 	"brcm,brcmstb-ddr-phy-v240.2"
@@ -184,7 +186,9 @@ Sequencer DRAM parameters and control registers. Used for Self-Refresh
 Power-Down (SRPD), among other things.
 
 Required properties:
-- compatible     : should contain "brcm,brcmstb-memc-ddr"
+- compatible     : should contain one of these
+	"brcm,brcmstb-memc-ddr-rev-b.2.2"
+	"brcm,brcmstb-memc-ddr"
 - reg            : the MEMC DDR register range
 
 Example:
-- 
2.9.3
