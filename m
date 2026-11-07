Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794010010;
	b=KK/qalWU15BR/wDGydJ1ijSCe4CnqqBLHPORuQOQ96sKGtYjtTrVWxuvuEyv2YBNC4sI
	 HpgXxsKSHQQd/KO7+nSuTjk+/hIvo/9K1s68V/ZYHITh6C70TEKFryjyxmIJqCDSz07zY
	 LFpPseZPQB0SLwSqxargHOVlzjWrl95k8PzhINiCewMTnObrRK1/gFMUvIKHAf9G4wrnW
	 cXtOlfSHN7Nr8kdw/BJ5Ha8HAd2jSI1/XcQ3uoVo4ZBdxs9PZtCvk6eFh13BKpKOvjODe
	 EGSh8uvrohLd9ErzxGZ5gR2JB0LIKhbBGD0xaBR3Qf8KT8hWY9uaugUS5COQoPBwD1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794010010;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=b1jw8/k9HF1Z0QFcfzQluiREZXrKVRI5j5BkQVxckCU=;
	b=3TGwc2Xsc4ZC9Ha8T9dmJ3n3qnrgJWUbe0VU15+rtmVI8h7quMrizNj/cxawGz+VHkU1
	 itFtkPCDjVg+uYAdOrAqdSC8QU06duwmbY+Q2AdeeWA4lZh7dCnPVqhXKJ618fVp0Hwmc
	 orCRRrcgCKuaBnn8B4B8/Q6mjpbHTMhrlpHAdtUWDLvw/puku93AMwgRypRkGKoU1jBex
	 fLx+ojA6HW/GSgTtTekUOAYvQItuz+PvPMugpCmQrk1mSrCNUGrUf3LAblulHrqGLxuLx
	 e3KmZd5R8gXnaLjUU7GGDT6maSE8lDuo7G8MyyFKbcCnc2PkHzw7Tq80SPNZktiLyuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Jb8hBDAm;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=OlNn1TSB;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE45606A32F
	for <linux-mips@vger.kernel.org>; Sat,  7 Nov 2026 00:06:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DE45606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Jb8hBDAm;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=OlNn1TSB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794010009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b1jw8/k9HF1Z0QFcfzQluiREZXrKVRI5j5BkQVxckCU=;
	b=Jb8hBDAm0JHwIBcBnEGlrMskZWWKmo3T1uWoWwLPtamxQnUjgLaqjJ0ghTUuxc7gsa8MMH
	iVkA80ZQJ9NbPAtUI2BxGHXs4CetkfrCBKt4AxYhEbjJwG0mOrRw0Ok4s0Xx8GB5s4nT//
	rGZy12dhZ6eWXSZD7sQiaYIdUBWinDQ=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-107-w4W_if9-ONuRapeD9v0CjA-1; Fri, 06 Nov 2026 19:06:47 -0500
X-MC-Unique: w4W_if9-ONuRapeD9v0CjA-1
X-Mimecast-MFC-AGG-ID: w4W_if9-ONuRapeD9v0CjA_1794010007
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-544019b1831so23294031cf.0
        for <linux-mips@vger.kernel.org>; Fri, 06 Nov 2026 16:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794010007; x=1794614807; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b1jw8/k9HF1Z0QFcfzQluiREZXrKVRI5j5BkQVxckCU=;
        b=OlNn1TSBp+Q644ps2PD/kg+ZZ1m5BixFajPnQ1ISTrpZNxU6GlpiChrFxEKztSscjx
         H2y4/xkRwJpMVitjkOOgIEFqxqwUWyPzWkaf+E8hVX5N8aEOADvUOk3v1kEknjZ3Fj+r
         nB/4MyBJxc3vEE9VwDFnCtW+NC54hvmzjW+M+hxk+9FYuXZfEp2A+yGU8/ZIWMsk6XSl
         NNwjUjqTY5HyILNctO6raOqBzRvPP8iP2dsTAvSoYcR3VKhK5QEHbdZ1IGHOg85NBNhj
         k+wqqIGbecZkIz5yO3itv5zl1pBJne+aZqGoWmGWIZIWEZl0GZehhjEDdRecTnL05ndU
         mXeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794010007; x=1794614807;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b1jw8/k9HF1Z0QFcfzQluiREZXrKVRI5j5BkQVxckCU=;
        b=R8bOm/T+HqGU+6oQSLMDt6NX1jhLm9iv8FWn3gTZ9tFqgXgVGI31/+HE24oUR3eXCI
         1NdOLfUnpSURP7/WHtkos0VFdXFoCYX+fEn9W9InLaj0WDojQBKPZXYF2Uketc9dSZLR
         gzRK3epSOSsk8uEbp01d+jVwmT41+06vAlniv/j93MsMxWp2e+HbTtjHd/nWtkSWiN8N
         RhblksqyMdpUY+yJHsUkTosG8x9FeGlckBWBLa/6G06SPL+brh1bVjXlXa/3i2E0kED/
         7SiQO4vXmfa4CI8zTWNmvhBnZK20GxaofvL9rjvY2urGE0mDVCWSDmEJ09wD2Cqqx28+
         6Aag==
