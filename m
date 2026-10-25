Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792955814;
	b=gsmMrnnvlefj4Ul6QGzVPZsfam32BAksSmOmK5c1cgCGALCadf60k4FU3Pcv3dMTde/v
	 EKyaZYvsoeRVLsVSQk1nlzACjW/T5Cx8kwi36NEvMunaVDFHE16y7PqtX8p3hS4DdBiSB
	 XH99Zu6SyXfOLwze6KX7JicabUhZS4yP8WjYlQwehGkkeaGKjBjcLiaU0YEKhbr7DhgM+
	 ecw6NeeJuhFRGuYDUfmEtqpBuO1hFFjRSCqUkARDWXOqqezSYyJyl/LuLF8JVns2C/bFs
	 B1FLxDgT54zgCTTLYrBQUcCms2f9G53yIna9bZW+O4l/rNjfAL+ToZ57FMjbIG+fXyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792955814;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=At55VbEIUsasl7OxdFDzlSnsOUvX8xe1OzwnO0ut21E=;
	b=YibeeyOmkDuppUl7xxb64LlbbzfQOpcf49ousI1Fki4KBpKK5GH/f+fpx5cUMkXUkqCY
	 Yr8mYkgCh9kO92CZg8dx8JqCGynY/lgO7tonT4O/HgB6qzJQBNx6PbU9AgIUQe8/QEe9q
	 spuJ9g78vQMWJaaO7gy/4lF4VrjteEvCA0+yo851bkJfydhtODD7j3NsuT8aNZO1yeoOv
	 SOkbOfG1yjYV/6FipVlJdiRVJrxeIM8SvHqeH+xnrGQeOPNKlpO/qFu0NFuTKGG6pcXPt
	 9PWnAmNazZXWFyOcYCwDxpc1alKQjQdBwlyu9f5BZi6jI8oYBqRxHAkGuHWphFesrMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=V3otzXTC;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B440606A322
	for <linux-mips@vger.kernel.org>; Sun, 25 Oct 2026 19:16:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B440606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=V3otzXTC
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso23982595e9.3
        for <linux-mips@vger.kernel.org>; Sun, 25 Oct 2026 12:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792955805; x=1793560605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=At55VbEIUsasl7OxdFDzlSnsOUvX8xe1OzwnO0ut21E=;
        b=V3otzXTCPfWPDvno+f+AcbGywEtPGBynIRDBpdHjs8vaxgVqVdlazfu0ArREi49hAa
         hj8OoEaSpFI/F663vtCrFTFbW4EI+lszgCG2eSvjumFUvG7cF9eAInyzh2lQiL6gg+UE
         VSnxoRuwtjUgqi81lASDgnp4HbK9feaUgdJUk/AbW5Q1Ifg4oiqsoK7sCsC7E5WuPxCD
         /JrBXoNBOcPIWiXv59GWICZadHkhO1Xq+cI4e6AEdZlxD8Bfoov7XAvaIfGEQnQ7aPdY
         g0hXWIB6wmqwvdfuidxmmC8n0bXzNiI7ovM/msPr6RRG5Z5aiIGyuugHv/q6WltKNDaU
         647A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792955805; x=1793560605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=At55VbEIUsasl7OxdFDzlSnsOUvX8xe1OzwnO0ut21E=;
        b=dZH07EvIRUmo3XTX4TqWCUtisRQBmM8ycWj4tUqFTJg5ADrCundd5W/5wmz6A4wM/3
         5Atq3cqLpOMFK7rttJpljYzozCKR3ygqy1mSZWHXo4M3en0cyNQ8pBKgLBO6fYbBAPvO
         wzss7cmVVomGbGLJCv+JXAqBJQasGU5JqGCncUVDi7nfzW/7LDMXhKb2ITrQyy/lP83m
         Ca+O4NIH3HRV/t4sNJpC6y6gtxyaBrRjynW8L0J4H+/TXJcd4AZXA7L764JovCR3TKKG
         zXNkPpfLjqqQDpEKIuyl2yquEiR5vZhKJRVNc8r96a42Km6gfSK3LKgDRSPxV7bWmS6Z
         utYw==
