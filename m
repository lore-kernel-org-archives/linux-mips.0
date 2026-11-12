Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794523516;
	b=rfBguIiptLfxf7KsLOu4rYroPrgkukw5TR7psts5yG5Zl2fip14s8mZcGFK54br7HY4d
	 YVb8AoOIt/ILrbdGCWZUl06+H9ROiygYqPjRAsbTzUzk2IxvHVnGVKAVXL+/62uUcwNZa
	 KjHJNjQSXXs2BZEa4cM2p6UHkReyzZrEOa1MSJsBl1ppQMc5y5U/8oe3BOt0i1/D6PCZ7
	 4trwExJaV+jWE71e5aakbEcduwSnOYd9R0aEwoXTxaOW4Zb4RUXyUepuiwIp58A3usJRX
	 0w5KR5WswFnzKH7LyIjCvYPHA8tvOTZL1x/FxL/gmYLZd7hLgqv4YB8drjicwVwESCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794523516;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=G8Io8I+YEqWRGsV8tAVCp98ZwR0+rUFIZtD/WXh2Ul8=;
	b=yy8qt1Y89MIeflPVdb+FMVsVRcVmLDx166civXieGFqDzqfsMhIM9uluIO08ZtF/kZta
	 du8NEr9hzV3oqOJMWXKAs57AxtyEpNepD0OtGvW5zJq4ai7rJy95z/dfV9nFWUfzsSGaM
	 WoFrsXmmB+1jKJwdIte4nrQwlnMHVqx0XArZPOOfm7A3KvnbIf9HDowEfN44jZyVcek6K
	 Riui3t3+R8WfkjNjARxjLiG6JfXnoKFQfSqoURDuVZp7NXjN8s6NH97ZzEoPM+LlHfD4f
	 +O2ETt0pY2z4BC/h4zyk2HrGW+QByMRx0kwxNFhbrMK6XTcVUzPmZW/P3wwfVvkl06g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ue9bvPyC;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141EF60A2610
	for <linux-mips@vger.kernel.org>; Thu, 12 Nov 2026 22:45:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 141EF60A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ue9bvPyC
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b09a65c76dso353212a91.1
        for <linux-mips@vger.kernel.org>; Thu, 12 Nov 2026 14:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794523515; x=1795128315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G8Io8I+YEqWRGsV8tAVCp98ZwR0+rUFIZtD/WXh2Ul8=;
        b=Ue9bvPyC0LKInRqnVHcjxOVjYkME87DYzL1a3Nl7Xi2mvu3yJ4P9Qere1920OYpE+s
         dNuFCC9cgmfjdCa4dWUAQLWHMs+utxkLf2iFTjyeVAHtdGRvpn/1QRFgkNmc4h7USM1t
         Ing3Sqqukg17kCjWAXpk7PdJ6X6JwWpDO+AlfYOF1I0/4kUSACMD0n6t7kyDh4742pNY
         Bts/ZVgX2J3fBs6GO3B5ISZaIho1DsGsZmwqOserT8ndTUYY25ILRc5P5KYoPkjXpUK/
         Xzd0AgaKjUBXVPRZsafX/5wOJLufl1Ym8Sa+Di5Rw2KWCTx2Z8uKy81KMLtO8pxgNcgu
         O27A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794523515; x=1795128315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G8Io8I+YEqWRGsV8tAVCp98ZwR0+rUFIZtD/WXh2Ul8=;
        b=u+v07bWHuro4xWOIlTwaZjIBNj7pCJIYorQa0uASL7hGtEPug0WgI5jm7/tS00FqHL
         AjSPX8zKD7p5qyfvt0ew/4TBg+uEvmspI8SHZIDC2WpONJk9OAsT/DdwWFWfKotI/LYk
         GeHqXj7/UhFuouG0XZNgWTveM9dBWTfOZ6D04Y4Wjw6rtH7Cgf2qERbrPxbG842e7EcJ
         Nuc4N7oY+BQNwhOv9w5OP6pr1DCKdS/kYWGmazQWTsoL0CAomXQjdfkDjgTvaKPAgGro
         MbmRHYm8f6htp2vz/IMflSwTeV7C2t+bq1EP5LmbaVnnjR2O96NDZPnxO7CKzA58t2oy
         Xsew==
