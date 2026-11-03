Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.149.158.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793748673;
	b=pSn0RaMTUoRNTVVWZJ718wR40HUYO5NQ3O+IpD8qCnMlmaKtJQD3VAnqWVO+cxhk1YXq
	 2KjAa/oqXifehWUUukv+AK2DBw1fAowBa/8cHiEs8ylCTFwZrJyGyE2DYBMNIElEQlu3u
	 nol3vp0JiQHVACwGIyIjZ8zsuzo4EkN9GbwoHEt5/Z0WXg6e7ueiPcvDh+MgpTfb7cyIL
	 kI4BG9jOAbXziw1V2u7dvD9Km5CBZxqsBz6Vgg/f1vdIo2VhaUB26CiOGcIabV1cPpDfh
	 BWVc029XZfBPyQv5v882zPbr/CXWrej2fJTETCXI0UiTGGaxKPLvPJVF8l1xvu09ZXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793748673;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-CMAE-Envelope;
	bh=/1t78VH49OICnCMyo1z5frvTtIlLEj9iqkcrMPmsj/E=;
	b=hbmqulLwlb0XJiKdnx4JNZkCdJl9w342ZUyyWfcFj3nPyWYjWvEPBDl8SITBNVJvuoXe
	 QUNrl37n9qWRHveQGRc/uvjnlCC2ORU3v6tp+CCFtv4h4ac2wAFhBNrMHZAWNNV1tjtG0
	 ZZ2RaBhPm2j/TeMl5A/JQ9x4o8IEBajtCD7Q3rAJhJyTGgbDVC7+VrX0gfL/ukYgwHadn
	 q5fsuk7QjKiU3acYDuy2/lsijO1xy0afyLfcYUqr5r0oanHJxKGHHh2QvXJX/DOLI54+u
	 x/Yrqvhxna40lzx+1qDTNidaEkp8aYzMUgvuhXWPfqUVQ38wEfTLjlVvh7re1Efe2Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mythread.it;
	spf=pass smtp.mailfrom=mythread.it;
	dkim=pass header.d=mythread.it header.i=@mythread.it header.a=rsa-sha256 header.s=a1 header.b="n/7q6u22";
	arc=none smtp.remote-ip=62.149.158.101
