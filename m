Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082447;
	b=K1TqxmeKonVsmclbCsqAmNqhmtlylYBFrZJEzww0G7VLCCuP6NQO4Uheep5WtShr51fi
	 92ySOwRqEhVs+2EYpedKpzZXUnK82WBfKexWov8DNNJmtR4SL3cu4vOtkDvBYN9pGb8nc
	 iEZhbYqBEfwkD0jkGxoV4VQcZ1YeD05vy3WuCb8q+Ialt/sV4Ai/euIcnBYC9IrzuAM4Y
	 9ME1WkTJk2r1UPm/FLggDUSGuBqk6DbW+N3CCT7nm+9x/J3rYitDFhb3ZklOjamwW3XXz
	 uPiixHU6Oi0AhlVtWQXYRNGBlEEelKfH8e8KivORp4YeNm5KfahleA7i+Q5v8QyrGIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082447;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=slReh3bGXbD9MmyB1S+b4Br8YbCA885gA/KmfHnbZqA=;
	b=imggAkRIMgkGI5p2/V0N40XNdRxD906qr8rtRZuqLkaQJikMO/OKqZBcLiWlGmmXzhDv
	 jtiApVQ4k2RMTIyodNR4sibrUit9wWek4YxIKN3iHXkY2H9XH6i2zo805jkglyZs+EBjl
	 btdKEAPeore/FlnujU3onieTD1UeK3HbOz+7dVLCFhzWak2bGunryWmAKl3BvLHVlK3dG
	 0I3cFxMKWBXSeQkkKa9EJZivab7jQiO7ykD5cBLHpIw0aLC4HHJMD6uqoSAlhxIGynO0j
	 I+EdFZLbRh6fF1vh30SwiuKTEIf0y3APZgDG0w7aLiqj/SvL6o8DJNcVwM+w6HLuk1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8DE60A2606
	for <linux-mips@vger.kernel.org>; Sat,  7 Nov 2026 20:14:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A8DE60A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-702fd86d674so1058572eaf.2
        for <linux-mips@vger.kernel.org>; Sat, 07 Nov 2026 12:14:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082445; x=1794687245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=slReh3bGXbD9MmyB1S+b4Br8YbCA885gA/KmfHnbZqA=;
        b=NDhPBxMJNGVwxuddmEBwtmOMja1lqxV96fZDky1WD73lLZldcajHwhAV+NNZpB5Z1X
         WhCgPzwQ5mTLahSsP3LJEDQwcHXexoGoSIN97r+GnlzZlVHPCX2EbQkprGC8NJaBd5Om
         cxb7N4WAgN/9MZ3c3W/fBA28dbP7CCxxRwF/JuJ7a9nWreN8XbDue7+b+ejna0R3tikv
         wttfWMcQ2ITBNa+AWvGs3bUUf80yOHAA6J+Lc5zn6zSs1qS9ejjEkgEeR4lV317PllPz
         6o6WzAuP068ufDbIFo5aMA9lmbiErWx1y0qdGBzyvXiqqqPbc4s1cdp46YqMM3PKmTek
         e2pA==
X-Forwarded-Encrypted: i=1; AKwUvBxilJYb9dxUnXxxcWpavib8UJQ8m6rw2F/ayZ8s32L7rWwIDe+EapCQU2qXmKYjTes3kbRSQyFcuqik@vger.kernel.org
X-Gm-Message-State: APuU4Z+XJluZRQRFpk8nc2+oia8PzIsGsrJrAzBKQEFzjbLwfwlrGx41
	JVOY0vGnctcq8V/dG8BotHhpfNxJHyYdiGAX9XF3NTaa0LWqcQdhSkyzfuruD51sC0A=
