Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792955789;
	b=qHEu5Q1XqhnuSuvDhPxcqW8QJ100WfwRR4hlMmbMqtG44jEHDiO/PC6EjQOIewG7pbHA
	 U62f9zfOe4e45cn4+T9X6Yad1AcIUdOYtkw53cnZSM5Z8C79jxhmveIypU7ZELkZexQhG
	 eEIp5LUxQLW1IvgoRZkWqE7b+lmNhMJJvSV+YhvK5zHGxMo1kDK74Z/gGdwxMQ1NYRX87
	 rVUwYT6OSUv49fpUITBctU+muvnNF1jJOp9kykCCxqwVPh+uZAmr+lBBVnx/03e0vc0lo
	 WTCRR4uiqWcdQNLB2hjEWeila0FBeUj3hZ9vwXlMzaB8dTQY6cOh/o4zti6TomFYWBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792955789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=shKs+84YFZWm8V4NxmW82M6dcuAtIzUXrpL2zUFyQkQ=;
	b=nVtNu0WkxA+lSvr7/udeutGIYC7LBJmaVxySYQuryrHs3tX6fYssanKxj4hZ+eDtoc5o
	 tktUJapZGIp1Bzaxs10M4frPgDQ8JU3MHxVLAL0xnCn83qzGRtKymvrnOy5mHTWdb/rlu
	 r7LT8QNhq9ujS3qrGpBWYglzzkfNz5k2NP9NHHla7CWLqpJc235bjrUK3EqB9xCp2FZpV
	 iJHArM3qg2gsUEw4JNXhq+HDeCbKigNt54e8CVnyt2RJoIXCuArNy35ijbKpcW2cJuduQ
	 2bwGFmiqvJBxAAwqGdscChU0rV43UZ9WVei0re9DOKKmZTlHW7nG5x7NWP9QyPmlgaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=U8Qcwrll;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8DD606A32A
	for <linux-mips@vger.kernel.org>; Sun, 25 Oct 2026 19:16:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F8DD606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=U8Qcwrll
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48df4e9d2d4so1312857f8f.3
        for <linux-mips@vger.kernel.org>; Sun, 25 Oct 2026 12:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792955787; x=1793560587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=shKs+84YFZWm8V4NxmW82M6dcuAtIzUXrpL2zUFyQkQ=;
        b=U8QcwrllUv/1g3l4wdbLJQYb+BNf2wY1221QSR13Pl1paWzFiZw09ejvf+azMdR3eT
         D6FyoXscbem2eHrxMiIXbueJBQrGhC1YhTSuJEZJ6xS3ios5rUtMyE/y2pOigAZQ/BBr
         ntcef6KJOnHuJORj0Op572MSyLYiV44QvfvtN4Gf1iLvsVMPdeY+LsNdXZm1nc+7jwnP
         9+gs1e/1tTZv6No0SNMhRB2v4jpY+DEeNF+vY69abr0oHty4lI5zuL0aZaSlSM9brVrp
         LOWnJPA7ZQcCshHZh3ZQfO1YDfOs6I04ZcO9FCaD5Kvjb6z0BjZIfvI6epZ+3lqjJ+np
         B8vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792955787; x=1793560587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=shKs+84YFZWm8V4NxmW82M6dcuAtIzUXrpL2zUFyQkQ=;
        b=zSRqAWXNnayafo0nTEPXVz8uQAkM7gDdjvLu7uctHBEklmGnVFPx5yt/glOBMM4Mg5
         mv5yAYkmCdslCj1Ttg13HAy0Bcp6JYulxBf4wP/q6xQGBYqpl6fYXuRrXBh1RonQwRIz
         uyKeTIYzzmGgslpqJGwojumfbIoV5xDnrrUYK0ShNzWQt8rEKPqehqYnfCIxrAs6EQ1q
         E59Hfvvacd/0gqN9efr5TRH3v/Tg2OgQU3maa2DxntQu2dRmFRyxdzweUtc/lCSqLwla
         S+wXv9ri5fmQ1LsfL3Y+5Lxe6/fMD+cYhWrgQ9GBjGwrfVEUp5AonJ+7PtrZ9pEL2uQM
         18mQ==
X-Forwarded-Encrypted: i=1; AKwUvByN1ikifpZrnITHXVYYg+6WoMLOy1VmMmHh9R4ssjTaCvDFKZUBx2YE8Vr04Y4hUQIc9aIBs+9ZE3Nm@vger.kernel.org
X-Gm-Message-State: AFq9FYIEEsirLVzqapyIIGBwiOYWSMME15m0aSp2to2eD5S2n2FwQTFq
	qOclloygkgUqICBYzWu0UHHirJn5PtdWlHKhJx4fm+xaxRTVjzN6KCtpb7gLREha2mE=
