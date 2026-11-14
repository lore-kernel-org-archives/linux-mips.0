Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794699454;
	b=kURTFI6TMvspFr3Ul2U1JkJGaph+ANeZGu08TMNHc2EZQkj5CNJcBzxPHPR9WGOVII1s
	 1BZkiIIVTj6IH012Ctu5JkJCt5KAj+8pEZLGBCiXD+yo7+PfP56+eep/oRIpkTQrWQC2N
	 h9GNEaTEO3tOGtMshzUqnie8SIyfTXTAbARPZQdGqAnuQhSqj26/W83AxrzHnnpwegvHX
	 uXvjuizLVdhPsWnZd3ImyKN7/CxXI2Gba5Gl/Be3VEU8I4IHPEonQSJfuHwf8mbu6KrR5
	 tc0IPc2XNpY8e6FwD87faTR+7YWlSiXkx9KreGRwXlhtboDihwxtDKQzLEWMwIecmwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794699454;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PP00yyyHcAa49iLb09D3hdi6QOsMJJT3uiuR4Zaky8A=;
	b=n5+PWRqFaNO/MqWIOPd3HN7vHBSsGjeswlBUWb9OQe7Ei50Tj6mj/erd6H5QLMu45ZjH
	 WGzM3A+/CPHnQEzDnwCqiIS956BPkgzI2cMvx5eCpdn0qqdZ3OXZirYbGSEhTUuY0EdDT
	 4m57Ff7a6AHL/V4SzCOkUTaZ8eB5aGhy6WWsa3vpW21QMbiJhN+AjAyhi5uuVK0m0lpEW
	 OG19kZUKVsmi7Tpm+ngDQ/CavaiJg2nB98qqS0uOdv+G5jNCckXkcN2Bi/Fq70J23d0fX
	 YR8mHlwBnN8wKFocOiUoAAoOnwgFeWm4ZQ4mroGGffE43s2Z9mO7PgytypEo+lASATA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y0z9bUaI;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73BF2606A332
	for <linux-mips@vger.kernel.org>; Sat, 14 Nov 2026 23:37:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73BF2606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y0z9bUaI
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8b66d1a08ccso2410780b3a.1
        for <linux-mips@vger.kernel.org>; Sat, 14 Nov 2026 15:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794699454; x=1795304254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PP00yyyHcAa49iLb09D3hdi6QOsMJJT3uiuR4Zaky8A=;
        b=y0z9bUaI0gFyTfODkPjDwcCzJuaNfl1HEoKDs+v1OLTk34kcv98kdjpQoXa8CIxGZH
         jR/9gNfOhvIvweDbjwDv39CIZOqKlrKYbaa6k+592zziqxj4+LOFER63cx4fzhBNnV4Q
         RThEkgO6YOpDWdzbaUmjQzs9zgn36MqdklEaL9iig2yH1gZ5gOWqp+GI1vtDy9kN+Z3L
         lpAl+9upUBHos3/lr9758xVJ/OTUe7dqalEHeCT9EcGkQEO2obW+Au16n0rATomQvquV
         yOmck5W2ZgvmcnyTBhZy+0IrbEru+8IOp1l8nPGLa/s3IO2pZjJ+CxiwCb5OCv2Tdahl
         6j6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794699454; x=1795304254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PP00yyyHcAa49iLb09D3hdi6QOsMJJT3uiuR4Zaky8A=;
        b=YPs/TjskkxXDzVMD2puLrQrb3ysGeeQgPBJtWsVtVs3dVdwkpyqiS5vJ2xF03bKCs+
         1oGHNZUoDQW2hMVv6OFKpuqOb6/ypptMdse6Tp53+9mpOb6vB0TI4FKeqAvhxpdnkRUt
         TM5jFY6JaqzPuarZDbtdhTatXItBpRKX4urxAEMDrYhlbnZGqZN/kculbP8l7+L1DvBN
         ZYbS/zExieTTxkmISGJuclKtxzm8T4B++jP4V+at+016sg46DE1rlZtD1hfYLs9NHQGH
         mvBxyWwveeQr9tDc/Dr7UTMPSj3+/3zBI4M01J/VvSmFw7i5vH0MkHRDDSNkexUBa2Q4
         7hSw==