X-Gm-Gg: AYBFou2Sx6E1C0IMuVOgN57xGp3dCnYYTmk4KgHtF39wB+neLqMcmEo23aXNU/BeNDF
	OaSRdeUHZ7zeYRYrx2sW9YziEVyETLxCGjxGRKsa758BP9mrnycCBCDG683VYQCkPUttf0o1rDQ
	uYNs7zloSqxa9ThusdIqmpwX0TrD5WXHUm3E+RrEcCH8fIpWkZz6qoo8tHLhZH196sjzhXtY/RF
	kVquIAsjyf7kyc+DXl3AgqHK3S1FAjdACFAfmhQHPE9gd5B31ywLImhCTYXF7lU+QJE61sTv/eH
	2Vdgj5qL9eTF02H8JUN10tPHXVpe7OS8/lZ67qpIY1dC63v21IqiG18l13SchJsORaBnTfH3qXe
	VmYjBg9ja69Oyivv2oFIXPqfgUFJcjtReCJtc1z34jJkmVzjKyp0Xij+3qlOzXIGwjE2VUupT/S
	fM0Z6la6kL3wtT6phZ++pZ52t0ptDK0tizun/t7TPqhcZGMRg4L+Wb2mTANt3LpniJfvu3QCso3
	LieFA131KtbZOT7BYh3XLZi7onnHHs63VZqK74lHMB7f5SJB76QyQUBKs7J/tdJGccfU5GZU+X1
	MHOQVtwiSpYaso7SJGoxUpQ3RPLstKUHPWcYGP+MKUhbh4cl1wI7etYqoKKTG95Og91BNrJZ+vk
	jNqylgA==
X-Received: by 2002:a05:6820:820:b0:716:c0d5:2cfb with SMTP id 006d021491bc7-7170f1be2c9mr28227eaf.6.1794082445409;
        Sat, 07 Nov 2026 12:14:05 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:14:04 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:49 -0700
Subject: [PATCH 52/58] mtd: rawnand: bcm47xxnflash: retain chip state
 across removal
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-52-0181ef0cc4c8@gmail.com>
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

Disconnect the scanned chip on removal before the BCMA-backed hardware
state becomes unavailable. Retain the embedded NAND controller and chip
until the final MTD put, including registration failure cleanup.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/bcm47xxnflash/main.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/bcm47xxnflash/main.c b/drivers/mtd/nand/raw/bcm47xxnflash/main.c
index 4d4e185c22e5..60fc440d4515 100644
--- a/drivers/mtd/nand/raw/bcm47xxnflash/main.c
+++ b/drivers/mtd/nand/raw/bcm47xxnflash/main.c
@@ -19,6 +19,12 @@ MODULE_AUTHOR("Rafał Miłecki");
 
 static const char *probes[] = { "bcm47xxpart", NULL };
 
+static void bcm47xxnflash_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct bcm47xxnflash,
+			   nand_chip.legacy.dummy_controller));
+}
+
 static int bcm47xxnflash_probe(struct platform_device *pdev)
 {
 	struct bcma_nflash *nflash = dev_get_platdata(&pdev->dev);
@@ -26,9 +32,14 @@ static int bcm47xxnflash_probe(struct platform_device *pdev)
 	struct mtd_info *mtd;
 	int err = 0;
 
-	b47n = devm_kzalloc(&pdev->dev, sizeof(*b47n), GFP_KERNEL);
+	b47n = kzalloc_obj(*b47n);
 	if (!b47n)
 		return -ENOMEM;
+	b47n->nand_chip.controller = &b47n->nand_chip.legacy.dummy_controller;
+	err = devm_nand_controller_init(&pdev->dev, b47n->nand_chip.controller,
+					bcm47xxnflash_release);
+	if (err)
+		return err;
 
 	nand_set_controller_data(&b47n->nand_chip, b47n);
 	mtd = nand_to_mtd(&b47n->nand_chip);
@@ -48,9 +59,16 @@ static int bcm47xxnflash_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, b47n);
 
+	err = nand_set_release(&b47n->nand_chip, NULL);
+	if (err) {
+		nand_cleanup(&b47n->nand_chip);
+		return err;
+	}
 	err = mtd_device_parse_register(mtd, probes, NULL, NULL, 0);
 	if (err) {
 		pr_err("Failed to register MTD device: %d\n", err);
+		nand_disconnect(&b47n->nand_chip);
+		mtd_put_master(mtd);
 		return err;
 	}
 
@@ -65,7 +83,8 @@ static void bcm47xxnflash_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static struct platform_driver bcm47xxnflash_driver = {

-- 
2.53.0

