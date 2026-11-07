Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794010005;
	b=mdekuur+WEkD6bqg34IttcIvVMg2Ypfy8HJ493rhO3kCdnm2IGTDNskuey01m5SlWpGP
	 CUW6daExjsUSuAVNuZMQzGvK+tf8jiLEcopV+KYrHNsQMhUbcjKKVyJdBAOEWZSOUsyAA
	 xB0F+jMcdzs/PEqrPLQvLqPtwadx81Lic6XIOWwzldL26tZ1tLr45lQ85K3iJYgAq/seZ
	 +mQrxSzeO6+SFwZpm62EkwDJb9qGk5EDT6gNs+JsFw9iOx34f8r0dmzxkvvTAeCig5mJD
	 rEiQ6qjypvY71Ct5vPM3sjAb2Wvn0MfMw4Eb2N7JMCJIj3rV1z36mv2aEJTMP0SbY0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794010005;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=XP2lKTQGAydL4R+xsCm0cY669RVVtn0VvIRtylww03o=;
	b=xWvX3tkj5ica6AwmMhtPyytmW3GdXsAo1pmCaxKz+te0AqI1Ou/4ixY7NAMnq4VH8SmC
	 cflrWToRQHdOlO/4WTTLxw/sBEsG/DXoGXx928qizn2Rv/H4IdCfcO6CBedN6D7Z419DY
	 IhH4BooHUcRb9OMR57+LC+igJH0Y7Qv1T/O7LpcAqQ2/nPKCZfGm15OKzXNIm0k+/JeDO
	 RCtXebdqk5aJfouNimsl1+ujevB8LvkndSKDokUlvLstrcDxrKRKyY84pXNXL0mFWQFOh
	 SLzoI5yd0kelSJKvSdpi9rCxJMA7iFf2Yz4w5rbrthIk4Ua42G+5kxxlsCthA8FCmww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eRwlbATG;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=QaItErdm;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB59606D805
	for <linux-mips@vger.kernel.org>; Sat,  7 Nov 2026 00:06:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AB59606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eRwlbATG;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=QaItErdm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794010004;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XP2lKTQGAydL4R+xsCm0cY669RVVtn0VvIRtylww03o=;
	b=eRwlbATGuePqRoUfDSZ9qs0RrDdYZ+KAJ7W8YOSwyruxWr6QSwtuhfpmSEKbs0RkuvS3tq
	nDRF7ibxDb2QRowCIcx4fyeXiTxtwfid4l4jQyVnUyDmgMfNi5M3QTGt59FIsuMAveEHIT
	gklSeZm9ZhWhFE3Jsw4LD7nznNwoFKE=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-r4HsvIrTPsOD3yGEfY7SvA-1; Fri, 06 Nov 2026 19:06:43 -0500
X-MC-Unique: r4HsvIrTPsOD3yGEfY7SvA-1
X-Mimecast-MFC-AGG-ID: r4HsvIrTPsOD3yGEfY7SvA_1794010003
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-946038e22f5so67636585a.0
        for <linux-mips@vger.kernel.org>; Fri, 06 Nov 2026 16:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794010002; x=1794614802; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XP2lKTQGAydL4R+xsCm0cY669RVVtn0VvIRtylww03o=;
        b=QaItErdmqNV9RHrJfk1jyRqVWmy8RPzwOr7/Gtt6w2WUgRRJ6D0jInjmF5bCO3A7AK
         FR3SVFDmlMjislejJMo/Ar10alCPHZEt2I8tyH2fn1GhkYTU8kW9oh8J1iyffzPKMiYZ
         wylVm2eqyZLnRSPbiXmrQsX7EuqfZI89sCkv0aXfetBOr6S8r0FrtWWER2kcOpgac6Wm
         Iv1NN56YIdQ2ABVw+xx6zF7IfZsGq4rodUcM+kHHpmNwEgFmAlcImhz2wIqnksbEtRq/
         z+O2OzBY7HH3iPr/MQF0JKQWyy0/UoPnofXD/0eYC/NfyziFx6u0BH8ubf3Yh8qNWVU4
         /Dlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794010002; x=1794614802;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XP2lKTQGAydL4R+xsCm0cY669RVVtn0VvIRtylww03o=;
        b=VVCgHV1mBHwwEIM72aI5nZRiOwKAsniN9IMHszQar6Ol5HdvARTl76Y0flsW1c+m+9
         lt/s2UyrkkAz93x0lff6zTxf4RBMOv8Mb0ldFvlHT5Z45bXAPGB58BeLWK5Zxtof4977
         qvXc9ym76jZNUILUsDAtTEsjzy00dIAeQvJGxubI+vaskkcYd8ZtNPpKvs+Qds9iB5bX
         lkpjC0bCi7klElGN/A3D+0ftZOTerqJzvBNid45gGgx7fih9uV1lwrshJHORHBRk4yBW
         TU2p1rgBLE9KfgiEbPMfNB4xtOzxtl0jycKJtG0SOrvpzxoU5vQ+AM3otUHeTOfEal4H
         qInA==
