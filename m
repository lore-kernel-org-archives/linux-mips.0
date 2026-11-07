Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082377;
	b=mTuYKtMG2UDckRozuAW8q10i11mnitKZDWIQ87aCYqPvehrD1/KgtuJOFgJIJ6saecoP
	 X1xR68jbrcHRDZMfw42UB02/7Hx2a7tJpjAIlluAdIqTis5kd7OT5uGPfWvb9MKlESzLE
	 44GSyIhQ6B+b915t9tQtFpyGhSUDkhvZS+DCzGEB3aycnddvjtJFc/mjux9xt+zshFygr
	 sYB4+xTdhQj04vKBvdPYf+P8OMO/DjK6dwbXJqHNCurqrgRAq5+vJhBsYEIgDSmdKjm7p
	 0HmQXwjNQZZufQvTdOTJceOCOctO3r9FtPDsrhsVCIRnnNW1ycxwqEZj8Eqfd0uN2Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082377;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=WZWF34gOVCDoNZBsFNBdQRVzEa1ZPBim3Drz0tOLXU8=;
	b=iNItzaCENXd+GkO5gEZla8zI5ZJlhz183Ei6EYGzhrAayHwVXqtgo06kScIUPvcJEuJE
	 K1WUhwNf75GehRqdQLII0hz4/SktAaySpKaHEQPgalAjc9NcljKTgwuTvtqIkAFP80qpl
	 +y8Mt7IYNPeTlPZivss7nTbdWhlv0hR4cDMmMNOe2XZwEcMWoFjZRnnwdvIDFK/xh2njl
	 wVZD6q3GL6350Ng5WDmXbM/C0bTzVl3BioI86rE/+1ywTbGnYW5L+GdwLL7HiYhUlm5zC
	 H9ik26o0mA5c1RfSFXtGvZVERTVDD+k34L61gX0tV3wo4i04xKlf6rXwEGZreOl9Unw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F91606D802
	for <linux-mips@vger.kernel.org>; Sat,  7 Nov 2026 20:12:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31F91606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6df0b02fe91so449448eaf.0
        for <linux-mips@vger.kernel.org>; Sat, 07 Nov 2026 12:12:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082375; x=1794687175;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WZWF34gOVCDoNZBsFNBdQRVzEa1ZPBim3Drz0tOLXU8=;
        b=XVK9CUtVULI57BDP5KWuz+j2vlAgWR7GCSN/SDYkR/Ih6kbF0fQCUTbT/8T1OcSAG0
         OmpP73qVYFMpG5d56k0eIizxytapLfZupmRLCRD6T/GWMIU3PjlqX1GWvrlr2s2tWYap
         x7m1BTlFucvOtYj4BqF0wqhrZiWlOodcHQ6MXoicd+g6PnShA7lR5bE+xbYP65A7jtHI
         kpp5P26A0QUfZdFaBuc8ifVw4CywRk+Ibjo1BZlnvQiZ/vDxPsDioQsGU6aRgQLdsl+e
         do9Zov2DjqYCCrDBCaCjWjakOrG4uZahsFR7xxJMFQDNTdqIk4nESwwsqu84o7sc1Cod
         MgxQ==
X-Forwarded-Encrypted: i=1; AKwUvBzQPKWzbFuj2ZVm0UHoACpPFIQP90eUn56v9mC6+yDtf2KEK0JC0S5onTR+TLJs6SyakPf3v6X9d/1r@vger.kernel.org
X-Gm-Message-State: APuU4Z9N3A/hzzz3O3ggN57KPU1zIZgVqyALb/ib6rs5J6JJYDvT0OIQ
	7tTJHDydTHidOuJMO8h+TqhG3sq52Meu//wN5kkWZBWaTjSGjxSee4v0L4FTx/NcZQ0=
X-Gm-Gg: AYBFou07aFM/yIW85nArSTHFmJNt3EknctKHyNZqFzudeyOdDzhjwqtbZA/aDftOEsb
	6q5Sb7I6uFX79TNFRFYHbMK5fJC4FdzA6tHP037kJe0m9sK/+gVzOFfxTButv3MK9r8aotXjigk
	zhtm4OCDBpOSioKWXGFx5xiuZao4/D59KXOKoOB96MTmqyoow21e4FzHEGXu56WtNihUYP2utPW
	owmJaTmbr9l/dfEv8XKGPHZiv3O0OmwvliI8UUmLsgwp1QRqBrRRz/+aH0K+TzIlRbGrUwQrRFI
	hDH7pNIQbPGJBhouYdPpU8DtLf2Iv5uqkVwRvyXGQtC3zZ1GySwIqhLqqyIaxnov7OixByNtA07
	bFTpk+OkB3vC7izzjM97dOespNJ2T9bw5b1QtJC/87/7UgbRCDyA27J1dJx0J/EyTmsRmmO4mBI
	CGL1bM9fj+cT2KLrmylCaxccXsWmKA1J8rh7YouTGP81WLYOYKGoEbiF+6wJDs5LY0HNTTI82SL
	yFtK7Q6r3Fr9t2WOzpEEDvfSW2wfOIGLn8lL6Kkzbk67M3slzlMpkklVPB7SFKR0k4xmANZuXBt
	nPgyRqreqSeYdViu4PfgMrZw/rWmGCcqgZ+gi7VResU0OWupuDx1+wQ2dqqt
X-Received: by 2002:a05:6820:3091:b0:703:6903:75f5 with SMTP id 006d021491bc7-71700d0c858mr1254161eaf.39.1794082375047;
        Sat, 07 Nov 2026 12:12:55 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:12:54 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:25 -0700
Subject: [PATCH 28/58] mtd: rawnand: loongson: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-28-0181ef0cc4c8@gmail.com>
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

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Disconnect the chip before DMA resource cleanup.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/loongson-nand-controller.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/loongson-nand-controller.c b/drivers/mtd/nand/raw/loongson-nand-controller.c
index 8490412d5be1..49938c7b9453 100644
--- a/drivers/mtd/nand/raw/loongson-nand-controller.c
+++ b/drivers/mtd/nand/raw/loongson-nand-controller.c
@@ -869,15 +869,26 @@ static int loongson_nand_chip_init(struct loongson_nand_host *host)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to scan NAND chip\n");
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_release(chip, NULL);
 	if (ret) {
 		nand_cleanup(chip);
+		return ret;
+	}
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return dev_err_probe(dev, ret, "failed to register MTD device\n");
 	}
 
 	return 0;
 }
 
+static void loongson_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct loongson_nand_host, controller));
+}
+
 static int loongson_nand_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -890,9 +901,12 @@ static int loongson_nand_probe(struct platform_device *pdev)
 	if (!data)
 		return -ENODEV;
 
-	host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &host->controller, loongson_nand_release);
+	if (ret)
+		return ret;
 
 	host->reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(host->reg_base))
@@ -911,8 +925,6 @@ static int loongson_nand_probe(struct platform_device *pdev)
 	host->data = data;
 	host->controller.ops = &loongson_nand_controller_ops;
 
-	nand_controller_init(&host->controller);
-
 	ret = loongson_nand_controller_init(host);
 	if (ret)
 		goto err;
@@ -938,8 +950,9 @@ static void loongson_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	loongson_nand_controller_cleanup(host);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct loongson_nand_data ls1b_nand_data = {

-- 
2.53.0

