Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082433;
	b=C685w990+jZTsz4KXfSkBcN90Qk3rVcKxGpsVE+9Cy6rrxBwIZhcSBYPU23ibjltdZHW
	 /JkzBvYVx9d4mcRhjW7lbZcUeAJr16thuqDMZS5PZazAKO00Nqjv1tKaYNqrsJaq9nZDw
	 U9MuNdVPJBePSk/4zp37N5jhGXXOmjuotg8mht4Hrm03K5fgkFI13Q/pMHo82J9pdUBop
	 Rue500n5gHxO0pE5ngx+NxDmFz8tf/8F17lnol3TugBHO1znNwv3EM0yH8LBIwFNK1Xfn
	 49MIvUxePna8ar5PJ2hP0gtNBQpe3jLldroLRGRWrf2udeqPQjTu4lanB7t91J0fD2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082433;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=z5AWpefGP8ugvxCrGcFnv88cfzYJY+wSyEyfHqNeTTo=;
	b=llDnGJZQgpzy3bjXbBzvubG7QcEzVlllsEFS1yw5mTw1FMP8oy2743s20I1kZa4zimGi
	 fBIVxR964Egs7EI8o+Lh7IJ65JVttDOjdbQIsuSeiyJOgh5BMYRUvBJSuRarzcYD6E2LZ
	 HonMW3EhTNYYsTMAtWYldFLVr+0N4JYgZyYZyUl2DsLyOp3AzZ5U7BMT39Mo+7j0lOWhE
	 JMSEehQStDMYTIUmmpSJ9S5dErrxYWKqQKF3C5/pkVG0kX700ArxTYKZw4S5Dc/L6XBYt
	 Uq3RXMG362nm0SOB0sFTfqjImwSHHjVcvqCFt/X6lInGrZDsF2eOMGorK3dMFoqnOXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.160.53
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484906083605
	for <linux-mips@vger.kernel.org>; Sat,  7 Nov 2026 20:13:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 484906083605
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-4ad60ec5eaaso21514fac.0
        for <linux-mips@vger.kernel.org>; Sat, 07 Nov 2026 12:13:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082431; x=1794687231;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z5AWpefGP8ugvxCrGcFnv88cfzYJY+wSyEyfHqNeTTo=;
        b=b1/jwrWB8qupi62jZUXeNNpmzXdBukkivx/vPUyoL7qC7aoZEdm+VMJxG1HZAnJb/J
         o7Kb9fKVimWrIooAchoEmU53Utu4Lspg/6TwUKFzL2y3/LOh9xirlXrhEDGm5pnRpNmj
         K+UIHxaGSZq60v9BfmiwiO1ZjhRXYSRONlvJxaKsEVKv46FMqZlutmIbwgJE7iVQRzql
         wJ1s8pmpBrOksU+Mx+49qB2iPqfnQ1vzLL0T2+UqvpDTIdButTwTuxw5/8nltLmMbZHl
         2d2gnbnV3vuxlAzZ+IQyMgG7YUqK0lrJmtV6F+xKf9g07AzqiUTMvE5yPWjEcJGov9fO
         7mOw==
X-Forwarded-Encrypted: i=1; AL+hErENgyz6qxEjU9gLC+dJfkPEutPXPB8KOquG0S5BV09uRvsTyQ3BXsh/ZjobbLWQcHmuMlOMh0yB6o00@vger.kernel.org
X-Gm-Message-State: APuU4Z8AyuB8g/m9ghXJBWZxeyqIV3ygDsbethNWi6yl4TccEFAbAs7N
	Y7xhM0E3B9Jas6vKmbIfpifCgD/7+C66ak63ZS7CB6xFqmCV1iP5R82gN8iW/s9YF1c=
X-Gm-Gg: AYBFou0pu9q/Z2ctK4d4KWdGukMzcVQ+kKSuMIKto/8Mv1Fy4F21no+nRgCeeAMLjfu
	PZRFZQwQQ2FfxnMRt74VNnZWu5DZIULzmsY+izr5PHcfz+sXtvdTBtlOIw6p+tel8OtjNAbf89R
	hkHck1K7sgvd3pewcQq86oC/9nw8EsSyQnjMXkdstcJF+agmg4ATtCSYrWn2IE5k4K25jWxfYYk
	FWZpQuDfOK5dc9+rdSVgEee55WsdRBUX9BfNCSPp4KXdAanJ4giEFx85/6Ja+zHNlRhoCkb071H
	kDN3KGGnxr45Y9aSAQmm8hgGXne9MSUAItF9hhClf0R6SbpTOYNd+GpwWwVlfyjMZYHOazOcej8
	RWoPDB8ATwOnXz6LX2UjWjphcOtpSxaFEwEV9W84Xg6tTl4XONeCbGDIx2giimW40X9fovoLW5m
	v3/6lFrQgD6XgCRiwu1DI3nBYd9j2Al6/VEYI9r+mPeDsrz8/HSY0P3veCJdF2hkKgPoZzdQndP
	ICFHRDKSL1AYDeUZQyBFwGGD+4FHpqcesL4jAx5Bvi5dWzNCyCGPXPvjdy8t127p1yE2dej0Zxd
	WsoFel+3rwutQYhgkP3JJxMZGmhe4OsieNLGjBFuIFOZwcDbQdPqjqerU3XJsR/IMoOIhvTdgSR
	P+Yti1w==
