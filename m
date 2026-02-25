Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4063E9F73;
	Wed, 25 Feb 2026 16:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772038534; cv=none; b=YDuS3f6HPTy2/PT5X2WY+nlbtuLvb8HjA9kL5vqWjvS0PKClGEWdSnQ8096koeZeG+looHytEweJrzq51wWDLE+qTPTloy3RDYDBI3LlkeDlzpp2TMVd8SKM95Blw9aOL9XBD1zaFcTVRv57QPvweta1F/zo8FOhoctntfsIhVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772038534; c=relaxed/simple;
	bh=lfCmOAYsFOuaFioBHXU/Fxe5X8x0mVX0XYGpyf9HdFM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZlTujyRWnHDeii8NREFR98bI7PdsDNEk9XWnan5fMYl1GeZe+8HJXiD1OI0RIO0Y0iNaQPqMovtG0yHURsz0sXMzoukKHIPmxWSzpo3YfeLjC5FC1g3dVTA7hm7z1UqsViovL9VHHC1yD3m08Sn/b/Xipoyl3L3zwKrsf432pJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=0cKogkyu; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="0cKogkyu"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EDA5D1A1327;
	Wed, 25 Feb 2026 16:55:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C56AF5FDE6;
	Wed, 25 Feb 2026 16:55:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9230A103692F2;
	Wed, 25 Feb 2026 17:55:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772038530; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=S4PT0EOtNN8V8/JEJcfrAOeeozUfCp8lyxHnrqb8ZSQ=;
	b=0cKogkyucxou7NZlkekTQ++BWFpRf1Zc097YxG3T+VHrdkPpr90WSwJsG4PHSWFg38I6J+
	cW62yD8O2JS56bn3C+H5VDZ7PuPh1ee2nv68tVRfYPAOGIvQfeMroluG9KkfTF8zYYacCb
	kVxW+JPQJQm6UNTNDForUTN0ZqpDwt7x60F4Lm07Mzkbs7TiMNpWg+RIJbFuTZUcHxlvh+
	ypdbOeQpMIp4cZ+ybDTcazcTku46okfeRUL4pmzDdaf1awt8PqF1yxuHqJFyoUHE9LFjJz
	3qkrRkpVcOpyrubr1YE182FqfpHqIWMd6rGWT0c2Z9qSX4ZnCDV0i1T+tKfnIw==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 25 Feb 2026 17:55:24 +0100
Subject: [PATCH v7 3/3] MIPS: mobileye: eyeq5-epm: add two Cadence GEM
 Ethernet PHYs
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260225-macb-phy-v7-3-d3c9842ec931@bootlin.com>
References: <20260225-macb-phy-v7-0-d3c9842ec931@bootlin.com>
In-Reply-To: <20260225-macb-phy-v7-0-d3c9842ec931@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Andrew Lunn <andrew@lunn.ch>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

The Mobileye EyeQ5 eval board (EPM) embeds two MDIO PHYs.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 arch/mips/boot/dts/mobileye/eyeq5-epm5.dts | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/mips/boot/dts/mobileye/eyeq5-epm5.dts b/arch/mips/boot/dts/mobileye/eyeq5-epm5.dts
index 9fc1a1b0a81b..babf52731ea6 100644
--- a/arch/mips/boot/dts/mobileye/eyeq5-epm5.dts
+++ b/arch/mips/boot/dts/mobileye/eyeq5-epm5.dts
@@ -29,3 +29,29 @@ temperature-sensor@48 {
 		label = "U60";
 	};
 };
+
+&macb0 {
+	phy-mode = "sgmii";
+	phy-handle = <&macb0_phy>;
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		macb0_phy: ethernet-phy@e {
+			reg = <0xe>;
+		};
+	};
+};
+
+&macb1 {
+	phy-mode = "rgmii-id";
+	phy-handle = <&macb1_phy>;
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		macb1_phy: ethernet-phy@e {
+			reg = <0xe>;
+		};
+	};
+};

-- 
2.53.0

