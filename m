Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792815248;
	b=G0oZPBoqJvYOy4Gvq15ErEG8uBKOLG5iqy/jPzhCY0rY7KmR4jiixKa76PBt5Y1HzvOE
	 xGlmMbNllzobrrpuRZuoiMzFwzjgmWM8+Gf+qtSa6H7XY/ajtTRapXi/7OLt+SquT+3Nz
	 fBz1G944HzDYjt1QxGck2VTrgNB+I1IAUPTIEcjRxdjcsSJj4XglQcDPrO63eAaKr2Cep
	 HNUtszOOQvMAJsp+sq3vUouJiINrvYhNfR22fwutM6/XBVC6eNn/6HqX2fseB2W0LE1Of
	 HklGBf5tIG8jY4ezSv8q/TJZKLRwgiSaUW3w/7oe9LNHrl5h0KJklQq5HUWxjNkfo8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792815248;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AVm+Py6gIRWjoWudlwJRPOhhNwPl2mhcVINUfayAsuw=;
	b=xTDuRnpYuMdAEXHKuMKv7e0MCHexH2l5aviSbF191iT+X425xDGXgi2gXZhUky+Xekil
	 2IIyFjMhKMNG/N1IjxUvKrdCTWnBZ6JK89VxV0XaT1Gc0xdbkZGM3Rx1WTzP5Uf82yX13
	 lzZzjyQC2gz7/9fb1hj7GsF89a5cLdxp4GGli306EQ2EUGMLfatTcMc4IlGVWRoGjwCKS
	 L/jUw+zaSCzemiUCYoXx34xloKfbtLvfZbFAOZey5Ev21ruXEW1xvhB7gHql/1+MKNG0Y
	 QP8DugpfCIPwQt4knRM5xXNZWsR50lhmJl4MZoMbuPicJV0qnVoLgB84agoCicKgsZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=dGTugZZF;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35357606A324
	for <linux-mips@vger.kernel.org>; Sat, 24 Oct 2026 04:14:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35357606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=dGTugZZF
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso10898915e9.1
        for <linux-mips@vger.kernel.org>; Fri, 23 Oct 2026 21:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792815241; x=1793420041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AVm+Py6gIRWjoWudlwJRPOhhNwPl2mhcVINUfayAsuw=;
        b=dGTugZZF57jiWmmvOSsHW2poGFSwPw0HKT4VzHyEK7mLlUSpp5txLFZDKK7ix+nbAd
         ouiLngwkJvv5Q0EF/0c1xv914e1A4PKuBhtpU3BofhKpPbkY1Ab8eA9TYCnKdlurP8Rn
         nBqYRKGhQavSpMy4DeNCl1Q6QZY3FoWuIWvdBnm2GBdI+aIdHIy+JQpO6OYKPjdwZTzd
         T3Udnd0s06haSQ0tn02bltLzPRjT//A0wVP5wNxRbS7Rn1CwzT4+bt7tpbunboU0SzxY
         cCmy0W+EzuN7P9+/0/byMOqQTWPOOdJrypRVoeAgMhumJrh6RmyXiz89BCy/83eAJApU
         792Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792815241; x=1793420041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AVm+Py6gIRWjoWudlwJRPOhhNwPl2mhcVINUfayAsuw=;
        b=pFYWrQwtV1TXZ3rMp72ogFrJXhUJ3SYG+u8rE/h8XbLD0VYuyeLTCqFPEC8SG6GaTr
         rBRCfbMSF9ENXb5hEbIFCsyNpBwX8QjANZMmSGuyMHwTn4y0oxC7mwdqP/28EUm3pGnj
         1MZase6anI6IAb7gmUAoJqM//IwVedOAo5ww99JcLBd5rFsLjFXRsYQXFRc5MwQamoFY
         vhQs55DjPk+AubcjLKL1YPyEmFDvHvUN0c2hkZY+WMrNv94fnfeOgqWuqLV+LHYc3G/A
         VIdIMS1uQJrHdRgvIGgU6st5Uy1dngNKrAIewQYDlyOwa/r5yWqPyqFUhXNvjibGCqoQ
         kKMw==