X-Received: by 2002:a05:6870:2418:b0:4a7:20e8:8d1c with SMTP id 586e51a60fabf-4adc106e03bmr1313869fac.27.1794082431205;
        Sat, 07 Nov 2026 12:13:51 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:50 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:44 -0700
Subject: [PATCH 47/58] mtd: rawnand: lpc32xx_mlc: retain chip state across
 removal
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-47-0181ef0cc4c8@gmail.com>
References: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
In-Reply-To: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
  Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
  Brian Norris <computersforpeace@gmail.com>,
  Boris Brezillon <bbrezillon@kernel.org>,
  Arseniy Krasnov <AVKrasnov@sberdevices.ru>, Chen-Yu Tsai <wens@kernel.org>,
  Jernej Skrabec <jernej.skrabec@gmail.com>,
  Samuel Holland <samuel@sholland.org>, Thomas Gleixner <tglx@kernel.org>,
  Vitaly Wool <vitalywool@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
  Russell King <rmk+kernel@arm.linux.org.uk>,
  David Woodhouse <David.Woodhouse@intel.com>,
  Mike Rapoport <rppt@kernel.org>,
  Maxime Coquelin <mcoquelin.stm32@gmail.com>,
  Alexandre Torgue <alexandre.torgue@foss.st.com>,
  Christophe Kerello <christophe.kerello@st.com>,
  Jason Roberts <jason.e.roberts@intel.com>,
  Michal Simek <michal.simek@amd.com>,
  Boris Brezillon <boris.brezillon@collabora.com>,
  Mason Yang <masonccyang@mxic.com.tw>,
  Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>,
  Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>,
  Thierry Reding <thierry.reding@kernel.org>,
  Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>,
  Matthias Brugger <matthias.bgg@gmail.com>,
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
  Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
  Heiko Stuebner <heiko@sntech.de>, Yifeng Zhao <yifeng.zhao@rock-chips.com>,
  Nicolas Ferre <nicolas.ferre@microchip.com>,
  Alexandre Belloni <alexandre.belloni@bootlin.com>,
  Claudiu Beznea <claudiu.beznea@tuxon.dev>,
  Keguang Zhang <keguang.zhang@gmail.com>, Jacky Huang <ychuang3@nuvoton.com>,
  Shan-Chun Hung <schung@nuvoton.com>, Frank Li <Frank.Li@nxp.com>,
  Sascha Hauer <s.hauer@pengutronix.de>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,
  Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>,
  Liang Yang <liang.yang@amlogic.com>,
  Neil Armstrong <neil.armstrong@linaro.org>,
  Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
  Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
  Manivannan Sadhasivam <mani@kernel.org>,
  Kamal Dasu <kamal.dasu@broadcom.com>,  Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,  Vladimir Zapolskiy <vz@mleia.com>,
  Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
  Paul Cercueil <paul@crapouillou.net>,
  Harvey Hunt <harveyhuntnexus@gmail.com>,
  Maxim Levitsky <maximlevitsky@gmail.com>, Michael Walle <michael@walle.cc>,
  Srinivas Kandagatla <srini@kernel.org>
Cc: Tze Yee Ng <tze.yee.ng@altera.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-mips@vger.kernel.org, imx@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Drain chip operations before releasing interrupts, DMA and controller
resources. Retain the embedded NAND chip and controller until the final
MTD reference releases their metadata.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/lpc32xx_mlc.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/lpc32xx_mlc.c b/drivers/mtd/nand/raw/lpc32xx_mlc.c
index 8436015edcb4..93ee8cfc0345 100644
--- a/drivers/mtd/nand/raw/lpc32xx_mlc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_mlc.c
@@ -675,6 +675,12 @@ static const struct nand_controller_ops lpc32xx_nand_controller_ops = {
 	.attach_chip = lpc32xx_nand_attach_chip,
 };
 
+static void lpc32xx_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct lpc32xx_nand_host,
+			   nand_chip.legacy.dummy_controller));
+}
+
 /*
  * Probe for NAND controller
  */
@@ -687,9 +693,14 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	int res;
 
 	/* Allocate memory for the device structure (and zero it) */
-	host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	nand_chip = &host->nand_chip;
+	nand_chip->controller = &nand_chip->legacy.dummy_controller;
+	res = devm_nand_controller_init(&pdev->dev, nand_chip->controller, lpc32xx_nand_release);
+	if (res)
+		return res;
 
 	host->pdev = pdev;
 
@@ -794,10 +805,16 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 
 	mtd->name = DRV_NAME;
 
-	res = mtd_device_register(mtd, host->ncfg->parts,
-				  host->ncfg->num_parts);
+	res = nand_set_release(nand_chip, NULL);
 	if (res)
 		goto cleanup_nand;
+	res = mtd_device_register(mtd, host->ncfg->parts,
+				  host->ncfg->num_parts);
+	if (res) {
+		nand_disconnect(nand_chip);
+		mtd_put_master(mtd);
+		goto free_irq;
+	}
 
 	return 0;
 
@@ -830,7 +847,7 @@ static void lpc32xx_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	free_irq(host->irq, host);
 	if (use_dma)
@@ -841,6 +858,7 @@ static void lpc32xx_nand_remove(struct platform_device *pdev)
 
 	lpc32xx_wp_enable(host);
 	gpiod_put(host->wp_gpio);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static int lpc32xx_nand_resume(struct platform_device *pdev)

-- 
2.53.0

