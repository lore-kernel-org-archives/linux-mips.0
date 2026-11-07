Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794010005;
	b=TZ80q39jzAV9HfGBsYn+NdAgASBE3aBSmVy9gsHP+bheg1LNPMNhHcYau0oXdKr5NH2U
	 8UB5Ffll2EjL8Zw2LNuFjv9d4xfeDRb0Asv1CTzHl6jDQVBngVYuXFFC43K6pB3Tcb0nD
	 dgNlCKQlNsfS/WUHXobNUbJ6a0T7DzpAoxe17T4aA3Yd+uyP7D/MhR+tuQckuMkSxxYlK
	 uKY9ngUfLwhQDwMMNDmq8ks9OQNjq4a3qMORQJxS3V1ZaRwGYV6f/IR4hmbWteNy9PiNG
	 9LYd6nws5wpEp+/lFgjpDWIT9TekrC6phzROBeD40ETYD4FIR84KgjtRY8+SQH2PwGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794010005;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=UdtdyDCTn3IifZCbbp9UgSX4Df7wJU84qONeUfr3t8U=;
	b=HWpKrjwRKoa6GzbkLZoruWDVBpxXBHUcEVIi96QAT2ILZI6GCYuJTTmy/iT/918oV+Gq
	 NR75gn51bjvWRJuOxX/DJxZEqCktItys2rS9zg/YMPQwRuL8t9KAaO9QrEEPay2hRQOxF
	 isffgPI9TrbJfp+cTkMi+xAeQGvF+s5mqWGmUkHpZgDYoC/rDIfmtkfVpMC7g/WeOKYGU
	 OawFOn8IXknkiALIHnuWgetyRZBVzolZ44CHJZ4BSDSwuHNXRe6DG429UKttHCcLsMneM
	 520EJU61W5uZcB+tuWX95F2rndAABO6m/ZhpHb86mgq3a3Taj45nGcZ3OvxPCgCxB+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=J2mdFPLW;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=mDyPFmBi;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACAF606A336
	for <linux-mips@vger.kernel.org>; Sat,  7 Nov 2026 00:06:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ACAF606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=J2mdFPLW;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=mDyPFmBi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794010003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UdtdyDCTn3IifZCbbp9UgSX4Df7wJU84qONeUfr3t8U=;
	b=J2mdFPLWoZblA9/riGdEejTfiDLNaPzDkrMtWOrO1dRebaAsRSSRN3oGzlfTjNs2OPmSEv
	dh3pdyEr23QImZRrdPA5fAGca8d/CaGLOwaEZLpAe13Gvx4DyV1m5Jq3kFbmxcgAdLA6Lw
	OHjemFdjcpMIBHfytHweYH8HCM+2Kh8=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-283-2kdkS1YZMa-BAjyKLa190Q-1; Fri, 06 Nov 2026 19:06:42 -0500
