Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046615;
	b=li/VvpxXjGSFuJCkUNNmwJElRQy14TrljUC0iy59SCyliehEluq+6yYGUSXTlImzIywJ
	 mqTFV7dZJ4EIJ1IjM/Iq3Xk+msdwjtUwLt0TYyMwIcyaa/b/H/h0Jo8AcZJ1/8crb4EsB
	 UAh6gy+0nYhf8Bw2g7iH9h/JlN4/gMIu0iK+jiC+DP09H/jTk6TCVT4udpYxtilZfAePG
	 VY+DzvhsQyuh2PrAT8H8wsXdgUtWE38ywuCiRaGjXyKHNNOWeW3SEs6gbYaqgTufLFTLy
	 NC/BTwbgRmgx3I0YEb0hF6nRKVYEuGv08c4Mm3I6e0MjZMYOgzw+25UW05vPG8Essuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046615;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=nOgljHqd0FWVe1HwSz1vk6dLQKeQBi/kBxtLolOT7n4=;
	b=VOfiYn9H6XOCHp2vOvX0+36Hbm0fRnVCzBlWia7aAHKBM6q3xNShl5k2UDHTqBXHeq61
	 JweJR2meCxfnDnl68ueZDOa6sSTDJ/OqvMtoH7vURchdlBGnXs+tQ2AaumMGjc5NyzjUk
	 kk/ujNjcVwXJCR7HZlWHBH89CAfPNEi8l2DyaEosaXsd8Sa5FbMqRsS3PbB9STQNEBrdK
	 CL7OVZ4nI3/qr6EUXDiWBDlwfw483teFDj0RGFzabINcFuKxsBYK6bf8poQ4yaLmYd7hG
	 R7nAM28E/7SSvbaj3auk6m1pOZFujgcBPB3jmmjhpZE7E76kQhbx5km2VjIWspWVcVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="m/KgnUmB";
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB538608362E
	for <linux-mips@vger.kernel.org>; Sat,  7 Nov 2026 10:16:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB538608362E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m/KgnUmB
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-85a5455bd3cso839924a34.3
        for <linux-mips@vger.kernel.org>; Sat, 07 Nov 2026 02:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046614; x=1794651414; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nOgljHqd0FWVe1HwSz1vk6dLQKeQBi/kBxtLolOT7n4=;
        b=m/KgnUmBA9asMUd0f0fu9UeNymkB/zCExsUaYUMGeN6r95uexyBk+TMkbG8BeO3Ez+
         CdC/bmx+/IXfizSS9hcG1E/NGlARwrW/GK7EwXhOg1Uf5A2SK5aF4hkUPKSghGVsYx/j
         sIVpJFKIEWVnQu5zwkOsQTZkfBkuifslXmYrslqkh6QFjRPptfQrEx4oo4bAADRxLxg4
         qic/s7aSXW6UlzuCdi+mM9REj/pB75p1MCwYgskiKBT/crK80LQSJCnALeasHJmdeDFG
         H4uA/oxHTe5Hkm/J7JBKz2XlUIMzGHB4KrrYhzZzZ5fKKDW27FRg0GJag9Z+A4/oXoO4
         U7RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046614; x=1794651414;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nOgljHqd0FWVe1HwSz1vk6dLQKeQBi/kBxtLolOT7n4=;
        b=M2W/KUoJ9b7z+FPO1KYEGVd/9UmjXkphp/S6z+9aFt9Bg9eCBgXdbIg2P73GXfHR3F
         EVBUp5umH63pStCMlsc7dvCg4Ohm8G7x+vs9/jjVt8PaoOU5kDn3+JqMvIdBuUMUKhds
         p15c6UybY3DKhu1pCAH5z9ltz5RzjpbICsiLfXyXCTAZzKAv2mHYdyInsospn1x6d6gA
         qj7ilTeMxD0O7ZCyikTJNbAHcF6ZW3ZY9tWtvi7pdp0NiLXyvqaXoObiz5DDSBHZNA39
         f+cfm5jQuyyVDklHt32ZG7kQ8gLXsjre1YNAyxw6G6FNeqcH8sikoP7uS+F+t41DJPq/
         td1g==
X-Forwarded-Encrypted: i=1; AKwUvBxZv5mIcnBfrmlqyXtJ20gg78JSQPD85OZMbJHYEop1K4Obht8IlzVg6RIbZRmgLWInoZOaomTBvPpw@vger.kernel.org
X-Gm-Message-State: APuU4Z96aNZxDOXWV+UcRDbE9o9GtA9Lz3tsoVWeDOW2dWLGbaCySqv6
	HJAh3GBPfbdJICC6k+WtR6suyTy2c5iWBPnh22Uh7RihW1Q+pegUD7SC
