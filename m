Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046638;
	b=Bn3d7mle9vMudBLNwKPaVYBt9mgsZ7yEGJcAezZbODOhTNHi2zwlm6vsBR/as5sbqUGU
	 4c1FJNgE6afGoqx1wXKGLN/hwnaqOO75enaDX0kCZLVkJyZdWup+N3t4mBIJsvIk64fJA
	 nN+UfiiA0uWsBdcRoIeuYlNWtPeEc3too9BcCUULPLl27WbpeziO0kwN29KIc/LiH2BnE
	 fjtLGm/DDrUi9bmrsVOuY4JWNl04SRQt24gWOmkMx/LKUMbber9LYRX1jrzR6JicokqiU
	 3om3t7StRkpYUSfMga3THnRBUArgLQZZHvYMhqJxdgtjV4fGw0+yRkkuWXtyKmVJLqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046638;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=jZhmXh2sTJWMyX9gtP0zRdy0goXPy7ysG+XXcBHxYuk=;
	b=j0LhS3Kg5/qUWilSIxQxdVEbzUrB4FJ3rXlEBW1iepHsx18CzcXvdFzfQE331NNMsSBb
	 osQofbqfnm6YRDCsu7rYiIWARSWXSYvekyh+89R14gcViwfX6wt6HDcEvxb55Hk+Juqt6
	 7DrKyH65tJoMMCBvdXPYZoj3NUTvNbGE8iT4mKIVvuRHRt13ZKcbcnfRgjqiFS9XaP5CD
	 KDOYKVNmuEqClvDnpFaa5FHrPl+YFXsW9QYQMUaTFn4cG5FE5ZwxTyqqXMutjerNTzGFR
	 EpQZQRzCkDIShNqNvYnyJ3PZiXnOJqwCJ8CuqwRRmDTpgkvJPjueLaGtMRc6gTox1+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EUqCXhmD;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7364C60A5BE8
	for <linux-mips@vger.kernel.org>; Sat,  7 Nov 2026 10:17:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7364C60A5BE8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EUqCXhmD
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-843ea301d60so936876a34.0
        for <linux-mips@vger.kernel.org>; Sat, 07 Nov 2026 02:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046636; x=1794651436; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jZhmXh2sTJWMyX9gtP0zRdy0goXPy7ysG+XXcBHxYuk=;
        b=EUqCXhmDasUOlEJTqqzOpMKtgNl0LilVGV5g81pI/Pqy8z9gP78rlpQvFnMi/dbXtb
         YkSEQZATc5hXng5rN7GjghiDis10VWnMyxqUnwN480PvvKV/C+Y3F7DLiqHBNI6/LG6b
         Rk2RO/mTyea//mZpttWEYwTfcNtQdGo0vXE7tcqz032whIN0UjZoDWRsvSPv7riO0b/S
         /qqOtns5lAS7sgv4eapsGES/KowcnRKslQzF71TP+3mjkWyY5sCCsvLckwnd6vWz7mUX
         t6Y0JJNp3YwEx0MaoRkS/PMjhBbLlF5Mj1ZiktyWrCba8BbymHfujUmZg5rw0tFoU/iu
         SsRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046636; x=1794651436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jZhmXh2sTJWMyX9gtP0zRdy0goXPy7ysG+XXcBHxYuk=;
        b=RjS5pTdaRjApRnhmSVPzasPu4c96ocnxv6gISHP18z6Jxh/LuMpOrda1leThonC4rR
         rt3RwRsRxj0j99SVaoQk3pLK20TQunWOcdpgB25cuLglOQJr2H//lZXgKnq2a6UMxLYb
         NTYZl6jRkerLSC/3yAZjO+Ftp54f7goNZvXsCfyItv6OtmBtuYMRZgb2S7YW2t06yJwx
         W61psWFvAbDuA9q9E+pNxrJM4qIZ7WTwb0bILVSLFPDv5P1QtN/rRnOo21dgjcemjibD
         16A2dnJW222GrmZ4rW2d/DxAiAYKhcPdfiPgdfQep1oOXQ1MaG4muLeSmqrOISvjFv7K
         +BZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZ+XZkHSnmbJmTLZ121ACXRrQEfp5286SfAuTpVe4AVvXvub0JBP9AN9K2z5Bj2u3LwmE3//IpV8Mr@vger.kernel.org
X-Gm-Message-State: APuU4Z/A9Qg8D7whFcBhNUHkMc7awlR2+c/On6z6H+0ybSV9CMn2Qe9Y
	c4+hIvaitMeFbPhrNNVPjvcWdRJxnR1TqucXVpnVcAAlcyZU4XHobgCv