X-MC-Unique: 2kdkS1YZMa-BAjyKLa190Q-1
X-Mimecast-MFC-AGG-ID: 2kdkS1YZMa-BAjyKLa190Q_1794010001
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91e89171fabso21063446d6.3
        for <linux-mips@vger.kernel.org>; Fri, 06 Nov 2026 16:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794010001; x=1794614801; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UdtdyDCTn3IifZCbbp9UgSX4Df7wJU84qONeUfr3t8U=;
        b=mDyPFmBiJx0CuA9DKdpTph8XYOdPT9ehGm70fYZWIqNhCucrNHqslty9kYa9carEQv
         ThgEx+7S1WA7hjnxbGAuqwfN+mWX14uvGCOK3FOhd+3f0XPqbjIPs7XG/7bJSCqVIEBt
         yYrBHlNaft3p6mZEQxdx3khB8/Lp/0983UvHjEiei2EGfiQM6XutM/yfS5GvgwpQNfGh
         3H+ywp+vof3CbPUR29LhW34X7Cl0Tfnp8DnzvSjdxRCXNWGOUp9teEOFLYswjhL3y1JP
         pvYWCfQz5ePPKTdkzfM+YBOycI7bWJi83J4iYf4Ex62RDupaU+GDTLVOkke4YmYqpsv1
         bvKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794010001; x=1794614801;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UdtdyDCTn3IifZCbbp9UgSX4Df7wJU84qONeUfr3t8U=;
        b=BtKzdyUdAwjSNOGo+7XJI3q9/pmCxz8ziaKeLZNZ5QnxzMzuO9QqSy0824M7WkRgcS
         xbSl5ZrEiE6bJabI40iGDN62bzSBULE8qH23jAmv/QPzOBiKh54BioX0Vs6S/atk5J1W
         96AUCPCgTfeThLxVdak/s7aObDwNVxodknOXOYXIkv3R8kyzJq2K+r6gXuXyJWx29QW3
         rcFFnnWFnjw57zuCGxddp1GguEcJH6iJmP5ydxbfHP4asl4wqPt+2Yebk/y4kcjR8OQh
         vrl6WG6uimXoDD44Jl9Rw/rSk8lR1taOe3FMa4ZVGRZlYOGt1nkixedvdfbKnIqJJPkC
         mowA==
X-Forwarded-Encrypted: i=1; AL+hErGnk6QtTJnIe+92NV/euS1nWJFQssOf/n4PbOeyOJNzUTrBrpwb/eEwld9E/ky66k97091hVPdEVpQG@vger.kernel.org
X-Gm-Message-State: APuU4Z+woOBtwqtv/XggzN+rrRQUzgnNP0WmO6IRgtStQiR/YHzy7G7T
	s49DkUejqkW9kLmn2LKEj7JXxhGJGWK1XwAfjHdsiwUHeStrKTU2zzUYNDjOJYjM+0m8OLoJtHU
	ZwwaNazI4wCWL8qVhazYgp50El5qfjVOCv6cDhuHfq8IF2QGUrqWW7N93TnicmJ0=
X-Gm-Gg: AYBFou2b1iWSgiqGrAmUBwO239c4T2Nz1U5cjgtyuGdeHMx4gEvDVw2N6SF4I+Pt48X
	fm4NwpgJIFEuUGAEgE6o11R7gdG2efPMXd4hvJZ8vRxf27P1WyOySUB6NBrSiEGeWMIEeFpbk+V
	eHhnq2qtQFiM9f72ylGhH1hanee+n0rGjZyOr9RivEZ0VcArTUW/KH0wpv+IvMmrOBwgclPQbQY
	3F+AkB0Vk1rpj7NgyQm+Db6+MP45o3j2Qc8aCjHbET3s8gZaKJ+wDxG4LtEvoFKmcz2go1I/lfS
	Wk6SJMr2bD1rnNZ9gWOVXyxliuMtxLYonGUKVQFtGmFBipdoSrelBnzacZElSsAAylV1Ds0LGAs
	bAWoCyQDJXhnzL/+8o3JF3ccSowKG4ZLNcxczL+CNu+A528XW+F6Q1yJ5+JRr9N/AniR3ZHxFcc
	hYCX3r28J1BNGVulcb
X-Received: by 2002:a05:6214:460e:b0:91e:7bef:a4b4 with SMTP id 6a1803df08f44-91ea927f443mr60124076d6.2.1794010001252;
        Fri, 06 Nov 2026 16:06:41 -0800 (PST)
X-Received: by 2002:a05:6214:460e:b0:91e:7bef:a4b4 with SMTP id 6a1803df08f44-91ea927f443mr60123486d6.2.1794010000556;
        Fri, 06 Nov 2026 16:06:40 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6acc4a7sm31624376d6.44.2026.11.06.16.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:06:39 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 06 Nov 2026 19:06:08 -0500
