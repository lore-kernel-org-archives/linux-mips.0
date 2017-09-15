Received: from smtp3-g21.free.fr ([IPv6:2a01:e0c:1:1599::12]:25744 "EHLO
        smtp3-g21.free.fr" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23991500AbdIOTSw66ss5 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 15 Sep 2017 21:18:52 +0200
From: Mathieu Malaterre <malat@debian.org>
Subject: [PATCH v2 3/5] MIPS: jz4780: DTS: Probe the jz4740-watchdog driver from devicetree
Date: Fri, 15 Sep 2017 21:18:36 +0200
Message-ID: <20170915191837.27564-1-malat@debian.org>
In-Reply-To: <20170908183558.1537-3-malat@debian.org>
References: <20170908183558.1537-3-malat@debian.org>
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
Cc: Mathieu Malaterre <malat@debian.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Linus Walleij <linus.walleij@linaro.org>, Paul Cercueil <paul@crapouillou.net>, PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>, devicetree@vger.kernel.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20170915191836.vjEfYk8sRaxm4zJ4qheToEnd_ZWF6aMiEiPvWyASbN8@z>

The jz4740-watchdog driver supports both jz4740 & jz4780.

Signed-off-by: Mathieu Malaterre <malat@debian.org>
---
Changes in v2:
* make the node name generic (Paul Cercueil)

 arch/mips/boot/dts/ingenic/jz4780.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi b/arch/mips/boot/dts/ingenic/jz4780.dtsi
index 20e37d2d6008..76055bbc823a 100644
--- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
@@ -263,6 +263,11 @@
 		status = "disabled";
 	};
 
+	watchdog: watchdog@10002000 {
+		compatible = "ingenic,jz4780-watchdog";
+		reg = <0x10002000 0x100>;
+	};
+
 	nemc: nemc@13410000 {
 		compatible = "ingenic,jz4780-nemc";
 		reg = <0x13410000 0x10000>;
-- 
2.11.0
