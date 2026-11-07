Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082453;
	b=rKN4LoMh8Y6LxLtEc35qZm/4+++ZfMqZrCCh7FVizB9Keoj9N/sFlwIfL6dkhUEGc6eA
	 oWQ6O6DYtyE9Brq9fhqjSNTVGb53AbbgJ3IA1+EdOGvoPs9+++gugk3GVILLmCyfL7kqd
	 6m82tvzX0mnwfFBywsxsIuhyLnttjzPYx13eebSLrRy27GJmUDuCqNzSg4C3WKRR8aUck
	 j3VjaLEHiKN5AROGGERvoe99I3+ZoQ8ZVApY5j6TdyRtZ7r0jG4v5FdIOW3gamoiZ+Kl5
	 OFIKqGMLxsnxvBBCe648xlq+A1ZsFx2QcxymXPR9BoYHP14AJAR7hP7DU9oTM61UvQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082453;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=NppZ7CUb04bxQjnUofthCMie7KVnuMp1vzpPBAm263s=;
	b=tj8zAqNCnov7AXuiK4rVZFYjIXIo9vQEOKnMABmDYngilQkzJaKmqYSVrJ2PwteyUGJ+
	 pHWHfIOTF7uM17qUzGJyoVDKm25+PY4cAQeJ2lOkrN8sVtvvh18cLiMJtZXfh6T4YQa3D
	 /JXlIifTnfWCAZsQkehvMraO5RZhECl1bqv4Wg5EAnf8wFvADQ4nf71k66upOBqeYiypb
	 Hq0KSSqYQVQz7B2V12K2LLEvJ+eYPutCW2KGV8WXUU5SHiFgm99ztJGDQ5O6N6qI44Ipe
	 rgHlGYtdPdVdMlhCoMY5Di6BX4B7IBrkd8F+3UhCNXiyD0U0IUMvrGLqSS9+d8ddibw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829E160A2624
	for <linux-mips@vger.kernel.org>; Sat,  7 Nov 2026 20:14:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 829E160A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6de1fd5f572so671627eaf.3
        for <linux-mips@vger.kernel.org>; Sat, 07 Nov 2026 12:14:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082451; x=1794687251;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NppZ7CUb04bxQjnUofthCMie7KVnuMp1vzpPBAm263s=;
        b=FXajfvrcY/M+NvI5KjdazMw3XzF55cK+CVlbohFW/V1Qfyjs7ZOp1FUgXPW0wROu2M
         kLOWA7yJXppfjcKVi2UtyGKwkksiOYSf4K3QnjvPleUovX9+81BOkRbBh10sFf0Wz11y
         tkaZhZC1o2kCyNV711K3m8IcQiWR5o9U4PT0NWlP/OProDRnAu7Df/SJVNbuisdiodZB
         dqCee+PbQ0Q+ZBkfrKw0QvGJtgi3CDoSNqTlkSr0NHgo6nKnXDjJZGSUF1F/05+LPeQ0
         RgtVoxEsBOKVV9aguEcYfj8uOy9Ag4QYP0Q9aL7ls19pquIPPThDsjlnL/mrGOn70By0
         qVdQ==
X-Forwarded-Encrypted: i=1; AKwUvBzo7xU6XrXmAIk2e00BcWVDiTEEt/sLqDcBRvpftahBz4wNzcP3bmYpnzmdqeUhzDZ+IcrRSXjLliH1@vger.kernel.org
X-Gm-Message-State: APuU4Z871Tcnr4dQQfU7LpUOem8QIXD9gk0rcP4LvuuAkDmHK8ztAkrq
	BYcGradiJ48swdqfkd2Q8X1Ima6tuMZl6XSFCFgCUDikgI7YEFD2iJtqXphbeRchxr0=