Received: from smtpcmd02101.aruba.it (smtpcmd02101.aruba.it [62.149.158.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD0A606A32D
	for <linux-mips@vger.kernel.org>; Tue,  3 Nov 2026 23:31:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AD0A606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mythread.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mythread.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mythread.it header.i=@mythread.it header.a=rsa-sha256 header.s=a1 header.b=n/7q6u22
Received: from [192.168.1.237] ([94.34.125.0])
	by Aruba SMTP with ESMTPSA
	id ONxyxz48a7fl5ONxzxPx9u; Wed, 04 Nov 2026 00:30:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mythread.it; s=a1;
	t=1793748659; bh=WRkBwj9Lh4y4B90qy4T7LLf3UBUQstNlJd97j2Qv8fA=;
	h=From:Date:Subject:MIME-Version:Content-Type:To;
	b=n/7q6u225h+0SYOHAB3KQakjVvV9yICT5JyroEtMnt2tewKaMFrIvXhNAahojnvFO
	 Tpvq1BBUb12sSgHQ6OFwa+y84bxJZFMxyX/mzuYKQjSPhcYylBJ+E+IL8SlEmMaaRJ
	 6oit6w6zMogA8ySLiB1M5SyxIY8Cxgx0EJVeXZ3IOcqafzAFeilG8aRrz1t1VIpSM3
	 eJ0B7BAor273NwgaXMeUIdr+dvS8hI34YOXI3mZ7Ug9ImoRExBjsPHooYE+LM7j2Ux
	 BT43a8XSQrL3sCgZnYrZwqtkvPygfV01dR/mk7zUTwKmAH0oMAY1WSZY7xvFlr1XOH
	 OeulKHLsoD06w==
From: Alessio Ferri <alessio.ferri@mythread.it>
Date: Wed, 04 Nov 2026 00:30:58 +0100
Subject: [PATCH v3 2/5] bcma: scan: support big-endian backplanes
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
Message-Id: <20261104-bcm6362-wlan-v3-2-e46562b2ac12@mythread.it>
References: <20261104-bcm6362-wlan-v3-0-e46562b2ac12@mythread.it>
In-Reply-To: <20261104-bcm6362-wlan-v3-0-e46562b2ac12@mythread.it>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Jonas Gorski <jonas.gorski@gmail.com>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
 Alessio Ferri <alessio.ferri@mythread.it>
X-Mailer: b4 0.14.3
X-CMAE-Envelope: MS4xfCGfJlQk5zHd5tl9/+3/t67H4T9ssLhpKRSdEehXV6IsMyUJNHfeWsrfsRrgaWaCIaRrPYMb0/3MTJjBvq3OjUoxhSct3m9JtfRO6926Rp24KaQdId/M
 bWjr8Nen32TawHDiBbg8e6LcWMVnppCynapVC58RxzsY1eIIyQmcjnxQ4w75AAOMvVvB65qMw1VMsw8uFUNA6aiixDcmljJ0imJJp3tUh1Up0VHmhLTGNtTl
 AqhiqJmjmd5yJEmLr2upiyejlHqrSq7tnqTfjgPHxNHwLzJ3ef3n3yoTDDA1SXpU27D250ztwRCFusVvakoX0Gg39Gm/XVVvKF7/EwEYEt+qs6CVa6dL++BW
 ++5vRgpx5CTxUK8QYx3Eex5r/RdCkd2McjdFHWsutX1pXmQ4ArMJsXnntA9iF3YtcadtUTOQCeXDhvgElXifMYMpG/kghcZ0T15uy9qctbSRPgcTcC2rgSnT
 kM6QpSpcJtnpbWmdYHjYgP75YpanYkw6Dvrflog8Zs27Kz7Gndxy1FJVs/bmVWca1HRoQjFlI3rigDUc001ddm+N8cUEBdjLsqxpJAx6tMwpRQkS3L4LvrOO
 NnyL2XfWfOhgH/r1vvyVZ+7vPV/rA+ikJLiXsd5ZQTB/YYauvSTk8ynqAgGKaZsyTKjdy+mTwzFcV9s+T/ohEnqCfprfXEzlJtAvrZCTa4DWYw==

On some SoCs the bcma backplane is a big-endian peripheral, so the
ChipCommon ID/EROM pointer registers and the EROM itself read wrong
 with readl().

Add a big_endian flag to struct bcma_bus, set by the host driver
before bcma_init_bus(), and use ioread32be() for scan-time accesses
when it is set. Core register accesses after the scan already go
through the host ops, which the host driver provides with the right
endianness.

Nothing changes for other devices.

Signed-off-by: Alessio Ferri <alessio.ferri@mythread.it>
---
 drivers/bcma/scan.c       | 4 +++-
 include/linux/bcma/bcma.h | 3 +++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/bcma/scan.c b/drivers/bcma/scan.c
index 84742408a59c..983a62ddeebb 100644
--- a/drivers/bcma/scan.c
+++ b/drivers/bcma/scan.c
@@ -143,6 +143,8 @@ static const char *bcma_device_name(const struct bcma_device_id *id)
 
 static u32 bcma_scan_read32(struct bcma_bus *bus, u16 offset)
 {
+	if (bus->big_endian)
+		return ioread32be(bus->mmio + offset);
 	return readl(bus->mmio + offset);
 }
 
@@ -155,7 +157,7 @@ static void bcma_scan_switch_core(struct bcma_bus *bus, u32 addr)
 
 static u32 bcma_erom_get_ent(struct bcma_bus *bus, u32 __iomem **eromptr)
 {
-	u32 ent = readl(*eromptr);
+	u32 ent = bus->big_endian ? ioread32be(*eromptr) : readl(*eromptr);
 	(*eromptr)++;
 	return ent;
 }
diff --git a/include/linux/bcma/bcma.h b/include/linux/bcma/bcma.h
index 17fc50190014..7ab2b21e7238 100644
--- a/include/linux/bcma/bcma.h
+++ b/include/linux/bcma/bcma.h
@@ -362,6 +362,9 @@ struct bcma_bus {
 	/* We decided to share SPROM struct with SSB as long as we do not need
 	 * any hacks for BCMA. This simplifies drivers code. */
 	struct ssb_sprom sprom;
+
+	/* Backplane registers, EROM included, are big-endian */
+	bool big_endian;
 };
 
 static inline u32 bcma_read8(struct bcma_device *core, u16 offset)

-- 
2.56.0

