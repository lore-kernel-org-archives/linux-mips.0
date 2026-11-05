Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793914411;
	b=vUOgUAGHGqLjjwyCvHugVMy/JyBYTq5A7NZqKVcbk8W8oYF1HLVHFgRpnLc9vjjSjIBH
	 WrxELJKgKJVwOQ1GojQoeTaRxQCNF5SfpnReHUi+QJyrX+VDXHa5JJ6jAyReYV6RFGYxS
	 yY4jtDBfR6cidSqt9fckmqtcZbPX0Cf/itXc/gB26vgAgm4nEmrWtS6SL3jfBqjBYEfdA
	 N1eMGFh365qCKjSNOKJ3EW5y1GlG8rHv8ID9LxUDXNy+LOLoaVs31PL09oI9YJIxznXlW
	 apCYZeVbG3W9PQINGhnHQb4iP6k77wKACFqQtgGxMe38v3F/eoWEKmTuKEzHWktpztA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793914411;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Notht+srG91GHUEX+NvJgjSsIAvRKoHhEo0WPhNbsG0=;
	b=v4UtTav2U/+nITd118d52U5UzO0cSRRADviYMwDsBcoVnTSoxcdRXDhbBGDHBm8XrX6m
	 n8ZqZ30DiDApM93FM7ysvwVWXA62Qsrosya6F2xTuXGdGzvfGQ4kWWgKKu/0OW/2PgTto
	 YFtjbZlAjGBrYqj741Ppz0R5cvpav98usCOqQ/TfjSpiaYh9YOUr5Pi3+YAWVyRF5CvTn
	 FlvBdsmZuxmhGlkMgGYhtSSLKvG3r55Q4R05lQXuUWYWSSWCy5DEMBaMFzEInl1NZHNgd
	 hVNVrdCgm0n1KwA8oss15pyERn3Pr8hziY7r8r7QAEgn1WKfZ4p59ArSV1WnmClQlTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=AJwUzOk0;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE226606D82F
	for <linux-mips@vger.kernel.org>; Thu,  5 Nov 2026 21:33:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE226606D82F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=AJwUzOk0
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso21548465e9.1
        for <linux-mips@vger.kernel.org>; Thu, 05 Nov 2026 13:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20260707.gappssmtp.com; s=20260707; t=1793914409; x=1794519209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Notht+srG91GHUEX+NvJgjSsIAvRKoHhEo0WPhNbsG0=;
        b=AJwUzOk0BhfGc0m3sJO94SX9OpHJG9OF8spXB3ZhwVayzvDwwAhC1A4rAd5qmQ/m/d
         VZeVBc8DPqpwc7uJBWI4XVovwPpk5aVPG1+vdqYgZWVqShka6UExS71u29+p0u6Df3AH
         ZZ2GHSAFRZ3ANQDO07NubnEG4FfEl4s8jSQf/k5ZdAhDH76tQJ2l6CsEKc762Slt3WM/
         VdbSgH+yLJqXeJ3/Ov/xeJEoTKcVYNuQZqmiMELwveIIrxrfiB2dy/uz0lYTVi6RC+cP
         J8WiulSCadYE7E865prkbm8GFF8d0pCNCG/h3UVc+VYd3U0/HGY18Pdw686QMdz1rmle
         uEZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793914409; x=1794519209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Notht+srG91GHUEX+NvJgjSsIAvRKoHhEo0WPhNbsG0=;
        b=kYBro4/NCpyIeR7OU+cVBbkAE9NY2q6jJrgO0/tBWT7oUmcXKIHyjhTphXJxtJ0kfl
         22lCQ24BYqcwNyooqLOSprGhkZZw4FBHigCU9++lsSPH5Myv4Ha3/M5350nTj87s/DO2
         bRSfvpiO9xfM1v9m9jGc++ygOpiBCvID7mthER49tW78OAqFXw0JbUhytZJG6oEhqBdy
         KBBzfx1UaVjJmGy9C9v807ElYqTg8EyVL+np+xhTWUTzrKBgyCvcbKmhKMt64wAgGBU3
         gt62xjZ/YlzLlYjsDC1rOr3L1L6/4AXJ7RhB8Jq+q54cvnA8isDe10ych8KLrkdmI3Lj
         4KcA==
