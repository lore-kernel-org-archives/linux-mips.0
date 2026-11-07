Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046634;
	b=sSAA51/P9xVfTzckl9ZaK8c+IVIkxZiRxYMo0ZUR4ZVlJKqYXgCMB5+ZiRW5PEJbWCms
	 oLoJPNBjydMHxy73t8RmLdUmMHReR763x5JnrZ7c8oHJWspNZRnTYVtq5UE6F1F1OfIv5
	 4fBGj6f8gcl78tTCBFsCQetiCLqPKfp0hxCU6h0dwJg9MbRFuAYRAVI/HXV02aevIdXMQ
	 I+24Wb4F5nGHJbHSqOMGcQdiwCGqx6R0im6gMJ7tHur3igDagNJBXqI45ySuURyuyQ2nR
	 o8Shk4JLcAyWY8xWlVf6Nx4IzklPoESDA9W6+1jraosEfv8e5UmDIAzkf7npykN+dgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046634;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=FwPtW+JjAhqo5jTU0/m3cNOHA1ZM321zSLbm5kQ7SQc=;
	b=VKrF0BwLYTz6/gMvG44bbZQ/AQiGAfAPEhH1UTEWa4sl//HIoCzUHa5LzK7SVEAvcQJi
	 r1kHh4Ws8bu9OMd3sMi5IBzPMndcfx6gP3KXApwH7mJ2jQV0raeVtRfpjfNgCDOQwpm4h
	 Ig5THDJ0p6f0b4WHu5LpSYV+Ifr4nK1rGUjKt/BpX48N92lDqcZfjiaz6PKVX9Dbmqzml
	 tIoGZAytQJHca7WfhT1SK33XYNr1mv52uTW041d+pChuHIAatUxYEFGCOuZ++v8Rs5R2f
	 0eKlof+bc8TfpGTvXWbw/bJR9tWxeIei4g3uZ+wxVNlDwVu3dDpaVgVtfmIbYOwVazw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=umbXTS3A;
	arc=none smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA6360A5BC9
	for <linux-mips@vger.kernel.org>; Sat,  7 Nov 2026 10:17:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EA6360A5BC9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=umbXTS3A
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-85a5455bd3cso840024a34.3
        for <linux-mips@vger.kernel.org>; Sat, 07 Nov 2026 02:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046633; x=1794651433; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FwPtW+JjAhqo5jTU0/m3cNOHA1ZM321zSLbm5kQ7SQc=;
        b=umbXTS3AnVj2tC2pIsFKrQSkND2P5xJOJ6V/Lh4GxdgSAQ1gjo1WrV8/+s5paEMeuK
         OcVh6Y0kubI7QQKGipSHAgmcyd65X0vOGdNOx6zLIELn9zs+xtfenwWFZ4/0uUOMhKvs
         peXzv2f0Q/cY47iqMT/eCs8kjCOw5xyrdyK9oCsSEJ6VWPNiczA2UJEzo+qJPY/mTEaZ
         XuSloGK/cP9WvE/8rXu3AyN/XFwjSt0k1G1vokVwJZ4CEfVQX9tHUY3X1hSXx4THdQHT
         YvK9wYxRun56MtnhCm5wBt0IDyLZO0qRI81mM7verR41MfKcVCllXxCTniEGgLrGbxKR
         gzrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046633; x=1794651433;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FwPtW+JjAhqo5jTU0/m3cNOHA1ZM321zSLbm5kQ7SQc=;
        b=Ivo5UkO8weyuAEn6mMzdmz495y5xhM0N+cZfGevvtw3G0BayHRZPslkL2cqH1MPh+S
         2+R3I0bW3bt3jJxAHxWTVQssLM5KQm/N49p2wuJSNfCBDQGhb2mB/RjK1V3QJr7F23xN
         FPU/G1e5XmNtF790+DCqpmGkwtkXH8mKzbNzY5+7VnzeN7O+NnNUWqs+bjenGuW55q6l
         W0zM/MEcIBgtAML6PB8GjTj5t3qCTQRCsBWe9CRJZ33A7xaIvHQSsa2PD6TkgMOweKjm
         lU8yjAkUonHYaaiZASUYUzonlGC39frMe+FBby19nDHEZWHPJh/pVQ7WR/MKfLiAe9UL
         2yQA==
