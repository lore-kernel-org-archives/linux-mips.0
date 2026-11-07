Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082462;
	b=MosSGbpO+fEuswPvd6JTQmTw4QYQoppW9WlYaoET/4Sg8e/trZot+kcN35I2YlBLUUHL
	 ItX+feAEfCZhT71pYvBbOEBhbxjWZgyf+RSHk5xyXW3Jtw6E9jaP50v0wvCHge1vC/MW6
	 db0ejx1v2Nw/nCAPZdXh+36heqY7AVxAJDm1CnIeKQ5uAHpVf5BQiIBdRL3QFV/uIoUBL
	 3sLK0Ej5G1XQoG1qca9+5NTPpNYFpsMPcK5RhWrDUbfN7vfiGsKfuyz3bpiYCyS3CkGYh
	 7nkSvtVzNNiI2LzrLMOQY3TMIISFi0/R5nxf6Mg1xvl1MvtcHs6c7rx33KI5e64sGyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082462;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=nxY1HbO6C2RfpZ036fxI7eWu/qhT1X06/xSohH0ZsQg=;
	b=MWX3O8dG0rHKOxSZ+zC587JJZ9jVR1AibB62qq/SrQq/cB5YKs4j64QnLocc6JvDG/hC
	 GckDel3qDi6fxTt3VqAllmvmZ1SmWGtZabyK0guVtjsAC2HA+zoebshcbWwruGbq3eb12
	 Q3UyG60xM8DuYk1ZaukLz5+fqlKuMdYc6T2nbh6uf+4PwGbIorUnKemP8jZ2uauTrUym4
	 xndCCAgULDCAbByWNO4Br5DNVzAnvGblBmwmsc2n/wEcSvzJVN2SKzgkSYBJP2WA8Bnvh
	 L6YNTR4UV/My7IHvJVJ/c2bR5moFNfBNXAmv4EQoh6zt4TO+IJTMGi0qCam9q3T++6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.160.47
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686F46083603
	for <linux-mips@vger.kernel.org>; Sat,  7 Nov 2026 20:14:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 686F46083603
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-4a85c656c58so3009fac.3
        for <linux-mips@vger.kernel.org>; Sat, 07 Nov 2026 12:14:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082460; x=1794687260;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nxY1HbO6C2RfpZ036fxI7eWu/qhT1X06/xSohH0ZsQg=;
        b=AdicY/RTxto6SLE/XWnpr8DFdy84PKLpBe7nW+H4KIAnHsDD85m5mxtD1cZQR/DCJC
         VuuNU/CtINt9Hb9PEq3Q3fX//LFE8+c4qxaAQ7iQK6c3qx4lbEJWFL4ulgclwUmxdkP6
         eH6f8wIga3QXjOPnz77p3T49PAQ9mkw9bIQgkVeS9NRzE0Ld+lMRiZwrUt4uZdlD9KM9
         71gBU7gxW0QNivJHv7EkzDaNRztK5Q1s2y6tOhVmo5E6ZVxLk40ClNerq1TkqChqssvb
         0T4uty8LIxlGvZ485MX5bPdOdXboAEayqBe6byA2zlayYpGZ703YrsrwsCgoqHXCpszn
         ZHoQ==
X-Forwarded-Encrypted: i=1; AL+hErGz6kGpZ52Ux/exgq4qaUM/cJWsp61EZvVJEhiSbrFmhz8uaMQC4AeDs/EehWRnF336Wdt0QEmffNwi@vger.kernel.org
X-Gm-Message-State: APuU4Z+yajZY9eNBdBTihQRndeOQfG0G+DOUmcQlLHirVBAkkJ1hMH2L
	NT1clUPZ/t6mRbRMX1+HLKXxFsqW0p8yQZ1Y0wXEqnWeOzjRDl/5yOC+Mu7cYrZMpBg=
X-Gm-Gg: AYBFou0mLu8DmEd36rnL6izgE2kUyNo/bCwaA8wVjfM3BT2ZPus9dObhGCG1K1acuHt
	+kHeT6syPeiHsiyjG9TQroLcwOTJngw8SOR6RNN83iJRFqNOBVYFS1atBnJM2x+Wf6qXcXN0dNC
	rY9R/cZHP6ARakNZBAzWkLZ1uHEzsLEqZTflC5ZXZjhxTChG0BiAAt9jLYg0WJ5trJ8Wb3TQrt5
	8Mj+FZx4czYz9oeuMlQLbTUSYlIZbJ25gPctrrX34ApjF/JWKggATxrl0RQh2xtlvAZ0v9HML5X
	3VA3uSJ688fFQ/yDKbbsYEt3cteKuNlvv5aeO1U580I/DpLAQNRhL5QsGwul5moKfn1RdrFNeYx
	O+t/jvUMYtyc58NsJjEYYw/6kP8Y7KrVdhMl6guOzUthx5HDniip0KWJDOGPis0uPMHzTse9fiG
	wJxAMNEHhSgOwDQBe9zlsKf79vk+I/fTlgXtH3OEfVlf8AWyyhS/kMhuNP5oxeSBWxDkbSJESlD
	kaeQvvcs4JjdhzH6syhlYY02fPYG0RiVoLXwpxbvuRo9XY7KZXeMO7g5BDef41mxImp/nuBb7c0
	i/I/ErVJ1XskC60RcxhJcS28ikxi6RhdWqDEHPRBn7gEcLRzEGMipKECslbd2g==
