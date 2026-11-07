Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082426;
	b=mBFL3tRUBrWyEEIixT7Cgn16hL6EReZzzdXvxbID+ZTI3oooOoU+3WPYaIgATo6DBC2A
	 oE6EubvK9tFFuaMkwbEYhBZ/I5v1zjJPENrKBQQvfRHgK0mVWFr+APFeH9s6LLVwhSTgQ
	 dt12VvsF+/xXlHJzSLZM9liPWb4YF85CfRb1ewVhrkIEFZR0t4Y9uPp2C7NfTNlmwmKVE
	 fnqnA+4ayKFkzsdhd8ZHpWiw1pUYj9r51PmbVWI0alDOAr+Hg+udPPs69TLlgd+/6CT4+
	 879A/W2H/zqKEYHq57y5T4Aw/3CPQ89+5Vk9Sf7AKuqtE46KtxE9wJLnSfEsu8eFDjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082426;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=Hvi6UIajIglEhxrzqUdlsFCj9Wr9GC9WiHiI7xVbplA=;
	b=aZ24mydBF2c8vRWtzgCkxp9CYTRVPhH3BhasYhsf6O4DeMlL27u/LsIGBaYYctfwzjPw
	 7LXeoB12+Wj4wp4frG42JCxRpI/IhWpaXWierTx8TXSCg4Ywmeu+4lRaRlzaPIF1npvDk
	 Gvjn+o4/WPDDfNxahUS+BmO/fid2RgOhu3bVsvh+/HC0zCpV6KIUJbyLE5o4a0+UvODoL
	 jGJh6q1kFylQoneP1tQmaNx7xetsSmbv8Z3wjdkn7hs3v6wqVLUNb0vhzC8ooCcGLtCcM
	 yh1eHz23G4UnUUwUoLbUkFEzmI4cudWeis/ckudC0RzHPAVybIghx0kmRGS2uIsw2ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886B46082BF7
	for <linux-mips@vger.kernel.org>; Sat,  7 Nov 2026 20:13:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 886B46082BF7
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-8256106635eso417a34.0
        for <linux-mips@vger.kernel.org>; Sat, 07 Nov 2026 12:13:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082425; x=1794687225;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hvi6UIajIglEhxrzqUdlsFCj9Wr9GC9WiHiI7xVbplA=;
        b=M4hJPHe73krmLoy7wMhx4MTPFn/EfLR017TX8bXoyIPZdtR21tQD1S9PGyJppwAt5x
         uulCszaqmVbqdNytfJDLnPEbyILp5680CMLt6A+n9itlP7GCpRpVipC6bRW1bzo3lDZr
         SJ8DCiNSH9JjrV7VQDBTBik0344/Mul3VQc54ESOpQ3cUYlArdr9T8JCsIEvyJysNart
         4Bp/4WaY1QOt93GPSvmLEiYheQjeS610+vVmpEJWShIWQY5yPZL9V5jUhtkJh/b6Uoba
         I7IOdkZtYTphWCpmZY+SPf6eiNJKsm0Jru4NDKUKZeq2mxqvctV//kQ63zz6W7lBWoId
         J63Q==
X-Forwarded-Encrypted: i=1; AKwUvBzwTnc4i8Hnw41ZLlebtP3w6KW3q8xqCPYovCdAC0nDsrHlL4k1JHRQ2OYWqn2aGemwgnKpIrtSJGJx@vger.kernel.org
X-Gm-Message-State: APuU4Z+NaM0JSLSLojbqlsnAT8qj/YWYVR4FMDb+wcWo4JPd+u/8+SZ8
	J3q30dXRL8f+D7SWQyy5aByPIpkO0KCPNaajYFgB15hjy+gwiH5IU5AJjNJMLrg2Bh8=
