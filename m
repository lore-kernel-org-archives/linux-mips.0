Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046607;
	b=J3GiFMBvyfuB/HPrDm6BsoYidppwvMMJiTo+OcFtZ0N8zVj19iPm4EhhVmyI2X4I2riZ
	 cyBlyupvlOTjtuGDbNedj/nh67h67Bz589Z2hryBXq2RdQDQkjBobsHvJKUHNhwWUzRW3
	 MMya6+Ahm1CNPrPva0mbt3aopB0VM3X3bA6nG0puTURLZtiDnjWnYsSR0uLSBmergOFll
	 lJrxAhu2GODOivkdg5lVZU63cqvpZU8iirVlm19lCzlE2A4gfvUZp1F4slU3LbYPqil0D
	 WLVEj8+LtO7lqyqvmsTVTod3YA9nOlmA2YJ1pBtw43BwSmKo6GtyWEbyqLi04rwfJQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046607;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=MlZnG/7Sna+U2qbkmqtYLFmIOLPlVRBG830dYMD5F3Y=;
	b=fAPYTew2DWUB9U23ey9J8mgTtWDID6oR6GvmMPiYPJMlgUoRiZaekVraRjt/yz0Mb9uX
	 yHe/+xZ11BqfDPUbNGsMp/dxYWzOj5d+sgakBe5ycJuSuhkDNUscmNQfzuBqLiwiphQek
	 r0iqFVFlCxY2rrIV8ZDqrO5SVepxc4q88sBmUGlUsYF6wc0f6sT4gsWJ20PR8vQxUPmg0
	 ANj6iec+qBPTno0Oqo4LkANbjSwxXFSfGZLp4jvnaIki3eogS/eY0b1P4zaXcifovd6GD
	 SXUjEKQFq2KTtreKYueVACJugc+4xj4it3s9WpZMO0moVHDE4MZwJ9PZ+5cRNwNzC4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I4EDgUje;
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3A66082BE1
	for <linux-mips@vger.kernel.org>; Sat,  7 Nov 2026 10:16:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B3A66082BE1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I4EDgUje
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-823b938464fso1112548a34.2
        for <linux-mips@vger.kernel.org>; Sat, 07 Nov 2026 02:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046605; x=1794651405; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MlZnG/7Sna+U2qbkmqtYLFmIOLPlVRBG830dYMD5F3Y=;
        b=I4EDgUje0B7UDXMa+ELXk9OxfQwzG/ynZiclDbEATaMxhxnMJEOh9tBRagXG+QigeZ
         fQWMX4JeUIMTYJDzzyX+Xh36DZKij2bGF2bZFqIaFrcyC99lPiivPqyE4+caNXpWFGyz
         5huTZx/U8xuSrGvp6hefFPfxGyP+mRsyHxUCm0FeAgPgt5vTES2lO7CCWOW65ua7+IV2
         O+NKR+cp/xizaenR/cotLQ9yqg+qGqZHL+R96mmUiWJrsX1pa4uVP2DIMSjkAbjTdWpM
         EUX2lROYv21Y9V0Qu1o5RlMhnjMaigQRtJ+ZxnlBo4WdPc4vIDAh9Cd2uY6ZsTT2/7tJ
         r98A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046605; x=1794651405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MlZnG/7Sna+U2qbkmqtYLFmIOLPlVRBG830dYMD5F3Y=;
        b=v2XUJ3z7+NP5x64+rXiUiukNKXhUhlpf3wVgKjv5xb5z+gUj8aMJ6BBe7J5yf1ur83
         1mMuS/W9FKhPOBi0lNbsVw8XdzdBwpPUN+pCRpzGexaYG/Kn9I4wBeLePta4Js6ouD3S
         Vt4yvWLqAEGTuS73Tq/Cb0zefklyta4A1o7R/7GyyFNC3wlerW75pA/iI3x7mC9BHUGx
         VkcPMplSlcweh7Lu32htmH0mtfDZ59UwxW1bdyUURsnLWMeeY1k4WoJBsOTYQCYSmV01
         it0p1ev0uRLLXJGUa/s7HI/ngg7b2UoSkBGxRzdSCYuHsgsDV8tD5iiJA0PGmMbtSozB
         uUeA==