X-Forwarded-Encrypted: i=1; AKwUvBw3GIcNfCzqVfxxRkeqT4k/NsvgbLikECAqDMTBm+VBaSlhB30JREjIkklbD7e+rORu40MUm7TwRWyA@vger.kernel.org
X-Gm-Message-State: APuU4Z8+jokenx6AcmZQFRQ9UHZzh9/nPGmcBCgcX468wy2GiNCuNwjB
	vPpxQ6guQI7wd73UsRvORLmQjcFy6HC3d3B1Evx39nvetkMhAeZzkjRo
X-Gm-Gg: AYBFou2yBYQqOVfGeoIVjznLLGbSroTGY3oVhHCGa50VWRPg5ZYa1n/+vtpoKZgoKKm
	p/Sp/yh443ydGKpHAPrEymYCYa/6efV1geL50iCYZrZKmpsl8bPqB2jobnysTqaV5pyx2BqdMLc
	3ynb3cquzzP9thMHzO+5HXNGD5anEPpOr647V5RICP0vQxcIl7YPF13ItWZlBvQEeGu2HYqAWMp
	+unJq0Y7biIja7cjKMQY351OMV1qFuYaH+Ai3z3EPIdPV8eNEkXV6y6iT4ugvc4RBBwRTgNLgCb
	4lETlx1w7aPZPRJ9Sq6R8fnA+3OLn9sJlNwDpZ+4sk7Ljlb1hiyr93kUcSACkVAboFdp5atmg77
	o+/98BqIkb5MvaySRhIyYNGBaJskZanBovBM35urols04Oh5PxJxXYUrG4GiQj6fVdo3aYbBuwd
	QV5gq3zykE6SNAwsqXX4So5eIRlAGqYkjEwVbvWp1JLGCw+wDkKEMWpLDm8RP+QtMmo9XwxoLXF
	UO+cxAPhC2a02DyGbtw3GXqx1EH3YSObBapdc7SFada1tEkmT6BgCkxrf/dO2AV+ukWv3Cb5JxV
	tbSkRc73ubX73DLvjtGTUGmk6fQ0hlpXcxyAj7K6FJo8BlkA/b7ns6Cgw7haxK+TBxW6p/gBhO6
	sb0Z9lrOo0oq1JOy4qS4Ir1DsN3WXHGd7BUhI+JiaAqtPfdNtHBkoK2XJSKdmqn+tvVQt+bFSlF
	9jec5gsknmev2wR9ouVno8TyRpGieIQq2E3bmeWH8zO6LbgZLwExnl
X-Received: by 2002:a05:6830:440e:b0:812:4cc7:4afe with SMTP id 46e09a7af769-85f1cfe2161mr4589309a34.17.1794046633427;
        Sat, 07 Nov 2026 02:17:13 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:17:12 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:14 -0700
Subject: [PATCH 17/58] mtd: rawnand: rockchip: retain chips across
 controller removal
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-17-0181ef0cc4c8@gmail.com>
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

Keep chip metadata and controller storage alive for retained MTD
handles. Disconnect each chip after unregistering it and before
releasing transfer buffers or clocks. This also lets unregister
notifiers finish using those buffers before hardware teardown. Free chip
metadata on the final MTD put.

Fixes: 058e0e847d54 ("mtd: rawnand: rockchip: NFC driver for RK3308, RK2928 and others")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/rockchip-nand-controller.c | 49 +++++++++++++++++++------
 1 file changed, 37 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/rockchip-nand-controller.c b/drivers/mtd/nand/raw/rockchip-nand-controller.c
index 9444ba02696d..aa31457390cd 100644
--- a/drivers/mtd/nand/raw/rockchip-nand-controller.c
+++ b/drivers/mtd/nand/raw/rockchip-nand-controller.c
@@ -1115,6 +1115,11 @@ static const struct nand_controller_ops rk_nfc_controller_ops = {
 	.setup_interface = rk_nfc_setup_interface,
 };
 
