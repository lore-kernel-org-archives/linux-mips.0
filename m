Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792825221;
	b=hMDJUDW/ckE9ddXBt5jsKi+tHX+Xi8YEZL9OIAqcx9IB+Taz5fj4OH3JlVPVu17cSljK
	 rRVzeGtXI4CI8Zdl2FwF/V85TZadF3rgKKnFRZKCA5EgwaFZcBPbIat7OU+I8IjQEdy8u
	 z/U8nYWZbNuyUAFjeQqDuSlhW7ywenM0DXAbCOlIeVRZ60QJVKkUx15okxviVsxe7C4WL
	 gU5wdaiazEJ5jiEpCN8L2K4A177qey3vh/EuhHGSDgq3Qx2Vh6TNMEfTeG/yYI+cH2leW
	 OykmbUzZlfQIKED9XTEopUseAxQ3OELs8tyrmhxXe5orK2Hj3WgD63pmNt96VMsY95A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792825221;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Y6MPlItNnv+GsY20I3sstkpXLDue914ZTPjNUcDG96g=;
	b=N/2yKWQh+VgEZgk/lgNXuN7ITw7GARw+pzWYNK6pfuvbQj5PoYnBMH7YQ0kSzVASEZol
	 m37GqOlOTxQFprXYtOpqMDopU6fDY1J8T7qFk5WSazUZozitV6dWPQLNZ7ctWXDTHdUSz
	 GRn6XTTHuaqYBcGhK7VD2wV4UsTD7SwPWshDe5oyvS4rRQD+Am/Qq8NF7heW6maASlwP0
	 /AAYJ4mpmBvqOsQmVFj7HwRIR6IC8qnLThmw4s86KUiJhgqcoE0KJUJgFvDk1rVZ1OT1T
	 JpW4/fGuc6Akl3ayglzf2vmuYegGuKYRa0ktbLgd3rKqQ5snhZKGiFNTd44CSTtz63g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UYn1LBbD;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA14606A321
	for <linux-mips@vger.kernel.org>; Sat, 24 Oct 2026 07:00:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFA14606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UYn1LBbD
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so8367235e9.3
        for <linux-mips@vger.kernel.org>; Sat, 24 Oct 2026 00:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792825209; x=1793430009; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y6MPlItNnv+GsY20I3sstkpXLDue914ZTPjNUcDG96g=;
        b=UYn1LBbD088fngO6Ea5WxjmUHVrrWb6podP0F3wiQvM0gVTs5C42y7l+i9kh6QpE9k
         /6WBRyKDvXQlY3n4SKrYRVJ+pRqc6Bl0PdS8Jsk4QAU93686VXi7iEfITXHWb3zoEUAp
         ffWyEkT9StzVDCMcGlBUQkv9QbPpYc8HQ+9SYO0UNTkec2wBNqRk8cl+ccUONziuYIYX
         P4RNH7IX+S8Eq5yDP450hPZtzCwBzIPxEIqDC2l/peyBPk7kL5dc8ghmfruKe47puiRE
         e04ghXYmkrCDjWeoVpKvxdUIGkUT5t97QMJg5jcVsnG7tcvK0gPgxd9V63dqrtH4BULX
         yINw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792825209; x=1793430009;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y6MPlItNnv+GsY20I3sstkpXLDue914ZTPjNUcDG96g=;
        b=k6NXWxgInfrD9z1idwWLb9NK1aMq2BoI6Z9Sa1PhCIgLIqm3e+2HxtFLnTR8UFg0j4
         PvhJ2j9QMrWXsG38yXEzhcaa0omgygrrsLfHGrQ1HhLFr4YfrR37LY42g/ft2nfzXLk8
         YtQIbjRAFpQRw4RblWRlYWRhZo7BWhFDdTtu9QSLKkDXOMpPPhi7pjIM4d6huLxlN+Qy
         23RTOjZUuQC2/p+q9HwFTllDIkBYOVSEx9dS+9YJzDmMyGjdtAn9mDdQTZ9ec/MhUcgQ
         DXI7DbZ9B8AykAK0KCZkxPHQI6yBzgauZCOSqfplZJd9Ul99colU79LOFC1kqxgLMHdJ
         Jgdg==
