Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046592;
	b=BjkRZuIOJlZMJBDE0GlSAXLtvD2YBBND8QHnuElyYJaV+iNuuxZuKwlwHCck2L2zQmZh
	 QoK74JxrMzFNVYxmKirXV/HZBBZ962ibnp+YRZy9Cx2Kh2Wtujx7MKM8ngdyeoBBk12PR
	 rPaOd6kcGeTHabiWKQqKNy3Dt0HPAEOzvZ/HkGTCyya64p8XGX3Oq2a7rPXjFT5EMbLFd
	 7NJjuYOlOXDPENKx8NluEKnwzso8woRq4WHvAULPAt1xG7UNBIc8I61siiXOAIxPaz/4N
	 gc7qx30PfoPTT55kDywTjnILWBij1vmvRFGE/2b/hjWVDM3AJvOwbbQS7Tybk0aEPBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046592;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Ir8ocEsY2ITCHB73OM8DOt1TO1FexBL3HI8zDqPQjm4=;
	b=NtvMFEuYg7wxWSCdQVxEy79/hE1NM3R1aMVfEpLCdLw8kLMISt7Lg4+UB+oeeEM0xqRI
	 j96FR5Nfcb/9nAuHsXGV6NBNvludRwTzcuK6e48jA/eD6dliIccY2SYp421TCDNo9Z22m
	 cnrPPwi6pnkZljUxwzQuionyP/ctuC/jCreHrBvp2WFRAmuSXqQYy+7Ua4Z8F8tCeAi7f
	 S0ftYlroZMxS8PBi65rBF+E+k4LO928u3dVHEaBWG9MvI3ohKWxCTFVQjD6geN0/QC/pC
	 SLASfp6mpEWQqwgTy6ssqCq42mXHot/vKl++V6UUOwqFqZoN2jgK++v2gMv3xTHMhMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hf5XVAUs;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD748606A32E
	for <linux-mips@vger.kernel.org>; Sat,  7 Nov 2026 10:16:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD748606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hf5XVAUs
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-85c1135c286so1028221a34.1
        for <linux-mips@vger.kernel.org>; Sat, 07 Nov 2026 02:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046590; x=1794651390; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ir8ocEsY2ITCHB73OM8DOt1TO1FexBL3HI8zDqPQjm4=;
        b=hf5XVAUsF8EPd/RdVeIWVS5oZGsS0lby/+9Kj4QlGxI7nmPIXVSyQF7JqySogUecbd
         yRFpCeLuScpBXGbVWXv4fQxq54pXgi4KnhAQvkI0KOlqaD6k65pYeD+leZOff63AtnOp
         vwgCjG/FpYB1e7s2J6kUroDzwPkTebX92DPPuYqdHlU831TrCt+WHho8CY6aszmEKM2F
         /XYdhwHchv3jUMRW0vBpNMie5Iss++8mGpZHCGvcbCMgKxBWNNrvFR1RvqpBkDvlIh/P
         woaS2DxX7uQfjoQ36gFraLZmORdjMXrIPemQWt/Q+pC48wS4VEiQkwU9TX1WkyT3NT55
         KKbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046590; x=1794651390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ir8ocEsY2ITCHB73OM8DOt1TO1FexBL3HI8zDqPQjm4=;
        b=cUzUxIPXB/ONhecPTDCSIWfEkDsPhpogJlShfgr+VIVrtMWHPAXMoRwQXWrX014LFD
         b9wNnQjK2pcvMuPCCz3kSpDBiHMWWpknQ0Z+H8zve9INOiPm+wo/6l9G6ZAyqaESYYOs
         zjmrsNhKQVhWUC0fpC0ZIQxc1f+JkYdwSBw6kumM8UToHebitiRHCCZVA5YfChj0mpce
         M/2dyhgnsBCIu+GReJvKxMCy0ceJUiUO/4sduSG+CUieeqr1e60FJdzGX7/QHTE0aqnp
         b9/clR2MJpajOA8xZo1rNTCG2CNS5TS5+5BgCMVCuf4TOtqMsaxix57fLGddaebepMWq
         QxEA==
X-Forwarded-Encrypted: i=1; AKwUvBx9W8OgioVykMb1bw+GCGnVgw7fxDPU63XqJqZmwhpGLDRVWiTE+pwFkhdJkEgTvTE+EhjAEfmcZ8yE@vger.kernel.org
X-Gm-Message-State: APuU4Z/nhwS+Mk5yR+naRj3V/5TAM5PE7biX9aYiigc0GBaaE6Q1uktg
	ENZ06Qv2/PmswmfmEU+nrudlOYyfDEnPzFRQIPFm4srs3aeakq0oeVy7
X-Gm-Gg: AYBFou3+mZ68NlsAQTCOUBMesRtoyRqZDFKJa0VcKwOdtRCqHQgZ2Fydm9j4k77fVT4
	DV4sUU9pz/BscK21RVkgbhRRl9CzmKyQx5kAPnBxpJSyxCcaC1bQQ+crgH3qEs4GGPgpipHNtoR
	ZBUDzRkjn0Uwxug2Za1jF3sV+CxwmpCv3dzB3Ck7hoyx148/HMH0IzGOAOE+qzU6Sl+eIl4L9lH
	eyw1r8IVdznv6D/EqukXQyinzMQU7iIy1fWnI/s4mJMMw3X1884+LcjYPFP9gZXOeM3/Fr7qMOW
	X0wE4lUt+fUWdpC8V+WF+UNvKEn5Mz/fkgGjpezUdw3U8fQaW4T/5jqg3usAM10J5YOtQCysyRO
	OUvaoYISpwR1QCa79WWjLB14ljzmFZpJRygszdu4hzb0b5xRqqWn6sxV8XkkgPYT1xpBqD0CvR5
	AiIqRUPr88WlD4dZbqn9P8uf3XcnQjCQDd3pLBp2ScMOBWhUPAtmjug1U+09Z0zHzvjY818OApU
	uTln+fQnBtiMt2jtjdCVbkrL6CNcXcPSHbSzrDvL+V/+AFjxnrOr/5DmpHdi7UNg/VIprObYblL
	/ZakWYygZr0yOO1X61Ftctao525XjZe3d9rIh88DA31doXyvq5xU78IG8321OFVFQOLjA0Ty5uJ
	3d/BQMNwrQOAYAr6qvisEsxV4E5LB6fDEbmuza7LBq5c7w0YupqBBOm+oK74hokq7PuIpxTiUZD
	w1kli5IBbkhGVEtsEC7+lBuew5idrBZ1+S6ANx1z4cI/Qi8+upQmvv