Subject: [PATCH 1/3] dmaengine: convert to subsys_platform_driver()
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
Message-Id: <20261106-dmaengine-subsys-v1-1-780eeddbf3ef@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8793; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=7C9fqKNgBFi22vFkQ7N44YlNIVFY4LFfjkA6CgiIeoo=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLeZTfvfKz943LobmVhe7b8mWVbi7s0N16MnLjy6OrJu
 nMrz9dc7ChlYRDjYpAVU2RZkmtUEJG6yvbeHU0WmDmsTCBDGLg4BWAiIZYMf3h6irao8mR5rN9e
 nCO3qDN2/abUyA6TmvOSek6z107tdmVk2HVn4sn8uxFz/s7Ilqp7F3bZzq7Zj/+OyvPF04Um7DS
 OYAMA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Reduce boilerplate code in these drivers and convert them over to use
the macro subsys_platform_driver().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/dma/at_xdmac.c          | 12 +-----------
 drivers/dma/bestcomm/bestcomm.c | 18 +-----------------
 drivers/dma/dma-jz4780.c        | 12 +-----------
 drivers/dma/dw/platform.c       | 12 +-----------
 drivers/dma/fsl-edma-main.c     | 12 +-----------
 drivers/dma/mcf-edma-main.c     | 12 +-----------
 drivers/dma/moxart-dma.c        | 12 +-----------
 drivers/dma/owl-dma.c           | 12 +-----------
 drivers/dma/sa11x0-dma.c        | 12 +-----------
 drivers/dma/sf-pdma/sf-pdma.c   | 14 +-------------
 drivers/dma/ti/omap-dma.c       | 12 +-----------
 11 files changed, 11 insertions(+), 129 deletions(-)

diff --git a/drivers/dma/at_xdmac.c b/drivers/dma/at_xdmac.c
index d40a8b40dddc..8b19d46ac812 100644
--- a/drivers/dma/at_xdmac.c
+++ b/drivers/dma/at_xdmac.c
@@ -2488,17 +2488,7 @@ static struct platform_driver at_xdmac_driver = {
 	}
 };
 
-static int __init at_xdmac_init(void)
-{
-	return platform_driver_register(&at_xdmac_driver);
-}
-subsys_initcall(at_xdmac_init);
-
-static void __exit at_xdmac_exit(void)
-{
-	platform_driver_unregister(&at_xdmac_driver);
-}
-module_exit(at_xdmac_exit);
+subsys_platform_driver(at_xdmac_driver);
 
 MODULE_DESCRIPTION("Atmel Extended DMA Controller driver");
 MODULE_AUTHOR("Ludovic Desroches <ludovic.desroches@atmel.com>");
diff --git a/drivers/dma/bestcomm/bestcomm.c b/drivers/dma/bestcomm/bestcomm.c
index 241a91936fe8..1dadcc259382 100644
--- a/drivers/dma/bestcomm/bestcomm.c
+++ b/drivers/dma/bestcomm/bestcomm.c
@@ -474,23 +474,7 @@ static struct platform_driver mpc52xx_bcom_of_platform_driver = {
 /* Module                                                                   */
 /* ======================================================================== */
 
-static int __init
-mpc52xx_bcom_init(void)
-{
-	return platform_driver_register(&mpc52xx_bcom_of_platform_driver);
-}
-
-static void __exit
-mpc52xx_bcom_exit(void)
-{
-	platform_driver_unregister(&mpc52xx_bcom_of_platform_driver);
-}
-
-/* If we're not a module, we must make sure everything is setup before  */
-/* anyone tries to use us ... that's why we use subsys_initcall instead */
-/* of module_init. */
-subsys_initcall(mpc52xx_bcom_init);
-module_exit(mpc52xx_bcom_exit);
+subsys_platform_driver(mpc52xx_bcom_of_platform_driver);
 
 MODULE_DESCRIPTION("Freescale MPC52xx BestComm DMA");
 MODULE_AUTHOR("Sylvain Munaut <tnt@246tNt.com>");
diff --git a/drivers/dma/dma-jz4780.c b/drivers/dma/dma-jz4780.c
index ac2094e65ecf..32a40c17e0cd 100644
--- a/drivers/dma/dma-jz4780.c
+++ b/drivers/dma/dma-jz4780.c
@@ -1129,17 +1129,7 @@ static struct platform_driver jz4780_dma_driver = {
 	},
 };
 