+static void rk_nfc_nand_release(struct nand_chip *chip)
+{
+	kfree(container_of(chip, struct rk_nfc_nand_chip, chip));
+}
+
 static int rk_nfc_nand_chip_init(struct device *dev, struct rk_nfc *nfc,
 				 struct device_node *np)
 {
@@ -1134,8 +1139,7 @@ static int rk_nfc_nand_chip_init(struct device *dev, struct rk_nfc *nfc,
 		return -EINVAL;
 	}
 
-	rknand = devm_kzalloc(dev, struct_size(rknand, sels, nsels),
-			      GFP_KERNEL);
+	rknand = kzalloc(struct_size(rknand, sels, nsels), GFP_KERNEL);
 	if (!rknand)
 		return -ENOMEM;
 
@@ -1144,17 +1148,19 @@ static int rk_nfc_nand_chip_init(struct device *dev, struct rk_nfc *nfc,
 		ret = of_property_read_u32_index(np, "reg", i, &tmp);
 		if (ret) {
 			dev_err(dev, "reg property failure : %d\n", ret);
-			return ret;
+			goto free_chip;
 		}
 
 		if (tmp >= NFC_MAX_NSELS) {
 			dev_err(dev, "invalid CS: %u\n", tmp);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		if (test_and_set_bit(tmp, &nfc->assigned_cs)) {
 			dev_err(dev, "CS %u already assigned\n", tmp);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		rknand->sels[i] = tmp;
@@ -1179,14 +1185,15 @@ static int rk_nfc_nand_chip_init(struct device *dev, struct rk_nfc *nfc,
 
 	if (!mtd->name) {
 		dev_err(nfc->dev, "NAND label property is mandatory\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	mtd_set_ooblayout(mtd, &rk_nfc_ooblayout_ops);
 	rk_nfc_hw_init(nfc);
 	ret = nand_scan(chip, nsels);
 	if (ret)
-		return ret;
+		goto free_chip;
 
 	if (chip->options & NAND_IS_BOOT_MEDIUM) {
 		ret = of_property_read_u32(np, "rockchip,boot-blks", &tmp);
@@ -1197,16 +1204,26 @@ static int rk_nfc_nand_chip_init(struct device *dev, struct rk_nfc *nfc,
 		rknand->boot_ecc = ret ? chip->ecc.strength : tmp;
 	}
 
+	ret = nand_set_release(chip, rk_nfc_nand_release);
+	if (ret) {
+		nand_cleanup(chip);
+		goto free_chip;
+	}
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "MTD parse partition error\n");
-		nand_cleanup(chip);
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&rknand->node, &nfc->chips);
 
 	return 0;
+
+free_chip:
+	kfree(rknand);
+	return ret;
 }
 
 static void rk_nfc_chips_cleanup(struct rk_nfc *nfc)
@@ -1219,8 +1236,9 @@ static void rk_nfc_chips_cleanup(struct rk_nfc *nfc)
 		chip = &rknand->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&rknand->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -1375,17 +1393,24 @@ static const struct of_device_id rk_nfc_id_table[] = {
 };
 MODULE_DEVICE_TABLE(of, rk_nfc_id_table);
 
+static void rk_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct rk_nfc, controller));
+}
+
 static int rk_nfc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct rk_nfc *nfc;
 	int ret, irq;
 
-	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
 
-	nand_controller_init(&nfc->controller);
+	ret = devm_nand_controller_init(dev, &nfc->controller, rk_nfc_release);
+	if (ret)
+		return ret;
 	INIT_LIST_HEAD(&nfc->chips);
 	nfc->controller.ops = &rk_nfc_controller_ops;
 
@@ -1449,9 +1474,9 @@ static void rk_nfc_remove(struct platform_device *pdev)
 {
 	struct rk_nfc *nfc = platform_get_drvdata(pdev);
 
+	rk_nfc_chips_cleanup(nfc);
 	kfree(nfc->page_buf);
 	kfree(nfc->oob_buf);
-	rk_nfc_chips_cleanup(nfc);
 	rk_nfc_disable_clks(nfc);
 }
 

-- 
2.53.0