X-Gm-Gg: AYBFou0Kc2GSYw/gJByt+SVkLtYpxpfsBlnfDf2EYDQn6zukZqNLiq1WvzYMWlp+WZi
	Fe2h7cCX3G2dm0QV7Q4X7cbykfY2PGvGK74sG+/gMuLLm6sG9jKIGFowh0dTx5izADj6/iHuiMR
	bZusBuwpd8fuZklzGTQrm5TyvzdgygR2a3SUIbLrEbgIGvFiQInQgbbYIMDgG7Ro7aSi9xyBYxb
	szlLXb3FP5DBKBE8jiGXF2EJgx43XtwiZr6yxvvBqVTN/Kl+FNXee4wtLONxyTIQbc3BeUu1+63
	eZ7g8RW7YdKbUVGzZDYcNHK+3ngvpDJSL9aQrFLTUB5PtrJqUz7ewYiIVidDNSbTvK7CZqJkNVD
	e4B7ng8+QtGqWxa2qUwhaYPMpzhM/68PHauTZfi8OkTz/Y3hRuEXd6yJ1JOp9gBoMiBDf8W2y+6
	8FUiGSNIsLwdp2ztY4IV63KBQeS9Gvqpr/8mfLK03Zfzlj9qRa0PhLc7kkxSoyiF1/Fl0oTunqB
	LZUAWNIvI/NPG2KKGSZRkFktWlr76Bemph2C+W5OmaPwICvzD1Zv+/VCc5LCzKrZScpvU+TdKlW
	NeDgMm+1cYs5VkVaV2LYtZzyzij4NIjOcLlXIohySSxnqiJ06ssmSq+4S1aE
X-Received: by 2002:a05:6808:1985:b0:55c:8ee:a9c4 with SMTP id 5614622812f47-567e115e036mr4539353b6e.43.1794082425397;
        Sat, 07 Nov 2026 12:13:45 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:44 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:42 -0700
Subject: [PATCH 45/58] mtd: rawnand: sh_flctl: retain chip state across
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-45-0181ef0cc4c8@gmail.com>
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

Unregister and disconnect the NAND chip before releasing the DMA
channel. Retain chip and controller storage until the last MTD reference
is dropped.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sh_flctl.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/sh_flctl.c b/drivers/mtd/nand/raw/sh_flctl.c
index 97f733e481ff..291d809d0ea1 100644
--- a/drivers/mtd/nand/raw/sh_flctl.c
+++ b/drivers/mtd/nand/raw/sh_flctl.c
@@ -1109,6 +1109,11 @@ static struct sh_flctl_platform_data *flctl_parse_dt(struct device *dev)
 	return pdata;
 }
 
+static void flctl_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct sh_flctl, chip.legacy.dummy_controller));
+}
+
 static int flctl_probe(struct platform_device *pdev)
 {
 	struct resource *res;
@@ -1119,9 +1124,14 @@ static int flctl_probe(struct platform_device *pdev)
 	int ret;
 	int irq;
 
-	flctl = devm_kzalloc(&pdev->dev, sizeof(struct sh_flctl), GFP_KERNEL);
+	flctl = kzalloc_obj(*flctl);
 	if (!flctl)
 		return -ENOMEM;
+	nand = &flctl->chip;
+	nand->controller = &nand->legacy.dummy_controller;
+	ret = devm_nand_controller_init(&pdev->dev, nand->controller, flctl_release);
+	if (ret)
+		return ret;
 
 	flctl->reg = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(flctl->reg))
@@ -1187,9 +1197,15 @@ static int flctl_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_chip;
 
-	ret = mtd_device_register(flctl_mtd, pdata->parts, pdata->nr_parts);
+	ret = nand_set_release(nand, NULL);
 	if (ret)
 		goto cleanup_nand;
+	ret = mtd_device_register(flctl_mtd, pdata->parts, pdata->nr_parts);
+	if (ret) {
+		nand_disconnect(nand);
+		mtd_put_master(flctl_mtd);
+		goto err_chip;
+	}
 
 	return 0;
 
@@ -1207,11 +1223,12 @@ static void flctl_remove(struct platform_device *pdev)
 	struct nand_chip *chip = &flctl->chip;
 	int ret;
 
-	flctl_release_dma(flctl);
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	flctl_release_dma(flctl);
 	pm_runtime_disable(&pdev->dev);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static struct platform_driver flctl_driver = {

-- 
2.53.0

