Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795720904;
	b=E8NGr7zHyV72ESv+g11PTYN+6JJ06/4kKzE82aTC6jG2kzq6PsRqxOzSAFwPk9n9wN0r
	 dV/87kzAOmHmqiR5kZtG0+DT1scnhvKmdD+0wLYoAPDrqv8Tvl9zEuHghjP0WaIdzEFPQ
	 WjGzGmYo4goYvAjXU0AG0TLwYYHD/J2QuCzSjWvqtUPdVQkMo698Xe71LJ0xGzwx4G5uq
	 lpdh1su7z8qwiVya7PP1LKaMrp4dHwcgB2Ew/hDjO69rEz2A59shBmvpZrjWsC4/m8vpO
	 7fT/BF72jbDWizPw01xl9T70tGe8hXJYOMaQ4BN/HZ8jf4dQv7zbNNAki1Gzu9RZ+fA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795720904;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+yBHB70+JsmAKFMYihujfW/eOsl5So0v3ZBdIAUoYTw=;
	b=r4uzKa4ilLF+V0oRyRGGbL38Z5Flt7xRHYRgbzuvTBdRIa9PtyHrqRECUJ6pR2I9NUkJ
	 BNuBwlUpYklE0pSqOcyp0PNXeH2dOhcO0P5RcFL1n0vABcHVevIP0bjGY70xhzGX6hmoR
	 +HoDNLFpVdk+Wbr+2w4seFdtfzKbN4hfbdK4TInWH+EF5vy32D2MRz468jU63+z1Fjp7u
	 MdO7m2KC4foqD2hlbQiOTUekt/iUSkq8kshcAEWGVVyIN77xByTzfqM+qjb0xeGAiMRHn
	 gDZwaNXhbAuaAozEBm2k8flp3Th5sZVhUZARSN3o4Fdq30EGJFZPLWIq3Vprs4vNaqg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="B/qMuxQX";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1254F606A339;
	Thu, 26 Nov 2026 19:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B/qMuxQX
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795720903;
	b=WdnSDeubf3xBZQWz8nOA0ClM/m2YWEL5oZadUAynv9fwb/gLR9O4PI9bN+1iOkmYvfit
	 G4pZrgGhak/MK6TrahYs9O9SlfuBz/oErFva+rLCosjKG6gKY8DoSC2HXJ3sExvdQu7ga
	 6n1dJhWNMl65F0xnxDmjhTjvKythsYqwAT561R4vaH7imNmtardHgOO74aZsKZ3X0AgYx
	 MzOQZ8WH5MY93+a/nZLOIiPqZTDgI0ay+a4IeyC0beqLGVuu7KziOCIFXBvTi9xrHIAT5
	 NR/AwF+xz3wRs8nirftPDW7uAdsRCqHxjpn9xduLXS0E3cjUjHpWKqJDPoRQ1dps6uw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795720903;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+yBHB70+JsmAKFMYihujfW/eOsl5So0v3ZBdIAUoYTw=;
	b=JVxGkV63ENM6Em3s1zfWPMdKnXSeGQ7hyG6Ff5tiF6MCqVpMR6AyQ8wSvEvYcy4pfyfU
	 ++qCb+2oZ30WGA8dZvfkvRczkNg3AR0Q8Xo5gu1TQ5Aa0ChSf64b1TNdxfaoGPlPWc9Vo
	 f1loZXPodBTPbdOna+jCRkXEj796+ONgZilrH2TvExfOGR9WJU4NaeilQbXrpj2sXNDMB
	 QqLBA8fnuayLazPdlj79o2THlTJJYdKOhTNhhbE4mAwq8Lq5nNrsWTD4uKx7Bo+R/lTXV
	 lJnJcNKSxX5S33nDlW1JRuYeu6zfhJY/wqOs8NSXVz/zzEGucXue0XM9O268v5G1qLA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AABE61F000D4;
	Thu, 26 Nov 2026 19:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795720903;
	bh=+yBHB70+JsmAKFMYihujfW/eOsl5So0v3ZBdIAUoYTw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=B/qMuxQXzUitvyL9g685nXYfmobLsEcY0xD92BU5cgIF2iOpWo3A3fkAHU4sqJpxs
	 L0cuq9BliIr0VXaVvF/DpOU76DZ+RIBmJjo9I+zoa+lNL+xjt+n9bDTdeeP+GPY0NE
	 orJgzhhn/ZV+hR9I7N+nYlXjWOIWikn3JzbNKEIE612nMgZnXFmdWvSQwyo9aDCpJP
	 cTWjVSjwh/IHuhe+mbe3vCffZHxf5qynvYkdtu4853Al7OuS9SxSm9G/9eibOqcnUP
	 S4MxOarSxZrSwtDaFTE3jfDzK5uqxn7mjy0jV8cKrH1Xdvk/8A8uyVU+YpoJ0v7w3d
	 koXyZ8szs2Hzw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 381574D7BE;
	Thu, 26 Nov 2026 19:21:32 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Thu, 26 Nov 2026 14:21:32 -0500
