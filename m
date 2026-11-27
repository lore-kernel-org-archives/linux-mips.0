Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795795811;
	b=1h8UxEMa+nFXt6KG4OIyPwmpRkBRyAfr+jv1O0w+yiMsYOTRX9kut5QoCDOSkhdoHNSq
	 SXuWfZfjX5TiHQwDUJ+pINrA73mh/UzFwzFwizJ1g36jt+sMcnVCmrfZ67E/5rbKfP41o
	 HyE4Tn73NFrmU5/nu0jPqg808r8Ils2j5giG9i9kW8AmTBAguO7o6Is2N2VcNtvxDtrc5
	 a1kIWGoWu7Cy46GPMRSgBVolvos5B3eJp6KXgM96dejUxBOUiGyaE68GwgIOq/DM7xkBp
	 ZCDutdglnlKYoIuuowIL5WnK6lvucnd4q45brn6XsDQNnPfOMRuj0cOKwBA5tyhuZug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795795811;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=M2cfdir0g2ZOuv3RqeLC/CgMql5c3ZeNh/nVLiJgggg=;
	b=ejpbDXZq3pvqqswBTGZQtEv4sXGMjpXqOjdcoE27mZwZTZ0SG71mbuG0X7HYbEG65ZWs
	 h4Kqq5HFVn1NxD/jfGXN4tGUZ/enrzzZ1KQICaMirBggXALQmJRUOxv9qtGXNbLws2U3H
	 zl0HtfhxFlwuJOlmnExHw8FTDTPXwDT6l+v5JWq0d2aYqlLE/k6FuuEj3eaPqzDWq8afA
	 4i6rsoTTNdRnsQS4zE6GnnyGjIpc5WsAkpraapI/1mP7cckCBKnN9Z9/A7xs+lL8vU/Na
	 8zRoNUIBFETuAzldBcgMMjf3YfReiy3LQI8EgG2xU4T37hdEMn+489nGScWaq1udd4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=bdMMPKFA;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DEAE606A31C
	for <linux-mips@vger.kernel.org>; Fri, 27 Nov 2026 16:10:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DEAE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=bdMMPKFA
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8F6E5C2AC50;
	Fri, 27 Nov 2026 16:10:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BC26F6049C;
	Fri, 27 Nov 2026 16:10:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F03C111E90D06;
	Fri, 27 Nov 2026 17:10:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795795808; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=M2cfdir0g2ZOuv3RqeLC/CgMql5c3ZeNh/nVLiJgggg=;
	b=bdMMPKFA79XLnJCJBNPu4m+0WYvuy9pFGUgQKwWqGzp/CYYm21onyAyP1GbNT6nQQ49pKq
	m+7uqXoTaN0QUJ2WvH0yg/HeQrhzs/xXor6sixczZWQxY1wIW2yyCSFluOjYlP/ImUzlnH
	ceGTEeNDasTlfYRncjp3EkSdAJJCn3IenOLnB2/O+pkZalQ3cUv9x6DZWQaRygFD/bn3Wl
	WhH5sg3e1U7BLDlePRBAmTgQiS4HWlFExZnmMZtK5XtsKzpWgcsIpiMEqLqe6uRxFjAs7V
	bvBRyOwXVDpKAMZwe3paK03m24dKj8S5riNeDy1kVGBcmpSYR7pZ3WHIyMjfHw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Fri, 27 Nov 2026 17:09:52 +0100
Subject: [PATCH 4/4] MIPS: mobileye: dts: eyeq6h: add I2C controllers
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-b4-eyeq6h-i2c-v1-4-d3232984fe83@bootlin.com>
References: <20261127-b4-eyeq6h-i2c-v1-0-d3232984fe83@bootlin.com>
In-Reply-To: <20261127-b4-eyeq6h-i2c-v1-0-d3232984fe83@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Gregory CLEMENT <gregory.clement@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Add the four EyeQ6H I2C controllers. Enable I2C3 on the EPM6 board and
the on-board TMP101 sensor. It also allowed I2C testing.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 arch/mips/boot/dts/mobileye/eyeq6h-epm6.dts | 12 +++++
 arch/mips/boot/dts/mobileye/eyeq6h.dtsi     | 68 +++++++++++++++++++++++++++++
 2 files changed, 80 insertions(+)

