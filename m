Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082449;
	b=fjePFmlS4FSBnFQc0Igo9lc3ttxHfOh36ybU0fuBWyyzyHpky2stVYwgxEYDzqNjm3wi
	 ziViebO06kmFYZlOoPnslg//Ru4aOlA56lrrQGH8AXjpBLDHOouQKDEK/t7XLwUHV/k/Q
	 vtWaJyOom2QfcCIIFBOD/KX7UP5QHKOvYrBQMlCSJb3e9c/pfZ9Dp66LG58LoWFMuO/nX
	 teY6aZD72gJgccBhRs5cQ8DFadll21urAkFVQ/FVFanQmruHzPyt4gbEUAQtqZWW9LWS0
	 AuA5+4hJHkqAZgk+ODk1ncoOu2XqKVVsTYMq/U7P1BOqhTUmxTw2MZE52uo1PwD9ZAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082449;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=zd1KEiVioYI8oN7Z1XXsuI+JrCDYdIglHkXO7xk8gJ0=;
	b=DsUveOVvSlIHYlRI5CEQYbnTvuvEYKpuLyWCXRZw3OrA4+2n9ES9RW/UGgycZl3O85MU
	 JBLEuNH5CDbg7DFH4Ix3QaMBiccQ6j3Auc3nJS2vr0E1DFNj2M3/IWY4a5crgMdZzuXVc
	 Sw+M4BPz4b5f0SWiXAWkU/BTGhRzjqlIVHuqXtWY7Zwe2vMmsU+iTk3+qT2lhNGa2sfcZ
	 5pwNUXfzHSwhOBpztp/NQrCnZBbumgdmwAbYHyRBQ2yNZzjDRKlgbUZKnppDiLdr1q/tr
	 KqssL5BM9Ctvb0J3vcHvbnT2BFnMSuHyhpfkIu0GIRgv9X2z/ruYijG1RaR6bHjrltg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F6260A2612
	for <linux-mips@vger.kernel.org>; Sat,  7 Nov 2026 20:14:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82F6260A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-705cb6ceebaso1240629eaf.3
        for <linux-mips@vger.kernel.org>; Sat, 07 Nov 2026 12:14:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082448; x=1794687248;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zd1KEiVioYI8oN7Z1XXsuI+JrCDYdIglHkXO7xk8gJ0=;
        b=WkL3gVdD7Mlzvd5xTOp+bmTIJqSw9/tHwm+iEOsAa26HOfEA9Ax+3GjdZMBWQ7AA72
         985c2ptYwkDxHfdDlv3CtyXJOJNsO7H8MzMHCX3wbUewlll2nIwnSBQZcwzMLG27f1wc
         9rHihdmeVNehGeOMnUOA89ZC9cI2W+TYpI+YwBMDtPfTQdTNdY0Z9YoxMewMAU40N86W
         EDseQXHPrnJJ97pFlmz2qnjaOOPtdOXARLZkNLr8lQsxbGZmHq8M+u79JMwf60QaBLvF
         G5c02gvdnjEOSPrbMH+72U4Vmjgafrs0v07iGmrIn0y9EiLbrC88mi1KWJdUIFgSzngH
         s2fQ==
X-Forwarded-Encrypted: i=1; AKwUvBzD91d6y+SNbE7D8PpwQRId1BG5kwAVY6u4CADGG4cUSWIKt6ubU6eF5pAsXCdAK648OyEeU4ANa8ms@vger.kernel.org
X-Gm-Message-State: APuU4Z+LVrVRvi00/E2Z+lPqRviOPvmiu77b+YnsBWNubluNEgUz/lUO
	bzVkvImDqlXBk1ans/5K/Y/yPkfJ86LIoJlqZ6xtcD1vwlY63UULptNXAtbFmIxgtNA=