Subject: [PATCH v3 4/5] MIPS: dts: Add Siflower SF19A2890 and GL.iNet
 GL-SFT1200
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261126-sf19a2890-mips-v3-4-1f808d38ab37@telaak.dev>
References: <20261126-sf19a2890-mips-v3-0-1f808d38ab37@telaak.dev>
In-Reply-To: <20261126-sf19a2890-mips-v3-0-1f808d38ab37@telaak.dev>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Burton <paulburton@kernel.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Chuanhong Guo <gch981213@gmail.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, linux-mips@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795720891; l=5038;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=Q+uqg0phnSitomVG3bzzNR+OMDkZ9IamsxkTzR01Xes=;
 b=mTt/V6AQaFjTARsm/yCgyOPaYECF3VGU+fcZE3/WL58sk7TskaFUneEpNsVGRowU3/q7liOWS
 /XO+W3kAQP+BSq9k4wX0K6s8rUx7GXi5GD9VueP9epn6cGIwcR2XJsh
X-Developer-Key: i=joseph@telaak.dev; a=ed25519;
 pk=oQI+UfddlZ0wK2ac4WKOGNjUl1ZEN8j9ZVFSqEDoNP0=
X-Endpoint-Received: by B4 Relay for joseph@telaak.dev/20261104 with
 auth_id=1404
X-Original-From: Joseph Telaak <joseph@telaak.dev>
Reply-To: joseph@telaak.dev
Content-Transfer-Encoding: 7bit

From: Joseph Telaak <joseph@telaak.dev>

Add a device tree for the Siflower SF19A2890 with its four interAptiv
CPUs (two cores with two VPEs each), the MIPS GIC and its timer, and
the PL011 UART that serves as the console, and one for the GL.iNet
GL-SFT1200 travel router built on it.

The SoC's clock controller has no driver yet, so fixed clocks stand
in for the rates the bootloader programs: 800 MHz for the CPU (and so
for the GIC timer), 100 MHz for the peripheral bus and 125 MHz for
the UART.

Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 MAINTAINERS                                        |  1 +
 arch/mips/boot/dts/Makefile                        |  1 +
 arch/mips/boot/dts/siflower/Makefile               |  2 +
 .../dts/siflower/sf19a2890-glinet-gl-sft1200.dts   | 27 ++++++
 arch/mips/boot/dts/siflower/sf19a2890.dtsi         | 97 ++++++++++++++++++++++
 5 files changed, 128 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3aa80a8dd785..23ad08c7d8d1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25703,6 +25703,7 @@ M:	Joseph Telaak <joseph@telaak.dev>
 L:	linux-mips@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/mips/siflower.yaml
+F:	arch/mips/boot/dts/siflower/
 F:	arch/mips/include/asm/mach-siflower/
 N:	sf19a2890
 