X-Forwarded-Encrypted: i=1; AKwUvBxmLcfvMlaqQM64vuzg6HUo2Pdv0LjvN378O6g+8xfcqzWJNXcay85h/5CjC82YQLAlIHa8vmH94KZy@vger.kernel.org
X-Gm-Message-State: APuU4Z/a0kS9xozd1QQsu34XpOSU1mBGJH8IKWsuMpb+bsMU5gGDiqyC
	rIbdDkZMPp97JHt7P84QGnNPCl8tWxzN2bbCrNwpS5pV7qOSWwANEvYxDB4/j1bbXz8=
X-Gm-Gg: AYBFou0RpGCXEZ/UPBFwp3ygzEhzT90h1z1i0IVIwJschBshaKfOFn5gTpc1W2J/mIk
	8gvXKMzYAl318ywts3YhBmMPp5e6AQ44kU7c5fch3aXduHpi31bw9yVrH7rM1Wa+5ufjmSsqcvl
	z+310xal9alD3HemMwLk94D6rZaKuItp2TfRPnicMB/uYaAtr77i/Z2IrVNRqDBSL4dKaAXJzNt
	bWXFSQq0f0B9k1NvblNGyfOFN3vp7n8yzoSVR7WbmCvpjodQura5CmIR7OBNlH+gKGWtWWx+hCd
	P1CvzTwajNr25dqZlzCQVQGytvvckveEeG0ZyF8+ZRR8S2Ybqam29T+/j05vH47eOogh53p0Fqz
	OWSDDys/dDPsapOu7J3bozd4S7xBbpOTjpujDLCF2Y8ReADpBLCMIddDqMx2hGmFIh2uaqQBrag
	EUU+PgkFl9QotrjCzUYOCa6zHE7b7BsnN0UJGM5XMVVB9HIYixXiNooFicGU+05MnatRdOkUJ4v
	AWjNbIAP10gwns4idLZGKDlB8GZTQcDnMC3Aj8qW0dr95/1tTNrYQvf4GWePpTjzmfJZg8ZCFXL
	gIPqMv0lIWb373VemOepaiVHnegd08VDI4uRWmeluVobaqkXmecfGdymX8IqqRiEWLLw/eLy/em
	23wVpsZ8=
X-Received: by 2002:a05:600c:608a:b0:4a2:1364:252a with SMTP id 5b1f17b1804b1-4b6db0d07dbmr6419195e9.3.1793914409184;
        Thu, 05 Nov 2026 13:33:29 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:5c25:f8d1:d9d7:54c1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b411de95b4sm107798385e9.0.2026.11.05.13.33.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Nov 2026 13:33:28 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	Joshua Crofts <crofts@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v5 2/2] iio: adc: Add a driver for the Ingenic X1600 ADC
Date: Thu,  5 Nov 2026 22:32:10 +0100
Message-ID: <20261105213210.87457-3-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105213210.87457-1-olivier@mgcrea.io>
References: <20261105213210.87457-1-olivier@mgcrea.io>
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
driver that exposes the four channels as voltages against the SADC_VREFP
reference: the vref-supply's voltage when there is one, else 3.3 V, its
typical value.

The registers are in chapter 19 of the X1600 programming manual. The
ADC clock divider is even, as the manual has it (an odd value divides
by one less); the vendor kernel writes the divider minus one, which
gives a slightly faster clock than it asks for.

Tested on a HiBy R1, whose play/pause and volume keys sit on channel 0
behind adc-keys: all three read and report correctly.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Tested-by: H. Nikolaus Schaller <hns@goldelico.com> # LX16 - driver only, no real world test
---
 MAINTAINERS                         |   1 +
 drivers/iio/adc/Kconfig             |  10 ++
 drivers/iio/adc/Makefile            |   1 +
 drivers/iio/adc/ingenic-x1600-adc.c | 269 ++++++++++++++++++++++++++++
 4 files changed, 281 insertions(+)
 create mode 100644 drivers/iio/adc/ingenic-x1600-adc.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 4ab4ae67f788..81d5d1c89cff 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13180,6 +13180,7 @@ INGENIC X1600 ADC DRIVER
 M:	Olivier Louvignes <olivier@mgcrea.io>
 S:	Maintained
 F:	Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml
+F:	drivers/iio/adc/ingenic-x1600-adc.c
 
 INJOINIC IP5xxx POWER BANK IC DRIVER
 M:	Samuel Holland <samuel@sholland.org>
diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index f8456c803988..fab8147834b1 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -891,6 +891,16 @@ config INGENIC_ADC
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
index d7bb4815df61..702715603c94 100644
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
index 000000000000..81bc651731b2
--- /dev/null
+++ b/drivers/iio/adc/ingenic-x1600-adc.c
@@ -0,0 +1,269 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Ingenic X1600 ADC driver
+ *
+ * Copyright (c) 2026 Olivier Louvignes <olivier@mgcrea.io>
+ *
+ * The X1600's SAR ADC has four auxiliary channels, each with its own start
+ * bit, interrupt and 12-bit result (X1600 programming manual, chapter 19).
+ */
+
+#include <linux/array_size.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/cleanup.h>
+#include <linux/clk.h>
+#include <linux/completion.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/iio/iio.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/jiffies.h>
+#include <linux/math.h>
+#include <linux/minmax.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
+#include <linux/time.h>
+#include <linux/types.h>
+#include <linux/units.h>
+
+#define X1600_ADC_REG_ENABLE		0x00
+#define X1600_ADC_REG_CTRL		0x08
+#define X1600_ADC_REG_STATUS		0x0c
+#define X1600_ADC_REG_DATA(bank)	(0x10 + (bank) * 4)
+#define X1600_ADC_REG_CLKDIV		0x20
+#define X1600_ADC_REG_STABLE		0x24
+
+/* ENABLE: bits 3..0 start a channel's conversion; bit 15 powers down. */
+#define X1600_ADC_ENABLE_POWER_DOWN	BIT(15)
+/* CTRL: bits 3..0 mask the channels' interrupts. STATUS: write 1 to clear. */
+#define X1600_ADC_CHANNELS_MASK		GENMASK(3, 0)
+#define X1600_ADC_DATA_MASK(shift)	(GENMASK(11, 0) << ((shift) * 16))
+/* CLKDIV: an even divider from the device clock; US and MS: for repeats. */
+#define X1600_ADC_CLKDIV_CLKDIV		GENMASK(7, 0)
+#define X1600_ADC_CLKDIV_US		GENMASK(15, 8)
+#define X1600_ADC_CLKDIV_MS		GENMASK(31, 16)
+#define X1600_ADC_STABLE_TIME		GENMASK(15, 0)
+
+#define X1600_ADC_NUM_CHANNELS		4
+/* SADC_VREFP when no vref-supply gives it: the datasheet's typical value. */
+#define X1600_ADC_VREF_DEFAULT_mV	3300
+#define X1600_ADC_BITS			12
+/* The ADC clock the vendor kernel runs at. */
+#define X1600_ADC_CLK_RATE_HZ		1166667
+#define X1600_ADC_TIMEOUT		msecs_to_jiffies(20)
+
+struct x1600_adc {
+	void __iomem *base;
+	struct clk *clk;
+	struct completion done;
+	int vref_mV;
+	/* Serialises conversions: there is one completion for all channels. */
+	struct mutex lock;
+};
+
+static u32 x1600_adc_read(struct x1600_adc *adc, unsigned int offset)
+{
+	return readl(adc->base + offset);
+}
+
+static void x1600_adc_write(struct x1600_adc *adc, unsigned int offset, u32 value)
+{
+	writel(value, adc->base + offset);
+}
+
+static irqreturn_t x1600_adc_irq(int irq, void *data)
+{
+	struct x1600_adc *adc = data;
+	u32 status;
+
+	status = x1600_adc_read(adc, X1600_ADC_REG_STATUS) & X1600_ADC_CHANNELS_MASK;
+	if (!status)
+		return IRQ_NONE;
+
+	x1600_adc_write(adc, X1600_ADC_REG_STATUS, status);
+	complete(&adc->done);
+	return IRQ_HANDLED;
+}
+
+static int x1600_adc_read_raw_channel(struct x1600_adc *adc, unsigned int ch, int *val)
+{
+	unsigned int bank, shift;
+	u32 enable, data;
+	int ret;
+
+	guard(mutex)(&adc->lock);
+
+	reinit_completion(&adc->done);
+	x1600_adc_write(adc, X1600_ADC_REG_STATUS, BIT(ch));
+	enable = x1600_adc_read(adc, X1600_ADC_REG_ENABLE);
+	x1600_adc_write(adc, X1600_ADC_REG_ENABLE, enable | BIT(ch));
+
+	if (wait_for_completion_timeout(&adc->done, X1600_ADC_TIMEOUT))
+		ret = 0;
+	else
+		ret = -ETIMEDOUT;
+
+	enable = x1600_adc_read(adc, X1600_ADC_REG_ENABLE);
+	x1600_adc_write(adc, X1600_ADC_REG_ENABLE, enable & ~BIT(ch));
+	if (ret)
+		return ret;
+
+	/* Two results to a data register, the even channel's in the low half. */
+	bank = ch / 2;
+	shift = ch % 2;
+	data = x1600_adc_read(adc, X1600_ADC_REG_DATA(bank));
+	*val = field_get(X1600_ADC_DATA_MASK(shift), data);
+
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
+		if (ret)
+			return ret;
+
+		return IIO_VAL_INT;
+	case IIO_CHAN_INFO_SCALE:
+		*val = adc->vref_mV;
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
+#define X1600_ADC_CHANNEL(_ch) {				\
+	.type = IIO_VOLTAGE,					\
+	.indexed = 1,						\
+	.channel = (_ch),					\
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
+	x1600_adc_write(adc, X1600_ADC_REG_CTRL, X1600_ADC_CHANNELS_MASK);
+	x1600_adc_write(adc, X1600_ADC_REG_ENABLE, X1600_ADC_ENABLE_POWER_DOWN);
+}
+
+static int x1600_adc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct iio_dev *iio_dev;
+	struct x1600_adc *adc;
+	unsigned long rate;
+	u32 div, reg;
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
+	adc->clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(adc->clk))
+		return dev_err_probe(dev, PTR_ERR(adc->clk), "Unable to get clock\n");
+
+	ret = devm_regulator_get_enable_read_voltage(dev, "vref");
+	if (ret < 0 && ret != -ENODEV)
+		return dev_err_probe(dev, ret, "Unable to get the reference voltage\n");
+
+	adc->vref_mV = ret == -ENODEV ? X1600_ADC_VREF_DEFAULT_mV : ret / (MICRO / MILLI);
+
+	/* Powered down, interrupts masked and cleared, as the vendor does. */
+	x1600_adc_write(adc, X1600_ADC_REG_ENABLE, X1600_ADC_ENABLE_POWER_DOWN);
+	x1600_adc_write(adc, X1600_ADC_REG_CTRL, X1600_ADC_CHANNELS_MASK);
+	x1600_adc_write(adc, X1600_ADC_REG_STATUS, X1600_ADC_CHANNELS_MASK);
+
+	rate = clamp(clk_get_rate(adc->clk),
+		     2UL * X1600_ADC_CLK_RATE_HZ, 254UL * X1600_ADC_CLK_RATE_HZ);
+	div = round_up(DIV_ROUND_UP(rate, X1600_ADC_CLK_RATE_HZ), 2);
+	/* US and MS at their reset values: single conversions don't use them. */
+	x1600_adc_write(adc, X1600_ADC_REG_CLKDIV,
+			FIELD_PREP(X1600_ADC_CLKDIV_CLKDIV, div) |
+			FIELD_PREP(X1600_ADC_CLKDIV_US, 16) |
+			FIELD_PREP(X1600_ADC_CLKDIV_MS, 4));
+	reg = x1600_adc_read(adc, X1600_ADC_REG_STABLE) & ~X1600_ADC_STABLE_TIME;
+	x1600_adc_write(adc, X1600_ADC_REG_STABLE,
+			reg | FIELD_PREP(X1600_ADC_STABLE_TIME, 1));
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	ret = devm_request_irq(dev, irq, x1600_adc_irq, 0, dev_name(dev), adc);
+	if (ret)
+		return ret;
+
+	/*
+	 * Left powered up: a typical use, such as buttons read through adc-keys,
+	 * polls every few tens of milliseconds, and powering up takes 2 ms.
+	 */
+	x1600_adc_write(adc, X1600_ADC_REG_ENABLE, 0);
+	fsleep(2 * USEC_PER_MSEC);
+	x1600_adc_write(adc, X1600_ADC_REG_CTRL, 0);
+
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
+MODULE_AUTHOR("Olivier Louvignes <olivier@mgcrea.io>");
+MODULE_DESCRIPTION("Ingenic X1600 ADC driver");
+MODULE_LICENSE("GPL");
-- 
2.39.5