X-Forwarded-Encrypted: i=1; AKwUvBwGX5TA6UagjxrVdp0olEF9BwJUAGmOLqVzB96e8w3WbJTT/2U6naMDzyss/2+750olot6yKbFtkq2S@vger.kernel.org
X-Gm-Message-State: APuU4Z/s8zyXdf9n6mMqg42/GPcTafWVWKmvmdzcY0nCuthRMTDyqADI
	ov8yykknoalluxRuILBDkbJQgNMR5ts5QuZPQ5eUqZ90zMa8to4hUm8WTeJrBEF1UTJospgvWcR
	yTT/aQi/q7+ujvzkKutDp8cuG6+vzDZ7HS1nQEXJWcRQeRVDetL9JfcNimnW5oAQ=
X-Gm-Gg: AYBFou1tF0+9fMna0MPQhwnrUGfz5Ftflg9NIaifkRDIErbYLPOd6pi2MC1K69lwGQP
	4W1c5E1ZmoPIoKewnakquL8B3XjHK4SGrporACmBa1DWiUcQ92VDrr1fg0+xcBDAw8I5IUMG5q7
	KoCFSATTnwAczDR/snFBr57Hrbcv+47GA/vWK8SOdeY8XYjXphK/7648SPTf3IqjE/+6fkgR6IF
	Z56hzftV3YMHRetJ+FJf5VTd3oQjZV9cv4c23pVLk7sjIxNE9peL0ql4E4M36vohISihIJsQ6zN
	xO1fcBIwRWo4U6hqDrMyT8cDT0oxnzHv5tXwbG4VIGoPjqRSL9rZrMVpQHtOr1H6Y4FsJv23giJ
	HXfMDHWfiRSF5wBt0YnfLmqrSGFU9SmpDAQUnnATV28p/u0YmZLXT26CC56ofUoPEHmnvSU9wUV
	2yfyCXCK1JcZIK9mls
X-Received: by 2002:a05:620a:468f:b0:93e:6325:ae6d with SMTP id af79cd13be357-945f349ce35mr704446685a.40.1794010002594;
        Fri, 06 Nov 2026 16:06:42 -0800 (PST)
X-Received: by 2002:a05:620a:468f:b0:93e:6325:ae6d with SMTP id af79cd13be357-945f349ce35mr704441785a.40.1794010002132;
        Fri, 06 Nov 2026 16:06:42 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6acc4a7sm31624376d6.44.2026.11.06.16.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:06:41 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 06 Nov 2026 19:06:09 -0500
Subject: [PATCH 2/3] dmaengine: convert to subsys_platform_driver_probe()
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
Message-Id: <20261106-dmaengine-subsys-v1-2-780eeddbf3ef@redhat.com>
References: <20261106-dmaengine-subsys-v1-0-780eeddbf3ef@redhat.com>
In-Reply-To: <20261106-dmaengine-subsys-v1-0-780eeddbf3ef@redhat.com>
To: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Paul Cercueil <paul@crapouillou.net>, Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <mani@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>, 
 Zhang Wei <zw@zh-kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
 imx@lists.linux.dev, linux-actions@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=1356; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=FjTOp1M8Xy8WBCnxDwFzONX6zQMkkI1R2AYzFx+nwrU=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLeZbdoi/pLp60VjjwvcUxslVrirb5DV/utktpvPDq5W
 Wn/wb71HaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEykdQkjw6JqyU0+3VVfSzWl
 u41X9l86OG0B89PfCwV8v3te0lN3YmD4K1PKxrDgtUqx6oLWQ+/ii6VYfpw6XSt0c6OA5Me1z50
 zWAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Reduce boilerplate code in these drivers and convert them over to use
the macro subsys_platform_driver_probe().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/dma/imx-dma.c   | 6 +-----
 drivers/dma/ste_dma40.c | 6 +-----
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/dma/imx-dma.c b/drivers/dma/imx-dma.c
index 81c6276436f8..8e0e82df8c5b 100644
--- a/drivers/dma/imx-dma.c
+++ b/drivers/dma/imx-dma.c
@@ -1238,11 +1238,7 @@ static struct platform_driver imxdma_driver = {
 	.remove		= imxdma_remove,
 };
 
-static int __init imxdma_module_init(void)
-{
-	return platform_driver_probe(&imxdma_driver, imxdma_probe);
-}
-subsys_initcall(imxdma_module_init);
+subsys_platform_driver_probe(imxdma_driver, imxdma_probe);
 
 MODULE_AUTHOR("Sascha Hauer, Pengutronix <s.hauer@pengutronix.de>");
 MODULE_DESCRIPTION("i.MX dma driver");
diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 2e83503f71d1..4fb54c8f2d23 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -3990,8 +3990,4 @@ static struct platform_driver d40_driver = {
 	},
 };
 
-static int __init stedma40_init(void)
-{
-	return platform_driver_probe(&d40_driver, d40_probe);
-}
-subsys_initcall(stedma40_init);
+subsys_platform_driver_probe(d40_driver, d40_probe);

-- 
2.56.0