X-Gm-Gg: AYBFou3naAOzicu13G/cvq131HJiuz+ExtpTv7+64vnpkWYOYPzGNL/xxFJ/zDxjUie
	SRHjEzqrvO2K2Ac2ium9dcgULCXBG68N0kPVuofLYCOn4CZuvrsgCnQI+DlMbT8Q+AxsPBKZ7Z2
	BJ9FxvOM+4DiAAgmdnYvc/DejtaqEmj6c9q8OfC4MY6C29gXPe2mwAAvpvtyOvopbrHMoBWNRMg
	MTPasfrObzDbqWov9HgYpQjv3+KIF4nzVkvEm269EY3dr8Bdy1XVyxJcxua1OExp3yXvmAv9HH0
	Mj98veiFWkA730P+vR7tZVcKx4nzOAOnAnxG7eFEfRyPyZlu2Ebt2m2NgSsiIz8YdgbrMVExxMx
	LS27yZuDSlPaPQelVoLYTFYxZ+VtF4hitLuOFb9kA8vzo2mzyjExFZF3yved5jg+lhHmsm7bg1K
	QBoaPrDLr2vDqRvCpudUK1L7fhEmNXomtwB7yccA0FQlwPWHHAoO0OGno8fOrbU6Pw8K3m2Bdxb
	i8CTWeSMguH4yDqrsmMPZ2vFkDc+qsEhhVMFMpaq2ddy2zLK/5XHk+LuUYC3ivM/p/I2vcuNall
	DeDsFpmZJQQtFVb/75rlTtCOL+0Xyc4Odwu7WjBJxkUGWGQwqwCwnKW/F9Xo3gNdciOAw3IFHJP
	JTY2FYB/aWO1CUpdJdGyf2W7RNDZ8XZqZDXo3Bn0e/E8yooNCZ/dhlvk1MgTwgav62vUOqpfMdf
	9koNEbmUSwtmhM4qRzlyAAbX7ja3TxtSepcfDUgHOPslpXXjbq1Bxy
X-Received: by 2002:a05:6830:640e:b0:814:8259:780c with SMTP id 46e09a7af769-85f1d012c2dmr5221596a34.19.1794046613684;
        Sat, 07 Nov 2026 02:16:53 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:16:53 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:07 -0700
Subject: [PATCH 10/58] mtd: rawnand: stm32_fmc2: retain open-handle state
 on removal
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-10-0181ef0cc4c8@gmail.com>
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

Keep the embedded NAND chip and controller serialization state alive for
MTD references that survive unbind. Disconnect operations before
releasing DMA channels and scatterlists and asserting write protection;
defer NAND metadata cleanup and controller storage release until the
final reference.

Preserve immediate cleanup before publication and use the retained
lifetime after MTD registration has been attempted.

Fixes: 2cd457f328c1 ("mtd: rawnand: stm32_fmc2: add STM32 FMC2 NAND flash controller driver")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index 9f42f8ab3212..4b89094c89e6 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -1902,6 +1902,11 @@ static int stm32_fmc2_nfc_set_cdev(struct stm32_fmc2_nfc *nfc)
 	return 0;
 }
 
+static void stm32_fmc2_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct stm32_fmc2_nfc, base));
+}
+
 static int stm32_fmc2_nfc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1915,12 +1920,14 @@ static int stm32_fmc2_nfc_probe(struct platform_device *pdev)
 	int chip_cs, mem_region, ret, irq;
 	int start_region = 0;
 
-	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nfc->base, stm32_fmc2_nfc_release);
+	if (ret)
+		return ret;
 
 	nfc->dev = dev;
-	nand_controller_init(&nfc->base);
 	nfc->base.ops = &stm32_fmc2_nfc_controller_ops;
 
 	nfc->data = of_device_get_match_data(dev);
@@ -2024,9 +2031,15 @@ static int stm32_fmc2_nfc_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_wp_enable;
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_release(chip, NULL);
 	if (ret)
 		goto err_nand_cleanup;
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		goto err_wp_enable;
+	}
 
 	platform_set_drvdata(pdev, nfc);
 
@@ -2061,7 +2074,7 @@ static void stm32_fmc2_nfc_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	if (nfc->dma_ecc_ch)
 		dma_release_channel(nfc->dma_ecc_ch);
@@ -2074,6 +2087,7 @@ static void stm32_fmc2_nfc_remove(struct platform_device *pdev)
 	sg_free_table(&nfc->dma_ecc_sg);
 
 	stm32_fmc2_nfc_wp_enable(nand);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static int stm32_fmc2_nfc_suspend(struct device *dev)

-- 
2.53.0

