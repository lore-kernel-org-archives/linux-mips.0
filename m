Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638271;
	b=xdO6ir+kdnRyc7X+HmARqZDDqQxqDft9lLRyxqqK0BtARXNyTzpS+BrhydyiR9NzSAkq
	 Gj8dbOfas8yS1kJV5r5FseEtwhuVGvj9Up+8E2wVN6YPYLOPudrTi55AjctYR52moAtp6
	 jPcC3Xr3DaZLDL5TCUh/t8Wbw8mOKo9mQ5m77NXMM4xhELIQ0ByOQ5tszZZwau9OeE29B
	 DnBLX12XUwY2X5hUbqByzL3pVUSsr5miBUzaWVRQ/JoZtcoWVl6v00qoW3di6KfSctqAn
	 S9SKmbK6IDTmmcfAt2RckDo1yUQxXNrYmyb/EdrE0w0a/hoKZET9LhDo1jH5673vOXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638271;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=CSFToAoiRs3HTdfqSHH4fqOUtpfy+qVr4BH+gjm2Dyc=;
	b=yDm9+bZgs/gOVg7PpLI/ejfdvS/gELmHoskZEeWBzMoaz52h1h0MaTPMJSRvglhxhVJN
	 Bt3oQhmwgmSJEvQpCY5Vnkny4wyAcLo0LuDvwRYi03sJzgRGZZty3rgi3Lq7QVArihmCE
	 VpqNZLHN+aZYROhaQ+8srXmJ0wXiYs2weqTl3GAsGNKnCifUyrD5aktH0XXSc+CciUDBB
	 VDEQa9v1ffgwmrrgQ8//6jNgmZyQEGArri59ayFN5Okrz9fbdPVdz+KtX91u/RG8/h+QQ
	 to1RiWkX296t2aiI2/XEJ+bRwM9dznV+PFMG+Et9St4YwlcBKMVWDAwmHxbtXX9L9qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=qTpXUCsl;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CCC60771D2;
	Mon,  2 Nov 2026 16:51:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99CCC60771D2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=qTpXUCsl
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5003B1A1407;
	Mon,  2 Nov 2026 16:51:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1BD2E603D7;
	Mon,  2 Nov 2026 16:51:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4F24610328E6F;
	Mon,  2 Nov 2026 17:51:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793638267; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CSFToAoiRs3HTdfqSHH4fqOUtpfy+qVr4BH+gjm2Dyc=;
	b=qTpXUCslW3JIfaokWoEfBMCLIQY6W1bfTqdS5eWttN7fgh8xdmmZBNx3RtkjSxxXpY1c9M
	Usshxs+P0JDxE8rN7Ow4m/BuuB5rwR9T24AZMqyhY/8RXsULqebwNqZST7ZXbQeveOTDWF
	s6KvyxWvP51/Cmvdt5f/uUo5uVeZjdghwthfziJIMuk9PPuo5uyxnXYJo8CoB3kUQNdu9R
	7ShJk34/HCwDh2AczJ2QZ0glfGgpGoUOpA1y+DvdAP8f7hD5WqplUChjtEugVD1Yc+NyOH
	AGZIwVwlvnmey4fW/vzQ9nimu1rh1MV9PFBScQBEB2t+Omq60U9XFqsEmZNnXA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Mon, 02 Nov 2026 17:50:40 +0100
Subject: [PATCH v2 3/4] MIPS: dts: eyeq5: add MSI controllers
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
Message-Id: <20261102-eyeq5_msi-v2-3-4aa3d3608064@bootlin.com>
References: <20261102-eyeq5_msi-v2-0-4aa3d3608064@bootlin.com>
In-Reply-To: <20261102-eyeq5_msi-v2-0-4aa3d3608064@bootlin.com>
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
 arch/mips/boot/dts/mobileye/eyeq5.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/mips/boot/dts/mobileye/eyeq5.dtsi b/arch/mips/boot/dts/mobileye/eyeq5.dtsi
index cec5ad8752285..39549cef998ea 100644
--- a/arch/mips/boot/dts/mobileye/eyeq5.dtsi
+++ b/arch/mips/boot/dts/mobileye/eyeq5.dtsi
@@ -309,6 +309,34 @@ gpio1: gpio@1500000 {
 			resets = <&olb 0 26>;
 		};
 
+		msi0: msi-controller@5840000 {
+			compatible = "mobileye,eyeq5-msi";
+			reg =	<0x0 0x05840000 0x0 0x10>,
+				<0x0 0x05840040 0x0 0x20>;
+			label = "port0-msi";
+			interrupt-parent = <&gic>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+			msi-controller;
+			#msi-cells = <0>;
+			interrupts =  <GIC_SHARED 7 IRQ_TYPE_LEVEL_HIGH>;
+			memory-region =	<&pci0_msi_reserved>;
+		};
+
+		msi1: msi-controller@5840010 {
+			compatible = "mobileye,eyeq5-msi";
+			reg = <0x0 0x05840010 0x0 0x10>,
+				<0x0 0x05840060 0x0 0x20>;
+			label = "port1-msi";
+			interrupt-parent = <&gic>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+			msi-controller;
+			#msi-cells = <0>;
+			interrupts =  <GIC_SHARED 48 IRQ_TYPE_LEVEL_HIGH>;
+			memory-region =	<&pci1_msi_reserved>;
+		};
+
 		iocu-bus {
 			compatible = "simple-bus";
 			#address-cells = <2>;

-- 
2.53.0

