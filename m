Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794079359;
	b=rPDZcYs7qBHWCyvWoOIGxSMavwg9p+SgpdAAVtXF6wR6v6c7BQaapi5FScdoObJzA+3X
	 xNQWNxjHzUE927qFDTCobdFqSPMENt87zSo0GqEctYNLiYLAaXq8jG3ehIiMfmzbIATjs
	 5bOEuhrs5435cbeR4ude/IJTnl8vbQQ3Dst7u7/5tuhDR6hvmFZIbf7yu6pmT+gCmgHi4
	 5cVcwdHOZyyW9YdLvAMmYqyvZMqEKU7uN0Obm8pdVam4Qwa96G6Ozuc0uCKCzSaC1T00O
	 tAOmzcR2YvRsrbVqsStnnpdRxEmjeBLbaU866n3UzGeUI/VQQTB92Ah+f0Fi3A4kFgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794079359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=/IYxRQsQO6UsoPYARG/MQ3DRm7b0plb/fBLBgAtsE5Q=;
	b=1iijPL4NDmB3EzvVcfBIjQhdJbxk0COx59eW72pGDRgJAImQMzYpeCgK/+apUvPOc200
	 ZGCYqT9ehTZYX7NQD/NqdBCuzaft6/dBrITpnZf575pMp6uxQnpXPP96LQfMb3oUls2Xi
	 oIpztj775NeP/jVB0i/QC+0TWKSyNEg/SA/L/jCiArP/okNX1t1/ykcfZqGVR/VapeqR7
	 C7UfC89lMxLyY2pSw9FpBrL73s7HhNYG1BpmEWOuhQV4grrdu6iclPK0IOMKSbg3plA69
	 3a6YK/OCDjx/SzIS26aLmg17xadkdjAArGKd7jCe+PgfpGH/GRgllnpGFqi65VuiCAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FPlZPym2;
	arc=none smtp.remote-ip=209.85.160.54
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7B5606A333
	for <linux-mips@vger.kernel.org>; Sat,  7 Nov 2026 19:22:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C7B5606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FPlZPym2
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-4ada9579947so763926fac.1
        for <linux-mips@vger.kernel.org>; Sat, 07 Nov 2026 11:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794079358; x=1794684158; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/IYxRQsQO6UsoPYARG/MQ3DRm7b0plb/fBLBgAtsE5Q=;
        b=FPlZPym2uXrEKfatPBCADeNjTybQJXizuucFUnEvjPFiQrk6RFjrPRRUf1c8C5HjUv
         iXSgKpx/eBeS+qItB9pkvi+lNcHf7Q/wk7MEj9Kb2lKWJnOgMbFnOG5ICVIS0r5EHGIP
         RuADCBkJKpCSptLef/054xG9ggEVUmwk8VNM39oJ3gStkDC0OeWpFXYAeYlyigfr4H/b
         pKZui1WlPk2zpYfKnOuQWi72Uk9yPBltOwq1N7CizXvAjbtVORCyYiSWP/4BDldotP6W
         fwGkCRB7dN5Jml7MzkLdrUjqC2HxRmqEWBQCzVDwKV7m6aPWoi6uVqIBecfAwGO3jSod
         YcRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794079358; x=1794684158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/IYxRQsQO6UsoPYARG/MQ3DRm7b0plb/fBLBgAtsE5Q=;
        b=cCJ2kJlFbyFR5aUGZm+bce74C6wZ4eJFr5zsxzhq8L8OokWxdS3ExNr4D/EBb6uqJR
         oRQimMtH8jys4Wjqu5+WiMWffvyYoB7XZPwcLlSKiYyEkNNs1PYoBdIbxUya9KIK0tcD
         CBIageHvGNRpxZ9u55bOzoXVFU2/2K26M78VbeKzz6OyE/zdIT4vT0LuyJzh9SgbiQK7
         hDoakxUerL3bHqj9UOgivW6YhPmlPAeFb+DvR52ldt/4zeQF9I+sNkzCGE9QFMSIAAfe
         efPXwyPbYgvUwJfQreTdtp6yKHx3qcbJxfyL2cqpgd/i72esi/2kgD5+O78t+ifEo23N
         O/eA==
X-Forwarded-Encrypted: i=1; AKwUvBws+gZfCe7jx5TJVHHn4AtxiQCm2ReuSY+3iKvP2ecNAbXSudqpZZ2wlNRFDWmx2EZsFcaPyhpqIJe9@vger.kernel.org
X-Gm-Message-State: APuU4Z9BczrvD/LfbX0gfqlDjS9F423P43zlP536fIi2fK0am8oWLh2p
	bbCIzhjN8BJ8jPBg40jmu75Ggds6IGnzJcHvlyJLgR5m7rzL1btTG4i/