X-Forwarded-Encrypted: i=1; AL+hErGotgWo4T+Y0qESbLRaARn0f+a2lm/k7U/1W1X+k5hwx6XODBT4ad+d4ZHYyu+paQa/w5Gx1ady4QDA@vger.kernel.org
X-Gm-Message-State: APuU4Z9i7EyRiqPKdVMDPAj0kp4vc64RYjVFAi1Dj9qpj0gSUjPE7SSd
	Ktoc7VTwu0H8SNJGrkTrGFPX+9jL8R/T68j8OV4/Qot6R33TWTRTru4e
X-Gm-Gg: AYBFou2kLhcHjQg5Dl4LTebIi/yhq9lv7lFTDFv3JnYPsBLlUyDUs+BUU08AiAVTiqA
	79gTZMDD8q9YPS/4TCx9QYqi7RX0HZN2eq14B+gCIwKoHAHSdrfGhvXe3BlRoLELWRqq5vhcgeM
	O1EWd0pZ+EWGcez9fDKChyqWpnXxeLAoBJaYc7X9Hl+MR9ytzlGiHwSaRuIlzoGMLODCInDSQ07
	LsBPdCroyst0Cp/pEXjvTYHf6JcRkphNljoXC64AqBqmCKzeTdqn5W6tHtRu3Df+oPuuxbQwKDm
	truadY0jeZdiRygh1APvBhHSAsrMzjkkXk1uhFwJDpXvUL5+D2a6Avk8jIf7Db+Ynhz5QNxk2NZ
	MfwLA/XmvHKjJNMM9oodMARPsj9c2wamekCf6WQfraYydK7HQ1e1Px4Twfao+h20uczuOXSeRYm
	OJ3F6jGJT9hUA7kv2o3n5QJTfx+DBc2LlUPpA7JeubKh48AaJ2rsjKPCC6zOq+fRU7L/AIj0Zvt
	eY4ru1WIHKq87H2oJxFylcrRaYf302Kiw3EEsigsghhOX2ObUkic6IFgCWXxb1umgiJKWrD9H5q
	aVRtVYnSCBZbyVrtbvlYFI7cpS7ESvg7u7+aeOpB4gvXcbvyNdFV01YZiOuP1S8VArTJfvarUer
	qJmZmG7MvCnq81GHqdEex4pLyUnTPzsYWtdlU3ETRJrH4G1pvdBcSYAgLC/RnQh2K9J10GpFWLB
	uJYLgI2Ri3yOYTMd4vLEzNpLA=
X-Received: by 2002:a05:6a00:94c3:b0:857:7337:5db7 with SMTP id d2e1a72fcca58-8beb658e279mr6190631b3a.21.1794699453766;
        Sat, 14 Nov 2026 15:37:33 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed2d0f473sm2306372b3a.53.2026.11.14.15.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 15:37:32 -0800 (PST)
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
Subject: [PATCH v2 3/4] irqchip/ath79-misc: convert to a platform driver
Date: Sat, 14 Nov 2026 15:37:17 -0800
Message-ID: <20261114233718.86520-4-rosenp@gmail.com>
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

The MISC interrupt controller is cascaded from a CPU interrupt, and its
users are all platform devices, which defer their probe until it is
available. The performance counter interrupt, the only one needed
before the early initcalls, is now mapped on demand.

Probe the controller as a platform driver, and use device-managed
resources, which also fixes the leak of the register mapping when the
irq domain cannot be created.

The driver now probes after plat_time_init(), which on QCA956x and
TP9343 enables the MIPS timer interrupt in the MISC controller, without
which there are no jiffies. Keep that enable bit when disabling the
other interrupts, which leaves the register as it was with the old init
order.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/irqchip/irq-ath79-misc.c | 90 ++++++++++++++++----------------
 1 file changed, 44 insertions(+), 46 deletions(-)

diff --git a/drivers/irqchip/irq-ath79-misc.c b/drivers/irqchip/irq-ath79-misc.c
index 5cedea5234e0..e69d4eca929f 100644
--- a/drivers/irqchip/irq-ath79-misc.c
+++ b/drivers/irqchip/irq-ath79-misc.c
@@ -12,8 +12,9 @@
 
 #include <linux/irqchip.h>
 #include <linux/irqchip/chained_irq.h>
-#include <linux/of_address.h>
-#include <linux/of_irq.h>
+#include <linux/irqdomain.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
 
 #include <asm/time.h>
 
@@ -22,6 +23,7 @@
 
 #define ATH79_MISC_IRQ_COUNT			32
 #define ATH79_MISC_PERF_IRQ			5
+#define ATH79_MISC_SI_TIMERINT			BIT(28)
 
 static struct irq_domain *ath79_misc_domain;
 