X-Forwarded-Encrypted: i=1; AKwUvBw4WS8FTx/Dc7uubSlGA/P3A4cS8GCmZb8xM8IGZRLJNjkKCewnC9Ug+BCQFczu6clSx3zzi3cagjI4@vger.kernel.org
X-Gm-Message-State: APuU4Z+Rzx2M+2dC2IJjnw8eWfPEhG0K6SH6N0iXOAi4izA4CTmADBq/
	wYw90UoTlT0EGDhObHC8Nld0SzQJLkk6Dr9B9MaptAr2jUFpWdxL7Rg1
X-Gm-Gg: AYBFou37FaVpw7Uzu0PSy9rb7CC07b/+sMXHK3bfl7VKm5Da+ntXS6OoPPXO+s5jRGz
	3KGVa5tPRCmTxNk5Nybshi42FSVBVmCzojtEPHKd+veQ8sndeg//RFH6COZ4WfkweqhZv7zERsm
	/xMt8ViZkMF+McbNBDY+D+trUza+Nmr8kn4lLO46yJ7beieQUqzWjnxmlzVZJ3Jym3tkK10CuSA
	yTSDockl5uxQCM5637oIxo053nLnIi3ak/711MBeuUDAO/CZUrSoH1sNo9eYa2c7JAbOYbxXjVQ
	Z+3wq3pCueQCNly3VtuIZHx0NlfPy+iwjYkccCG0Xeu8I/+d2bqZv8hVmfvfAzUN2L6nnQwIC4L
	NkAGiirzpDm7qSxjA5Dqmw5nJe0sevbv0KJeFOZHZhONAfrd+jcguKScF8KOJBLzd3G3XXVy4t0
	yihE5Qx7BdFDc4cGY0iDMIsmnZFgAyPpNK4NL/08q80trES32x6ve0Z3Es4fU7gS1xXZA5/mjkS
	68T5dzOl+ch8tAMgNkElzyaYB9E+SxsVrTEcT+5hUPqxPbuYZ2VvuQQ8RNGPDcUapQyvQ9R2535
	VHtZIRCJZn6PcVJKeZTP67/fksSRGhiivPr0zyafhf8AURnThkpaO0o8Zp9jr52a8g0BR6WU286
	nHNv6x/ATO535gLwoNDPVnuLyU2kNWZV5BWgpddzrlxGUnKRJI8QFAupwO6XJpI8kx1HEgNbDRN
	AAJzgp5/xBXONAsK3kOJO95T/Ih2sRi+fmsWCRGew0PZ9SHezWs1Hn
X-Received: by 2002:a05:6830:310b:b0:85f:31f:7643 with SMTP id 46e09a7af769-85f1cf3e2c4mr5316383a34.7.1794046605233;
        Sat, 07 Nov 2026 02:16:45 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:16:44 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:04 -0700
Subject: [PATCH 07/58] mtd: rawnand: sunxi: retain chip state until the
 final MTD put
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-7-0181ef0cc4c8@gmail.com>
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

sunxi_nand_chips_cleanup() unregisters each MTD device and immediately
calls nand_cleanup(). Devres subsequently frees the chip and controller.
An open MTD handle can outlive this sequence: another operation or even
closing a writable handle reaches freed metadata and lock storage.

Unregister each MTD device while removal notifiers can still finish I/O,
then disconnect the chip and release the driver's initial MTD lifetime
reference. Defer nand_cleanup() and chip destruction until the final MTD
or device reference is released. Retain the chip name, flash node and
per-sector user-data lengths along with the NAND metadata.

Give the controller a reference for each retained chip and one owned by
devres. Register that devres action first so the IRQ and hardware
resources are released before the initial controller reference. The
shared lock and parent device remain valid until the last chip is
destroyed, while the disconnect gate prevents access to released
hardware resources.

Unwind heap allocations on probe failures, including attach failures for
which nand_scan() does not invoke the detach callback.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 59 +++++++++++++++++++++++++++++----------
 1 file changed, 45 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index f41feebe4257..57894ce45065 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -27,6 +27,7 @@
 #include <linux/dmaengine.h>
 #include <linux/interrupt.h>
 #include <linux/iopoll.h>
+#include <linux/mutex.h>
 #include <linux/reset.h>
 
 #define NFC_REG_CTL		0x0000
@@ -405,6 +406,13 @@ static inline struct sunxi_nfc *to_sunxi_nfc(struct nand_controller *ctrl)
 	return container_of(ctrl, struct sunxi_nfc, controller);
 }
 