X-Forwarded-Encrypted: i=1; AKwUvBxGS6BdCn2iP8rxamIK3YoSQl8R7wUlBR4PDoEbfszta6m9g+bU9m1X6me/U4lbFeqAETNTVHRaRUH5@vger.kernel.org
X-Gm-Message-State: AFq9FYLD73WnZG9n3vcc1N6+M42CNdW61EJGzjfn8+j9L2bAA7VTR5Az
	sofsLV96d9FFTS5GSzDq8BrD1baplLk5NwCXdeR62Jiajyrrz6BM+732vjF+48Ay87E=
X-Gm-Gg: AYBFou21fDS6LKQiOKzIM29a54OgXzEyxWdEL7z03106VT6ZmjCQtpLcaZ5X19c2KVf
	xfiTgDVskcR59pLtJATNW0Fq3Gwmc6zmjKcJhmRm1FHsWfbvJ2Q2kNtCEt31uEFglY8JEqU7ijW
	ng+uftwXDiNtCxJ3fC4oDga30T+ACFVTBsoByh+VBY/wgWmKcmuWT6iBv32EyRX5iUVpL90fezL
	Qa4+ID8L6nNihr1Ce1qZu6WCRDfyX+O0SkxVrfggX6/asI3q9umt9uv8k3p7IacAuEVWoHSUATB
	D2q3Hne/WOULmorhkIL880aEmOFIRjFfQPLtIgUgVfZsr4/SyJZRp15h1CadznJV+sRcObpqq0g
	6q4TC57oICbbpvrKcKISNvY+xgxxTvPpYMuuMNWzBOSnVoyRviE08Dld1fDdTvgMNUW+3ArYm+Q
	V5bni817jirHmeeWhBD9uHr+whlcsrjPf/Q2w/tLQZpwn0c9ZXJRIKAT5tm07kP2ah1/Z0Czuqc
	5UO6eFwqRduRnruRWjDjpqfaN0CYgwv12XI/w2NJUcu3i54gPbuavMZzZK5C66W/shKN4f9u6Ff
	h/xuo7A+aV0=
X-Received: by 2002:a05:600c:83c7:b0:4a2:c9b:9b98 with SMTP id 5b1f17b1804b1-4a35ac95f44mr11732945e9.17.1792815240705;
        Fri, 23 Oct 2026 21:14:00 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9c3:9990:89bb:701c:1852:56c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2c0458sm26332265e9.11.2026.10.23.21.13.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 21:14:00 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v2 2/2] iio: adc: Add a driver for the Ingenic X1600 ADC
Date: Sat, 24 Oct 2026 06:13:57 +0200
Message-ID: <20261024041357.34346-2-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261024041357.34346-1-olivier@mgcrea.io>
References: <20261024041357.34346-1-olivier@mgcrea.io>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The X1600's SAR ADC has four auxiliary channels, each with its own start
bit, interrupt flag and 12-bit result, and none of the touchscreen or
battery engines of the JZ47xx ADCs that ingenic-adc drives. Add a small
driver that exposes the four channels as voltages against the 3.3 V
reference.

There is no datasheet here: the register layout and the clock dividers
come from the X1600 driver of the vendor's 4.4 kernel.

Tested on a HiBy R1, whose play/pause and volume keys sit on channel 0
behind adc-keys: all three read and report correctly.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
Changes in v2, after Jonathan Cameron's review (thanks):
 - Drop the comparison with the JZ47xx ADCs from the file header
 - Drop the mod_devicetable.h include
 - X1600_ADC_VREF_MV -> X1600_ADC_VREF_mV
 - Split the status declaration from its readl() in the interrupt handler
 - field_get() for the channel's result
 - fsleep(2000) instead of usleep_range()

v1 was tested on a HiBy R1; v2 is build-tested with W=1 on iio togreg.

 MAINTAINERS                         |   7 +
 drivers/iio/adc/Kconfig             |  10 ++
 drivers/iio/adc/Makefile            |   1 +
 drivers/iio/adc/ingenic-x1600-adc.c | 226 ++++++++++++++++++++++++++++
 4 files changed, 244 insertions(+)
 create mode 100644 drivers/iio/adc/ingenic-x1600-adc.c