X-Received: by 2002:a05:6830:4c05:b0:822:e9bf:6445 with SMTP id 46e09a7af769-85f1cf838e3mr5603674a34.9.1794046590411;
        Sat, 07 Nov 2026 02:16:30 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:16:29 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:15:59 -0700
Subject: [PATCH 02/58] nvmem: retain provider context through final device
 release
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-2-0181ef0cc4c8@gmail.com>
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

An NVMEM provider can keep its read/write context in an object separate
from its parent device. Retaining the parent does not keep that object
alive, and nvmem_unregister() can return while consumers still hold the
provider. A device reference can also delay release after the last
consumer is gone.

Add optional paired callbacks to take a reference to the private context
before publishing the provider and drop it from the final device release
callback. Balance the reference on registration errors as well. Require
both callbacks together and document the associated module lifetime
requirement.

MTD OTP providers need this ownership because they are children of the
physical flash device, while their callback context is the separately
allocated MTD master.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/nvmem/core.c           | 12 +++++++++++-
 drivers/nvmem/internals.h      |  1 +
 include/linux/nvmem-provider.h | 10 ++++++++++
 3 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 0556d140170a..851fa5cabecb 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -541,6 +541,8 @@ static void nvmem_release(struct device *dev)
 
 	ida_free(&nvmem_ida, nvmem->id);
 	gpiod_put(nvmem->wp_gpio);
+	if (nvmem->ops->priv_put)
+		nvmem->ops->priv_put(nvmem->priv);
 	kfree(nvmem->ops);
 	kfree(nvmem);
 }
@@ -896,6 +898,9 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 	if (!config->reg_read && !config->reg_write)
 		return ERR_PTR(-EINVAL);
 
+	if (!!config->priv_get != !!config->priv_put)
+		return ERR_PTR(-EINVAL);
+
 	nvmem = kzalloc_obj(*nvmem);
 	if (!nvmem)
 		return ERR_PTR(-ENOMEM);
@@ -922,6 +927,12 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 
 	device_initialize(&nvmem->dev);
 
+	nvmem->priv = config->priv;
+	if (config->priv_get) {
+		config->priv_get(config->priv);
+		ops->priv_put = config->priv_put;
+	}
+
 	if (!config->ignore_wp)
 		nvmem->wp_gpio = gpiod_get_optional(config->dev, "wp",
 						    GPIOD_OUT_HIGH);
@@ -945,7 +956,6 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 	nvmem->word_size = config->word_size ?: 1;
 	nvmem->size = config->size;
 	nvmem->root_only = config->root_only;
-	nvmem->priv = config->priv;
 	nvmem->type = config->type;
 	nvmem->keepout = config->keepout;
 	nvmem->nkeepout = config->nkeepout;
diff --git a/drivers/nvmem/internals.h b/drivers/nvmem/internals.h
index 4e610deeaa7b..dcf5d81ca1b9 100644
--- a/drivers/nvmem/internals.h
+++ b/drivers/nvmem/internals.h
@@ -11,6 +11,7 @@
 struct nvmem_operations {
 	nvmem_reg_read_t	reg_read;
 	nvmem_reg_write_t	reg_write;
+	void		(*priv_put)(void *priv);
 };
 
 struct nvmem_device {
diff --git a/include/linux/nvmem-provider.h b/include/linux/nvmem-provider.h
index 6063fe5b7784..03e8522bab17 100644
--- a/include/linux/nvmem-provider.h
+++ b/include/linux/nvmem-provider.h
@@ -98,6 +98,8 @@ struct nvmem_cell_info {
  * @word_size:	Minimum read/write access granularity.
  * @stride:	Minimum read/write access stride.
  * @priv:	User context passed to read/write callbacks.
+ * @priv_get:	Optional callback taking a reference to @priv before publication.
+ * @priv_put:	Matching callback releasing @priv at final device release.
  * @ignore_wp:  Write Protect pin is managed by the provider.
  * @layout:	Fixed layout associated with this nvmem device.
  *
@@ -107,6 +109,12 @@ struct nvmem_cell_info {
  *
  * Note: Specifying name and setting id to -1 implies a unique device
  * whose name is provided as-is (kept unaltered).
+ *
+ * Note: @priv_get and @priv_put must be supplied together. Each @priv_get
+ * call is balanced by one @priv_put, including on registration failure.
+ * The put can run after nvmem_unregister() returns, when consumers and
+ * device references have gone away. These callbacks must also retain any
+ * module needed to execute @priv_put until it returns.
  */
 struct nvmem_config {
 	struct device		*dev;
@@ -132,6 +140,8 @@ struct nvmem_config {
 	int	word_size;
 	int	stride;
 	void	*priv;
+	void	(*priv_get)(void *priv);
+	void	(*priv_put)(void *priv);
 	/* To be only used by old driver/misc/eeprom drivers */
 	bool			compat;
 	struct device		*base_dev;

-- 
2.53.0

