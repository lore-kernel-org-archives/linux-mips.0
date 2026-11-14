Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794699458;
	b=fdDps2pGgkP2aly1XDNRBUKnSDs2Xi1cksB6tfkYbk2QMg36zgPNKRU+AqMJDC53GhNS
	 B06hNeUtRRAxcX1EDtZdzD35mEg2V+I096+zDO2IqKw4Q4HYmOlTyQdRSvlHRTVjGmA74
	 yocTwyxTjjRHRi1PVWQ43XEMNnKr73q04zWaFElNKNDdHhWeIXac82xQuoCFluFKxTbW7
	 fHgDmhZ77LwIs4nlyYnc0MCWclnSmduzCPGvxrfW67kqL8XkM+s+rZLt2Alfs8nSar3UM
	 AoPLP+y/BxkpL1gNdPl+fLd3RdyXIfk8oss+9NvT8HmCCjMnrkR/2HiznrzUSB2XrBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794699458;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zPxwQZ24qNZrX3J3/HAoM3bM0nDSHqnSDrrlD4YRwII=;
	b=CdeliXjAbDzR04NdbO1BDJ4w9Js+H3IsEJa7rjSJN0b7Q/v3HvxiOGWukJkGIGd4f2th
	 UDpRPwJbkL1hE2DknTGO55YWp4PMYfzGDGufyr2nmar4RGFGGYbUh6aPaD97HihvenQ6u
	 jjkwRQ65F/MgnhX/v7lJIuU00+/VFTk/Y6frslXIDLtnmw2O6QSF4sB95FIfP3c5otnC6
	 /ISd3cEGWhaYQtJ6vnAjhKIvrNKNRfwAn4d7tdQt/ay+JRpQAS08wJUzLzUVuEh6QMg1C
	 6aOpTRpptePNdnPgfD95JVLGm2Wl0+uTRLCefzHLZBopydDqUKex5jPO722b+PFaGUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NqkD68Kq;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B62A606A8A7
	for <linux-mips@vger.kernel.org>; Sat, 14 Nov 2026 23:37:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B62A606A8A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NqkD68Kq
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso1278047a12.0
        for <linux-mips@vger.kernel.org>; Sat, 14 Nov 2026 15:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794699458; x=1795304258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zPxwQZ24qNZrX3J3/HAoM3bM0nDSHqnSDrrlD4YRwII=;
        b=NqkD68KqiFujgPDXz4hpk/E8NENKbPH+Io2MzZfurch0T/qeDpe5CQQTTtl5RFlXSN
         cb0oWbI6tA4jvOg5OjuFfBdV8OKEVvCX9BSeYKhxgl+LXpKoJ578QA6DpRRVwiGs2jK7
         CwtTNlKIJANFa/JkRM0SlHaf5oJ5jlcdmXUuIOGBxIRu+++8Ho0sQJRfpZ5Yu8LDhk2S
         n6BdJRhFExZ4V+ulIHlfsK8Ft73eeZ5137FXsFhWDLpDoEiNXIM5x23RSP3wqLH6+QPX
         4hBYZ3puw0ja4MzVfmqQZCQZTufYWqkD+Pni+SgY+WPb098TcmKfXvp+Nb7pVfaoFpe8
         C8/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794699458; x=1795304258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zPxwQZ24qNZrX3J3/HAoM3bM0nDSHqnSDrrlD4YRwII=;
        b=OzyvjWWyvJ3wrjr3Z3NdIdCmHaew5V6m9u7I0B9xrgA8wQoWv+3Is4pxhGY4VGU1hJ
         1/stsMUrr+cm85GX4NQlN7oWPlXpFzLxgFZ1B5WOKCJq4eHgRyD8XtM2hWtAQo8GSoP1
         PKOxwcjRxFAQlmTQrTci7qmk5C4wvLslAoN4vNI4OoZ3iGkyMKXh10AA55hOwcYp/97U
         zDAB55XWN3AYnZ3tT9/uosnVd+f7mRqbfjrKtR5xr+vgFL8hTFQc07C4twjM1/PPU7Fn
         L32Z6XK8e4deuZSS536+victu22hzot/O7KZTdUdIZceEGGSK41WAdWNUxR9G59XOhvR
         +hTw==