diff --git a/MAINTAINERS b/MAINTAINERS
index ecc22d1149d1..bbb63228e330 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12925,6 +12925,13 @@ F:	include/linux/mfd/ingenic-tcu.h
 F:	sound/soc/codecs/jz47*
 F:	sound/soc/jz4740/
 
+INGENIC X1600 ADC DRIVER
+M:	Olivier Louvignes <olivier@mgcrea.io>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml
+F:	drivers/iio/adc/ingenic-x1600-adc.c
+
 INJOINIC IP5xxx POWER BANK IC DRIVER
 M:	Samuel Holland <samuel@sholland.org>
 S:	Maintained
diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index a802d8ee4dd9..7b5c3d3fcfdb 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -881,6 +881,16 @@ config INGENIC_ADC
 	  This driver can also be built as a module. If so, the module will be
 	  called ingenic_adc.
 
+config INGENIC_X1600_ADC
+	tristate "Ingenic X1600 ADC driver"
+	depends on MIPS || COMPILE_TEST
+	help
+	  Say yes here to build support for the SAR ADC of the Ingenic X1600
+	  SoC and its four auxiliary channels.
+
+	  This driver can also be built as a module. If so, the module will be
+	  called ingenic-x1600-adc.
+
 config INTEL_DC_TI_ADC
 	tristate "Intel Bay Trail / Cherry Trail Dollar Cove TI ADC driver"
 	depends on INTEL_SOC_PMIC_CHTDC_TI
diff --git a/drivers/iio/adc/Makefile b/drivers/iio/adc/Makefile
index 9e82c21dbd37..f76e62b0cd04 100644
--- a/drivers/iio/adc/Makefile
+++ b/drivers/iio/adc/Makefile
@@ -77,6 +77,7 @@ obj-$(CONFIG_IMX8QXP_ADC) += imx8qxp-adc.o
 obj-$(CONFIG_IMX93_ADC) += imx93_adc.o
 obj-$(CONFIG_INA2XX_ADC) += ina2xx-adc.o
 obj-$(CONFIG_INGENIC_ADC) += ingenic-adc.o
+obj-$(CONFIG_INGENIC_X1600_ADC) += ingenic-x1600-adc.o
 obj-$(CONFIG_INTEL_DC_TI_ADC) += intel_dc_ti_adc.o
 obj-$(CONFIG_INTEL_MRFLD_ADC) += intel_mrfld_adc.o
 obj-$(CONFIG_LP8788_ADC) += lp8788_adc.o