@@ -124,65 +126,61 @@ static const struct irq_domain_ops misc_irq_domain_ops = {
 	.map = misc_map,
 };
 
-static void __init ath79_misc_intc_domain_init(
-	struct irq_domain *domain, int irq)
-{
-	void __iomem *base = domain->host_data;
-
-	/* Disable and clear all interrupts */
-	__raw_writel(0, base + AR71XX_RESET_REG_MISC_INT_ENABLE);
-	__raw_writel(0, base + AR71XX_RESET_REG_MISC_INT_STATUS);
-
-	irq_set_chained_handler_and_data(irq, ath79_misc_irq_handler, domain);
-}
-
-static int __init ath79_misc_intc_of_init(
-	struct device_node *node, struct device_node *parent)
+static int ath79_misc_intc_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct irq_domain *domain;
 	void __iomem *base;
+	u32 enable;
 	int irq;
 
-	irq = irq_of_parse_and_map(node, 0);
-	if (!irq) {
-		pr_err("Failed to get MISC IRQ\n");
-		return -EINVAL;
-	}
-
-	base = of_iomap(node, 0);
-	if (!base) {
-		pr_err("Failed to get MISC IRQ registers\n");
-		return -ENOMEM;
-	}
-
-	domain = irq_domain_create_linear(of_fwnode_handle(node), ATH79_MISC_IRQ_COUNT,
-				&misc_irq_domain_ops, base);
-	if (!domain) {
-		pr_err("Failed to add MISC irqdomain\n");
-		return -EINVAL;
-	}
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	domain = devm_irq_domain_create_linear(dev, dev_fwnode(dev),
+					       ATH79_MISC_IRQ_COUNT,
+					       &misc_irq_domain_ops, base);
+	if (!domain)
+		return dev_err_probe(dev, -ENOMEM, "failed to add the irq domain\n");
+
+	/*
+	 * Disable and clear all interrupts, except the MIPS timer interrupt:
+	 * plat_time_init() enables it on QCA956x and TP9343, which have no
+	 * jiffies without it, and that runs before this driver probes.
+	 */
+	enable = __raw_readl(base + AR71XX_RESET_REG_MISC_INT_ENABLE);
+	__raw_writel(enable & ATH79_MISC_SI_TIMERINT,
+		     base + AR71XX_RESET_REG_MISC_INT_ENABLE);
+	__raw_writel(0, base + AR71XX_RESET_REG_MISC_INT_STATUS);
 
-	ath79_misc_intc_domain_init(domain, irq);
+	irq_set_chained_handler_and_data(irq, ath79_misc_irq_handler, domain);
 	ath79_misc_domain = domain;
+
 	return 0;
 }
 
-static int __init ar7100_misc_intc_of_init(
-	struct device_node *node, struct device_node *parent)
+static int ar7100_misc_intc_probe(struct platform_device *pdev,
+				  struct device_node *parent)
 {
 	ath79_misc_irq_chip.irq_mask_ack = ar71xx_misc_irq_mask;
-	return ath79_misc_intc_of_init(node, parent);
+	return ath79_misc_intc_probe(pdev);
 }
 
-IRQCHIP_DECLARE(ar7100_misc_intc, "qca,ar7100-misc-intc",
-		ar7100_misc_intc_of_init);
-
-static int __init ar7240_misc_intc_of_init(
-	struct device_node *node, struct device_node *parent)
+static int ar7240_misc_intc_probe(struct platform_device *pdev,
+				  struct device_node *parent)
 {
 	ath79_misc_irq_chip.irq_ack = ar724x_misc_irq_ack;
-	return ath79_misc_intc_of_init(node, parent);
+	return ath79_misc_intc_probe(pdev);
 }
 
-IRQCHIP_DECLARE(ar7240_misc_intc, "qca,ar7240-misc-intc",
-		ar7240_misc_intc_of_init);
+IRQCHIP_PLATFORM_DRIVER_BEGIN(ath79_misc_intc)
+IRQCHIP_MATCH("qca,ar7100-misc-intc", ar7100_misc_intc_probe)
+IRQCHIP_MATCH("qca,ar7240-misc-intc", ar7240_misc_intc_probe)
+IRQCHIP_PLATFORM_DRIVER_END(ath79_misc_intc)
+MODULE_DESCRIPTION("Atheros AR71xx/AR724x/AR913x MISC interrupt controller");
+MODULE_LICENSE("GPL");
-- 
2.56.1

