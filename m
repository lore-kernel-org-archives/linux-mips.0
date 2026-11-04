Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793776623;
	b=vtVARyEVyKyTM2wJLq6YUJK6OpHI56yja2XDO8B4Yw41Cyg2e4UFFqV7T5hbm/Z+GYIv
	 /UALoa7V4VD/CiMhB5sLvmfqtbqV5CXP6ho2Bgg131qvAyAv8lvMbdUEx6gkGTV3WBidG
	 RCau40I44ggBu0gFWBDOKd8XXSL9I0rHxD0bA8uZqguXQJExa/U70aF7osuAoFqzB6u3V
	 K2JPe33A7cp9Vr6jVIrbHyQc+TrRtPkLpTLw/Iqah3pVXgMSsCrx5MsYSoV5UXQxVD9Ee
	 NsbNhl5UvtIiV66U+CwHNMyDWkGDsHVjEnxsOTQRLvX/w3gLagldVy1Fo4XeCa4ZlNQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776623;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Js9m2mdEL+0lGVevyhujAjmTqYXI90JD//uzRs9mWcc=;
	b=FWItgkM2mH2tVjR/mMN9BXLujZqmHDpYy+2hmEoDkH8HUomATM35uPibsnOHIUGwygkq
	 OncUTjFyDHuP0gO4XH0qG6W1PXmAUJBPYoaWjU6QnIpTf4c0RpToW8pjApY8A3au7jdzT
	 G1C0xOZbjFM3OAkOAyNGlVYeV3Q6z4IAJVBtBfrNykq1/IQXFXvPw2f3/QgtszDZPsjVe
	 AtZPrhXqZw7HmX2ielciRC7HBpSnQSGg+2Je/eTfKR9nTSN70CYGou2F/m4yd7Pm42MI2
	 XPk5g3/Rwxo4X5RUe95JA2VLSTjgITuVvpVVDAUvVpBRrl/9wSmKTxWsy7jciyojwdw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IF8z43rX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21168606A32D;
	Wed,  4 Nov 2026 07:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IF8z43rX
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793776622;
	b=DLAk4EqgG4gDoRZM4R7gW3DQ7jPTa7h5wLm3i0a/FGkvE0ue4LoPysO7e2YCaWnIJPAx
	 HmNsc8Aitn94NVBfgfNIVE9+Teo8ff+jjNjGbZ1k93u7gSY4gg6KVAew0q4+1EasOEJMn
	 6aw4+AV1HkHLi55fzwToRZxYqEuHhUJ+8VPbK+jusP4fs4NQZbkliOHB3iWuuuX1XUK2U
	 3ji6UuLKRMvTe13vWbH+Sb67HQ4TTTQ61SCnpuigKxj/t+g6kZmwaCDh6coI1hzT9nd15
	 C9YCWDcHtil383OxALmZYESB0bOWkmhsFmgtqbI8qVa2PMkd0ZKAP2rys3eEC6g9dFQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793776622;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Js9m2mdEL+0lGVevyhujAjmTqYXI90JD//uzRs9mWcc=;
	b=PDpYfkQavh53X+2PtGYul6Je6WK7EBOvTdyc43YiltMecLIlIrB/45aAZ6TZcoQJ7NQb
	 xlqoV+0tn+yf5s39SqiAJ1U4agsXTVdOvrRBCSbkvyEi3x7tWB6len8JJdQe4juOgKUgN
	 F7A2x5U34CkqF8/5Ppy6BOXiQMuuKkwdEnGQw/RB8Y0I/giOgtp06+Innx/yn2ziCf5yj
	 wLClLjw6WDZdrAGqhohVWozbbJmOc/XmEuCbFBSrWhOPFdMcG7Nwhp6hDXi+hazf8PKBL
	 1ADC+Ni5hPA57oYBSF5Lsxcv6yc8YxFHSvs53kJSCfNXSB+w3XykK112Amtx2cZ1tqA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A59301F00A02;
	Wed,  4 Nov 2026 07:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793776622;
	bh=Js9m2mdEL+0lGVevyhujAjmTqYXI90JD//uzRs9mWcc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=IF8z43rXcVZQUz47TUsg9vmQp4Og+EMRs96hWJ1uozc4khWI51N5hRwUjh5h/tHgO
	 Ae/fbjLEmHFvkZLieKC4aYB7Prm1EKA7TPwdD8o+WHx86wrep+2KQycZLTtlxv/Bv7
	 Bh7mPB2hMbGlW7KeKR3nAcA49SXXjcmqvdKRy2yeiybqj5DTnmGCpaPalhghU+Iwcm
	 MckbAJRVRMln5uWl4tldOQDJUvVOfsJxq5IoDV+lM3ZEbcNNHnB+X66U7hbxWvbWcs
	 YG/Bps3Jbaxy7tzFeDQh7uzrTvJ+pYuC4rTiuDX+pmtTY0OCxymxAvTTJAGrWrAPq8
	 XMWETNSqmJxaQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3481E46CE9;
	Wed,  4 Nov 2026 07:17:01 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Wed, 04 Nov 2026 02:16:55 -0500
