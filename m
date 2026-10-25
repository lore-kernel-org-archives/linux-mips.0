Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792918009;
	b=g9/I5kk2KLPka1lo9JpyhfIqcPDGTqyD5+jyzef3FfmDPHa+7jQRM/M0ROvlvT95aMHX
	 UQ8KtNV2qshuE5XlIGURf8P2PPusPId6Y3v1hZCcsGa7Sp8mGzm5uDqELB0NCfFuTmerB
	 ov/SxY3x7+EUfP/1ZY2TGavp/BI5tjHEZAfdL2YH1+1PX2Sf4YY/1FzNXMEExauYaYxmp
	 Dq0OdTW2MCwn5WuwZ5mD8PczEki9H5/F6spTIlsWEunJbijrynKZ8BuuqY3rsRV7BuHjh
	 zyfhy21Pxkq9pPsD3P1OdYVTpFdx6bGtrZ+SxKxkiRvyqco6HeGe6ceOO86WXHElmKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792918009;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LKxOIc+Os/5OwZrKosD6IK2IejYrwsOHb9VwGtXoqJM=;
	b=Zzr8/ak+SLVx4Iniaun5bOxWsEowhbefSzWW3GfIhS4niGLhqNMA4KfD1rX1EZu88oxv
	 ygfkojOMz2iFqFPAqObpK3a9vtDhtRh51q0sDvYU+WGZSgm/dHY5pFUl1dUzgYOqyouMv
	 rS67S4WIPnjdVTW+o6IzqbKYJQ9+NcoRj/dP/dPEhKiFiXuSnMjm3GlMtTj+7nL/5YCTv
	 qceZ3W7XWwI9U/8FQKs54Psq4Hl05z0/aKj7Ih4lMfdx18WqO73VYKSwb1MG8oewq43Yn
	 4ntvnmEYgQzWlcjgLKv82qs8Ebi2PjEQmY31RwjRlJOIBgxTv8YUxULLRomAzzZpJhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=Dfbc78Su;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EA6606A32F
	for <linux-mips@vger.kernel.org>; Sun, 25 Oct 2026 08:46:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04EA6606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=Dfbc78Su
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so1248253f8f.0
        for <linux-mips@vger.kernel.org>; Sun, 25 Oct 2026 01:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792918006; x=1793522806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LKxOIc+Os/5OwZrKosD6IK2IejYrwsOHb9VwGtXoqJM=;
        b=Dfbc78Su2mChKaGgA74zsFH18zKAwp+ElKEKGXUsL/hCluwwk2ZQQKTb9lKvD7+Rkj
         xhRZshHb8SXYQUDKnuguFk8FPKQMb1DyVexyBIhV1nx8VXlZSAstZuVYg68f/qxF+hpE
         PuwRqqzdNeIOVGQ4mjBAC+xbSUrcAZAWfKKSeKTk3vm/dC0YznGHmyjWoW3axWcKVboa
         QRjq+TDP+ceVcuf5BMsKVgHS8t7dl0NKjObWkWXGaVgH469552UXSkWxsQpat4TsmGKu
         Mgo2Jy105xhhKq4qG/psz9vIMjgOWR4yUtiJCSbiDjTE+2u8hEXQQ93jzsO93HSfiWwi
         /FoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792918006; x=1793522806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LKxOIc+Os/5OwZrKosD6IK2IejYrwsOHb9VwGtXoqJM=;
        b=qPgEqdDHhRgxY+ay9Zt9I6oXV65aIxrnjrx4tt+QUCcnk+wXYBLpTtQbYWHagsA4sM
         xjeYVfh64YQI+Is1XFnuTRSQMAx8V7T4olxHAvW3CmbvvblZ7Uc2/65V00Cf/JqgrGUr
         OoC3D4Aa25e0shwEdScjbdTqsws83gdm8y9cYZNLHs+p7J3gsjM1Juas42bTJPQXKSMx
         8DGqwi/dRvl9DHfNH9fyvMS6bIHFlCjpTw41zWOWIBGGRSgz/zjEbP8Ol5Pf1TodvhU+
         pabbVHPtt9hQ5Q1LpqViJ2x79EZ0hISlTfDuwBKR61F/KLt+aqITdkxwPv0RSc5Z+zmV
         Anaw==