X-Forwarded-Encrypted: i=1; AKwUvBzdE3Nt5MaJN4QVBErsAcTU37cClzImGyJ4B//C8YxJ4Y6xDYWH5YaFMMlKuA5M+YzHVPJui1xxznyB@vger.kernel.org
X-Gm-Message-State: AFq9FYLrskHy/emXPAYnyq037BEODwN7mmINQypt0XVH/od2O9bHHroS
	uavPi6xJ34Q1g5AijXDpmgwMWkScuuz087FaiD7glYmiZeMyCOR1622h/4G4Mg==
X-Gm-Gg: AYBFou31SiKxLmbev4uMXB3uONkAoo96IC8mxEYHl2smrBhENrwlF6JmEALDjfrVK/v
	7B1iIMyqbFKdZthTnAgYCdwCabqOunUvIz9ss5DmNkcfYl12dDzB7EfAakJ96vqGA7/IJB/4RFz
	wOvYwpRfZ98j1w2kW2SgoVqknrBMqvwWivKkxNd7pNyZJLtFa0RSwmS2nPLMfU87dAgNaYcRuDA
	0bhyKykZIZddQVD6ILlygd3FixW4yn6+KySZulJUy1k+5UmQjJeNnqE8MPxNpeHA+5xVnAQuJpT
	G9Qa1VrdLS8yRkUPINP+sMxH/JHjantJFnh8dcyf7dSBLk9zEu37BupjxkBueE2LkvlESj3KrEC
	ox07Po5nrJ3JMPtXDuYZPjySnPgZfQSoLxn1xzntpltlYfUZIaENOD1wWfIlGv0nHD/w+70Havj
	dNkfa+flUGblJ1+DzsZxM8Ow1Aavcw1XFbP5V7C9IXtYbUznaHy4D2kvtQcW+PQHgOoDbcRdkNz
	ffuy0E+bhnfSIFAkNFbYOLPzWtr0GGPij2Eb0R8rrQMqxxQIEbVcB+P2mNKorzp4fnNv3XEsBj/
	EovkPPRWpTQQtP4gxikKusA2T6RXYkkhsQnKrO0hAZttZPKz3Rndyi1kWDSeK2IP2ovnEdyrCIQ
	baMtV0Rb8AxXwmboLCscAFcY0pLUDBlOVgS8kJlT5f4oOWu1utjrBPdemffIUf/rRLcKj/otroJ
	kxlDYhb0xOXr/X8tMe6JHbOWnTLJGQ4lXdLu1HYoG4h0vMw7sNW1wtflLDSGQuhw==
X-Received: by 2002:a05:600c:6748:b0:49e:6050:9fbe with SMTP id 5b1f17b1804b1-4a35aca53camr16321375e9.15.1792825209014;
        Sat, 24 Oct 2026 00:00:09 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm100667405e9.1.2026.10.24.00.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 00:00:08 -0700 (PDT)
Date: Sat, 24 Oct 2026 09:00:06 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Olivier Louvignes <olivier@mgcrea.io>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul
 Cercueil <paul@crapouillou.net>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] iio: adc: Add a driver for the Ingenic X1600 ADC
Message-ID: <20261024090006.00002720@gmail.com>
In-Reply-To: <20261024041357.34346-2-olivier@mgcrea.io>
References: <20261024041357.34346-1-olivier@mgcrea.io>
	<20261024041357.34346-2-olivier@mgcrea.io>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 24 Oct 2026 06:13:57 +0200
Olivier Louvignes <olivier@mgcrea.io> wrote:

> diff --git a/MAINTAINERS b/MAINTAINERS
> index ecc22d1149d1..bbb63228e330 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12925,6 +12925,13 @@ F:	include/linux/mfd/ingenic-tcu.h
>  F:	sound/soc/codecs/jz47*
>  F:	sound/soc/jz4740/
>  
> +INGENIC X1600 ADC DRIVER
> +M:	Olivier Louvignes <olivier@mgcrea.io>
> +L:	linux-iio@vger.kernel.org

Drop the list, get_maintainer gets this via the directory.

> +S:	Maintained
> +F:	Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml

The changes above should go into patch 1 (checkpatch will
raise a warning if you're creating a new file and it's not
documented in MAINTAINERS).

> +F:	drivers/iio/adc/ingenic-x1600-adc.c

And this addition goes into patch 2.

...