Subject: [PATCH 3/4] MIPS: dts: Add Siflower SF19A2890 and GL.iNet
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
Message-Id: <20261104-sf19a2890-mips-v1-3-eae80820af68@telaak.dev>
References: <20261104-sf19a2890-mips-v1-0-eae80820af68@telaak.dev>
In-Reply-To: <20261104-sf19a2890-mips-v1-0-eae80820af68@telaak.dev>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Burton <paulburton@kernel.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Chuanhong Guo <gch981213@gmail.com>, linux-mips@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793776620; l=5031;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=JAaEQIaY7NkxWTkM4HWJ/BUicKl376ZGCJxJhbn3ft8=;
 b=xiBdViDyhe5VGc1j3jQ9eXrgPK/6PVwa6x7dB3Me9nWWK8lS//gQLnmqgvGg12Uqrb5kGSVB3
 vQYkYMzPaUTDLFwEPas1+vg3S1sgVCHrdveP6Ap2tYa6tD8+uNiD8Iu
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
 arch/mips/boot/dts/siflower/sf19a2890.dtsi         | 96 ++++++++++++++++++++++
 5 files changed, 127 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9e715a168..425b52d4f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25703,6 +25703,7 @@ M:	Joseph Telaak <joseph@telaak.dev>
 L:	linux-mips@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/mips/siflower.yaml
+F:	arch/mips/boot/dts/siflower/
 F:	arch/mips/include/asm/mach-siflower/
 F:	drivers/gpio/gpio-siflower.c
 N:	sf19a2890
diff --git a/arch/mips/boot/dts/Makefile b/arch/mips/boot/dts/Makefile
index 36c5e4c6e..d33cf7f61 100644
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
index 000000000..6f5e90aab
--- /dev/null
+++ b/arch/mips/boot/dts/siflower/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_MACH_SIFLOWER_MIPS)	+= sf19a2890-glinet-gl-sft1200.dtb
diff --git a/arch/mips/boot/dts/siflower/sf19a2890-glinet-gl-sft1200.dts b/arch/mips/boot/dts/siflower/sf19a2890-glinet-gl-sft1200.dts
new file mode 100644
index 000000000..13e6a0c8b
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
index 000000000..3a4b39971
--- /dev/null
+++ b/arch/mips/boot/dts/siflower/sf19a2890.dtsi
@@ -0,0 +1,96 @@
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
+	/*
+	 * The bootloader sets up these clocks. They stand in for the system
+	 * clock controller until it has a driver.
+	 */
+	cpu_clk: clock-800000000 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <800000000>;
+	};
+
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
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		interrupt-parent = <&gic>;
+
+		uart0: serial@18300000 {
+			compatible = "arm,pl011", "arm,primecell";
+			reg = <0x18300000 0x1000>;
+			interrupts = <GIC_SHARED 226 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&uart_clk>, <&pbus_clk>;
+			clock-names = "uartclk", "apb_pclk";
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