X-Forwarded-Encrypted: i=1; AKwUvBzDyG5ElgAfOGx4qQRGav6mEMBKErYvOP445cY/r3RcTgF7xTPbNOVpB5/1ONtSps8PY5GITSFCeWJM@vger.kernel.org
X-Gm-Message-State: AFq9FYJL7SjzBwhJtEdMaJzSsWctuQvBOjlROijNZZiuXM5IZG7XX98v
	+nLZzR9dWtEZAINdI6KbH32J/z3XfheGNdpkY9oHVdUdBOafD3qcqGncSowLdaIjNis=
X-Gm-Gg: AYBFou0xC30IwUFevwVa3B9JC5UHMrZIE8B3X6r+6CzuKMvhAAfxP9+Yr6M+Y+qLguZ
	R5O/njAsUHCGAREbB4P3HqmGKYgAoS0i7ZwcasrO5ZOUdwpVds6giEg7jH08oQGZQtpykwSrF4d
	ZZvTgwILr5ATCYb0b/duvrAow2ex9hJWlQ4knTI36zAJd0BO4oO/I4W9EBJqO+DHO3L9JeTO8Wt
	9/Y6+dmmPo+xaqfarA3mTUI9syfjhgi2sdNieAlLLutngMFzn9dPOmIiMK4Qc8HBQBzHI9N099m
	9kNL3Vla2kAUM5m5s5Bc1YvsWPsxTIVTLEvUh9doE+vxSk5T3cNyTEeh2nzeXZ6lyoaCJTiYSI+
	RNWW3MxoSMXV1DSDLO9yBEQG2ZV/ebJOtF8pQIqPbgSaApEMX6u/9QYacchyOkSqsO1dFbeDaad
	jJh+Cjgs7PpGpmbsbgjQBsdP0WOflxK+0JCEorZo6nj3BnWIc+3CvMyDPQC767cVQUZjxivXkKu
	ibMOOh5mdSLC2DarhxdKUPL3d8WE+desmjdhqPh03BZxQk+oHlYOVFdC9cLfXZTk/+SdXcrbM78
	0u3jXmuhRlYDGByHmEE8a4qzhrRA/j0hmFzI+pSkKV/IcYlu/D/A7dxeALKsCZ0BfCRg+FYgLg=
	=
X-Received: by 2002:a05:6000:2511:b0:48e:850:c0b7 with SMTP id ffacd0b85a97d-48e3ebd0c47mr6904966f8f.1.1792918006361;
        Sun, 25 Oct 2026 01:46:46 -0700 (PDT)
Received: from localhost.localdomain (2a01cb060184ad00bcfbae5efa3e0f0b.ipv6.abo.wanadoo.fr. [2a01:cb06:184:ad00:bcfb:ae5e:fa3e:f0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb99esm8616707f8f.23.2026.10.25.01.46.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 25 Oct 2026 01:46:45 -0700 (PDT)
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
Subject: [PATCH 2/2] pwm: Add a driver for the Ingenic X1600 PWM controller
Date: Sun, 25 Oct 2026 09:46:43 +0100
Message-ID: <20261025084643.93167-3-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261025084643.93167-1-olivier@mgcrea.io>
References: <20261025084643.93167-1-olivier@mgcrea.io>
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
 MAINTAINERS                     |   1 +
 drivers/pwm/Kconfig             |  11 ++
 drivers/pwm/Makefile            |   1 +
 drivers/pwm/pwm-ingenic-x1600.c | 260 ++++++++++++++++++++++++++++++++
 4 files changed, 273 insertions(+)
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
index 000000000000..83a8d5eec6bf
--- /dev/null
+++ b/drivers/pwm/pwm-ingenic-x1600.c
@@ -0,0 +1,260 @@
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
+	if (!rate)
+		return -EINVAL;
+
+	wf->period_length_ns = x1600_pwm_ns(high + low, rate, wfhw->prescale);
+	wf->duty_length_ns = x1600_pwm_ns(high, rate, wfhw->prescale);
+	wf->duty_offset_ns = wfhw->enabled && !wfhw->inl ?
+			     x1600_pwm_ns(low, rate, wfhw->prescale) : 0;
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
2.54.0

