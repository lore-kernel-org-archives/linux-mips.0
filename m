Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793203157;
	b=CF9ChLwvp/Egob/+CQ0eIQ9Lq7M+SVEHGK7e/T8Z8PjoG9BE2aQePqOLLPJeLad0qpWZ
	 vaKhxWr7DBShdcevadXTJmz7p7FSfMf56w/XprQreOFyWsIyJK36h2h4FNggkWnnZFGU8
	 0pPfSniPak2dQl0wRWkjtwhsNV7DNYY2kix035XiKoZUUoRchbUCejjr7ZGUhcEdZWTpQ
	 RMw40uU+PAs/OGh3dZl77A3Jae/ExPsJMJqcxjjHVahCYA2ziWiDLjmM7MngUk8thPZbo
	 a6oufluEiExTzaz5/+Za9Qw0YRbBZgDF+tjRKgsqilMKzEa9NQ6kUVIEvEQO8z2btRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793203157;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=I5a5E1bhzg0ab79hA59Sa28dgk9pFwQ/43DPmrVSBB0=;
	b=YNn5ov9FYV8zFM0ab4VSSRuLsOJwXLVpbpYjWpBgvPaefBL/jukkekYLDugkMqUJqCnp
	 ODwV7mkDiupqOLc+yR9HRCck8T7BYOxFsfX62A85HiqZfh9Hnt9gbxIPL+KEbKHvgdm2p
	 WC4Jd4ItLtEXG+1iQhtmlXEeOE0AbncYY+Zo/olTjFZX627RP5cUZzp47KwS+A0F1tTGv
	 tg26paBCt6H3yN6dLzLgGBUbq3HQr6MME8cjyHWL4s4WpSl0AgHVt8Lt49alLhN9qDuaB
	 42xnz3N6LEiU95nuhMWKQuPTTbMHSf+VrbAvEktmA0K1DErG9OKncUbe7yhTz5X95yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=siGGsAza;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CDC60A2619;
	Wed, 28 Oct 2026 15:59:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4CDC60A2619
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=siGGsAza
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3566A4E41361;
	Wed, 28 Oct 2026 15:59:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0B00460769;
	Wed, 28 Oct 2026 15:59:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E87F9103290E4;
	Wed, 28 Oct 2026 16:59:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793203149; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=I5a5E1bhzg0ab79hA59Sa28dgk9pFwQ/43DPmrVSBB0=;
	b=siGGsAzaUYL5jWGoahigsm3qAAFbt3eQ8UQIzi1QX14Wq6QB7nawSD6Q3daecLWN+wsnB9
	Q7g1s2+jv8XFbqNasXx9QaSkuKoNixUBoRzIm9KKDEf2LGF+uxAEqbxJPY8MuiTFGKK4vm
	UGFyflOztVIjaocFl5JPmClRItqhVPCNp2l9jdjx8MNlw7ncoB2uhH5ZMZZ5moeUokwo+1
	3XMxS51hD52sAkEpkajTa3OOFqjnQuqp87EfsJCrYR6rUjm8O/hTWXDVAvLaDxzQM8+grc
	JfzqbRN1p/Vd/kKslnOeJHsbWTzrADtrlF2LXNZa/J8ekHgOLCFBsUuXXiR98w==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Wed, 28 Oct 2026 16:58:50 +0100
Subject: [PATCH 3/4] MIPS: dts: eyeq5: add MSI controllers
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
Message-Id: <20261028-eyeq5_msi-v1-3-c464752fb55f@bootlin.com>
References: <20261028-eyeq5_msi-v1-0-c464752fb55f@bootlin.com>
In-Reply-To: <20261028-eyeq5_msi-v1-0-c464752fb55f@bootlin.com>
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
 arch/mips/boot/dts/mobileye/eyeq5.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/mips/boot/dts/mobileye/eyeq5.dtsi b/arch/mips/boot/dts/mobileye/eyeq5.dtsi
index cec5ad8752285..be5239d890239 100644
--- a/arch/mips/boot/dts/mobileye/eyeq5.dtsi
+++ b/arch/mips/boot/dts/mobileye/eyeq5.dtsi
@@ -309,6 +309,36 @@ gpio1: gpio@1500000 {
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
+			num-vectors = <4>;
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
+			num-vectors = <4>;
+		};
+
 		iocu-bus {
 			compatible = "simple-bus";
 			#address-cells = <2>;

-- 
2.53.0