X-Gm-Gg: AYBFou2gs+e/HmG8LHrcq9xaEN0s1aArKxgzr60LwmOzvubMt8cb1EfGVwuL9zhpAhJ
	wu/Nm5xDmRLreBmuKKNwE+o6Cxwgps+24lZWIyJ+7P5R8B4I/ONRMA3puWVxCbQtBS6HG/g/vd6
	JHIvrvDOku62DxWN8n3jui5DHhrQDLInJrBE9EayO5ZfJ7LqWQq17u82Euswe9bP2mIu/JqdGzV
	kIjHScwaD2fW7oUKj8Fv2xefh42iaYxBg52dG25onVp5ky33SYgt5Ix9Ymn1m3UMrykkBhXNXpn
	V5ED2AYUb68qbBiEFSEH2M6eo3twqqDWTyeLJuTA7UNhShx+xOFdPwzHXzPnumiUZwYpfpl16Gg
	MLiPWtSnUv0JqjT6CVdDBYqgtiaaepjHb5LgZb/dKy1gIDqiyewQG9JCRjQxKrIUPb/d7eQ7yy9
	9pgLOq3eznaI/oHp1JMnex0Etl6z42RWtd9cAVdfK2IrkRxOhjLAOy1bP3q3GRfrd2psIHldC3b
	+dH4r7y6ZRkK3z10l2au/E1HjmgeSF6/bQ9hOXov9eEl6KU33URNGLY3W175DRFjL0U1Des0zAZ
	eLWRMZRtZQ2ISgg=
X-Received: by 2002:a5d:5f81:0:b0:48e:390:80cf with SMTP id ffacd0b85a97d-48e3eb99b12mr8126524f8f.32.1792955787353;
        Sun, 25 Oct 2026 12:16:27 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:6dfc:5715:ead7:7540])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3bcdsm10082051f8f.13.2026.10.25.12.16.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 25 Oct 2026 12:16:26 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v2 2/2] pwm: Add a driver for the Ingenic X1600 PWM controller
Date: Sun, 25 Oct 2026 20:16:24 +0100
Message-ID: <20261025191624.9219-3-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261025191624.9219-1-olivier@mgcrea.io>
References: <20261025191624.9219-1-olivier@mgcrea.io>
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

The X1600 has a PWM controller of its own, separate from the TCU timers
that pwm-jz4740 drives on earlier Ingenic SoCs (X1600 programming manual,
chapter 13): eight channels, each with a power-of-two clock divider and a
waveform word holding the counts at the high and at the low level, the
channel's initial level picking which comes first. So the duty offset is
0 or period - duty, and since neither count may be zero, a duty cycle of 0
or 100% switches the channel off with its idle level set accordingly.

The driver implements the waveform callbacks. It follows the manual's
order: the divider is only changed with the channel off, and a running
channel takes a new word through the update register.

Tested on a HiBy R1, whose backlight is channel 0.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
v2:
- Read a channel that is off with both counts loaded as disabled.
- Refuse a clock rate of 0 in round_waveform_tohw() and write_waveform().

 MAINTAINERS                     |   1 +
 drivers/pwm/Kconfig             |  11 ++
 drivers/pwm/Makefile            |   1 +
 drivers/pwm/pwm-ingenic-x1600.c | 280 ++++++++++++++++++++++++++++++++
 4 files changed, 293 insertions(+)
 create mode 100644 drivers/pwm/pwm-ingenic-x1600.c

diff --git a/MAINTAINERS b/MAINTAINERS
index c905aa13bcbc..c090512468a4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12882,6 +12882,7 @@ INGENIC X1600 PWM DRIVER
 M:	Olivier Louvignes <olivier@mgcrea.io>
 S:	Maintained
 F:	Documentation/devicetree/bindings/pwm/ingenic,x1600-pwm.yaml
+F:	drivers/pwm/pwm-ingenic-x1600.c
 
 INJOINIC IP5xxx POWER BANK IC DRIVER
 M:	Samuel Holland <samuel@sholland.org>
diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
index 729776086879..244c8f4f140e 100644
--- a/drivers/pwm/Kconfig
+++ b/drivers/pwm/Kconfig
@@ -381,6 +381,17 @@ config PWM_JZ4740
 	  To compile this driver as a module, choose M here: the module
 	  will be called pwm-jz4740.
 