+static void sunxi_nfc_release(struct nand_controller *controller)
+{
+	struct sunxi_nfc *nfc = to_sunxi_nfc(controller);
+
+	kfree(nfc);
+}
+
 static irqreturn_t sunxi_nfc_interrupt(int irq, void *dev_id)
 {
 	struct sunxi_nfc *nfc = dev_id;
@@ -2027,9 +2035,8 @@ static const struct mtd_ooblayout_ops sunxi_nand_ooblayout_ops = {
 static void sunxi_nand_detach_chip(struct nand_chip *nand)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
-	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 
-	devm_kfree(nfc->dev, sunxi_nand->user_data_bytes);
+	kfree(sunxi_nand->user_data_bytes);
 	sunxi_nand->user_data_bytes = NULL;
 }
 
@@ -2045,8 +2052,7 @@ static int sunxi_nfc_maximize_user_data(struct nand_chip *nand, uint32_t oobsize
 	if (nsectors <= 0)
 		return -EINVAL;
 
-	sunxi_nand->user_data_bytes = devm_kzalloc(nfc->dev, nsectors,
-						   GFP_KERNEL);
+	sunxi_nand->user_data_bytes = kzalloc(nsectors, GFP_KERNEL);
 	if (!sunxi_nand->user_data_bytes)
 		return -ENOMEM;
 
@@ -2427,6 +2433,13 @@ static const struct nand_controller_ops sunxi_nand_controller_ops = {
 	.exec_op = sunxi_nfc_exec_op,
 };
 
+static void sunxi_nand_release(struct nand_chip *chip)
+{
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(chip);
+
+	kfree(sunxi_nand);
+}
+
 static void sunxi_nand_chips_cleanup(struct sunxi_nfc *nfc)
 {
 	struct sunxi_nand_chip *sunxi_nand;
@@ -2440,8 +2453,9 @@ static void sunxi_nand_chips_cleanup(struct sunxi_nfc *nfc)
 		chip = &sunxi_nand->nand;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&sunxi_nand->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -2465,8 +2479,7 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 		return -EINVAL;
 	}
 
-	sunxi_nand = devm_kzalloc(dev, struct_size(sunxi_nand, sels, nsels),
-				  GFP_KERNEL);
+	sunxi_nand = kzalloc(struct_size(sunxi_nand, sels, nsels), GFP_KERNEL);
 	if (!sunxi_nand)
 		return -ENOMEM;
 
@@ -2477,19 +2490,21 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 		if (ret) {
 			dev_err(dev, "could not retrieve reg property: %d\n",
 				ret);
-			return ret;
+			goto err_free_chip;
 		}
 
 		if (tmp > NFC_MAX_CS) {
 			dev_err(dev,
 				"invalid reg value: %u (max CS = 7)\n",
 				tmp);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto err_free_chip;
 		}
 
 		if (test_and_set_bit(tmp, &nfc->assigned_cs)) {
 			dev_err(dev, "CS %d already assigned\n", tmp);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto err_free_chip;
 		}
 
 		sunxi_nand->sels[i].cs = tmp;
@@ -2518,18 +2533,32 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 
 	ret = nand_scan(nand, nsels);
 	if (ret)
-		return ret;
+		goto err_free_chip;
+
+	ret = nand_set_release(nand, sunxi_nand_release);
+	if (ret)
+		goto err_cleanup_nand;
+	mtd->owner = THIS_MODULE;
 
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "failed to register mtd device: %d\n", ret);
-		nand_cleanup(nand);
+		nand_disconnect(nand);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&sunxi_nand->node, &nfc->chips);
 
 	return 0;
+
+err_cleanup_nand:
+	nand_cleanup(nand);
+err_free_chip:
+	/* nand_scan() does not detach a chip whose attach callback failed. */
+	kfree(sunxi_nand->user_data_bytes);
+	kfree(sunxi_nand);
+	return ret;
 }
 
 static int sunxi_nand_chips_init(struct device *dev, struct sunxi_nfc *nfc)
@@ -2610,12 +2639,14 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 	int irq;
 	int ret;
 
-	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
 
 	nfc->dev = dev;
-	nand_controller_init(&nfc->controller);
+	ret = devm_nand_controller_init(dev, &nfc->controller, sunxi_nfc_release);
+	if (ret)
+		return ret;
 	INIT_LIST_HEAD(&nfc->chips);
 
 	nfc->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &r);

-- 
2.53.0