> diff --git a/drivers/iio/adc/ingenic-x1600-adc.c b/drivers/iio/adc/ingenic-x1600-adc.c
> new file mode 100644
> index 000000000000..60683f26c693
> --- /dev/null
> +++ b/drivers/iio/adc/ingenic-x1600-adc.c
> @@ -0,0 +1,226 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * ADC driver for the Ingenic X1600 SoC
> + *

+ Copyright (c) 2026 YOUR_NAME <YOUR_EMAIL>

> + * The X1600's SAR ADC has four auxiliary channels, each with its own start
> + * bit, interrupt and 12-bit result. The register layout and the clock set-up
> + * were read from the vendor 4.4 kernel's driver.
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/completion.h>
> +#include <linux/delay.h>
> +#include <linux/iio/iio.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>

+ bits.h, types.h, array_size.h, cleanup.h, jiffies.h, minmax.h

> +
> +#define X1600_ADC_REG_ENABLE		0x00
> +#define X1600_ADC_REG_CTRL		0x08
> +#define X1600_ADC_REG_STATUS		0x0c
> +#define X1600_ADC_REG_DATA(ch)		(0x10 + ((ch) / 2) * 4)
> +#define X1600_ADC_REG_CLKDIV		0x20
> +#define X1600_ADC_REG_STABLE		0x24
> +
> +/* ENABLE: bits 3..0 start a channel's conversion; bit 15 powers down. */
> +#define X1600_ADC_ENABLE_POWER_DOWN	BIT(15)
> +/* CTRL: bits 3..0 mask the channels' interrupts. STATUS: write 1 to clear. */
> +#define X1600_ADC_CHANNELS_MASK		GENMASK(3, 0)
> +#define X1600_ADC_DATA_MASK(ch)		(GENMASK(11, 0) << ((ch) % 2 * 16))
> +#define X1600_ADC_CLKDIV_DIV0		GENMASK(7, 0)
> +#define X1600_ADC_CLKDIV_DIV1		GENMASK(15, 8)
> +#define X1600_ADC_CLKDIV_DIV2		GENMASK(31, 16)
> +#define X1600_ADC_STABLE_TIME		GENMASK(15, 0)
> +
> +#define X1600_ADC_NUM_CHANNELS		4
> +#define X1600_ADC_VREF_mV		3300
> +#define X1600_ADC_BITS			12
> +/* The vendor kernel brings its 140 MHz APB clock down to about this. */
> +#define X1600_ADC_CLK_RATE		1166667
> +#define X1600_ADC_TIMEOUT_MS		20
> +
> +struct x1600_adc {
> +	void __iomem *base;
> +	struct clk *clk;
> +	struct completion done;
> +	/* Serialises conversions: there is one completion for all channels. */
> +	struct mutex lock;
> +};
> +
> +static irqreturn_t x1600_adc_irq(int irq, void *data)
> +{
> +	struct x1600_adc *adc = data;
> +	u32 status;
> +
> +	status = readl(adc->base + X1600_ADC_REG_STATUS) & X1600_ADC_CHANNELS_MASK;
> +	if (!status)
> +		return IRQ_NONE;
> +
> +	writel(status, adc->base + X1600_ADC_REG_STATUS);
> +	complete(&adc->done);
> +	return IRQ_HANDLED;
> +}
> +
> +static int x1600_adc_read_raw_channel(struct x1600_adc *adc, unsigned int ch, int *val)
> +{
> +	u32 data;
> +	int ret = 0;

Reverse xmas tree.

> +
> +	guard(mutex)(&adc->lock);
> +
> +	reinit_completion(&adc->done);
> +	writel(BIT(ch), adc->base + X1600_ADC_REG_STATUS);
> +	writel(readl(adc->base + X1600_ADC_REG_ENABLE) | BIT(ch),
> +	       adc->base + X1600_ADC_REG_ENABLE);
> +
> +	if (!wait_for_completion_timeout(&adc->done,
> +					 msecs_to_jiffies(X1600_ADC_TIMEOUT_MS)))
> +		ret = -ETIMEDOUT;
> +
> +	writel(readl(adc->base + X1600_ADC_REG_ENABLE) & ~BIT(ch),
> +	       adc->base + X1600_ADC_REG_ENABLE);
> +	if (ret)
> +		return ret;
> +
> +	data = readl(adc->base + X1600_ADC_REG_DATA(ch));
> +	*val = field_get(X1600_ADC_DATA_MASK(ch), data);
> +	return 0;
> +}
> +
> +static int x1600_adc_read_raw(struct iio_dev *iio_dev,
> +			      struct iio_chan_spec const *chan,
> +			      int *val, int *val2, long mask)
> +{
> +	struct x1600_adc *adc = iio_priv(iio_dev);
> +	int ret;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		ret = x1600_adc_read_raw_channel(adc, chan->channel, val);
> +		return ret ? ret : IIO_VAL_INT;

You can use the Elvis operator here.

> +	case IIO_CHAN_INFO_SCALE:
> +		*val = X1600_ADC_VREF_mV;
> +		*val2 = X1600_ADC_BITS;
> +		return IIO_VAL_FRACTIONAL_LOG2;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static const struct iio_info x1600_adc_info = {
> +	.read_raw = x1600_adc_read_raw,
> +};
> +
> +#define X1600_ADC_CHANNEL(ch) {					\

Small nit, but align the \ with the others.

> +	.type = IIO_VOLTAGE,					\
> +	.indexed = 1,						\
> +	.channel = (ch),					\
> +	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),		\
> +	.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE),	\
> +}
> +
x
...