X-Forwarded-Encrypted: i=1; AKwUvBzZNupVJ7Pjwf6G0yguoYteZaAYk/fSEQ2Z8WfT4+TwGsbkNc0eNybi5iq6nllbtE61Eq7t1e/rp+kf@vger.kernel.org
X-Gm-Message-State: AFq9FYIL0cLFpXnJbzpnnSPi3qSctGOpz3W9a4vWdqtRGW/6wmwxaA1x
	/gqEzfOMQMPOWm33tszkiZODUd6hie8AUFlxCXOr4zSLAPHcgBuqjhQGt4EgZUhAXPI=
X-Gm-Gg: AYBFou3+zZ95VjnqSr0J3JdH1nMUXY63o5dif7s1lv8RLPWNz0U3hmIok3l6ETtuLa+
	9i5YqnoKwt4uSQzGcJYhWFkv9q1rqW6TLIUDIL8rH+2T0P+5FRLftvwTdwmhicg/Je1/S8JRgGJ
	Iq4+biO+4pn71FFUapRd7AwHYaZelzARwt/6mBgVcZgIxTa1jXqVUdTpJ7jKq5u2w3DToOidSbt
	q1npJtoBse3mvjR6QMyqsHZGkqdY3V8LWhmcu/RppCvIkqgppMyyTzZc6W32Slty/lrtKCEoD4n
	X4Rk87kfcpfVb37JvgkE33iOGwO9AOMyBRlqrG6cbCD3tlHNhCEdH9sPqXx4Jv6/NhX7P3l49mv
	PasIuTIuI/rctdTwwUhDr7fC4D9mk1MA6nTVckzXT8a/9jV6foUpKL0P6d1im+429Nz5YSIcD8L
	/NgM5vaiGZ9xyLfxAhtMij6yTc9ojWIRuHxXqHsf+J/pun/jxt3fNoflyNAu5ehZG15xiFJflwi
	WekvTVsg8/eZGe9CkI1jDqgJN6mIoY1gYfLDw6sNiWqpHpwpwxI2KNhQUd5jrxiJfPcGmVX3nQC
	mefg58bTQrKg+w==
X-Received: by 2002:a05:600c:1988:b0:4a2:1364:252a with SMTP id 5b1f17b1804b1-4a35ac3caa5mr81702855e9.3.1792955804720;
        Sun, 25 Oct 2026 12:16:44 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:6dfc:5715:ead7:7540])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a5822a7sm144560865e9.11.2026.10.25.12.16.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 25 Oct 2026 12:16:44 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v2 5/5] drm/panel: Add the HiBy LG35583
Date: Sun, 25 Oct 2026 20:16:40 +0100
Message-ID: <20261025191640.13592-6-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261025191640.13592-1-olivier@mgcrea.io>
References: <20261025191640.13592-1-olivier@mgcrea.io>
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

The 480x800 parallel RGB panel of the HiBy R1. It is set up over a 3-wire
SPI bus with 16-bit words, each carrying a register address byte or a
data byte, which no existing panel driver speaks. The set-up sequence is
the vendor kernel's; prepare sends it up to sleep-out, and enable and
disable switch the display on and off. It asks for BGR666: in RGB order the
R1 shows red and blue swapped.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 MAINTAINERS                                |   1 +
 drivers/gpu/drm/panel/Kconfig              |  10 +
 drivers/gpu/drm/panel/Makefile             |   1 +
 drivers/gpu/drm/panel/panel-hiby-lg35583.c | 342 +++++++++++++++++++++
 4 files changed, 354 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-hiby-lg35583.c

diff --git a/MAINTAINERS b/MAINTAINERS
index e65500a70c9d..994847735999 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8156,6 +8156,7 @@ DRM DRIVER FOR HIBY LG35583 PANEL
 M:	Olivier Louvignes <olivier@mgcrea.io>
 S:	Maintained
 F:	Documentation/devicetree/bindings/display/panel/hiby,lg35583.yaml
+F:	drivers/gpu/drm/panel/panel-hiby-lg35583.c
 
 DRM DRIVER FOR HIMAX HX8394 MIPI-DSI LCD panels
 M:	Ondrej Jirman <megi@xff.cz>
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 7a520b4d60fe..164ac349abd6 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -209,6 +209,16 @@ config DRM_PANEL_LVDS
 	  handling of power supplies or control signals. It implements automatic
 	  backlight handling if the panel is attached to a backlight controller.
 