diff --git a/arch/mips/boot/dts/Makefile b/arch/mips/boot/dts/Makefile
index 36c5e4c6e640..d33cf7f61aa7 100644
--- a/arch/mips/boot/dts/Makefile
+++ b/arch/mips/boot/dts/Makefile
@@ -14,4 +14,5 @@ subdir-y	+= pic32
 subdir-y	+= qca
 subdir-y	+= ralink
 subdir-y	+= realtek
+subdir-y	+= siflower
 subdir-y	+= xilfpga
diff --git a/arch/mips/boot/dts/siflower/Makefile b/arch/mips/boot/dts/siflower/Makefile
new file mode 100644
index 000000000000..b5986850aaa0
--- /dev/null
+++ b/arch/mips/boot/dts/siflower/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+dtb-$(CONFIG_MACH_SIFLOWER_MIPS)	+= sf19a2890-glinet-gl-sft1200.dtb
diff --git a/arch/mips/boot/dts/siflower/sf19a2890-glinet-gl-sft1200.dts b/arch/mips/boot/dts/siflower/sf19a2890-glinet-gl-sft1200.dts
new file mode 100644
index 000000000000..13e6a0c8be27
--- /dev/null
+++ b/arch/mips/boot/dts/siflower/sf19a2890-glinet-gl-sft1200.dts
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+
+/dts-v1/;
+
+#include "sf19a2890.dtsi"
+
+/ {
+	model = "GL.iNet GL-SFT1200";
+	compatible = "glinet,gl-sft1200", "siflower,sf19a2890";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x8000000>;
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
diff --git a/arch/mips/boot/dts/siflower/sf19a2890.dtsi b/arch/mips/boot/dts/siflower/sf19a2890.dtsi
new file mode 100644
index 000000000000..1c342cbaa8ba
--- /dev/null
+++ b/arch/mips/boot/dts/siflower/sf19a2890.dtsi
@@ -0,0 +1,97 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/interrupt-controller/mips-gic.h>
+
+/ {
+	compatible = "siflower,sf19a2890";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	/*
+	 * The bootloader sets up these clocks. They stand in for the system
+	 * clock controller until it has a driver.
+	 */
+	pbus_clk: clock-100000000 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+	};
+
+	uart_clk: clock-125000000 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <125000000>;
+	};
+
+	cpu_clk: clock-800000000 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <800000000>;
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			device_type = "cpu";
+			compatible = "mti,interaptiv";
+			reg = <0>;
+			clocks = <&cpu_clk>;
+		};
+
+		cpu@1 {
+			device_type = "cpu";
+			compatible = "mti,interaptiv";
+			reg = <1>;
+			clocks = <&cpu_clk>;
+		};
+
+		cpu@2 {
+			device_type = "cpu";
+			compatible = "mti,interaptiv";
+			reg = <2>;
+			clocks = <&cpu_clk>;
+		};
+
+		cpu@3 {
+			device_type = "cpu";
+			compatible = "mti,interaptiv";
+			reg = <3>;
+			clocks = <&cpu_clk>;
+		};
+	};
+
+	soc {
+		compatible = "simple-bus";
+		ranges;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&gic>;
+
+		uart0: serial@18300000 {
+			compatible = "arm,pl011", "arm,primecell";
+			reg = <0x18300000 0x1000>;
+			interrupts = <GIC_SHARED 226 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&uart_clk>, <&pbus_clk>;
+			clock-names = "uartclk", "apb_pclk";
+
+			status = "disabled";
+		};
+
+		gic: interrupt-controller@1bdc0000 {
+			compatible = "mti,gic";
+			reg = <0x1bdc0000 0x20000>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			mti,reserved-ipi-vectors = <0 8>;
+
+			timer {
+				compatible = "mti,gic-timer";
+				interrupts = <GIC_LOCAL 1 IRQ_TYPE_NONE>;
+				clocks = <&cpu_clk>;
+			};
+		};
+	};
+};

-- 
Git-155)