> +	/* Powered down, interrupts masked and cleared, as the vendor does. */
> +	writel(X1600_ADC_ENABLE_POWER_DOWN, adc->base + X1600_ADC_REG_ENABLE);
> +	writel(X1600_ADC_CHANNELS_MASK, adc->base + X1600_ADC_REG_CTRL);
> +	writel(X1600_ADC_CHANNELS_MASK, adc->base + X1600_ADC_REG_STATUS);
> +
> +	rate = clk_get_rate(adc->clk);
> +	div0 = clamp(DIV_ROUND_UP(rate, X1600_ADC_CLK_RATE), 1UL, 256UL) - 1;
> +	/* DIV1 and DIV2 as the vendor kernel sets them. */
> +	writel(FIELD_PREP(X1600_ADC_CLKDIV_DIV0, div0) |
> +	       FIELD_PREP(X1600_ADC_CLKDIV_DIV1, 1) |
> +	       FIELD_PREP(X1600_ADC_CLKDIV_DIV2, 99),
> +	       adc->base + X1600_ADC_REG_CLKDIV);
> +	reg = readl(adc->base + X1600_ADC_REG_STABLE) & ~X1600_ADC_STABLE_TIME;
> +	writel(reg | FIELD_PREP(X1600_ADC_STABLE_TIME, 1),
> +	       adc->base + X1600_ADC_REG_STABLE);
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +
> +	ret = devm_request_irq(dev, irq, x1600_adc_irq, 0, dev_name(dev), adc);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to request irq\n");

devm_request_irq() already prints an error message on failure, just
"return ret;" is fine.

> +
> +	/*
> +	 * Powered up for good: the keys poll it every few tens of milliseconds,
> +	 * and powering up takes 2 ms.
> +	 */
> +	writel(0, adc->base + X1600_ADC_REG_ENABLE);
> +	fsleep(2000);
> +	writel(0, adc->base + X1600_ADC_REG_CTRL);

+ blank line.

> +	ret = devm_add_action_or_reset(dev, x1600_adc_power_down, adc);
> +	if (ret)
> +		return ret;
> +
> +	iio_dev->name = "x1600-adc";
> +	iio_dev->modes = INDIO_DIRECT_MODE;
> +	iio_dev->channels = x1600_adc_channels;
> +	iio_dev->num_channels = ARRAY_SIZE(x1600_adc_channels);
> +	iio_dev->info = &x1600_adc_info;
> +
> +	return devm_iio_device_register(dev, iio_dev);
> +}
> +
> +static const struct of_device_id x1600_adc_of_match[] = {
> +	{ .compatible = "ingenic,x1600-adc" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, x1600_adc_of_match);
> +
> +static struct platform_driver x1600_adc_driver = {
> +	.driver = {
> +		.name = "ingenic-x1600-adc",
> +		.of_match_table = x1600_adc_of_match,
> +	},
> +	.probe = x1600_adc_probe,
> +};
> +module_platform_driver(x1600_adc_driver);
> +MODULE_DESCRIPTION("ADC driver for the Ingenic X1600 SoC");

MODULE_AUTHOR()?

> +MODULE_LICENSE("GPL");



-- 
Kind regards,
Joshua Crofts