diff --git a/drivers/iio/adc/ingenic-x1600-adc.c b/drivers/iio/adc/ingenic-x1600-adc.c
new file mode 100644
index 000000000000..60683f26c693
--- /dev/null
+++ b/drivers/iio/adc/ingenic-x1600-adc.c
@@ -0,0 +1,226 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ADC driver for the Ingenic X1600 SoC
+ *
+ * The X1600's SAR ADC has four auxiliary channels, each with its own start
+ * bit, interrupt and 12-bit result. The register layout and the clock set-up
+ * were read from the vendor 4.4 kernel's driver.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/completion.h>
+#include <linux/delay.h>
+#include <linux/iio/iio.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+
+#define X1600_ADC_REG_ENABLE		0x00
+#define X1600_ADC_REG_CTRL		0x08
+#define X1600_ADC_REG_STATUS		0x0c
+#define X1600_ADC_REG_DATA(ch)		(0x10 + ((ch) / 2) * 4)
+#define X1600_ADC_REG_CLKDIV		0x20
+#define X1600_ADC_REG_STABLE		0x24
+
+/* ENABLE: bits 3..0 start a channel's conversion; bit 15 powers down. */
+#define X1600_ADC_ENABLE_POWER_DOWN	BIT(15)
+/* CTRL: bits 3..0 mask the channels' interrupts. STATUS: write 1 to clear. */
+#define X1600_ADC_CHANNELS_MASK		GENMASK(3, 0)
+#define X1600_ADC_DATA_MASK(ch)		(GENMASK(11, 0) << ((ch) % 2 * 16))
+#define X1600_ADC_CLKDIV_DIV0		GENMASK(7, 0)
+#define X1600_ADC_CLKDIV_DIV1		GENMASK(15, 8)
+#define X1600_ADC_CLKDIV_DIV2		GENMASK(31, 16)
+#define X1600_ADC_STABLE_TIME		GENMASK(15, 0)
+
+#define X1600_ADC_NUM_CHANNELS		4
+#define X1600_ADC_VREF_mV		3300
+#define X1600_ADC_BITS			12
+/* The vendor kernel brings its 140 MHz APB clock down to about this. */
+#define X1600_ADC_CLK_RATE		1166667
+#define X1600_ADC_TIMEOUT_MS		20
+
+struct x1600_adc {
+	void __iomem *base;
+	struct clk *clk;
+	struct completion done;
+	/* Serialises conversions: there is one completion for all channels. */
+	struct mutex lock;
+};
+
+static irqreturn_t x1600_adc_irq(int irq, void *data)
+{
+	struct x1600_adc *adc = data;
+	u32 status;
+
+	status = readl(adc->base + X1600_ADC_REG_STATUS) & X1600_ADC_CHANNELS_MASK;
+	if (!status)
+		return IRQ_NONE;
+
+	writel(status, adc->base + X1600_ADC_REG_STATUS);
+	complete(&adc->done);
+	return IRQ_HANDLED;
+}
+
+static int x1600_adc_read_raw_channel(struct x1600_adc *adc, unsigned int ch, int *val)
+{
+	u32 data;
+	int ret = 0;
+
+	guard(mutex)(&adc->lock);
+
+	reinit_completion(&adc->done);
+	writel(BIT(ch), adc->base + X1600_ADC_REG_STATUS);
+	writel(readl(adc->base + X1600_ADC_REG_ENABLE) | BIT(ch),
+	       adc->base + X1600_ADC_REG_ENABLE);
+
+	if (!wait_for_completion_timeout(&adc->done,
+					 msecs_to_jiffies(X1600_ADC_TIMEOUT_MS)))
+		ret = -ETIMEDOUT;
+
+	writel(readl(adc->base + X1600_ADC_REG_ENABLE) & ~BIT(ch),
+	       adc->base + X1600_ADC_REG_ENABLE);
+	if (ret)
+		return ret;
+
+	data = readl(adc->base + X1600_ADC_REG_DATA(ch));
+	*val = field_get(X1600_ADC_DATA_MASK(ch), data);
+	return 0;
+}
+
+static int x1600_adc_read_raw(struct iio_dev *iio_dev,
+			      struct iio_chan_spec const *chan,
+			      int *val, int *val2, long mask)
+{
+	struct x1600_adc *adc = iio_priv(iio_dev);
+	int ret;
+
+	switch (mask) {
+	case IIO_CHAN_INFO_RAW:
+		ret = x1600_adc_read_raw_channel(adc, chan->channel, val);
+		return ret ? ret : IIO_VAL_INT;
+	case IIO_CHAN_INFO_SCALE:
+		*val = X1600_ADC_VREF_mV;
+		*val2 = X1600_ADC_BITS;
+		return IIO_VAL_FRACTIONAL_LOG2;
+	default:
+		return -EINVAL;
+	}
+}
+
+static const struct iio_info x1600_adc_info = {
+	.read_raw = x1600_adc_read_raw,
+};
+
+#define X1600_ADC_CHANNEL(ch) {					\
+	.type = IIO_VOLTAGE,					\
+	.indexed = 1,						\
+	.channel = (ch),					\
+	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),		\
+	.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE),	\
+}
+
+static const struct iio_chan_spec x1600_adc_channels[] = {
+	X1600_ADC_CHANNEL(0),
+	X1600_ADC_CHANNEL(1),
+	X1600_ADC_CHANNEL(2),
+	X1600_ADC_CHANNEL(3),
+};
+
+static void x1600_adc_power_down(void *data)
+{
+	struct x1600_adc *adc = data;
+
+	writel(X1600_ADC_CHANNELS_MASK, adc->base + X1600_ADC_REG_CTRL);
+	writel(X1600_ADC_ENABLE_POWER_DOWN, adc->base + X1600_ADC_REG_ENABLE);
+}
+
+static int x1600_adc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct iio_dev *iio_dev;
+	struct x1600_adc *adc;
+	unsigned long rate;
+	u32 div0, reg;
+	int irq, ret;
+
+	iio_dev = devm_iio_device_alloc(dev, sizeof(*adc));
+	if (!iio_dev)
+		return -ENOMEM;
+
+	adc = iio_priv(iio_dev);
+	init_completion(&adc->done);
+	ret = devm_mutex_init(dev, &adc->lock);
+	if (ret)
+		return ret;
+
+	adc->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(adc->base))
+		return PTR_ERR(adc->base);
+
+	adc->clk = devm_clk_get_enabled(dev, "adc");
+	if (IS_ERR(adc->clk))
+		return dev_err_probe(dev, PTR_ERR(adc->clk), "Unable to get clock\n");
+
+	/* Powered down, interrupts masked and cleared, as the vendor does. */
+	writel(X1600_ADC_ENABLE_POWER_DOWN, adc->base + X1600_ADC_REG_ENABLE);
+	writel(X1600_ADC_CHANNELS_MASK, adc->base + X1600_ADC_REG_CTRL);
+	writel(X1600_ADC_CHANNELS_MASK, adc->base + X1600_ADC_REG_STATUS);
+
+	rate = clk_get_rate(adc->clk);
+	div0 = clamp(DIV_ROUND_UP(rate, X1600_ADC_CLK_RATE), 1UL, 256UL) - 1;
+	/* DIV1 and DIV2 as the vendor kernel sets them. */
+	writel(FIELD_PREP(X1600_ADC_CLKDIV_DIV0, div0) |
+	       FIELD_PREP(X1600_ADC_CLKDIV_DIV1, 1) |
+	       FIELD_PREP(X1600_ADC_CLKDIV_DIV2, 99),
+	       adc->base + X1600_ADC_REG_CLKDIV);
+	reg = readl(adc->base + X1600_ADC_REG_STABLE) & ~X1600_ADC_STABLE_TIME;
+	writel(reg | FIELD_PREP(X1600_ADC_STABLE_TIME, 1),
+	       adc->base + X1600_ADC_REG_STABLE);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	ret = devm_request_irq(dev, irq, x1600_adc_irq, 0, dev_name(dev), adc);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to request irq\n");
+
+	/*
+	 * Powered up for good: the keys poll it every few tens of milliseconds,
+	 * and powering up takes 2 ms.
+	 */
+	writel(0, adc->base + X1600_ADC_REG_ENABLE);
+	fsleep(2000);
+	writel(0, adc->base + X1600_ADC_REG_CTRL);
+	ret = devm_add_action_or_reset(dev, x1600_adc_power_down, adc);
+	if (ret)
+		return ret;
+
+	iio_dev->name = "x1600-adc";
+	iio_dev->modes = INDIO_DIRECT_MODE;
+	iio_dev->channels = x1600_adc_channels;
+	iio_dev->num_channels = ARRAY_SIZE(x1600_adc_channels);
+	iio_dev->info = &x1600_adc_info;
+
+	return devm_iio_device_register(dev, iio_dev);
+}
+
+static const struct of_device_id x1600_adc_of_match[] = {
+	{ .compatible = "ingenic,x1600-adc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, x1600_adc_of_match);
+
+static struct platform_driver x1600_adc_driver = {
+	.driver = {
+		.name = "ingenic-x1600-adc",
+		.of_match_table = x1600_adc_of_match,
+	},
+	.probe = x1600_adc_probe,
+};
+module_platform_driver(x1600_adc_driver);
+MODULE_DESCRIPTION("ADC driver for the Ingenic X1600 SoC");
+MODULE_LICENSE("GPL");
-- 
2.39.5