X-Gm-Gg: AYBFou0oRhEgVJvzAWJQBpD77QugL8udqrB8lRbI6NJGi0yzjBLydptITe1j0Yd65xy
	+pHFdCWEUq8nJi3U3EXS9fd8SkJGkJ77fbE/X7sZXtUAvhwgJwnqOHjU6u83iIce84+nisKcvsY
	y1nWrF1crddMdU4jtxKf9Gw5Lt7cO5uqrUEpF2D72M9CWTRQcWdiy0lkDkdXUdbKAJ9xmjQJWIl
	Opt0Re1tLaRM/Kji31y4KK123Ie2FapO6QQeXc4y4Q7ojRZV/paFvzOCqMyIo3+iGy7a0xWS/eP
	vD2CW1Q6vhRk5J73WRH9/334YHkIT5zn/GPu7RFhowsyUjAS4cjHSnIwKn29oIMksJBJmIm+T3Y
	+IbxyMjPnwkxz+LOu0mg3vZdtoUF9dXvsYr8zAUauVby5Ga3m1E6TQrunJb4EVvN08BemawRaPR
	QSvnQyRPNZ4R8iBPBApWZ1DREEamQtvCiw/3zR+Ecx+kjVyAkTOTlxsM3hqX6c3vjFFuTUIvXz4
	WXsLCkw8u9edgkJA/IkrBR9ekPBw6v4tkMeGYobK5d0tEoTjZexdnucxPQe2fFXlmXuE/Ns6sbT
	7qLVFVMA17lIEVBvoRTrvQpuzU92nm1ppsyVXKgE/8frgv+7ztTsb3JvdKwr
X-Received: by 2002:a05:6820:440d:b0:703:10f3:89f1 with SMTP id 006d021491bc7-7170f2cf793mr13093eaf.40.1794082451391;
        Sat, 07 Nov 2026 12:14:11 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:14:10 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:51 -0700
Subject: [PATCH 54/58] mtd: rawnand: fsl_ifc: retain chip state across
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-54-0181ef0cc4c8@gmail.com>
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

Separate active bank membership from ownership of the shared IFC NAND
controller. Retained chip references keep the controller lock and chip
metadata alive after removal, without retaining hardware mappings.

Disconnect before device-managed resources disappear and drop the shared
controller reference from each chip's final release callback.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/fsl_ifc_nand.c | 58 ++++++++++++++++++++++++++++++-------
 1 file changed, 47 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsl_ifc_nand.c b/drivers/mtd/nand/raw/fsl_ifc_nand.c