X-Gm-Gg: AYBFou0id9YIQcATjhERHtuGjR3+oIGqBNGzn96gQ07Ez7ONQvsyZt9TkkTd16pPKCv
	Hd3BmBp3d1MSV3sfU+X8UYUb54WDuGJxY/+IF6hoMD/HIp2yYf5nA+F3hl3qjX0LPZleFd1A3zv
	XWtKkDUtDugsJPbV7kbxcfT1y/SOAJLOuOXsREr+gtjg7ckaNtzT4k96jigRDjVAQRnpKmyMvUq
	tFDJHp+fPYnK2UJkB4HUXvbQmGwck6f8SwcewYeJJ905VJ+EFMgWyUUyFUkTnipuhCDkhW5w1lv
	5nnZCIk+xA5pf2UV7Wpl46eQqClIVs6pS9fj6f7QdPmK0j0CY7Ibl8AP6ol+K3oZCUqEiZp0XP0
	9qqA/8C0mpRn4S9+BxYDDj1c3h0P1/vu7xJt90SxlhZehr1k/3qW3sOrApUv8sGHgP0zhLEGeph
	0gWEdj+pmzc+UrndCaAk9u7Oo2olv9o2uu/klVd2xxH18Oiqm1iG7kF9MFM7xiR+DRRFWsjemtD
	+DanSOn0CHR+/mzUOUn9KpT24C3loCRbP+O5rhmm7jfYLvQ6b72Ofs5ev+J45YHDAvGO+Cn9hl3
	sACD9vZrE73b51iJnKAC4OUfn4XiBOVS6jNfMEpG71TpBG+HGfVi7sIeWgTy
X-Received: by 2002:a05:6820:560b:b0:700:da68:7398 with SMTP id 006d021491bc7-7170f278e61mr16479eaf.43.1794082448352;
        Sat, 07 Nov 2026 12:14:08 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:14:07 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:50 -0700
Subject: [PATCH 53/58] mtd: rawnand: fsl_elbc: retain chip state across
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-53-0181ef0cc4c8@gmail.com>
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

Keep a reference to the shared FCM controller for each scanned chip,
including chips retained after unbind. Count active banks separately so
a new binding cannot reuse controller state still owned by old MTD
handles.

Unregister and drain the chip before unmapping its chip-select window.
Release NAND metadata, chip storage and the shared controller reference
only after the final MTD put.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/fsl_elbc_nand.c | 68 ++++++++++++++++++++++++------------
 1 file changed, 45 insertions(+), 23 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsl_elbc_nand.c b/drivers/mtd/nand/raw/fsl_elbc_nand.c