X-Received: by 2002:a05:6870:218c:b0:4a7:4a8e:237 with SMTP id 586e51a60fabf-4ad98ae42cbmr3680833fac.19.1794082460109;
        Sat, 07 Nov 2026 12:14:20 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:14:19 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:54 -0700
Subject: [PATCH 57/58] mtd: rawnand: cs553x: retain chip state across
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-57-0181ef0cc4c8@gmail.com>
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

Keep chip metadata alive while MTD device references remain after module
removal unregisters the device. Disconnect before unmapping the
controller, and release the backing allocation at the final MTD put.

Check registration failures and release the corresponding controller
without leaving it in the registered-device array.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/cs553x_nand.c | 46 ++++++++++++++++++++++++++++----------
 1 file changed, 34 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/cs553x_nand.c b/drivers/mtd/nand/raw/cs553x_nand.c
index 0b872b1e3b04..7419308a740d 100644
--- a/drivers/mtd/nand/raw/cs553x_nand.c
+++ b/drivers/mtd/nand/raw/cs553x_nand.c
@@ -257,12 +257,18 @@ static const struct nand_controller_ops cs553x_nand_controller_ops = {
 	.attach_chip = cs553x_attach_chip,
 };
 
+static void cs553x_chip_release(struct nand_chip *chip)
+{
+	kfree(container_of(chip, struct cs553x_nand_controller, chip));
+}
+
 static int __init cs553x_init_one(int cs, int mmio, unsigned long adr)
 {
 	struct cs553x_nand_controller *controller;
 	int err = 0;
 	struct nand_chip *this;
 	struct mtd_info *new_mtd;
+	const char *name;
 
 	pr_notice("Probing CS553x NAND controller CS#%d at %sIO 0x%08lx\n",
 		  cs, mmio ? "MM" : "P", adr);
@@ -309,6 +315,13 @@ static int __init cs553x_init_one(int cs, int mmio, unsigned long adr)
 	err = nand_scan(this, 1);
 	if (err)
 		goto out_free;
+	name = new_mtd->name;
+	err = nand_set_release(this, cs553x_chip_release);
+	if (err) {
+		nand_cleanup(this);
+		goto out_free;
+	}
+	kfree(name);
 
 	controllers[cs] = controller;
 	goto out;
@@ -344,6 +357,7 @@ static int __init cs553x_init(void)
 {
 	int err = -ENXIO;
 	int i;
+	int registered = 0;
 	uint64_t val;
 
 	/* If the CPU isn't a Geode GX or LX, abort */
@@ -374,14 +388,22 @@ static int __init cs553x_init(void)
 	   do mtdconcat etc. if we want to. */
 	for (i = 0; i < NR_CS553X_CONTROLLERS; i++) {
 		if (controllers[i]) {
-			/* If any devices registered, return success. Else the last error. */
-			mtd_device_register(nand_to_mtd(&controllers[i]->chip),
-					    NULL, 0);
-			err = 0;
+			struct cs553x_nand_controller *controller = controllers[i];
+			struct mtd_info *mtd = nand_to_mtd(&controller->chip);
+
+			err = mtd_device_register(mtd, NULL, 0);
+			if (err) {
+				nand_disconnect(&controller->chip);
+				iounmap(controller->mmio);
+				controllers[i] = NULL;
+				mtd_put_master(mtd);
+			} else {
+				registered++;
+			}
 		}
 	}
 
-	return err;
+	return registered ? 0 : err;
 }
 
 module_init(cs553x_init);
@@ -392,25 +414,25 @@ static void __exit cs553x_cleanup(void)
 
 	for (i = 0; i < NR_CS553X_CONTROLLERS; i++) {
 		struct cs553x_nand_controller *controller = controllers[i];
-		struct nand_chip *this = &controller->chip;
-		struct mtd_info *mtd = nand_to_mtd(this);
+		struct nand_chip *this;
+		struct mtd_info *mtd;
 		int ret;
 
-		if (!mtd)
+		if (!controller)
 			continue;
+		this = &controller->chip;
+		mtd = nand_to_mtd(this);
 
 		/* Release resources, unregister device */
 		ret = mtd_device_unregister(mtd);
 		WARN_ON(ret);
-		nand_cleanup(this);
-		kfree(mtd->name);
+		nand_disconnect(this);
 		controllers[i] = NULL;
 
 		/* unmap physical address */
 		iounmap(controller->mmio);
 
-		/* Free the MTD device structure */
-		kfree(controller);
+		mtd_put_master(mtd);
 	}
 }
 

-- 
2.53.0