index cc75b6a67e07..18b747e73c3b 100644
--- a/drivers/mtd/nand/raw/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_ifc_nand.c
@@ -40,6 +40,8 @@ struct fsl_ifc_mtd {
 /* overview of the fsl ifc controller */
 struct fsl_ifc_nand_ctrl {
 	struct nand_controller controller;
+	struct kref refcnt;
+	unsigned int users;
 	struct fsl_ifc_mtd *chips[FSL_IFC_BANK_COUNT];
 
 	void __iomem *addr;	/* Address of assigned IFC buffer	*/
@@ -961,11 +963,33 @@ static int fsl_ifc_chip_init(struct fsl_ifc_mtd *priv)
 	return 0;
 }
 
-static int fsl_ifc_chip_remove(struct fsl_ifc_mtd *priv)
+static void fsl_ifc_controller_release(struct kref *ref)
 {
-	ifc_nand_ctrl->chips[priv->bank] = NULL;
+	kfree(container_of(ref, struct fsl_ifc_nand_ctrl, refcnt));
+}
 
-	return 0;
+static void fsl_ifc_chip_release(struct nand_chip *chip)
+{
+	struct fsl_ifc_nand_ctrl *ctrl;
+
+	ctrl = container_of(chip->controller, struct fsl_ifc_nand_ctrl, controller);
+	kfree(nand_get_controller_data(chip));
+	kref_put(&ctrl->refcnt, fsl_ifc_controller_release);
+}
+
+static DEFINE_MUTEX(fsl_ifc_nand_mutex);
+
+static void fsl_ifc_chip_remove(struct fsl_ifc_mtd *priv)
+{
+	struct fsl_ifc_nand_ctrl *ctrl;
+
+	ctrl = container_of(priv->chip.controller, struct fsl_ifc_nand_ctrl, controller);
+	guard(mutex)(&fsl_ifc_nand_mutex);
+	ctrl->chips[priv->bank] = NULL;
+	if (!--ctrl->users) {
+		priv->ctrl->nand = NULL;
+		ifc_nand_ctrl = NULL;
+	}
 }
 
 static int match_bank(struct fsl_ifc_global __iomem *ifc_global, int bank,
@@ -981,8 +1005,6 @@ static int match_bank(struct fsl_ifc_global __iomem *ifc_global, int bank,
 	return (cspr & CSPR_BA) == convert_ifc_address(addr);
 }
 
-static DEFINE_MUTEX(fsl_ifc_nand_mutex);
-
 static int fsl_ifc_nand_probe(struct platform_device *dev)
 {
 	struct fsl_ifc_runtime __iomem *ifc;
@@ -1016,30 +1038,35 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
 		return -ENODEV;
 	}
 
-	priv = devm_kzalloc(&dev->dev, sizeof(*priv), GFP_KERNEL);
+	priv = kzalloc_obj(*priv);
 	if (!priv)
 		return -ENOMEM;
 
 	mutex_lock(&fsl_ifc_nand_mutex);
 	if (!fsl_ifc_ctrl_dev->nand) {
-		ifc_nand_ctrl = devm_kzalloc(fsl_ifc_ctrl_dev->dev, sizeof(*ifc_nand_ctrl),
-					     GFP_KERNEL);
+		ifc_nand_ctrl = kzalloc_obj(*ifc_nand_ctrl);
 		if (!ifc_nand_ctrl) {
 			mutex_unlock(&fsl_ifc_nand_mutex);
+			kfree(priv);
 			return -ENOMEM;
 		}
 
 		fsl_ifc_ctrl_dev->nand = ifc_nand_ctrl;
 
 		nand_controller_init(&ifc_nand_ctrl->controller);
+		kref_init(&ifc_nand_ctrl->refcnt);
 	} else {
 		ifc_nand_ctrl = fsl_ifc_ctrl_dev->nand;
+		kref_get(&ifc_nand_ctrl->refcnt);
 	}
+	ifc_nand_ctrl->users++;
 	mutex_unlock(&fsl_ifc_nand_mutex);
 
 	ifc_nand_ctrl->chips[bank] = priv;
 	priv->bank = bank;
 	priv->ctrl = fsl_ifc_ctrl_dev;
+	priv->chip.controller = &ifc_nand_ctrl->controller;
+	nand_set_controller_data(&priv->chip, priv);
 	priv->dev = &dev->dev;
 	priv->vbase = vbase;
 
@@ -1071,12 +1098,19 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
 	ret = nand_scan(&priv->chip, 1);
 	if (ret)
 		goto err;
+	ret = nand_set_release(&priv->chip, fsl_ifc_chip_release);
+	if (ret)
+		goto cleanup_nand;
 
 	/* First look for RedBoot table or partitions on the command
 	 * line, these take precedence over device tree information */
 	ret = mtd_device_parse_register(mtd, part_probe_types, NULL, NULL, 0);
-	if (ret)
-		goto cleanup_nand;
+	if (ret) {
+		nand_disconnect(&priv->chip);
+		fsl_ifc_chip_remove(priv);
+		mtd_put_master(mtd);
+		return ret;
+	}
 
 	dev_info(priv->dev, "IFC NAND device at 0x%llx, bank %d\n",
 		 (unsigned long long)res->start, priv->bank);
@@ -1087,6 +1121,7 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
 	nand_cleanup(&priv->chip);
 err:
 	fsl_ifc_chip_remove(priv);
+	fsl_ifc_chip_release(&priv->chip);
 
 	return ret;
 }
@@ -1099,9 +1134,10 @@ static void fsl_ifc_nand_remove(struct platform_device *dev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	fsl_ifc_chip_remove(priv);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id fsl_ifc_nand_match[] = {

-- 
2.53.0