index c655d27bc4cc..c27e89050270 100644
--- a/drivers/mtd/nand/raw/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_elbc_nand.c
@@ -48,6 +48,7 @@ struct fsl_elbc_mtd {
 
 struct fsl_elbc_fcm_ctrl {
 	struct nand_controller controller;
+	struct kref refcnt;
 	struct fsl_elbc_mtd *chips[MAX_BANKS];
 
 	u8 __iomem *addr;        /* Address of assigned FCM buffer        */
@@ -837,23 +838,35 @@ static const struct nand_controller_ops fsl_elbc_controller_ops = {
 	.attach_chip = fsl_elbc_attach_chip,
 };
 
-static int fsl_elbc_chip_remove(struct fsl_elbc_mtd *priv)
+static void fsl_elbc_controller_release(struct kref *ref)
 {
-	struct fsl_elbc_fcm_ctrl *elbc_fcm_ctrl = priv->ctrl->nand;
-	struct mtd_info *mtd = nand_to_mtd(&priv->chip);
+	kfree(container_of(ref, struct fsl_elbc_fcm_ctrl, refcnt));
+}
+
+static void fsl_elbc_chip_release(struct nand_chip *chip)
+{
+	struct fsl_elbc_fcm_ctrl *ctrl;
 
-	kfree(mtd->name);
+	ctrl = container_of(chip->controller, struct fsl_elbc_fcm_ctrl, controller);
+	kfree(nand_get_controller_data(chip));
+	kref_put(&ctrl->refcnt, fsl_elbc_controller_release);
+}
+
+static DEFINE_MUTEX(fsl_elbc_nand_mutex);
+
+static void fsl_elbc_chip_remove(struct fsl_elbc_mtd *priv)
+{
+	struct fsl_elbc_fcm_ctrl *elbc_fcm_ctrl = priv->ctrl->nand;
 
 	if (priv->vbase)
 		iounmap(priv->vbase);
 
+	guard(mutex)(&fsl_elbc_nand_mutex);
 	elbc_fcm_ctrl->chips[priv->bank] = NULL;
-	kfree(priv);
-	return 0;
+	if (!--elbc_fcm_ctrl->counter)
+		priv->ctrl->nand = NULL;
 }
 
-static DEFINE_MUTEX(fsl_elbc_nand_mutex);
-
 static int fsl_elbc_nand_probe(struct platform_device *pdev)
 {
 	struct fsl_lbc_regs __iomem *lbc;
@@ -867,6 +880,7 @@ static int fsl_elbc_nand_probe(struct platform_device *pdev)
 	struct device *dev;
 	struct device_node *node = pdev->dev.of_node;
 	struct mtd_info *mtd;
+	const char *name;
 
 	if (!fsl_lbc_ctrl_dev || !fsl_lbc_ctrl_dev->regs)
 		return dev_err_probe(&pdev->dev, -EPROBE_DEFER, "lbc_ctrl_dev missing\n");
@@ -904,21 +918,25 @@ static int fsl_elbc_nand_probe(struct platform_device *pdev)
 		elbc_fcm_ctrl = kzalloc_obj(*elbc_fcm_ctrl);
 		if (!elbc_fcm_ctrl) {
 			mutex_unlock(&fsl_elbc_nand_mutex);
-			ret = -ENOMEM;
-			goto err;
+			kfree(priv);
+			return -ENOMEM;
 		}
-		elbc_fcm_ctrl->counter++;
+		kref_init(&elbc_fcm_ctrl->refcnt);
 
 		nand_controller_init(&elbc_fcm_ctrl->controller);
 		fsl_lbc_ctrl_dev->nand = elbc_fcm_ctrl;
 	} else {
 		elbc_fcm_ctrl = fsl_lbc_ctrl_dev->nand;
+		kref_get(&elbc_fcm_ctrl->refcnt);
 	}
+	elbc_fcm_ctrl->counter++;
 	mutex_unlock(&fsl_elbc_nand_mutex);
 
 	elbc_fcm_ctrl->chips[bank] = priv;
 	priv->bank = bank;
 	priv->ctrl = fsl_lbc_ctrl_dev;
+	priv->chip.controller = &elbc_fcm_ctrl->controller;
+	nand_set_controller_data(&priv->chip, priv);
 	priv->dev = &pdev->dev;
 	dev_set_drvdata(priv->dev, priv);
 
@@ -945,11 +963,21 @@ static int fsl_elbc_nand_probe(struct platform_device *pdev)
 	if (ret)
 		goto err;
 
+	name = mtd->name;
+	ret = nand_set_release(&priv->chip, fsl_elbc_chip_release);
+	if (ret)
+		goto cleanup_nand;
+	kfree(name);
+
 	/* First look for RedBoot table or partitions on the command
 	 * line, these take precedence over device tree information */
 	ret = mtd_device_parse_register(mtd, part_probe_types, NULL, NULL, 0);
-	if (ret)
-		goto cleanup_nand;
+	if (ret) {
+		nand_disconnect(&priv->chip);
+		fsl_elbc_chip_remove(priv);
+		mtd_put_master(mtd);
+		return ret;
+	}
 
 	pr_info("eLBC NAND device at 0x%llx, bank %d\n",
 		(unsigned long long)res.start, priv->bank);
@@ -959,32 +987,26 @@ static int fsl_elbc_nand_probe(struct platform_device *pdev)
 cleanup_nand:
 	nand_cleanup(&priv->chip);
 err:
+	kfree(nand_to_mtd(&priv->chip)->name);
 	fsl_elbc_chip_remove(priv);
+	fsl_elbc_chip_release(&priv->chip);
 
 	return ret;
 }
 
 static void fsl_elbc_nand_remove(struct platform_device *pdev)
 {
-	struct fsl_elbc_fcm_ctrl *elbc_fcm_ctrl = fsl_lbc_ctrl_dev->nand;
 	struct fsl_elbc_mtd *priv = dev_get_drvdata(&pdev->dev);
 	struct nand_chip *chip = &priv->chip;
 	int ret;
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	fsl_elbc_chip_remove(priv);
 
-	mutex_lock(&fsl_elbc_nand_mutex);
-	elbc_fcm_ctrl->counter--;
-	if (!elbc_fcm_ctrl->counter) {
-		fsl_lbc_ctrl_dev->nand = NULL;
-		kfree(elbc_fcm_ctrl);
-	}
-	mutex_unlock(&fsl_elbc_nand_mutex);
-
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id fsl_elbc_nand_match[] = {

-- 
2.53.0