X-Forwarded-Encrypted: i=1; AL+hErEzCNC5aIQmcgnluYaYgpj6Kv9pE6Iyhtk/A5aFNamF/YW1KhYVCDvSZbET+nxTjpSiiAVZGoxPZytO@vger.kernel.org
X-Gm-Message-State: APuU4Z9a6EcrmsJyTRwnn/r813Ohj2Lj320tQHz2UJwGOguRlL0MzjPZ
	emEcxq5jHm2rvzp6kYxpHkEHka6miM31x4bcfoETEujJyhAy7sw1Q9Fz
X-Gm-Gg: AYBFou2kcdVybFqn3lOHNelWkC43+wY21gma6JvcmxKSOrhQnj5T3mGTOefLpRxMOEn
	EZwWkL7qprYZhEUJe7d2dxthOWEYusH5pDoOYHd6ZMrioCL++vUaR1WZ7qajV1ObTAmalgV2NDB
	e98yIB+s+V7mb5m4xnL1/lDGPhn8HEViPfNaGsZ+Ob1SknLjV8bfQXVJuG7lAa+LvB4TekpnhRd
	/BagqlGU4qa7iNV4OLO5CZU6HrV9ZZRUOezp2RBs7J8AjHQ83lH2ojms0k/cJybjWxC7871wheA
	ihSTRXity82JMzlPd9AQqnu652UhIwino5ojJNFd0GQ4CGHk3trGelQGW8QtvG95Xkt45iQKITQ
	V9OdobzTuEHSUB+UXvlY3xn8OAWpA67zVkCemtsTzuWQF3RyraG4ACk35iS1tIhqo/LfDy7z4kq
	09LOn4NPxljRliWavVobUG1FBz8DT3KOqsJVIQ9vIi8kl95UxhLcckRSS//6r66l2Xf3FwvcaUy
	DS3TjBRXTmweWASnR6h7BH6dtGaUCqVW4Z5zH+OhNhZ7iYGdiGzEigV1uWdMZ9J3dJOeN28eexn
	KiKE9WAJMLrH42XMLoqZjGSUknTePvNIhUeoHQ74xMCq3vKp8cleKRvYmNIQW25hdDuUsjXgIMy
	P1l0Gg4iKPwe+nMdeoe0nxxf3Jw6vsplK/N7gYTFhFJFCbwc8Ax5oxZ9SPRLcR+IOfHqZCk8FfK
	7HOg==
X-Received: by 2002:a17:90b:1b01:b0:3ab:2d46:1dd2 with SMTP id 98e67ed59e1d1-3b1b08798bcmr424778a91.6.1794523515247;
        Thu, 12 Nov 2026 14:45:15 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3b708adsm37073a91.4.2026.11.12.14.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 14:45:13 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Radu Rendec <radu@rendec.net>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: [PATCH 4/4] irqchip/ath79-misc: allow COMPILE_TEST builds
Date: Thu, 12 Nov 2026 14:44:45 -0800
Message-ID: <20261112224445.213324-5-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261112224445.213324-1-rosenp@gmail.com>
References: <20261112224445.213324-1-rosenp@gmail.com>
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

The driver is only built with ATH79, so only ath79 kernels build it. As
a platform driver, its only MIPS-specific parts are the performance
counter hook and the call to spurious_interrupt().

Add a Kconfig symbol that defaults to ATH79 and can be enabled with
COMPILE_TEST. Build the performance counter hook only with ATH79, as
other MIPS platforms provide their own. Drop the call to
spurious_interrupt(), which only exists on MIPS: a cascaded interrupt
with nothing pending only bumped the error count in /proc/interrupts,
and the handler now just returns.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/irqchip/Kconfig          | 14 ++++++++++++++
 drivers/irqchip/Makefile         |  2 +-
 drivers/irqchip/irq-ath79-misc.c | 19 ++++++++++++-------
 3 files changed, 27 insertions(+), 8 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 731041def5d6..91fcc433afab 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -127,6 +127,20 @@ config ASPEED_AST2700_INTC_TEST
 
 	  If unsure, say N.
 
