Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794385655;
	b=OVgPUBzS8WqxlQoPx96HVOCz5bTbCiEcirsincEAziUQ94lQeZlE+gasg0adAWeHN5Pv
	 HxUASyp8PqqLvspx+mJgVlOHnOrR5Vg+OORYIQmnTIRtO+sKjcJNpgTUKEpSIcUySPU4u
	 uuUsH6JVPjbbOeC7ivvdNR8zW7kne0hQ8P6gz6xFeF33DsNmKQK33xe7ZKB8fvfd2B/Xv
	 O0d8xz09vDa8YFmF1OIN9qMBgB6fQBPfDwdpmSJ3heOFSDs/qsl7BtVC2CfmOnbWK4/Fv
	 VIyHJwZXQmiEVqZUNJcXAi0OSPpJ/M5L97a+sHEpziQ+CEuy5bkmF6P1FTgfo/5tGtA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794385655;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+yBHB70+JsmAKFMYihujfW/eOsl5So0v3ZBdIAUoYTw=;
	b=fb/Wl+BdtFOynfdXlQ79KsGiYpCQiaPF7GOWvIlJIrYG7pnfqOWSKUiH/yt/6EkGxFyb
	 Su6m/4nsl82fqX729X+zJjq6cemH1X/1OPu7BMkQNHusRa6LKQd3tcHv1vNyunoNI9yjF
	 CbRlRzK7OyRsDKhvmdB+pcGLPWh+D6ubGiregCSZaACsMbEF7zxAuJpn2YYgJ4YGL9veG
	 M+bJ03V2N6Nvc4aCNNnAu+RrUCdgTEeELz9B9GfVE4iNDWYVYoI/dQa/LcmyHuRpsix9Z
	 3u10w/M+gODAtMTowTNUfpdhBOek+u0Uec5y20/z+nxTZndbPfCw5Fy/sayHcd68f1Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T5fqRM3i;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FEF60A2606;
	Wed, 11 Nov 2026 08:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T5fqRM3i
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794385655;
	b=Wl9Lhq0AAv6Lqf1ThAdS9CALF+MfHgbnHChJaSkX4YNvxjyg0ObTiV+yu1OxgR+e2Kg3
	 TShMw4/YRQ/b3wHO6UKT/O3vUiEjwSQgwQkZePLsg+vJCc/q6KinDHyMJLssWdNbzWOdy
	 uQ/J1PzDJQlmbUkI/rEZ3AKmH2Kn+pufOynezbG1vMObL4m0n/NfRSa74owSeGzgFxPlR
	 yg/RS+XzMRUuZbA/X8GtQCVrb4kB/u6aWdaaW18hL6c1p1AxbW8UmwMcnI7DEoV59R8bV
	 zOUFt4u9W3gDM06TV91AwCE4LnDQCGaF8mGDLBZqZssmq3i/Nww0kCzHPgkSVrHdnLA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794385655;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+yBHB70+JsmAKFMYihujfW/eOsl5So0v3ZBdIAUoYTw=;
	b=1M/3GVa9hnZCBPBvHZNf+gkoHz6HzRJ+KJGAecNnIy6s/uws8BmaRLb8jHMOeMaFkEbR
	 rXfyCJCI5PeyKROsuk6CsrlaJI7zMAZvb/EkKmFQd5AmGfrAxOnJjdpa2Eg/JzBcvua4X
	 CCUwXDz20CcQAusutGOW7iNEnPZeNR1vQQ+w54dM/s6aRKhm2Mhz+eYfK+VgEjDWQp+zb
	 CwGdlr5vE2LgT/tSD0+oYcLOysYBMhjlWbovnTZ3qe1bcBgBoVdiOPeCBfUFHwZfl8fwB
	 H/2bzHTevmFGZJv9uLmYKqsX0xZU306EBrH7vzjrVsy1Fg6A8MwGuy3JmmmBaR9qb/A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 98B1B1F00A0C;
	Wed, 11 Nov 2026 08:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794385655;
	bh=+yBHB70+JsmAKFMYihujfW/eOsl5So0v3ZBdIAUoYTw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=T5fqRM3i0UDFKs7ZNxMZFbPz4yOD0s0zrwD8i6YNP+kAYtKPyI6Yrz/0E26jOOMQ8
	 /LRgMO5UfY8P0B1OiaC52JgbUsaPCF0Qch0TF4bN9iTlcI18qNgnfavkHmYMCPwzbB
	 kLcNRIFwAW6Q0M5lhN52ntWqCwA5w80F+ORizs/Wv5cJpOqpJGltpQEY0KOaFoe54X
	 aVELm2klChDDsNi0UnhWvHHi4Qyk5HeAQDuxitgxIdxA/Sctw/+8O9fEWjlnqih7Yu
	 IxYr6td5Q6kYkIwh/TlAPOIfuS7ZX4uF9ol5/AANbU0swYjsVPTRCfMHz7lBsPxUGZ
	 JRU5ftsZVQlSQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2712A48EA4;
	Wed, 11 Nov 2026 08:27:33 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Wed, 11 Nov 2026 03:27:17 -0500
Subject: [PATCH v2 3/4] MIPS: dts: Add Siflower SF19A2890 and GL.iNet
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
Message-Id: <20261111-sf19a2890-mips-v2-3-36730fa4f5a6@telaak.dev>
References: <20261111-sf19a2890-mips-v2-0-36730fa4f5a6@telaak.dev>
In-Reply-To: <20261111-sf19a2890-mips-v2-0-36730fa4f5a6@telaak.dev>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Burton <paulburton@kernel.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Chuanhong Guo <gch981213@gmail.com>, linux-mips@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794385652; l=5038;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=Q+uqg0phnSitomVG3bzzNR+OMDkZ9IamsxkTzR01Xes=;
 b=6ABfj0uXkTAVs7/yyDHLTcnEK0zQjodbSYExypQ52OiN8n6VQma3/TWYeHBRFQhxFiCD8949G
 k9rnbCXe1jFA2lwx2IAXlvD4hbX3tHESMps1EXrqiLgYGZlrUT52faA
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