X-Forwarded-Encrypted: i=1; AKwUvBykLV05qTyYtAPS+wdvJ0UzQVnjeO9Ce/enaAme2DRoNciIUj5zn6+1IcxOvsA1fqRQH132/UnHA35n@vger.kernel.org
X-Gm-Message-State: APuU4Z/DBxSq+kZsGPoeo3iPcKb3p4DaxfdFD5ojAGGu04OgZVae+j81
	KcgJ9Mo8NimkPxGdllr+czu0ThI2vOotSr5qS98Qm5OC7bhNHTo03l4CVjiXbBO+/449UTFSQwN
	6Qc0zsEL8BYQlzCDMmfIM4r8WgrGlSV+qSdrbvhwoUaFVzMrntLZgiU2Xi+KiCY8=
X-Gm-Gg: AYBFou0uVKj43M55cMkgy6GvjNVUHP5H/vJZfSuZlsmL6I/7UVtdcrB6uv4A+QSNWLV
	pbWfB3JYV5C9Ozz2WVhENfIL+mDJ2nWmQheeMcHVaE0X1PrOS0bY2pZP2pGgkFkUNoQVcOBDk7E
	9Xz7IMcqKQ+433ONB0KXWzEpeEQl21+nzmxrFeg1phv71GcWXc+01BzXddjtVLMzmpP90CAzEF6
	FKpmAf/J5xs0z8Gx+yNXPoQRvVk3XQdLAZrnHpOaQ/m5NEsM8T17D+PXQATJhnigRqFvfEBpyoG
	tD2OSjjXMAdE3dGm50Pel5yCPzmYyjl4/sO6lD2LBKtvc2MCh5OnW2788ycqhH8ZVrUA2ZUfd6l
	njhndVxDwT6tNLJcRSrZWYT1RAzSayR1EQHnciFumKqOSMMPEBQOe8PLY6OYENlYuiH0TGAswlP
	CI4r+1Tt/KXnzZKTd2
X-Received: by 2002:a05:622a:114b:b0:537:f05d:881a with SMTP id d75a77b69052e-54e132997ddmr61751691cf.12.1794010007254;
        Fri, 06 Nov 2026 16:06:47 -0800 (PST)
X-Received: by 2002:a05:622a:114b:b0:537:f05d:881a with SMTP id d75a77b69052e-54e132997ddmr61751141cf.12.1794010006668;
        Fri, 06 Nov 2026 16:06:46 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6acc4a7sm31624376d6.44.2026.11.06.16.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:06:42 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 06 Nov 2026 19:06:10 -0500
Subject: [PATCH 3/3] dmaengine: fsldma: convert to subsys_platform_driver()
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
Message-Id: <20261106-dmaengine-subsys-v1-3-780eeddbf3ef@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1227; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=hy3g6mWddGYLX6Myo7kSoYtQp+hY5Hbo/vUsysOb4zQ=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLeZbeeNxabtVqgmXFuKMOEE2yy/Scinn4R5Zj7TWhOt
 atoruLqjlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACbiOouR4cR1jkNqh68wrEm/
 stlDUKbx8PxggVfG0h+OhJx8eL8//yQjw16uPZumb/y3PVJc7N7WsJVuGVcamc2sSnpsTuX05Pi
 UMQAA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Reduce boilerplate code in this driver and convert it over to use
the macro subsys_platform_driver().

Note that this driver previously displayed a log message during init
time, and this change drops that message.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/dma/fsldma.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index 99a878ed1444..fd3dca7616a8 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -1431,19 +1431,7 @@ static struct platform_driver fsldma_of_driver = {
 /* Module Init / Exit                                                         */
 /*----------------------------------------------------------------------------*/
 
-static __init int fsldma_init(void)
-{
-	pr_info("Freescale Elo series DMA driver\n");
-	return platform_driver_register(&fsldma_of_driver);
-}
-
-static void __exit fsldma_exit(void)
-{
-	platform_driver_unregister(&fsldma_of_driver);
-}
-
-subsys_initcall(fsldma_init);
-module_exit(fsldma_exit);
+subsys_platform_driver(fsldma_of_driver);
 
 MODULE_DESCRIPTION("Freescale Elo series DMA driver");
 MODULE_LICENSE("GPL");

-- 
2.56.0