+config DRM_PANEL_HIBY_LG35583
+	tristate "HiBy LG35583 RGB/SPI panel"
+	depends on OF && SPI
+	help
+	  Say Y here if you want to enable support for the LG35583, the
+	  480x800 parallel RGB panel of the HiBy R1 digital audio player,
+	  which is set up over a 3-wire SPI bus.
+
+	  To compile this driver as a module, choose M here.
+
 config DRM_PANEL_HIMAX_HX8279
 	tristate "Himax HX8279-based panels"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index da5175909d54..a2b34ed7cdba 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -21,6 +21,7 @@ obj-$(CONFIG_DRM_PANEL_ELIDA_KD35T133) += panel-elida-kd35t133.o
 obj-$(CONFIG_DRM_PANEL_FEIXIN_K101_IM2BA02) += panel-feixin-k101-im2ba02.o
 obj-$(CONFIG_DRM_PANEL_FEIYANG_FY07024DI26A30D) += panel-feiyang-fy07024di26a30d.o
 obj-$(CONFIG_DRM_PANEL_FOCALTECH_OTA7290B) += panel-focaltech-ota7290b.o
+obj-$(CONFIG_DRM_PANEL_HIBY_LG35583) += panel-hiby-lg35583.o
 obj-$(CONFIG_DRM_PANEL_HIMAX_HX8279) += panel-himax-hx8279.o
 obj-$(CONFIG_DRM_PANEL_HIMAX_HX83102) += panel-himax-hx83102.o
 obj-$(CONFIG_DRM_PANEL_HIMAX_HX83112A) += panel-himax-hx83112a.o