X-Gm-Gg: AYBFou2u3yBk3kAq8tidwmv+Kf2g3dj8bx1ysAgKixTtuEDORKTi6WhmK7sggNH3073
	tPTyBmrg7r4X1FGR9jwriVAJdvxHhmeKRrrzbIu0PN8LE9qi+3abnAXvKTNVQ8nDm9sweDX7bYc
	Q1tyB/DeT7vqg6OEdkBK+TAmH63jaf7EqPAJZwniFXnlS6IlQhlSK6okPquHgDKe5IUa2dNcdFJ
	RwKtymQYIWWkBH8iBzjJpu3p+vnhkeN70fkhjofHmLNj5v6pPiea9AbFECzvdu+pIJse1Yr0cYk
	OO7k6Jrlwrt83ue39UmHLLbgiuToiVgXdZxUhxCb4spHX8riixeVHPtXqw2oxgYMrM6+WrRtLiq
	HpOt4UIoQ99deri6hQ6pq1WRnM5mBnTknduv5pUefQV3gQaFZ6OfR3K88A3x4jTKP2TXWg1U+/m
	pPgIKUpeNhpz4tB65/iKGb7m/6ewLxnklMa5yQdimgDmy91hDwBacmTppHe7lPe0YJOJ7qQ0VeA
	Wd1BcWjKLyD9BLOZnhtmz4RkVIh7o4dZUaPnEUzr9pXesynykBUnprG7sAbgbPgfHMsFbNCLyB7
	TGYReolK+l7jeT/lFOvK2jpE9TduIEej53+ryHxOBKu2CpsHJPTWS3xlQOClDJBcL+TCmfpxayf
	6HSbShTlcuOGYQWPBSZrTDwkN1nM1o2QypIzxOxSKmIr+Tzy3MIhOTq86tSGNHbE/qCgplAzP5Z
	W8EgIZzpKIXAMFbQ6yTCMBLU+EpM9NeEd1qvzYmL4tNfR1XAxeDvk2PGkbqlgq46aft164uauph
	A==
X-Received: by 2002:a05:6830:25d1:b0:85b:c75:dc59 with SMTP id 46e09a7af769-85f1d07b56cmr5673247a34.29.1794046636308;
        Sat, 07 Nov 2026 02:17:16 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:17:15 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:15 -0700
Subject: [PATCH 18/58] mtd: rawnand: atmel: retain chips across controller
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-18-0181ef0cc4c8@gmail.com>
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
 Kamal Dasu <kamal.dasu@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, 
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

Keep NAND chip metadata and SMC or HSMC controller storage until
retained MTD references have been released. Disconnect registered chips
before releasing DMA, SRAM and clock resources. Give chip initialization
ownership of its allocation on both success and failure, including
absent SmartMedia cards.

Fixes: f88fc122cc34 ("mtd: nand: Cleanup/rework the atmel_nand driver")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/atmel/nand-controller.c | 59 ++++++++++++++++++++++------
 1 file changed, 47 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index 0bdbcbb50d94..10b725fa61d8 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -62,6 +62,7 @@
 #include <linux/iopoll.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <linux/slab.h>
 #include <soc/at91/atmel-sfr.h>
 
 #include "pmecc.h"
@@ -1628,8 +1629,9 @@ static int atmel_nand_controller_remove_nand(struct atmel_nand *nand)
 	if (ret)
 		return ret;
 
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	list_del(&nand->node);
+	mtd_put_master(mtd);
 
 	return 0;
 }
