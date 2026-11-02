Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638273;
	b=Sjj64gICCXLFSi3DIQnAHq+ZzTsf6TIMQUPbEvduCNUKPPgPzeauU1oKkwZEUtkNK4P/
	 0kCIYt6dc1gqgysBiNns3/q5CgkE24sbSuIFbUWPQQstY1IKx/SLF670GbnbBrAKxrDha
	 neKtMDO6/zU3s4rCjUk/zBdWhNSwREGPS5w6ztQjRqVQpsgqpHrBHkqsr4ZCHinwllQbd
	 lxv1Cm/vA8bXlcJKCryrP5E+w89ltFs9J2wNRlylXUw2jsQkWPE4NoOPG74NsLLJ1LKuv
	 jIzBRpeUFbS+uYrzds+Tozukr3RFFhPZrJkML9vJXEUMCaQv/x8kKZFX2O+53J07ciA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638273;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=7f2hzo/dOBTufspJmPFdaPlSMDROy4acygZbmp25eMQ=;
	b=Lv/oFxFHgy4DT5lO5KPex8QeZn95HfPyxejuIFQ7OJM1bRcJ1S3BJZOINOs8WCPxjftQ
	 /cjiLUu5nCIVYDpqHHaZOqLvfUP1bCXjLGZIczawlpVIImlKYTQ1LuuUMvUvlCUrovM50
	 Re2fr9tZS2yOUqUirIGBBTSx4HhaYJlAUfwZrXDzZazJVmJHjdA0ucITF3KW6qbiEMGpA
	 Ht7j3ip5GDc8a723gnv/IYnQTMNySeFaZdfILrYPKm+aLyIpjHM0Vv3+3ZNKIRPP80tHs
	 wZDJ67G19C5VWH2HYBfwOYT34SFyQ0fNI/kX6om29Nvc6aXi3YPGQVRVdBgctHE385A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=In9z5Xug;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E761060771EC;
	Mon,  2 Nov 2026 16:51:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E761060771EC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=In9z5Xug
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C7C161A1406;
	Mon,  2 Nov 2026 16:51:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9D72E603D7;
	Mon,  2 Nov 2026 16:51:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9CFA0103291A1;
	Mon,  2 Nov 2026 17:51:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793638270; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7f2hzo/dOBTufspJmPFdaPlSMDROy4acygZbmp25eMQ=;
	b=In9z5Xugfco9oqHHldbFtah5xTShazdz/fRl83+bTGwvEOrjAGRqIsI307ZRDWNLXGSvUV
	XOvjHjsYFU4Z5mKTdvtZYyW7okryon9JM7AcipX1zn/+zzMOC7wiYDjvjQjqNT2eDBd4dL
	tezldPa2WKvc3uMI05pj39DUou8AKsjrmer7RAmOuL4OzgkW0d3+xp4ushu++bb1MWV4Xw
	0GF07NZ3fWwXaQZKGt/h/PR+qCs8XOow7HKIoUPaZgwMFDQaoRFXz9QISh4QFC//7IS4jG
	O8oclGM46kVY4iLnUHWn3/9gT740JDMS2C+CUTvXkoFhLpYkEqkeU5YC0eywIA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Mon, 02 Nov 2026 17:50:41 +0100
Subject: [PATCH v2 4/4] MAINTAINERS: add EyeQ5 MSI controller entry
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
Message-Id: <20261102-eyeq5_msi-v2-4-4aa3d3608064@bootlin.com>
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

