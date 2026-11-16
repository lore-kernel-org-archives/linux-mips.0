Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837554;
	b=zITOcAsArUHsQP/GQaUcp8b6zrMIhPNb+8M0/8NzfiLEPE09oTpQBY/pRdKt3gL86ihT
	 mAb87OOXuc2qR0nfv7vSM992xerXydU9Upy+0D6rqnu3TPwkATHPcH1+DVklXaTCvdn/0
	 4oH7JsBRQte5KPaVt7YxSwf0QUj3Q1l7kMQ75gs7C+mIe1FuAEBIrXb8Qy+fWuKaWT4jq
	 +UZG2hqxzxqUXqSGG5XQXQDsN7tjyu84XdD5xEb/0N9dSHH5fxqNcxZLIOeCxmBUnSAAm
	 FL5krSvhgRgVqA12f13IW56fQeBWLhztqib+qCAdshLBLo4xRnAVNw53SO0M1BIqDGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837554;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=+c+7QLIr/6xnjzeRbgVMydkl5tX7ycl5LcLTqkY0J/0=;
	b=yXmbDjxiH0ru+6uEkGBE3aBziZor0viJQdcZUf5l5LqquHeaOMpcz6Tv2aEwKNPF0cGq
	 5tyl7pBLjWqKe45qYYiaKezEfwaAMDuEcs+i1yUJXesItjR8M61ydQIK8jHXPOkAdYLzC
	 hwoUOFs1/BWmycOdtJzW9TiuFrazSBToN5XW3IzdzqU2ZX6J0RjnVfwcSKfIfzVOzXbOf
	 5B03W/Hu6DSZmiDO7bLiJONzDTvLeSF1Dxmjwh4i7hl3FAglPPGAIL3bGiKdsNvRRIyg7
	 WExi15sQ3YmnPgw+8V5db215YbCrmyZW6/1fofBA8umxxV9fMxcnv/XdwTiQ3gtkGGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Oqr06SAB;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BCF606A89C;
	Mon, 16 Nov 2026 13:59:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76BCF606A89C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Oqr06SAB
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5B53A1A168D;
	Mon, 16 Nov 2026 13:59:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2B5396023F;
	Mon, 16 Nov 2026 13:59:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E9B5111BC0477;
	Mon, 16 Nov 2026 14:59:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794837551; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+c+7QLIr/6xnjzeRbgVMydkl5tX7ycl5LcLTqkY0J/0=;
	b=Oqr06SABkTCcLuKn9GstcTXG0gpKEzHE3UWJFl40TGAJCKpvRpKUucQ9506Eflw9CC0w5a
	1tI7a04edAe9z/3N9aQA4IsohieZ3OtIoowX5JQMeFxJesE2i2Amnnft8SURcYSJfOp5Us
	uq56fkN5grKmyXIUDCMghLb20Mp7cJ3/ubN11vEKI3paExn+3pIAWF/CJrTvpMfvYqp9h6
	he7rQTHhyJB/Kv5AHiYC0miEyV8p3a0/7i4bWfO4oprKoiz1FUti5A3zubqhKhG4EpxOBT
	YrSaZlbd3LUorpkFrQml0gpbBg7HxXMVScuLYwEjb8H3gPrcVGQ8zkrK51odRg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Mon, 16 Nov 2026 14:58:39 +0100
Subject: [PATCH v4 3/5] MIPS: eyeq: select the EyeQ5 MSI controller
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
Message-Id: <20261116-eyeq5_msi-v4-3-2e1233b014b0@bootlin.com>
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

The MSI controller is part of the EyeQ SoC. This change selects it by
default.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 arch/mips/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index ed17c9b1624ca..19dbf24684b23 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -632,6 +632,7 @@ config EYEQ
 	select CPU_MIPSR2_IRQ_VI
 	select CSRC_R4K
 	select DMA_NONCOHERENT
+	select EYEQ5_MSI
 	select HAVE_PCI
 	select IRQ_MIPS_CPU
 	select MIPS_AUTO_PFN_OFFSET

-- 
2.53.0