@@ -1638,7 +1640,7 @@ static struct atmel_nand *atmel_nand_create(struct atmel_nand_controller *nc,
 					    struct device_node *np,
 					    int reg_cells)
 {
-	struct atmel_nand *nand;
+	struct atmel_nand *nand __free(kfree) = NULL;
 	struct gpio_desc *gpio;
 	int numcs, ret, i;
 
@@ -1649,7 +1651,7 @@ static struct atmel_nand *atmel_nand_create(struct atmel_nand_controller *nc,
 		return ERR_PTR(-EINVAL);
 	}
 
-	nand = devm_kzalloc(nc->dev, struct_size(nand, cs, numcs), GFP_KERNEL);
+	nand = kzalloc(struct_size(nand, cs, numcs), GFP_KERNEL);
 	if (!nand)
 		return ERR_PTR(-ENOMEM);
 
@@ -1734,7 +1736,12 @@ static struct atmel_nand *atmel_nand_create(struct atmel_nand_controller *nc,
 
 	nand_set_flash_node(&nand->base, np);
 
-	return nand;
+	return_ptr(nand);
+}
+
+static void atmel_nand_release(struct nand_chip *chip)
+{
+	kfree(to_atmel_nand(chip));
 }
 
 static int
@@ -1748,6 +1755,7 @@ atmel_nand_controller_add_nand(struct atmel_nand_controller *nc,
 	/* No card inserted, skip this NAND. */
 	if (nand->cdgpio && gpiod_get_value(nand->cdgpio)) {
 		dev_info(nc->dev, "No SmartMedia card inserted.\n");
+		kfree(nand);
 		return 0;
 	}
 
@@ -1756,19 +1764,29 @@ atmel_nand_controller_add_nand(struct atmel_nand_controller *nc,
 	ret = nand_scan(chip, nand->numcs);
 	if (ret) {
 		dev_err(nc->dev, "NAND scan failed: %d\n", ret);
-		return ret;
+		goto free_chip;
 	}
 
+	ret = nand_set_release(chip, atmel_nand_release);
+	if (ret) {
+		nand_cleanup(chip);
+		goto free_chip;
+	}
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(nc->dev, "Failed to register mtd device: %d\n", ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&nand->node, &nc->chips);
 
 	return 0;
+
+free_chip:
+	kfree(nand);
+	return ret;
 }
 
 static int
@@ -1791,7 +1809,7 @@ atmel_nand_controller_legacy_add_nands(struct atmel_nand_controller *nc)
 {
 	struct device *dev = nc->dev;
 	struct platform_device *pdev = to_platform_device(dev);
-	struct atmel_nand *nand;
+	struct atmel_nand *nand __free(kfree) = NULL;
 	struct gpio_desc *gpio;
 	struct resource *res;
 
@@ -1799,7 +1817,7 @@ atmel_nand_controller_legacy_add_nands(struct atmel_nand_controller *nc)
 	 * Legacy bindings only allow connecting a single NAND with a unique CS
 	 * line to the controller.
 	 */
-	nand = devm_kzalloc(nc->dev, struct_size(nand, cs, 1), GFP_KERNEL);
+	nand = kzalloc(struct_size(nand, cs, 1), GFP_KERNEL);
 	if (!nand)
 		return -ENOMEM;
 
@@ -1857,7 +1875,7 @@ atmel_nand_controller_legacy_add_nands(struct atmel_nand_controller *nc)
 
 	nand_set_flash_node(&nand->base, nc->dev->of_node);
 
-	return atmel_nand_controller_add_nand(nc, nand);
+	return atmel_nand_controller_add_nand(nc, no_free_ptr(nand));
 }
 
 static int atmel_nand_controller_add_nands(struct atmel_nand_controller *nc)
@@ -2043,7 +2061,6 @@ static int atmel_nand_controller_init(struct atmel_nand_controller *nc,
 	struct device_node *np = dev->of_node;
 	int ret;
 
-	nand_controller_init(&nc->base);
 	nc->base.ops = &atmel_nand_controller_ops;
 	INIT_LIST_HEAD(&nc->chips);
 	nc->dev = dev;
@@ -2349,6 +2366,11 @@ atmel_hsmc_nand_controller_remove(struct atmel_nand_controller *nc)
 	return 0;
 }
 
+static void atmel_hsmc_nand_controller_release(struct nand_controller *controller)
+{
+	kfree(to_hsmc_nand_controller(controller));
+}
+
 static int atmel_hsmc_nand_controller_probe(struct platform_device *pdev,
 				const struct atmel_nand_controller_caps *caps)
 {
@@ -2356,9 +2378,13 @@ static int atmel_hsmc_nand_controller_probe(struct platform_device *pdev,
 	struct atmel_hsmc_nand_controller *nc;
 	int ret;
 
-	nc = devm_kzalloc(dev, sizeof(*nc), GFP_KERNEL);
+	nc = kzalloc_obj(*nc);
 	if (!nc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nc->base.base,
+					atmel_hsmc_nand_controller_release);
+	if (ret)
+		return ret;
 
 	ret = atmel_nand_controller_init(&nc->base, pdev, caps);
 	if (ret)
@@ -2426,6 +2452,11 @@ static const struct atmel_nand_controller_caps atmel_sama5_nand_caps = {
 	.legacy_of_bindings = true,
 };
 
+static void atmel_smc_nand_controller_release(struct nand_controller *controller)
+{
+	kfree(to_smc_nand_controller(controller));
+}
+
 static int atmel_smc_nand_controller_probe(struct platform_device *pdev,
 				const struct atmel_nand_controller_caps *caps)
 {
@@ -2433,9 +2464,13 @@ static int atmel_smc_nand_controller_probe(struct platform_device *pdev,
 	struct atmel_smc_nand_controller *nc;
 	int ret;
 
-	nc = devm_kzalloc(dev, sizeof(*nc), GFP_KERNEL);
+	nc = kzalloc_obj(*nc);
 	if (!nc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nc->base.base,
+					atmel_smc_nand_controller_release);
+	if (ret)
+		return ret;
 
 	ret = atmel_nand_controller_init(&nc->base, pdev, caps);
 	if (ret)

-- 
2.53.0

