Received: from smtp3-g21.free.fr ([212.27.42.3]:48361 "EHLO smtp3-g21.free.fr"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S23993962AbdIHSgSpSmgf (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 8 Sep 2017 20:36:18 +0200
From: Mathieu Malaterre <malat@debian.org>
Subject: [PATCH 3/3] MIPS: jz4780: DTS: Probe the jz4740-watchdog driver from devicetree
Date: Fri,  8 Sep 2017 20:35:55 +0200
Message-ID: <20170908183558.1537-3-malat@debian.org>
In-Reply-To: <20170908183558.1537-1-malat@debian.org>
References: <20170908183558.1537-1-malat@debian.org>
Return-Path: <mathieu@macbookpro.malat.net>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
Cc: Mathieu Malaterre <malat@debian.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Wim Van Sebroeck <wim@iguana.be>, Guenter Roeck <linux@roeck-us.net>, Linus Walleij <linus.walleij@linaro.org>, Paul Cercueil <paul@crapouillou.net>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Message-ID: <20170908183555.NRbT4XEesZHOqfXUsbNdk7EIog1DZ6O_3ALHfK-xghA@z>

The jz4740-watchdog driver supports both jz4740 & jz4780.

Signed-off-by: Mathieu Malaterre <malat@debian.org>
---
 arch/mips/boot/dts/ingenic/jz4780.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi b/arch/mips/boot/dts/ingenic/jz4780.dtsi
index 4853ef67b3ab..33d7f49186d6 100644
--- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
@@ -207,6 +207,11 @@
 		status = "disabled";
 	};
 
+	watchdog: jz4780-watchdog@10002000 {
+		compatible = "ingenic,jz4740-watchdog";
+		reg = <0x10002000 0x100>;
+	};
+
 	nemc: nemc@13410000 {
 		compatible = "ingenic,jz4780-nemc";
 		reg = <0x13410000 0x10000>;
-- 
2.11.0