diff --git a/drivers/gpu/drm/panel/panel-hiby-lg35583.c b/drivers/gpu/drm/panel/panel-hiby-lg35583.c
new file mode 100644
index 000000000000..47aba09e91a4
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-hiby-lg35583.c
@@ -0,0 +1,342 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * The LG35583 panel of the HiBy R1
+ *
+ * Copyright (c) 2026 Olivier Louvignes <olivier@mgcrea.io>
+ *
+ * A 480x800 parallel RGB panel, set up over a 3-wire SPI bus with 16-bit
+ * words: 0x20 and a register's high byte, 0x00 and its low byte, then 0x40
+ * and each data byte. HiBy calls it the LG35583; its controller is not
+ * identified. The set-up sequence is the one the vendor kernel sends.
+ */
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/media-bus-format.h>
+#include <linux/module.h>
+#include <linux/regulator/consumer.h>
+#include <linux/spi/spi.h>
+
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+
+#define LG35583_ADDR_HI		0x2000
+#define LG35583_ADDR_LO		0x0000
+#define LG35583_DATA		0x4000
+
+#define LG35583_SLPIN		0x1000
+#define LG35583_SLPOUT		0x1100
+#define LG35583_DISPOFF		0x2800
+#define LG35583_DISPON		0x2900
+#define LG35583_RAMWR		0x2c00
+
+struct lg35583_write {
+	u16 reg;	/* 0: wait val milliseconds */
+	s16 val;	/* -1: no data */
+};
+
+#define REG(r, v)	{ (r), (v) }
+#define CMD(r)		{ (r), -1 }
+#define DELAY(ms)	{ 0, (ms) }
+
+static const struct lg35583_write lg35583_init[] = {
+	REG(0xb100, 0x06), REG(0xb101, 0x01), REG(0xb102, 0x54),
+	REG(0xb104, 0x07), REG(0xb105, 0x06), REG(0xb106, 0x06),
+	REG(0xb107, 0x4a), REG(0xb108, 0x21), REG(0xb109, 0x08),
+	REG(0xf101, 0xc0), REG(0xf103, 0x01),
+	DELAY(5),
+	REG(0xb400, 0x01), REG(0xb600, 0x10),
+	REG(0x3a00, 0x77), REG(0x3b00, 0x03), REG(0x5e04, 0x02),
+	REG(0x3600, 0x08),
+	DELAY(5),
+	/* Gamma */
+	REG(0xe000, 0x00), REG(0xe001, 0x2f), REG(0xe002, 0x3f),
+	REG(0xe003, 0x1f), REG(0xe004, 0x21), REG(0xe005, 0x2c),
+	REG(0xe006, 0x2c), REG(0xe007, 0x61), REG(0xe008, 0x1c),
+	REG(0xe009, 0x18), REG(0xe00a, 0xbc), REG(0xe00b, 0x27),
+	REG(0xe00c, 0x59), REG(0xe00d, 0x6a), REG(0xe00e, 0xbb),
+	REG(0xe00f, 0xbe), REG(0xe010, 0x3e), REG(0xe011, 0x48),
+	REG(0xe100, 0x00), REG(0xe101, 0x32), REG(0xe102, 0x45),
+	REG(0xe103, 0x26), REG(0xe104, 0x21), REG(0xe105, 0x2c),
+	REG(0xe106, 0x5c), REG(0xe107, 0x63), REG(0xe108, 0x1c),
+	REG(0xe109, 0x19), REG(0xe10a, 0xd3), REG(0xe10b, 0x28),
+	REG(0xe10c, 0x59), REG(0xe10d, 0x6b), REG(0xe10e, 0xdb),
+	REG(0xe10f, 0xde), REG(0xe110, 0x5f), REG(0xe111, 0x6b),
+	REG(0xe200, 0x7f), REG(0xe201, 0x7d), REG(0xe202, 0x86),
+	REG(0xe203, 0x89), REG(0xe204, 0x10), REG(0xe205, 0x1e),
+	REG(0xe206, 0x41), REG(0xe207, 0x77), REG(0xe208, 0x0d),
+	REG(0xe209, 0x1d), REG(0xe20a, 0xc8), REG(0xe20b, 0x30),
+	REG(0xe20c, 0x5f), REG(0xe20d, 0x71), REG(0xe20e, 0xc3),
+	REG(0xe20f, 0xbe), REG(0xe210, 0x3e), REG(0xe211, 0x48),
+	REG(0xe300, 0x7f), REG(0xe301, 0x7f), REG(0xe302, 0x86),
+	REG(0xe303, 0x93), REG(0xe304, 0x10), REG(0xe305, 0x1e),
+	REG(0xe306, 0x41), REG(0xe307, 0x89), REG(0xe308, 0x0d),
+	REG(0xe309, 0x1d), REG(0xe30a, 0xe0), REG(0xe30b, 0x30),
+	REG(0xe30c, 0x5f), REG(0xe30d, 0x70), REG(0xe30e, 0xe4),
+	REG(0xe30f, 0xdf), REG(0xe310, 0x5f), REG(0xe311, 0x6b),
+	REG(0xe400, 0x00), REG(0xe401, 0x43), REG(0xe402, 0x6f),
+	REG(0xe403, 0x60), REG(0xe404, 0x21), REG(0xe405, 0x2c),
+	REG(0xe406, 0x5a), REG(0xe407, 0x6d), REG(0xe408, 0x1c),
+	REG(0xe409, 0x18), REG(0xe40a, 0xc6), REG(0xe40b, 0x27),
+	REG(0xe40c, 0x59), REG(0xe40d, 0x6a), REG(0xe40e, 0xbb),
+	REG(0xe40f, 0xbe), REG(0xe410, 0x3e), REG(0xe411, 0x48),
+	REG(0xe500, 0x00), REG(0xe501, 0x46), REG(0xe502, 0x75),
+	REG(0xe503, 0x67), REG(0xe504, 0x21), REG(0xe505, 0x2c),
+	REG(0xe506, 0x5a), REG(0xe507, 0x7e), REG(0xe508, 0x1c),
+	REG(0xe509, 0x19), REG(0xe50a, 0xdd), REG(0xe50b, 0x28),
+	REG(0xe50c, 0x59), REG(0xe50d, 0x6b), REG(0xe50e, 0xdb),
+	REG(0xe50f, 0xde), REG(0xe510, 0x5f), REG(0xe511, 0x6b),
+	DELAY(5),
+	REG(0xc200, 0x70), REG(0xc202, 0x70), REG(0xc203, 0x44),
+	DELAY(20),
+	REG(0xc200, 0x51), REG(0xc201, 0x06), REG(0xc202, 0x51),
+	REG(0xc203, 0x66),
+	DELAY(20),
+	REG(0xc100, 0x45),
+	DELAY(5),
+	REG(0xc700, 0x46), REG(0xc000, 0xa3), REG(0xc002, 0x8a),
+	DELAY(5),
+	CMD(LG35583_SLPOUT),
+	DELAY(130),
+};
+
+struct lg35583 {
+	struct drm_panel panel;
+	struct spi_device *spi;
+	struct gpio_desc *reset;
+	struct regulator *vcc;
+	struct regulator *vccio;
+};
+
+static const struct drm_display_mode lg35583_mode = {
+	.clock = 28000,
+	.hdisplay = 480,
+	.hsync_start = 480 + 24,
+	.hsync_end = 480 + 24 + 24,
+	.htotal = 480 + 24 + 24 + 24,
+	.vdisplay = 800,
+	.vsync_start = 800 + 14,
+	.vsync_end = 800 + 14 + 5,
+	.vtotal = 800 + 14 + 5 + 8,
+	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static struct lg35583 *to_lg35583(struct drm_panel *panel)
+{
+	return container_of(panel, struct lg35583, panel);
+}
+
+static int lg35583_word(struct lg35583 *ctx, u16 word)
+{
+	/* Copied to a DMA-safe buffer. */
+	return spi_write_then_read(ctx->spi, &word, sizeof(word), NULL, 0);
+}
+
+static int lg35583_cmd(struct lg35583 *ctx, u16 reg)
+{
+	int ret;
+
+	ret = lg35583_word(ctx, LG35583_ADDR_HI | (reg >> 8));
+	if (ret)
+		return ret;
+	return lg35583_word(ctx, LG35583_ADDR_LO | (reg & 0xff));
+}
+
+static int lg35583_write(struct lg35583 *ctx, const struct lg35583_write *w)
+{
+	int ret;
+
+	if (!w->reg) {
+		msleep(w->val);
+		return 0;
+	}
+
+	ret = lg35583_cmd(ctx, w->reg);
+	if (ret || w->val < 0)
+		return ret;
+	return lg35583_word(ctx, LG35583_DATA | w->val);
+}
+
+static int lg35583_prepare(struct drm_panel *panel)
+{
+	struct lg35583 *ctx = to_lg35583(panel);
+	unsigned int i;
+	int ret;
+
+	ret = regulator_enable(ctx->vccio);
+	if (ret)
+		return ret;
+	usleep_range(5000, 6000);
+
+	ret = regulator_enable(ctx->vcc);
+	if (ret)
+		goto err_vccio;
+	usleep_range(5000, 6000);
+
+	gpiod_set_value_cansleep(ctx->reset, 0);
+	usleep_range(5000, 6000);
+	gpiod_set_value_cansleep(ctx->reset, 1);
+	msleep(50);
+	gpiod_set_value_cansleep(ctx->reset, 0);
+	msleep(30);
+
+	for (i = 0; i < ARRAY_SIZE(lg35583_init); i++) {
+		ret = lg35583_write(ctx, &lg35583_init[i]);
+		if (ret) {
+			dev_err(panel->dev, "Unable to set up the panel: %d\n", ret);
+			goto err_vcc;
+		}
+	}
+
+	return 0;
+
+err_vcc:
+	gpiod_set_value_cansleep(ctx->reset, 1);
+	regulator_disable(ctx->vcc);
+err_vccio:
+	regulator_disable(ctx->vccio);
+	return ret;
+}
+
+static int lg35583_enable(struct drm_panel *panel)
+{
+	struct lg35583 *ctx = to_lg35583(panel);
+	int ret;
+
+	ret = lg35583_cmd(ctx, LG35583_DISPON);
+	if (ret)
+		return ret;
+
+	return lg35583_cmd(ctx, LG35583_RAMWR);
+}
+
+static int lg35583_disable(struct drm_panel *panel)
+{
+	struct lg35583 *ctx = to_lg35583(panel);
+	int ret;
+
+	ret = lg35583_cmd(ctx, LG35583_DISPOFF);
+	usleep_range(5000, 6000);
+	return ret;
+}
+
+static int lg35583_unprepare(struct drm_panel *panel)
+{
+	struct lg35583 *ctx = to_lg35583(panel);
+
+	lg35583_cmd(ctx, LG35583_SLPIN);
+	usleep_range(5000, 6000);
+
+	gpiod_set_value_cansleep(ctx->reset, 1);
+	regulator_disable(ctx->vccio);
+	regulator_disable(ctx->vcc);
+	return 0;
+}
+
+static int lg35583_get_modes(struct drm_panel *panel, struct drm_connector *connector)
+{
+	/* Red and blue are swapped on the R1 without it. */
+	static const u32 bus_format = MEDIA_BUS_FMT_BGR666_1X18;
+	struct drm_display_mode *mode;
+
+	mode = drm_mode_duplicate(connector->dev, &lg35583_mode);
+	if (!mode)
+		return -ENOMEM;
+
+	drm_mode_set_name(mode);
+	drm_mode_probed_add(connector, mode);
+
+	connector->display_info.bpc = 6;
+	connector->display_info.bus_flags = DRM_BUS_FLAG_DE_HIGH |
+					    DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE;
+	drm_display_info_set_bus_formats(&connector->display_info, &bus_format, 1);
+
+	return 1;
+}
+
+static const struct drm_panel_funcs lg35583_funcs = {
+	.prepare = lg35583_prepare,
+	.enable = lg35583_enable,
+	.disable = lg35583_disable,
+	.unprepare = lg35583_unprepare,
+	.get_modes = lg35583_get_modes,
+};
+
+static int lg35583_probe(struct spi_device *spi)
+{
+	struct device *dev = &spi->dev;
+	struct lg35583 *ctx;
+	int ret;
+
+	ctx = devm_drm_panel_alloc(dev, struct lg35583, panel, &lg35583_funcs,
+				   DRM_MODE_CONNECTOR_DPI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
+
+	ctx->spi = spi;
+	spi_set_drvdata(spi, ctx);
+
+	spi->bits_per_word = 16;
+	ret = spi_setup(spi);
+	if (ret)
+		return dev_err_probe(dev, ret, "Unable to set up SPI\n");
+
+	ctx->vcc = devm_regulator_get(dev, "vcc");
+	if (IS_ERR(ctx->vcc))
+		return dev_err_probe(dev, PTR_ERR(ctx->vcc), "Unable to get vcc\n");
+
+	ctx->vccio = devm_regulator_get(dev, "vccio");
+	if (IS_ERR(ctx->vccio))
+		return dev_err_probe(dev, PTR_ERR(ctx->vccio), "Unable to get vccio\n");
+
+	/*
+	 * Deasserted, which keeps a panel the boot loader left on as it is, but
+	 * as an output: after a reset the pin is an input, and prepare's reset
+	 * pulse would never reach the panel.
+	 */
+	ctx->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(ctx->reset))
+		return dev_err_probe(dev, PTR_ERR(ctx->reset), "Unable to get reset\n");
+
+	ret = drm_panel_of_backlight(&ctx->panel);
+	if (ret)
+		return ret;
+
+	drm_panel_add(&ctx->panel);
+	return 0;
+}
+
+static void lg35583_remove(struct spi_device *spi)
+{
+	struct lg35583 *ctx = spi_get_drvdata(spi);
+
+	drm_panel_remove(&ctx->panel);
+}
+
+static const struct of_device_id lg35583_of_match[] = {
+	{ .compatible = "hiby,lg35583" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, lg35583_of_match);
+
+static const struct spi_device_id lg35583_ids[] = {
+	{ "lg35583" },
+	{ }
+};
+MODULE_DEVICE_TABLE(spi, lg35583_ids);
+
+static struct spi_driver lg35583_driver = {
+	.probe = lg35583_probe,
+	.remove = lg35583_remove,
+	.id_table = lg35583_ids,
+	.driver = {
+		.name = "panel-hiby-lg35583",
+		.of_match_table = lg35583_of_match,
+	},
+};
+module_spi_driver(lg35583_driver);
+
+MODULE_AUTHOR("Olivier Louvignes <olivier@mgcrea.io>");
+MODULE_DESCRIPTION("HiBy R1 LG35583 panel driver");
+MODULE_LICENSE("GPL");
-- 
2.39.5