+config PWM_INGENIC_X1600
+	tristate "Ingenic X1600 PWM support"
+	depends on MACH_INGENIC || COMPILE_TEST
+	depends on COMMON_CLK && OF && HAS_IOMEM
+	help
+	  Generic PWM framework driver for the PWM controller of the
+	  Ingenic X1600.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called pwm-ingenic-x1600.
+
 config PWM_KEEMBAY
 	tristate "Intel Keem Bay PWM driver"
 	depends on ARCH_KEEMBAY || COMPILE_TEST
diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile
index 5630a521a7cf..5c59b54e0029 100644
--- a/drivers/pwm/Makefile
+++ b/drivers/pwm/Makefile
@@ -31,6 +31,7 @@ obj-$(CONFIG_PWM_IMX_TPM)	+= pwm-imx-tpm.o
 obj-$(CONFIG_PWM_INTEL_LGM)	+= pwm-intel-lgm.o
 obj-$(CONFIG_PWM_IPQ)		+= pwm-ipq.o
 obj-$(CONFIG_PWM_IQS620A)	+= pwm-iqs620a.o
+obj-$(CONFIG_PWM_INGENIC_X1600)	+= pwm-ingenic-x1600.o
 obj-$(CONFIG_PWM_JZ4740)	+= pwm-jz4740.o
 obj-$(CONFIG_PWM_KEEMBAY)	+= pwm-keembay.o
 obj-$(CONFIG_PWM_LOONGSON)	+= pwm-loongson.o