X-Gm-Gg: AYBFou2WVzog2m/qqrAxWr4LYFMA7PO9Mw6fjKcNWiqlFhncSWtiGFSsBM0BQYi43b7
	/9frxd047wFbXTwcekxnuO16XAHUDQ+Mg5J8C1w5JSoOTjWWnkS+yLEUU99ziGgNZ+R9rTIaqFZ
	JV9koTf8/eOp/VrgYnYDEEHKySVHdw3w00zYgdN5pCQf30RoleOxi6Efxv+JvYI8NzIwjftQ3Z9
	zVKy8IimolVKWneguWpbyHFbiZtKA4dAQxxWdLlwEG7bC0UHmD/yEhTFCeWPiIGTF6fOtKnnpo5
	R5lqPMrHuLcxaVYdv+mk/Mogd0OUXxLsL9zY7d9eDu3qW7nu1ipKj5L6ODYjf8kALLmvp7W3Yyn
	o66IX3ZIHiqcW4JGh7vfpcf+vR4uD13uPdD5DP6QbCNHsI5aOf8SlL71HlIT05yCiJM/Uvo6m50
	Oe/Jay3Y7aZTosi30nr8i0JDEFgxSFJGO0K16q08UwXY6JojLbKqaZnJpMyZaJejsqtoSRgkpLv
	xw7RYZhcU4jJodLgKS+Mhw6I/LwLZBL8Mx1Hff6X12IcpYlmrcLp51S68iZrCdq6IDq9ISnBUa3
	/85+ybaZZWzXa/eGnn15FgnqnpgjLQzpJjcdlSD/OlkKsuaHR22O5jvJhLm+huSZiKHDWBZbpZW
	VkCTsm6vxrKBZdejnb0suAjX0t5+CZr/Rp7TOQ2zHjfcWuzFHk+7p2GyP+8bkZm0C9vJtqkhwlC
	nIZWbWl2owla+yN+oDrMXaO3QSl3dWAe78TVDHZoh0V6ERkpzhr8OMaw==
X-Received: by 2002:a05:6870:e091:b0:49d:c88d:8bea with SMTP id 586e51a60fabf-4ad98e66b72mr4108041fac.42.1794079357895;
        Sat, 07 Nov 2026 11:22:37 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade647f559sm167644fac.2.2026.11.07.11.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 11:22:37 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:23 -0700
Subject: [PATCH 26/58] mtd: rawnand: vf610: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-26-0181ef0cc4c8@gmail.com>
References: =?utf-8?q?=3C20261107-submit-rawnand-retained-handle-lifetime-v1?=
 =?utf-8?q?-v1-0-0181ef0cc4c8=40gmail=2Ecom=3E?=
In-Reply-To: =?utf-8?q?=3C20261107-submit-rawnand-retained-handle-lifetime-v?=
 =?utf-8?q?1-v1-0-0181ef0cc4c8=40gmail=2Ecom=3E?=
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

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Keep managed register, IRQ and clock teardown after chip disconnection.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/vf610_nfc.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index 9940681810cf..903a25c549d8 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -805,6 +805,11 @@ static const struct nand_controller_ops vf610_nfc_controller_ops = {
 
 };
 
+static void vf610_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct vf610_nfc, base));
+}
+
 static int vf610_nfc_probe(struct platform_device *pdev)
 {
 	struct vf610_nfc *nfc;
@@ -813,9 +818,12 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	int err;
 	int irq;
 
-	nfc = devm_kzalloc(&pdev->dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &nfc->base, vf610_nfc_release);
+	if (err)
+		return err;
 
 	nfc->dev = &pdev->dev;
 	chip = &nfc->chip;
@@ -873,7 +881,6 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 
 	vf610_nfc_preinit_controller(nfc);
 
-	nand_controller_init(&nfc->base);
 	nfc->base.ops = &vf610_nfc_controller_ops;
 	chip->controller = &nfc->base;
 
@@ -885,9 +892,15 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, nfc);
 
 	/* Register device in MTD */
-	err = mtd_device_register(mtd, NULL, 0);
+	err = nand_set_release(chip, NULL);
 	if (err)
 		goto err_cleanup_nand;
+	err = mtd_device_register(mtd, NULL, 0);
+	if (err) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		return err;
+	}
 	return 0;
 
 err_cleanup_nand:
@@ -903,7 +916,8 @@ static void vf610_nfc_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 #ifdef CONFIG_PM_SLEEP

-- 
2.53.0