+config ATH79_MISC_IRQ
+	bool "Atheros/Qualcomm ath79 MISC interrupt controller" if COMPILE_TEST
+	depends on ATH79 || COMPILE_TEST
+	depends on OF
+	depends on HAS_IOMEM
+	default ATH79
+	select IRQ_DOMAIN
+	help
+	  Support the MISC interrupt controller of the Atheros/Qualcomm
+	  ath79 SoCs. It is cascaded from a CPU interrupt and collects the
+	  interrupts of the UART, GPIO, timers, watchdog and performance
+	  counters, among others. It is enabled by default on ath79, and
+	  only needs to be selected by hand for compile testing.
+
 config ATMEL_AIC_IRQ
 	bool
 	select GENERIC_IRQ_CHIP
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 16a5fd126c9a..de7be9803c74 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -4,7 +4,7 @@ obj-$(CONFIG_IRQCHIP)			+= irqchip.o
 obj-$(CONFIG_AL_FIC)			+= irq-al-fic.o
 obj-$(CONFIG_ALPINE_MSI)		+= irq-alpine-msi.o
 obj-$(CONFIG_ATH79)			+= irq-ath79-cpu.o
-obj-$(CONFIG_ATH79)			+= irq-ath79-misc.o
+obj-$(CONFIG_ATH79_MISC_IRQ)		+= irq-ath79-misc.o
 obj-$(CONFIG_ARCH_BCM2835)		+= irq-bcm2835.o
 obj-$(CONFIG_ARCH_BCM2835)		+= irq-bcm2836.o
 obj-$(CONFIG_ARCH_ACTIONS)		+= irq-owl-sirq.o
diff --git a/drivers/irqchip/irq-ath79-misc.c b/drivers/irqchip/irq-ath79-misc.c
index b06ece446746..dc865dbbbc3b 100644
--- a/drivers/irqchip/irq-ath79-misc.c
+++ b/drivers/irqchip/irq-ath79-misc.c
@@ -16,7 +16,9 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 
+#ifdef CONFIG_ATH79
 #include <asm/time.h>
+#endif
 
 #define AR71XX_RESET_REG_MISC_INT_STATUS	0
 #define AR71XX_RESET_REG_MISC_INT_ENABLE	4
@@ -24,8 +26,14 @@
 #define ATH79_MISC_IRQ_COUNT			32
 #define ATH79_MISC_PERF_IRQ			5
 
+#ifdef CONFIG_ATH79
 static struct irq_domain *ath79_misc_domain;
 
+static void ath79_misc_set_perf_domain(struct irq_domain *domain)
+{
+	ath79_misc_domain = domain;
+}
+
 /* Called by the MIPS perf code when the first event is created. */
 int get_c0_perfcount_int(void)
 {
@@ -39,6 +47,9 @@ int get_c0_perfcount_int(void)
 	return irq ? irq : -1;
 }
 EXPORT_SYMBOL_GPL(get_c0_perfcount_int);
+#else
+static void ath79_misc_set_perf_domain(struct irq_domain *domain) { }
+#endif
 
 static void ath79_misc_irq_handler(struct irq_desc *desc)
 {
@@ -52,12 +63,6 @@ static void ath79_misc_irq_handler(struct irq_desc *desc)
 	pending = __raw_readl(base + AR71XX_RESET_REG_MISC_INT_STATUS) &
 		  __raw_readl(base + AR71XX_RESET_REG_MISC_INT_ENABLE);
 
-	if (!pending) {
-		spurious_interrupt();
-		chained_irq_exit(chip, desc);
-		return;
-	}
-
 	while (pending) {
 		int bit = __ffs(pending);
 
@@ -151,7 +156,7 @@ static int ath79_misc_intc_probe(struct platform_device *pdev)
 	__raw_writel(0, base + AR71XX_RESET_REG_MISC_INT_STATUS);
 
 	irq_set_chained_handler_and_data(irq, ath79_misc_irq_handler, domain);
-	ath79_misc_domain = domain;
+	ath79_misc_set_perf_domain(domain);
 
 	return 0;
 }
-- 
2.56.1