diff --git a/drivers/pwm/pwm-ingenic-x1600.c b/drivers/pwm/pwm-ingenic-x1600.c
new file mode 100644
index 000000000000..5865ff0cf298
--- /dev/null
+++ b/drivers/pwm/pwm-ingenic-x1600.c
@@ -0,0 +1,280 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * PWM controller of the Ingenic X1600
+ *
+ * Copyright (c) 2026 Olivier Louvignes <olivier@mgcrea.io>
+ *
+ * Eight channels, each with a power-of-two clock divider and a waveform word
+ * holding the counts at the high and at the low level; the channel's initial
+ * level picks which comes first (X1600 programming manual, chapter 13). Unlike
+ * the JZ47xx and X1000, whose PWMs are TCU timer channels (pwm-jz4740), the
+ * X1600 has this separate controller.
+ *
+ * Limitations:
+ * - The duty offset is 0 or period - duty (the high level last).
+ * - Neither count may be zero, so a duty cycle of 0 or 100% switches the
+ *   channel off and holds its output at the idle level instead.
+ * - A disabled channel drives its idle level, low.
+ * - Changing the divider or the initial level stops the channel first, which
+ *   cuts the current period short.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/math64.h>
+#include <linux/minmax.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pwm.h>
+#include <linux/time.h>
+#include <linux/types.h>
+
+#define X1600_PWM_ENS			0x00	/* write 1: switch a channel on */
+#define X1600_PWM_ENC			0x04	/* write 1: switch a channel off */
+#define X1600_PWM_EN			0x08	/* the channels switched on */
+#define X1600_PWM_UPT			0x10	/* write 1: load the waveform word */
+#define X1600_PWM_BUSY			0x14	/* a load is pending */
+#define X1600_PWM_MS			0x20	/* 0: waveform word, 1: DMA */
+#define X1600_PWM_INL			0x24	/* the level a period starts with */
+#define X1600_PWM_IDL			0x28	/* the level while off */
+#define X1600_PWM_CCFG(n)		(0x40 + 4 * (n))
+#define X1600_PWM_WCFG(n)		(0x80 + 4 * (n))
+
+#define X1600_PWM_CCFG_PRESCALE		GENMASK(3, 0)	/* divide by 2^PRESCALE */
+#define X1600_PWM_WCFG_HIGH		GENMASK(31, 16)
+#define X1600_PWM_WCFG_LOW		GENMASK(15, 0)
+
+#define X1600_PWM_NUM			8
+#define X1600_PWM_MAX_COUNT		0xffff
+#define X1600_PWM_MAX_PRESCALE		7
+
+struct x1600_pwm {
+	void __iomem *base;
+	struct clk *clk;
+};
+
+struct x1600_pwm_wfhw {
+	u32 wcfg;
+	u8 prescale;
+	bool enabled;
+	bool inl;
+	bool idl;
+};
+
+static u64 x1600_pwm_counts(u64 ns, unsigned long rate, unsigned int prescale)
+{
+	return mul_u64_u64_div_u64(ns, rate, (u64)NSEC_PER_SEC << prescale);
+}
+
+static u64 x1600_pwm_ns(u64 counts, unsigned long rate, unsigned int prescale)
+{
+	return DIV64_U64_ROUND_UP((counts * NSEC_PER_SEC) << prescale, rate);
+}
+
+static int x1600_pwm_round_waveform_tohw(struct pwm_chip *chip, struct pwm_device *pwm,
+					 const struct pwm_waveform *wf, void *_wfhw)
+{
+	struct x1600_pwm *x = pwmchip_get_drvdata(chip);
+	unsigned long rate = clk_get_rate(x->clk);
+	struct x1600_pwm_wfhw *wfhw = _wfhw;
+	u64 period, high, offset;
+	unsigned int prescale;
+	int ret = 0;
+
+	*wfhw = (struct x1600_pwm_wfhw){ };
+	if (!wf->period_length_ns)
+		return 0;
+
+	if (!rate)
+		return -EINVAL;
+
+	for (prescale = 0; prescale < X1600_PWM_MAX_PRESCALE; prescale++)
+		if (x1600_pwm_counts(wf->period_length_ns, rate, prescale) <=
+		    X1600_PWM_MAX_COUNT)
+			break;
+
+	period = min(x1600_pwm_counts(wf->period_length_ns, rate, prescale),
+		     X1600_PWM_MAX_COUNT);
+	if (period < 2) {
+		period = 2;
+		ret = 1;
+	}
+	high = min(x1600_pwm_counts(wf->duty_length_ns, rate, prescale), period);
+	offset = x1600_pwm_counts(wf->duty_offset_ns, rate, prescale);
+
+	wfhw->prescale = prescale;
+	wfhw->wcfg = FIELD_PREP(X1600_PWM_WCFG_HIGH, high) |
+		     FIELD_PREP(X1600_PWM_WCFG_LOW, period - high);
+	wfhw->enabled = high && high < period;
+	/* Low first only if the requested offset reaches period - duty. */
+	wfhw->inl = !wfhw->enabled || offset < period - high;
+	wfhw->idl = high == period;
+
+	return ret;
+}
+
+static int x1600_pwm_round_waveform_fromhw(struct pwm_chip *chip, struct pwm_device *pwm,
+					   const void *_wfhw, struct pwm_waveform *wf)
+{
+	struct x1600_pwm *x = pwmchip_get_drvdata(chip);
+	unsigned long rate = clk_get_rate(x->clk);
+	const struct x1600_pwm_wfhw *wfhw = _wfhw;
+	u32 high = FIELD_GET(X1600_PWM_WCFG_HIGH, wfhw->wcfg);
+	u32 low = FIELD_GET(X1600_PWM_WCFG_LOW, wfhw->wcfg);
+
+	*wf = (struct pwm_waveform){ };
+
+	/*
+	 * A channel that is off drives its idle level. Both counts set means
+	 * it was stopped with a waveform still loaded: it is off. One count
+	 * zero is how 0 and 100% are written, and the idle level says which.
+	 */
+	if (!wfhw->enabled && high && low)
+		return 0;
+
+	if (!rate)
+		return -EINVAL;
+
+	wf->period_length_ns = x1600_pwm_ns(high + low, rate, wfhw->prescale);
+	if (!wfhw->enabled) {
+		wf->duty_length_ns = wfhw->idl ? wf->period_length_ns : 0;
+		return 0;
+	}
+
+	wf->duty_length_ns = x1600_pwm_ns(high, rate, wfhw->prescale);
+	wf->duty_offset_ns = wfhw->inl ? 0 : x1600_pwm_ns(low, rate, wfhw->prescale);
+
+	return 0;
+}
+
+static int x1600_pwm_read_waveform(struct pwm_chip *chip, struct pwm_device *pwm,
+				   void *_wfhw)
+{
+	struct x1600_pwm *x = pwmchip_get_drvdata(chip);
+	struct x1600_pwm_wfhw *wfhw = _wfhw;
+	unsigned int ch = pwm->hwpwm;
+
+	wfhw->enabled = readl(x->base + X1600_PWM_EN) & BIT(ch);
+	wfhw->inl = readl(x->base + X1600_PWM_INL) & BIT(ch);
+	wfhw->idl = readl(x->base + X1600_PWM_IDL) & BIT(ch);
+	wfhw->prescale = FIELD_GET(X1600_PWM_CCFG_PRESCALE,
+				   readl(x->base + X1600_PWM_CCFG(ch)));
+	wfhw->wcfg = readl(x->base + X1600_PWM_WCFG(ch));
+
+	return 0;
+}
+
+static void x1600_pwm_set_bit(struct x1600_pwm *x, unsigned int reg,
+			      unsigned int ch, bool set)
+{
+	u32 val = readl(x->base + reg);
+
+	if (set)
+		val |= BIT(ch);
+	else
+		val &= ~BIT(ch);
+	writel(val, x->base + reg);
+}
+
+static int x1600_pwm_write_waveform(struct pwm_chip *chip, struct pwm_device *pwm,
+				    const void *_wfhw)
+{
+	struct x1600_pwm *x = pwmchip_get_drvdata(chip);
+	const struct x1600_pwm_wfhw *wfhw = _wfhw;
+	unsigned long rate = clk_get_rate(x->clk);
+	struct x1600_pwm_wfhw cur;
+	unsigned int ch = pwm->hwpwm;
+	u32 busy;
+
+	if (!rate)
+		return -EINVAL;
+
+	x1600_pwm_read_waveform(chip, pwm, &cur);
+
+	/*
+	 * Running with the same divider and initial level: load the new word,
+	 * which the channel takes at the end of its period.
+	 */
+	if (cur.enabled && wfhw->enabled && cur.prescale == wfhw->prescale &&
+	    cur.inl == wfhw->inl) {
+		writel(wfhw->wcfg, x->base + X1600_PWM_WCFG(ch));
+		writel(BIT(ch), x->base + X1600_PWM_UPT);
+		return readl_poll_timeout(x->base + X1600_PWM_BUSY, busy,
+					  !(busy & BIT(ch)), 10,
+					  DIV_ROUND_UP_ULL(2ULL * USEC_PER_SEC *
+							   (X1600_PWM_MAX_COUNT << cur.prescale),
+							   rate));
+	}
+
+	/* The idle level first, so that stopping holds the right level. */
+	x1600_pwm_set_bit(x, X1600_PWM_IDL, ch, wfhw->idl);
+	if (cur.enabled)
+		writel(BIT(ch), x->base + X1600_PWM_ENC);
+
+	/* The prescaler only changes while the channel is off. */
+	writel(FIELD_PREP(X1600_PWM_CCFG_PRESCALE, wfhw->prescale),
+	       x->base + X1600_PWM_CCFG(ch));
+	x1600_pwm_set_bit(x, X1600_PWM_INL, ch, wfhw->inl);
+	writel(wfhw->wcfg, x->base + X1600_PWM_WCFG(ch));
+	x1600_pwm_set_bit(x, X1600_PWM_MS, ch, false);
+
+	if (wfhw->enabled)
+		writel(BIT(ch), x->base + X1600_PWM_ENS);
+
+	return 0;
+}
+
+static const struct pwm_ops x1600_pwm_ops = {
+	.sizeof_wfhw = sizeof(struct x1600_pwm_wfhw),
+	.round_waveform_tohw = x1600_pwm_round_waveform_tohw,
+	.round_waveform_fromhw = x1600_pwm_round_waveform_fromhw,
+	.read_waveform = x1600_pwm_read_waveform,
+	.write_waveform = x1600_pwm_write_waveform,
+};
+
+static int x1600_pwm_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct pwm_chip *chip;
+	struct x1600_pwm *x;
+
+	chip = devm_pwmchip_alloc(dev, X1600_PWM_NUM, sizeof(*x));
+	if (IS_ERR(chip))
+		return PTR_ERR(chip);
+	x = pwmchip_get_drvdata(chip);
+
+	x->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(x->base))
+		return PTR_ERR(x->base);
+
+	x->clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(x->clk))
+		return dev_err_probe(dev, PTR_ERR(x->clk), "Unable to get clock\n");
+
+	chip->ops = &x1600_pwm_ops;
+	return devm_pwmchip_add(dev, chip);
+}
+
+static const struct of_device_id x1600_pwm_of_match[] = {
+	{ .compatible = "ingenic,x1600-pwm" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, x1600_pwm_of_match);
+
+static struct platform_driver x1600_pwm_driver = {
+	.driver = {
+		.name = "ingenic-x1600-pwm",
+		.of_match_table = x1600_pwm_of_match,
+	},
+	.probe = x1600_pwm_probe,
+};
+module_platform_driver(x1600_pwm_driver);
+
+MODULE_AUTHOR("Olivier Louvignes <olivier@mgcrea.io>");
+MODULE_DESCRIPTION("Ingenic X1600 PWM driver");
+MODULE_LICENSE("GPL");
-- 
2.39.5