diff --git a/arch/mips/boot/dts/mobileye/eyeq6h-epm6.dts b/arch/mips/boot/dts/mobileye/eyeq6h-epm6.dts
index c0e1de2bb5a0e..f3448252d728c 100644
--- a/arch/mips/boot/dts/mobileye/eyeq6h-epm6.dts
+++ b/arch/mips/boot/dts/mobileye/eyeq6h-epm6.dts
@@ -20,3 +20,15 @@ memory@0 {
 		reg = <0x1 0x00000000 0x1 0x00000000>;
 	};
 };
+
+&i2c3 {
+	clock-frequency = <400000>;
+	i2c-transfer-timeout-us = <100000>;
+
+	status = "okay";
+
+	temperature-sensor@48 {
+		compatible = "ti,tmp101";
+		reg = <0x48>;
+	};
+};
diff --git a/arch/mips/boot/dts/mobileye/eyeq6h.dtsi b/arch/mips/boot/dts/mobileye/eyeq6h.dtsi
index dd0f1c7483180..cc5ecd63df07c 100644
--- a/arch/mips/boot/dts/mobileye/eyeq6h.dtsi
+++ b/arch/mips/boot/dts/mobileye/eyeq6h.dtsi
@@ -13,6 +13,10 @@ / {
 
 	aliases {
 		serial0 = &uart0;
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
 	};
 
 	xtal: clock-30000000 {
@@ -79,6 +83,38 @@ uart0: serial@d3331000 {
 			clock-names = "uartclk", "apb_pclk";
 		};
 
+		i2c0: i2c@d3333000 {
+			compatible = "mobileye,eyeq6h-i2c", "arm,primecell";
+			reg = <0x0 0xd3333000 0x0 0x1000>;
+			interrupts = <GIC_SHARED 37 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&olb_west EQ6HC_WEST_I2C_SER>,
+				 <&olb_west EQ6HC_WEST_PER_OCC>;
+			clock-names = "i2cclk", "apb_pclk";
+			resets = <&olb_west 5>;
+			pinctrl-0 = <&i2c0_pins>;
+			pinctrl-names = "default";
+
+			status = "disabled";
+		};
+
+		i2c1: i2c@d3334000 {
+			compatible = "mobileye,eyeq6h-i2c", "arm,primecell";
+			reg = <0x0 0xd3334000 0x0 0x1000>;
+			interrupts = <GIC_SHARED 38 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&olb_west EQ6HC_WEST_I2C_SER>,
+				 <&olb_west EQ6HC_WEST_PER_OCC>;
+			clock-names = "i2cclk", "apb_pclk";
+			resets = <&olb_west 6>;
+			pinctrl-0 = <&i2c1_pins>;
+			pinctrl-names = "default";
+
+			status = "disabled";
+		};
+
 		pinctrl_west: pinctrl@d3337000 {
 			compatible = "pinctrl-single";
 			reg = <0x0 0xd3337000 0x0 0xb0>;
@@ -96,6 +132,38 @@ olb_west: system-controller@d3338000 {
 			clock-names = "ref";
 		};
 
+		i2c2: i2c@d3353000 {
+			compatible = "mobileye,eyeq6h-i2c", "arm,primecell";
+			reg = <0x0 0xd3353000 0x0 0x1000>;
+			interrupts = <GIC_SHARED 39 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&olb_east EQ6HC_EAST_I2C_SER>,
+				 <&olb_east EQ6HC_EAST_PER_OCC>;
+			clock-names = "i2cclk", "apb_pclk";
+			resets = <&olb_east 5>;
+			pinctrl-0 = <&i2c2_pins>;
+			pinctrl-names = "default";
+
+			status = "disabled";
+		};
+
+		i2c3: i2c@d3354000 {
+			compatible = "mobileye,eyeq6h-i2c", "arm,primecell";
+			reg = <0x0 0xd3354000 0x0 0x1000>;
+			interrupts = <GIC_SHARED 40 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&olb_east EQ6HC_EAST_I2C_SER>,
+				 <&olb_east EQ6HC_EAST_PER_OCC>;
+			clock-names = "i2cclk", "apb_pclk";
+			resets = <&olb_east 6>;
+			pinctrl-0 = <&i2c3_pins>;
+			pinctrl-names = "default";
+
+			status = "disabled";
+		};
+
 		pinctrl_east: pinctrl@d3357000 {
 			compatible = "pinctrl-single";
 			reg = <0x0 0xd3357000 0x0 0xb0>;

-- 
2.53.0