-static int __init jz4780_dma_init(void)
-{
-	return platform_driver_register(&jz4780_dma_driver);
-}
-subsys_initcall(jz4780_dma_init);
-
-static void __exit jz4780_dma_exit(void)
-{
-	platform_driver_unregister(&jz4780_dma_driver);
-}
-module_exit(jz4780_dma_exit);
+subsys_platform_driver(jz4780_dma_driver);
 
 MODULE_AUTHOR("Alex Smith <alex@alex-smith.me.uk>");
 MODULE_DESCRIPTION("Ingenic JZ4780 DMA controller driver");
diff --git a/drivers/dma/dw/platform.c b/drivers/dma/dw/platform.c
index 5c1c97eb28a4..7576ad255343 100644
--- a/drivers/dma/dw/platform.c
+++ b/drivers/dma/dw/platform.c
@@ -195,17 +195,7 @@ static struct platform_driver dw_driver = {
 	},
 };
 
-static int __init dw_init(void)
-{
-	return platform_driver_register(&dw_driver);
-}
-subsys_initcall(dw_init);
-
-static void __exit dw_exit(void)
-{
-	platform_driver_unregister(&dw_driver);
-}
-module_exit(dw_exit);
+subsys_platform_driver(dw_driver);
 
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("Synopsys DesignWare DMA Controller platform driver");
diff --git a/drivers/dma/fsl-edma-main.c b/drivers/dma/fsl-edma-main.c
index 630285c85482..c731104c3306 100644
--- a/drivers/dma/fsl-edma-main.c
+++ b/drivers/dma/fsl-edma-main.c
@@ -978,17 +978,7 @@ static struct platform_driver fsl_edma_driver = {
 	.remove		= fsl_edma_remove,
 };
 
-static int __init fsl_edma_init(void)
-{
-	return platform_driver_register(&fsl_edma_driver);
-}
-subsys_initcall(fsl_edma_init);
-
-static void __exit fsl_edma_exit(void)
-{
-	platform_driver_unregister(&fsl_edma_driver);
-}
-module_exit(fsl_edma_exit);
+subsys_platform_driver(fsl_edma_driver);
 
 MODULE_DESCRIPTION("Freescale eDMA engine driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/dma/mcf-edma-main.c b/drivers/dma/mcf-edma-main.c
index 9e1c6400c77b..fb6c06d4a8d1 100644
--- a/drivers/dma/mcf-edma-main.c
+++ b/drivers/dma/mcf-edma-main.c
@@ -282,17 +282,7 @@ bool mcf_edma_filter_fn(struct dma_chan *chan, void *param)
 }
 EXPORT_SYMBOL(mcf_edma_filter_fn);
 
-static int __init mcf_edma_init(void)
-{
-	return platform_driver_register(&mcf_edma_driver);
-}
-subsys_initcall(mcf_edma_init);
-
-static void __exit mcf_edma_exit(void)
-{
-	platform_driver_unregister(&mcf_edma_driver);
-}
-module_exit(mcf_edma_exit);
+subsys_platform_driver(mcf_edma_driver);
 
 MODULE_ALIAS("platform:mcf-edma");
 MODULE_DESCRIPTION("Freescale eDMA engine driver, ColdFire family");
diff --git a/drivers/dma/moxart-dma.c b/drivers/dma/moxart-dma.c
index 28be93eed4cc..d33733afce9d 100644
--- a/drivers/dma/moxart-dma.c
+++ b/drivers/dma/moxart-dma.c
@@ -646,17 +646,7 @@ static struct platform_driver moxart_driver = {
 	},
 };
 
