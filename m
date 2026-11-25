Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795634855;
	b=B/TI3l/2gV58tzjbbpJXwDvTzWC6ENWAarW59/Bw1HXfxbVqe6rIPcXhZ8mQ8Kv665dU
	 44iKD5Gtu/iCZA8FOvEasKsKVVykrCd3mV5bSIft2v1d7XfX3PAeWjySrmam4kxH1PCCq
	 egRDC8CqoMwt5gtpfWEOEvjY26LLfbTAuETn2hCw1gVVcMYe1MmjU59oqBiBZyQxjjobE
	 kSbywFOG7VO1PTOuF6egVVvy8ZcECJqVlpQFqOTzIGN4qh55IhxQhxsW4BFOot+JrbFSR
	 72ukSVwtfSdwRY70f9NPSqnXIaqoAFlLi02Wh7dzes4BNu8aLBaKiYXIsUPq88zce3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795634855;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=ETlxSp0T1c8AX/VhONDrS4J1SKrQaJ/+qnMHUEdlhTc=;
	b=dxmom+mzc22WZOFG/taza9cosw3qukkZPXENeXLsPR7TJuXlTUD+7Ll5dax4UGbEtg4H
	 0bM1S81tLrHiwfAXa2q+9toaI6B26Wx3oyv+YBE0zOxT2VKIQvlVrRLL8kEfuBTI1BuJk
	 6hZwKYQeDUYWlWFNvKao2IqBDod/oOlEQGpfSqgstbtrZu5cZARwhOC0DoWmrhM+0Djh+
	 1a7w6/Zcd/AoUJxaD0ArlrzgbbCdEIFFurXuu/7qj0baEcMk+Wls01ieOO0NLuCQYmOei
	 MS7CAIR7Tqc0LPmFiuLvRtiKHPl+OXWSsFSjMBX4fpzewhDDtMoZvGdRuPpiSZH6TDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="Mmct8/f+";
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CA3606A33C
	for <linux-mips@vger.kernel.org>; Wed, 25 Nov 2026 19:27:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0CA3606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Mmct8/f+
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2B197C2BB3D;
	Wed, 25 Nov 2026 19:27:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3029660480;
	Wed, 25 Nov 2026 19:27:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4F41311E6B113;
	Wed, 25 Nov 2026 20:27:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795634852; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ETlxSp0T1c8AX/VhONDrS4J1SKrQaJ/+qnMHUEdlhTc=;
	b=Mmct8/f+9FoD1C6xXGo7HKlo2qp8KSAEtl6i+4OIjlLkC3stpwVsqw5NFFWRYLr2lObjfW
	DMRNYqZnEbLeCUSHC4sDpfw1dBaRjVbR9zTV3Ctojh+fnkTc1ZNVfBa2OlrnNy7OJtSLGk
	eT7rp8sSVZToPuaLQsJqW9VCj0H77G5WKX75VEHTT/TpVcYvydPJaYu4cPjFkiUDmw5l9i
	QjAfFH0HyRpI02WqP+qUWQbP7Pd7eWpQ0bBf1cNLhHeAJwM3KMjWYkWEo0LcPlAhCuJiB+
	unJxmlry07t+bGncXhgnEZ5eaTvCMPa4BVHxT02nPBbSH77nxpaaRGwRDCUYtQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Wed, 25 Nov 2026 20:27:11 +0100
Subject: [PATCH v5 4/5] MIPS: dts: eyeq5: add MSI controllers
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
Message-Id: <20261125-eyeq5_msi-v5-4-72346cd10736@bootlin.com>
References: <20261125-eyeq5_msi-v5-0-72346cd10736@bootlin.com>
In-Reply-To: <20261125-eyeq5_msi-v5-0-72346cd10736@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Add the two EyeQ5 MSI controllers. They use reserved-memory regions as
their doorbell windows.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 arch/mips/boot/dts/mobileye/eyeq5.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/mips/boot/dts/mobileye/eyeq5.dtsi b/arch/mips/boot/dts/mobileye/eyeq5.dtsi
index cec5ad8752285..ab63a90ed3e92 100644
--- a/arch/mips/boot/dts/mobileye/eyeq5.dtsi
+++ b/arch/mips/boot/dts/mobileye/eyeq5.dtsi
@@ -309,6 +309,28 @@ gpio1: gpio@1500000 {
 			resets = <&olb 0 26>;
 		};
 
+		msi0: msi-controller@5840000 {
+			compatible = "mobileye,eyeq5-msi";
+			reg = <0x0 0x05840000 0x0 0x10>,
+			      <0x0 0x05840040 0x0 0x20>;
+			interrupt-parent = <&gic>;
+			msi-controller;
+			#msi-cells = <0>;
+			interrupts = <GIC_SHARED 7 IRQ_TYPE_LEVEL_HIGH>;
+			memory-region = <&pci0_msi_reserved>;
+		};
+
+		msi1: msi-controller@5840010 {
+			compatible = "mobileye,eyeq5-msi";
+			reg = <0x0 0x05840010 0x0 0x10>,
+			      <0x0 0x05840060 0x0 0x20>;
+			interrupt-parent = <&gic>;
+			msi-controller;
+			#msi-cells = <0>;
+			interrupts = <GIC_SHARED 48 IRQ_TYPE_LEVEL_HIGH>;
+			memory-region = <&pci1_msi_reserved>;
+		};
+
 		iocu-bus {
 			compatible = "simple-bus";
 			#address-cells = <2>;

-- 
2.53.0

