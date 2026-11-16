Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837559;
	b=d+mJvTUKQST3JSyg8f5fc+WNinLEpFRlQEXpb7MCkaluvpzRkU+X7rKVuNMhjKwg7QcI
	 fr5CKixFdnRoaERTFHWbQvVTC4yGNLvZeyyfBLjYekodJIeO2T5biQ+rVE0f+aH7Jjdev
	 2zD5pMm2Y/zgt0XbdNgWIItFSUABj7hXwqelpJFkLBvyiCK9JWdhTcsaxP21909hih5ox
	 AI5ef09NexYvCjOAhjNJbJdGmajjqGRV+vtLuxlUKRGnXNt1tm2g1zWDQFbEhfEKvsW2j
	 ofz5w69CX+UoXcku1u+9xlLopK5VfFhy+/9NvCdpozNZtOlQep4InyDxCQtqYopakAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837559;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=7f2hzo/dOBTufspJmPFdaPlSMDROy4acygZbmp25eMQ=;
	b=KwtY8QxSWMyBAsUm9/OaPuoHOnKf+paO+irJQf6Hm1h3WYYcBg2v1NTN28ai1cNG3r7w
	 aobddLh3QqUF4XahQYd7K4f32Ofaf4nVzMEptqIuCOig2ikHBAwLZqWXZ4Xu5hPuPJeXa
	 s0va8CvfRYfbhLrWNX2/hHuE/m4m+Aa253YWKrn6PF42Hk4ndZ9fEBTO//Zto/2pDPh2K
	 0f8OATjqjIp6i4fMwrrfOIAZMh3Ca155ATA7f3m4F8jh8I+QYf/l+Rul515SzSI4/6w00
	 CuugEnUwQ73bCuIFhc4ygkrrXRZFockeB9EdEI1qeKIuQRlX3Bw6deIjmJJ6D37+GQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=WfyZHiuu;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D766760A260D;
	Mon, 16 Nov 2026 13:59:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D766760A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=WfyZHiuu
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 93D981A168E;
	Mon, 16 Nov 2026 13:59:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 62F046023F;
	Mon, 16 Nov 2026 13:59:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C771511BC051A;
	Mon, 16 Nov 2026 14:59:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794837556; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7f2hzo/dOBTufspJmPFdaPlSMDROy4acygZbmp25eMQ=;
	b=WfyZHiuu3/9f0gaRut3kWaOutqX8rn+DBgTPsfAdTO29X3NwxclHC2Kh9q3HcEzKNtzxeg
	X+NIlSOqlswYLPLfzyegwO0g66V3e28xnN546LMFptoBUM8H8+dU4Bo75lOh7On7L4uuvi
	wiNt+Szl/7aHS8je1bDObqMd8YYtHbLJzNqp6J745FCddjC1YZvDqX5YquOlH5CWaPcAt4
	nxkChn2ZBXVyUQeFR3130lj5dp43Rc2fEig45j+IpAXPH8AUigcu7EtAQkHlFpqm/8DKSd
	azMC6hNnrX2QWpsr3Bf9R3+k7REdN1yzS6Vy5awoP4tDOgl3z8wsr6WOpYEUvA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Mon, 16 Nov 2026 14:58:41 +0100
Subject: [PATCH v4 5/5] MAINTAINERS: add EyeQ5 MSI controller entry
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
Message-Id: <20261116-eyeq5_msi-v4-5-2e1233b014b0@bootlin.com>
References: <20261116-eyeq5_msi-v4-0-2e1233b014b0@bootlin.com>
In-Reply-To: <20261116-eyeq5_msi-v4-0-2e1233b014b0@bootlin.com>
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