X-Forwarded-Encrypted: i=1; AL+hErHWVD68v5LSjTwbelu1fVkM8GrrlowKxaTtlxjzOTB5GAt17BTZrc5ibrmRA0pGgp1wzIEQ7BerrQeS@vger.kernel.org
X-Gm-Message-State: APuU4Z8womUidltkrtm673yJy1bcursLHwC+r36kewVlz1HFIOrayyal
	jbkk9qXFio2Aw5/3m+g2ZxxOJXy0wNqcMU3fu4fdNU6HJVKh6t0TL0KW
X-Gm-Gg: AYBFou3SMO8jP9FdX2+mZVR4ja5YZfHzObQakUHpBSYZrXhQ7JhJv/6zrskdseDt8jH
	YsJby+wN+bXoRs6qcTL2bKvnewmMZGWX1TZKmeCDjAxxh2K/SQOo5lBmcePOwENNTZ2HUhCoPzD
	Y/ePn1ykrGTe0rYjgmyt587dCJw7HxfwG2unxeJQyAQULkGxXlLM7yIqRycz5SW9/0x47USB0t5
	fbjOUuwriwwcI0S3QC4TCK2zAnlUKgWrh1/EiKG4OfbD+evoSTWr02CRfKQly3a/imlKDjPUhP2
	2v16iCbuJlH/RhnwwVALkvZUI2BlBMfGybKOW85TypHpipxwIHTaiBwESqyV4b3c4QXnzxP3c/X
	/7WZnh+6b9jJ+WTXzcMNyy/lAdsFwr6hIkEa+AtXcavzhLFp65TD1E0MeCZjWFgtkZWQtwZCraZ
	fs5ux0Y+ZHVkb0w39Xu4ZaNSBmN1BhDsLaQ2KU9P1SYeRq4PxNUVVKwfUirzJusLz/GWuJOxiDB
	B86e8q+x6gWSB1VUKYm5pTluqVwJMWsRhOnAdvznwZsrNuf+K+gS/uN1OO/W9O40YR8VAP3N3Jv
	0wQ3CXTCHej/JT2iGvTDAXy+gY46d+6kPZylHrbZ9S/mqZ3CeCk2nbtAuiNrFJGpqTIX6RCgSIs
	JBsN1dUw21S4cXpt+JcKdqgIiFLFNyahjeCIOQZN05UTIWNHFn82heyg7tLwBgE5EKKOUeESWDr
	FJDQ==
X-Received: by 2002:a05:6a21:3989:b0:3fa:3e8f:4b3e with SMTP id adf61e73a8af0-3fa3e8f4d04mr751659637.44.1794699457752;
        Sat, 14 Nov 2026 15:37:37 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed2d0f473sm2306372b3a.53.2026.11.14.15.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 15:37:35 -0800 (PST)
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
Subject: [PATCH v2 4/4] irqchip/ath79-misc: allow COMPILE_TEST builds
Date: Sat, 14 Nov 2026 15:37:18 -0800
Message-ID: <20261114233718.86520-5-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114233718.86520-1-rosenp@gmail.com>
References: <20261114233718.86520-1-rosenp@gmail.com>
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
index 8aee8f731848..f83fe64f066b 100644
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
index eb539d41251e..c51e79d3621c 100644
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
index e69d4eca929f..c25676a1c1cd 100644
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
@@ -25,8 +27,14 @@
 #define ATH79_MISC_PERF_IRQ			5
 #define ATH79_MISC_SI_TIMERINT			BIT(28)
 
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
@@ -40,6 +48,9 @@ int get_c0_perfcount_int(void)
 	return irq ? irq : -1;
 }
 EXPORT_SYMBOL_GPL(get_c0_perfcount_int);
+#else
+static void ath79_misc_set_perf_domain(struct irq_domain *domain) { }
+#endif
 
 static void ath79_misc_irq_handler(struct irq_desc *desc)
 {
@@ -53,12 +64,6 @@ static void ath79_misc_irq_handler(struct irq_desc *desc)
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
 
@@ -159,7 +164,7 @@ static int ath79_misc_intc_probe(struct platform_device *pdev)
 	__raw_writel(0, base + AR71XX_RESET_REG_MISC_INT_STATUS);
 
 	irq_set_chained_handler_and_data(irq, ath79_misc_irq_handler, domain);
-	ath79_misc_domain = domain;
+	ath79_misc_set_perf_domain(domain);
 
 	return 0;
 }
-- 
2.56.1

