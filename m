Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793797108;
	b=hkN+arxyAxFSMxRkJpefBpzYB6srldk/ufzOIejEs6HV1FZyXmQfTKypZTYPQp7JUgmy
	 6Y1a7tRw0d98PPHsxGd9ZztZjl35pcObaRt72BwsNLwiDhM+tutOBQHPhZr2tVd2Ejm/C
	 mGNdTZMwvcN+atOplYTEp9/8R2NVHy0Z1uHGdBHxYStRW8xMIfnH5+gad7JjzXwkdlG4/
	 7XXxUHHpSfGV6iNuackOVwbg0PPvD8KRTvsJZSigsN6UakVGBbkaNrCvqvMgkDvsLEZLO
	 ObScOIQqBAUs6wz8YmSaD0rdLuiQO32DTdCh20k18P0Radhn6PwiT5uZgae+Wt4I/Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793797108;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=7f2hzo/dOBTufspJmPFdaPlSMDROy4acygZbmp25eMQ=;
	b=hzLOa4QulahW31QFB3SglixWM1x5PyZJ6uTNSzCevuJUY0XSEvZDBpQhgElK+DNvND14
	 xK+5VBSSFWTITCmTcYDnXRuj4dibXPr10GXPyhJxOu6MToQrkN1nXWAm4r0bgDWcigrzb
	 P+LV3Rktu2q0Gzfkp26Os1i0rCJV+c8KueY/JKvFrGDFwop6cZ4PqYVBZ4OTMrdycW3XS
	 a/RVUU8FinNuGPsusPVXFsJpZIdN3dgR1HYXwf7eJqS1AmEn88mDPnWZHXbRGrQUjXdsc
	 DzoJmHKDf3eYimVDyZaSHPL0zAeJUkfFLl+bZAUNIbe/OkWVANErS3Ts3zdG5khLK9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ppmQog05;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E58606D82A;
	Wed,  4 Nov 2026 12:58:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39E58606D82A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ppmQog05
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E8DC84E41392;
	Wed,  4 Nov 2026 12:58:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B8DAE60770;
	Wed,  4 Nov 2026 12:58:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7F1FB103291F6;
	Wed,  4 Nov 2026 13:58:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793797105; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7f2hzo/dOBTufspJmPFdaPlSMDROy4acygZbmp25eMQ=;
	b=ppmQog0544qg+PHX483FrjV21nuhSQoV2zqTyxCmraipWI9SzdBN6fsg0rAlfv3EptugsJ
	BIYh6L/sEaRtYuKt6sTBNy6xSo1XOhKj5Q83/az1xGMVWVpIz9iNrAGYntkr1l5ubVmSyj
	nMkbG4jzpT5DEdsNC0FYTtJdHupuzLLkT1gmyKcVAXHdapfd2Y8gcxMngQ+VWmGPCZRQDc
	XDCGWI5bFBTNexwBv2v6S+3hnLHI3uIfYDP+ndsFejOj5tIuHFf2JDLn55E9Q+E2gR53l2
	MQTUOINAqq5PTjhlMwxUdhd/2MFFZni9ce4fQ2rCJVwCCc2CthQf1LQi2o2awg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Wed, 04 Nov 2026 13:58:04 +0100
Subject: [PATCH v3 4/4] MAINTAINERS: add EyeQ5 MSI controller entry
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261104-eyeq5_msi-v3-4-2866f732cd38@bootlin.com>
References: <20261104-eyeq5_msi-v3-0-2866f732cd38@bootlin.com>
In-Reply-To: <20261104-eyeq5_msi-v3-0-2866f732cd38@bootlin.com>
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

Add the EyeQ5 MSI controller binding document and driver.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065d..ca3a32790261d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18769,12 +18769,14 @@ M:	Gregory CLEMENT <gregory.clement@bootlin.com>
 M:	Théo Lebrun <theo.lebrun@bootlin.com>
 L:	linux-mips@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/interrupt-controller/mobileye,eyeq5-msi.yaml
 F:	Documentation/devicetree/bindings/mips/mobileye.yaml
 F:	Documentation/devicetree/bindings/soc/mobileye/
 F:	arch/mips/boot/dts/mobileye/
 F:	arch/mips/configs/eyeq*_defconfig
 F:	arch/mips/mobileye/board-epm5.its.S
 F:	drivers/clk/clk-eyeq.c
+F:	drivers/irqchip/irq-eyeq5-msi.c
 F:	drivers/phy/phy-eyeq5-eth.c
 F:	drivers/pinctrl/pinctrl-eyeq5.c
 F:	drivers/reset/reset-eyeq.c

-- 
2.53.0

