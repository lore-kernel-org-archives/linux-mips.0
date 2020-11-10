Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 859B5C56201
	for <linux-mips@archiver.kernel.org>; Tue, 10 Nov 2020 11:58:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 30042207BB
	for <linux-mips@archiver.kernel.org>; Tue, 10 Nov 2020 11:58:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726152AbgKJL65 (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Tue, 10 Nov 2020 06:58:57 -0500
Received: from mslow2.mail.gandi.net ([217.70.178.242]:56050 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726944AbgKJL65 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 10 Nov 2020 06:58:57 -0500
Received: from relay11.mail.gandi.net (unknown [217.70.178.231])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id B1CE43B2299
        for <linux-mips@vger.kernel.org>; Tue, 10 Nov 2020 11:45:44 +0000 (UTC)
Received: from localhost (82-65-9-182.subs.proxad.net [82.65.9.182])
        (Authenticated sender: gregory.clement@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 70AAA10000B;
        Tue, 10 Nov 2020 11:45:20 +0000 (UTC)
From:   Gregory CLEMENT <gregory.clement@bootlin.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org
Cc:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        <Steen.Hegelund@microchip.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH v2 6/9] MIPS: mscc: Add luton PC0B91 device tree
Date:   Tue, 10 Nov 2020 12:45:05 +0100
Message-Id: <20201110114508.1197652-7-gregory.clement@bootlin.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201110114508.1197652-1-gregory.clement@bootlin.com>
References: <20201110114508.1197652-1-gregory.clement@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add a device tree for the Microsemi Luton PCB091 evaluation board.

It is based on the work of Lars Povlsen <lars.povlsen@microchip.com>.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 arch/mips/boot/dts/mscc/Makefile         |  5 +++-
 arch/mips/boot/dts/mscc/luton_pcb091.dts | 30 ++++++++++++++++++++++++
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 arch/mips/boot/dts/mscc/luton_pcb091.dts

diff --git a/arch/mips/boot/dts/mscc/Makefile b/arch/mips/boot/dts/mscc/Makefile
index 5015ccbbfb23..40699b44ed50 100644
--- a/arch/mips/boot/dts/mscc/Makefile
+++ b/arch/mips/boot/dts/mscc/Makefile
@@ -1,4 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
-dtb-$(CONFIG_SOC_VCOREIII)	+= ocelot_pcb123.dtb ocelot_pcb120.dtb
+dtb-$(CONFIG_SOC_VCOREIII)	+= \
+	luton_pcb091.dtb \
+	ocelot_pcb120.dtb \
+	ocelot_pcb123.dtb
 
 obj-$(CONFIG_BUILTIN_DTB)	+= $(addsuffix .o, $(dtb-y))
diff --git a/arch/mips/boot/dts/mscc/luton_pcb091.dts b/arch/mips/boot/dts/mscc/luton_pcb091.dts
new file mode 100644
index 000000000000..26ef6285d71d
--- /dev/null
+++ b/arch/mips/boot/dts/mscc/luton_pcb091.dts
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2020 Microsemi Corporation
+ */
+
+/dts-v1/;
+
+#include "luton.dtsi"
+
+/ {
+	model = "Luton10 PCB091 Reference Board";
+	compatible = "mscc,luton-pcb091", "mscc,luton";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+	i2c-sda-hold-time-ns = <300>;
+};
-- 
2.28.0