-static int moxart_init(void)
-{
-	return platform_driver_register(&moxart_driver);
-}
-subsys_initcall(moxart_init);
-
-static void __exit moxart_exit(void)
-{
-	platform_driver_unregister(&moxart_driver);
-}
-module_exit(moxart_exit);
+subsys_platform_driver(moxart_driver);
 
 MODULE_AUTHOR("Jonas Jensen <jonas.jensen@gmail.com>");
 MODULE_DESCRIPTION("MOXART DMA engine driver");
diff --git a/drivers/dma/owl-dma.c b/drivers/dma/owl-dma.c
index 9dc88d804a2e..c13c449ad05b 100644
--- a/drivers/dma/owl-dma.c
+++ b/drivers/dma/owl-dma.c
@@ -1254,17 +1254,7 @@ static struct platform_driver owl_dma_driver = {
 	},
 };
 
-static int owl_dma_init(void)
-{
-	return platform_driver_register(&owl_dma_driver);
-}
-subsys_initcall(owl_dma_init);
-
-static void __exit owl_dma_exit(void)
-{
-	platform_driver_unregister(&owl_dma_driver);
-}
-module_exit(owl_dma_exit);
+subsys_platform_driver(owl_dma_driver);
 
 MODULE_AUTHOR("David Liu <liuwei@actions-semi.com>");
 MODULE_AUTHOR("Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>");
diff --git a/drivers/dma/sa11x0-dma.c b/drivers/dma/sa11x0-dma.c
index a6fa431530e3..70b191519053 100644
--- a/drivers/dma/sa11x0-dma.c
+++ b/drivers/dma/sa11x0-dma.c
@@ -1080,17 +1080,7 @@ static struct platform_driver sa11x0_dma_driver = {
 	.remove		= sa11x0_dma_remove,
 };
 
-static int __init sa11x0_dma_init(void)
-{
-	return platform_driver_register(&sa11x0_dma_driver);
-}
-subsys_initcall(sa11x0_dma_init);
-
-static void __exit sa11x0_dma_exit(void)
-{
-	platform_driver_unregister(&sa11x0_dma_driver);
-}
-module_exit(sa11x0_dma_exit);
+subsys_platform_driver(sa11x0_dma_driver);
 
 MODULE_AUTHOR("Russell King");
 MODULE_DESCRIPTION("SA-11x0 DMA driver");
diff --git a/drivers/dma/sf-pdma/sf-pdma.c b/drivers/dma/sf-pdma/sf-pdma.c
index 6f79cc28703e..d62563f6c7f0 100644
--- a/drivers/dma/sf-pdma/sf-pdma.c
+++ b/drivers/dma/sf-pdma/sf-pdma.c
@@ -639,19 +639,7 @@ static struct platform_driver sf_pdma_driver = {
 	},
 };
 
-static int __init sf_pdma_init(void)
-{
-	return platform_driver_register(&sf_pdma_driver);
-}
-
-static void __exit sf_pdma_exit(void)
-{
-	platform_driver_unregister(&sf_pdma_driver);
-}
-
-/* do early init */
-subsys_initcall(sf_pdma_init);
-module_exit(sf_pdma_exit);
+subsys_platform_driver(sf_pdma_driver);
 
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("SiFive Platform DMA driver");
diff --git a/drivers/dma/ti/omap-dma.c b/drivers/dma/ti/omap-dma.c
index 55ece7fd0d99..da1f4eec9eb2 100644
--- a/drivers/dma/ti/omap-dma.c
+++ b/drivers/dma/ti/omap-dma.c
@@ -1941,17 +1941,7 @@ static bool omap_dma_filter_fn(struct dma_chan *chan, void *param)
 	return false;
 }
 
-static int omap_dma_init(void)
-{
-	return platform_driver_register(&omap_dma_driver);
-}
-subsys_initcall(omap_dma_init);
-
-static void __exit omap_dma_exit(void)
-{
-	platform_driver_unregister(&omap_dma_driver);
-}
-module_exit(omap_dma_exit);
+subsys_platform_driver(omap_dma_driver);
 
 MODULE_AUTHOR("Russell King");
 MODULE_DESCRIPTION("Texas Instruments sDMA DMAengine support");

-- 
2.56.0

