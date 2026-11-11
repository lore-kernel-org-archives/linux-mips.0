Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794434262;
	b=4Mgd4T7WakehapXAhIIW8eKj10Zg1VGG1DandnBqBJn5o9H2URkWRr8rOOcldezQA1bn
	 DHi4jqUPdI3XGOvFdKbRKFap86XdpJiW1BvsK7X/N3fTVwmySFFmlBZ9+9nmLQIZ1nM7u
	 sKETX63g+qdtehFG0JcPN5Rh1Mu/v9u/KXo0w2aAvnqQ8bxIVKrtTYav15xoRz10EbYaf
	 cIndP3qpBf7ScxQpdvPgYfueZ2uoEbVmY05/yny79F6z2Y1VaD+YLGSsUxeGilOq2Qkl5
	 bUlgPmEtW/mA3lLVwNePI0DO1Zmbp+i5JtZbqR18sxDAy3rROvFyCu5HEQ1fAJWAX1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794434262;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UsRJKEluBSbVsV3eijW+hVbVyEwtuopO98EdaaFI0AU=;
	b=Q+JeD3//dyvtrXotIEYluAAJZOUa2t5udiJtlHW+DOSM9PphVjCJ6esnd+TUiHYH8O6p
	 enyb5lrkxdwH9R/QIl942uds6W+7f8+wTUDzIibnnSiiUPm0lhhQBMJeNHKT+vXS2xH/z
	 ArwpTmC5QtCEJENWdu1x+gXfyxazw5SAofNVQI63n/rWofR+gy50rTKnzVlyCjydTuh7F
	 b3B6bkgi775qN9uiOFwn0wI9OTREr+XRoOBPnU2WK5d3y4zZM3Z++yqmwg+2TII9kx4d+
	 LYV1eAMCX5bzSKcaOxcmJ4DYM8spumpFLZ0yTgTd9pCS20VMIrZML8hcxE6pW2nWJdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="jIvB/fdN";
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2471D606A8BE
	for <linux-mips@vger.kernel.org>; Wed, 11 Nov 2026 21:57:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2471D606A8BE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jIvB/fdN
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ed0e2015aaso15594515ad.3
        for <linux-mips@vger.kernel.org>; Wed, 11 Nov 2026 13:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794434260; x=1795039060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UsRJKEluBSbVsV3eijW+hVbVyEwtuopO98EdaaFI0AU=;
        b=jIvB/fdNBR4OQV69zpGUacx0rezvsVdwS89SlNQSgSOqYSVDiXWZBUgkhwv+G5BWpo
         ZKcxhvyWWML2tg6Zin0RQJyLPFMHCnswgFlGKHghG5RDaaXTfdFI/YvAJ48d4VyrmBiL
         pMw9HnYicpVpJJ+VJJnJs4fXhgFGgwOzhh1v9koNAL2tBWSP8MDozLpOj3tO+5Xvtvoz
         hr+LZfA8SfhrSa5RPxLpBraPtkDEndCCilnrTCgVqNG9aLWOUzfXDzWN11fkM+2EQiDG
         bxLEMVbgJsXCO7IuL3Wcm5dkjFXSuHGZbVW+fFjEin5rw53lLSfN03JyEaTac55ON6nX
         iGaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794434260; x=1795039060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UsRJKEluBSbVsV3eijW+hVbVyEwtuopO98EdaaFI0AU=;
        b=d0RptpQhlkI9Mb1vspxaj/6+lH3i3swymDKOeURj5Pa0g3ePndoQCwE2SSx10YucEI
         zvqPYXSbXaEKTdt+ur8JCIM5dGpJ4OH9llZxS/GmgNnwxH+vhFF/ekE8Ac1OAhbe8Jlb
         yZBQuVIuuxKPMhA20feDSqeN36qXAr0lnNhxVnS/3bEKoFwsT8OjysB/XTQgGZY77SFz
         bFXo48BNekYr7rtWAPq1eabvnhZuiK/Ua+t2nk1LS6Hv/FISSg10HTBMjklFbnT18h5+
         AtDMHJjwzlohIsQfFeAnQfkA1oHa8Hw7UrX0OcxneNXyfQE2iA03+eG/TD1odwpwtYcQ
         3Qvw==
X-Forwarded-Encrypted: i=1; AL+hErGPTpfs49IF+eiNLfExCaw5hfniW1rwhgbkUeE3ZLJ+Db04MhSuflJungL2xrHVaFySjTYsGUM1ALSo@vger.kernel.org
X-Gm-Message-State: APuU4Z9dCOyRqEwAyNBBNfxxHvOkpmOukVklFme0MnTR+lYzXmWA/1tY
	E/L/cHHfM0sgpJWWB7308fZL9OPQ2MJYDOHMeGsc7Ar6gtWCxx/pb/1H
X-Gm-Gg: AYBFou1Mwq9LaaZ4HrAJwhZHOLsGzG51IouokI2RffQUCgwBAxPhIeYExZR+OLCuEcw
	u0s8AAkqbKCPUJSOwjStu1kV/PX8Lf9K76gZfRzJModDIBRvTH+R44pGJXdqola4dl6JqZH5UMQ
	6dQT0eLqYlMppWUuaWsqbC1dirpP32pzJ8hDpNOe4nJP0gq9g/6uglj44hmegesoBW9W2ImB+XP
	VbH2aIMAMSPal5ZdpdKLzUZ3dzCwiTobfMB5BkBUxFjyPlQVgeDDBMJj5BeLcuNgaNuoayQRUMh
	sRPLlLJKNh5JgLcEg8mDb8UTo2SCOBDp5yEg6r6eIX8TMow9ilhM+cwciFI4z+171X1G4aL8XsT
	anu4yGl6G5stoL6NFzXZ2V7kPkRaUxdXufE6HEz09QWSW4qIEpivY1ysEzzqgkG96ILd9swf91F
	BWLvDgfgFk/GmluzgHtmXS+4paQOX7vunYvd5S4ssM3+bJH0SznYgx4MF+nZBtK1YoIdGhtyf9B
	Rc79OhGFqAuoygVj8MnyRzDHdLtwHLaqB9SjIZ/BUQkDZ4kTw3N2Q+rmfZ+IPA7v56T43BSogb/
	XL8x9XkIN4eiIXQ6V0xe/h7PtLd0t38tSinVfqt2yGAVd13IFXRTsowCgn0dVgJaR6T6ik/bg+f
	WFzGlMl3U7x/7ww+7bFJUU/sMdUP8kAeC1Uhsc/O8cGULUBdtF9lxOWNfrQ5irOGbgQXdvfz5q9
	N34/331of9AmqcthuiZuzW2eQ=
X-Received: by 2002:a17:90b:2688:b0:3b0:9183:23ef with SMTP id 98e67ed59e1d1-3b182dea8bcmr3780486a91.3.1794434260372;
        Wed, 11 Nov 2026 13:57:40 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce556dsm965429a91.6.2026.11.11.13.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 13:57:39 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Alban Bedel <albeu@free.fr>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 2/7] MIPS: ath79: move the bootstrap reference clock to setup
Date: Wed, 11 Nov 2026 13:57:24 -0800
Message-ID: <20261111215729.10683-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261111215729.10683-1-rosenp@gmail.com>
References: <20261111215729.10683-1-rosenp@gmail.com>
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

The qca,ath79-pll binding requires the reference clock as an input, and a
rate in the device tree already took precedence over the 25/40 MHz that
the clock code read from the bootstrap pins. Many AR933x boards leave the
rate out, though, and rely on the pins.

Read the pins in plat_time_init() instead. When the device tree gives
no rate, so that the fixed-clock driver can't register the clock, register
it from the pins as the provider of the reference clock node. The clock
code then takes it from the device tree, like every other consumer of the
node, such as the AR933x UART, and no longer needs ath79_reset_base.

When the device tree does give a rate, warn if it disagrees with the
pins: a wrong rate leaves the CPU, DDR and AHB rates off, the UART baud
rate included.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/mips/ath79/clock.c | 65 +++++-----------------------
 arch/mips/ath79/setup.c | 94 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 105 insertions(+), 54 deletions(-)

diff --git a/arch/mips/ath79/clock.c b/arch/mips/ath79/clock.c
index 8c5eaa4ab6e0..6a8bef782186 100644
--- a/arch/mips/ath79/clock.c
+++ b/arch/mips/ath79/clock.c
@@ -25,9 +25,6 @@
 #include <asm/mach-ath79/ar71xx_regs.h>
 #include "common.h"
 
-#define AR71XX_BASE_FREQ	40000000
-#define AR724X_BASE_FREQ	40000000
-
 static struct clk *clks[ATH79_CLK_END];
 static struct clk_onecell_data clk_data = {
 	.clks = clks,
@@ -78,16 +75,12 @@ static struct clk * __init ath79_set_ff_clk(int type, const char *parent,
 	return clk;
 }
 
-static unsigned long __init ath79_setup_ref_clk(unsigned long rate)
+static unsigned long __init ath79_get_ref_rate(void)
 {
-	struct clk *clk = clks[ATH79_CLK_REF];
-
-	if (clk)
-		rate = clk_get_rate(clk);
-	else
-		clk = ath79_set_clk(ATH79_CLK_REF, rate);
+	if (!clks[ATH79_CLK_REF])
+		panic("ath79: no reference clock");
 
-	return rate;
+	return clk_get_rate(clks[ATH79_CLK_REF]);
 }
 
 static void __init ar71xx_clocks_init(void __iomem *pll_base)
@@ -100,7 +93,7 @@ static void __init ar71xx_clocks_init(void __iomem *pll_base)
 	u32 freq;
 	u32 div;
 
-	ref_rate = ath79_setup_ref_clk(AR71XX_BASE_FREQ);
+	ref_rate = ath79_get_ref_rate();
 
 	pll = __raw_readl(pll_base + AR71XX_PLL_REG_CPU_CONFIG);
 
@@ -126,7 +119,7 @@ static void __init ar724x_clocks_init(void __iomem *pll_base)
 	u32 mult, div, ddr_div, ahb_div;
 	u32 pll;
 
-	ath79_setup_ref_clk(AR71XX_BASE_FREQ);
+	ath79_get_ref_rate();
 
 	pll = __raw_readl(pll_base + AR724X_PLL_REG_CPU_CONFIG);
 
@@ -143,7 +136,6 @@ static void __init ar724x_clocks_init(void __iomem *pll_base)
 
 static void __init ar933x_clocks_init(void __iomem *pll_base)
 {
-	unsigned long ref_rate;
 	u32 clock_ctrl;
 	u32 ref_div;
 	u32 ninit_mul;
@@ -152,15 +144,8 @@ static void __init ar933x_clocks_init(void __iomem *pll_base)
 	u32 cpu_div;
 	u32 ddr_div;
 	u32 ahb_div;
-	u32 t;
 
-	t = ath79_reset_rr(AR933X_RESET_REG_BOOTSTRAP);
-	if (t & AR933X_BOOTSTRAP_REF_CLK_40)
-		ref_rate = (40 * 1000 * 1000);
-	else
-		ref_rate = (25 * 1000 * 1000);
-
-	ath79_setup_ref_clk(ref_rate);
+	ath79_get_ref_rate();
 
 	clock_ctrl = __raw_readl(pll_base + AR933X_PLL_CLOCK_CTRL_REG);
 	if (clock_ctrl & AR933X_PLL_CLOCK_CTRL_BYPASS) {
@@ -237,18 +222,11 @@ static void __init ar934x_clocks_init(void __iomem *pll_base)
 	unsigned long ahb_rate;
 	u32 pll, out_div, ref_div, nint, nfrac, frac, clk_ctrl, postdiv;
 	u32 cpu_pll, ddr_pll;
-	u32 bootstrap;
 	void __iomem *dpll_base;
 
 	dpll_base = ioremap(AR934X_SRIF_BASE, AR934X_SRIF_SIZE);
 
-	bootstrap = ath79_reset_rr(AR934X_RESET_REG_BOOTSTRAP);
-	if (bootstrap & AR934X_BOOTSTRAP_REF_CLK_40)
-		ref_rate = 40 * 1000 * 1000;
-	else
-		ref_rate = 25 * 1000 * 1000;
-
-	ref_rate = ath79_setup_ref_clk(ref_rate);
+	ref_rate = ath79_get_ref_rate();
 
 	pll = __raw_readl(dpll_base + AR934X_SRIF_CPU_DPLL2_REG);
 	if (pll & AR934X_SRIF_DPLL2_LOCAL_PLL) {
@@ -355,15 +333,8 @@ static void __init qca953x_clocks_init(void __iomem *pll_base)
 	unsigned long ahb_rate;
 	u32 pll, out_div, ref_div, nint, frac, clk_ctrl, postdiv;
 	u32 cpu_pll, ddr_pll;
-	u32 bootstrap;
-
-	bootstrap = ath79_reset_rr(QCA953X_RESET_REG_BOOTSTRAP);
-	if (bootstrap &	QCA953X_BOOTSTRAP_REF_CLK_40)
-		ref_rate = 40 * 1000 * 1000;
-	else
-		ref_rate = 25 * 1000 * 1000;
 
-	ref_rate = ath79_setup_ref_clk(ref_rate);
+	ref_rate = ath79_get_ref_rate();
 
 	pll = __raw_readl(pll_base + QCA953X_PLL_CPU_CONFIG_REG);
 	out_div = (pll >> QCA953X_PLL_CPU_CONFIG_OUTDIV_SHIFT) &
@@ -438,15 +409,8 @@ static void __init qca955x_clocks_init(void __iomem *pll_base)
 	unsigned long ahb_rate;
 	u32 pll, out_div, ref_div, nint, frac, clk_ctrl, postdiv;
 	u32 cpu_pll, ddr_pll;
-	u32 bootstrap;
 
-	bootstrap = ath79_reset_rr(QCA955X_RESET_REG_BOOTSTRAP);
-	if (bootstrap &	QCA955X_BOOTSTRAP_REF_CLK_40)
-		ref_rate = 40 * 1000 * 1000;
-	else
-		ref_rate = 25 * 1000 * 1000;
-
-	ref_rate = ath79_setup_ref_clk(ref_rate);
+	ref_rate = ath79_get_ref_rate();
 
 	pll = __raw_readl(pll_base + QCA955X_PLL_CPU_CONFIG_REG);
 	out_div = (pll >> QCA955X_PLL_CPU_CONFIG_OUTDIV_SHIFT) &
@@ -521,15 +485,8 @@ static void __init qca956x_clocks_init(void __iomem *pll_base)
 	unsigned long ahb_rate;
 	u32 pll, out_div, ref_div, nint, hfrac, lfrac, clk_ctrl, postdiv;
 	u32 cpu_pll, ddr_pll;
-	u32 bootstrap;
-
-	bootstrap = ath79_reset_rr(QCA956X_RESET_REG_BOOTSTRAP);
-	if (bootstrap &	QCA956X_BOOTSTRAP_REF_CLK_40)
-		ref_rate = 40 * 1000 * 1000;
-	else
-		ref_rate = 25 * 1000 * 1000;
 
-	ref_rate = ath79_setup_ref_clk(ref_rate);
+	ref_rate = ath79_get_ref_rate();
 
 	pll = __raw_readl(pll_base + QCA956X_PLL_CPU_CONFIG_REG);
 	out_div = (pll >> QCA956X_PLL_CPU_CONFIG_OUTDIV_SHIFT) &
diff --git a/arch/mips/ath79/setup.c b/arch/mips/ath79/setup.c
index d9e1cc77ad04..d06e8cc378bc 100644
--- a/arch/mips/ath79/setup.c
+++ b/arch/mips/ath79/setup.c
@@ -15,6 +15,8 @@
 #include <linux/memblock.h>
 #include <linux/err.h>
 #include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/of.h>
 #include <linux/of_clk.h>
 #include <linux/of_fdt.h>
 #include <linux/irqchip.h>
@@ -235,6 +237,97 @@ void __init plat_mem_setup(void)
 	pm_power_off = ath79_halt;
 }
 
+static const struct of_device_id ath79_pll_ids[] __initconst = {
+	{ .compatible = "qca,ar7100-pll" },
+	{ .compatible = "qca,ar7240-pll" },
+	{ .compatible = "qca,ar9130-pll" },
+	{ .compatible = "qca,ar9330-pll" },
+	{ .compatible = "qca,ar9340-pll" },
+	{ .compatible = "qca,qca9530-pll" },
+	{ .compatible = "qca,qca9550-pll" },
+	{ .compatible = "qca,qca9560-pll" },
+	{ /* sentinel */ }
+};
+
+/* the crystal that the bootstrap pins select */
+static unsigned long __init ath79_bootstrap_ref_rate(bool *strapped)
+{
+	unsigned int reg;
+	u32 bit;
+
+	*strapped = true;
+	if (soc_is_ar933x()) {
+		reg = AR933X_RESET_REG_BOOTSTRAP;
+		bit = AR933X_BOOTSTRAP_REF_CLK_40;
+	} else if (soc_is_ar934x()) {
+		reg = AR934X_RESET_REG_BOOTSTRAP;
+		bit = AR934X_BOOTSTRAP_REF_CLK_40;
+	} else if (soc_is_qca953x()) {
+		reg = QCA953X_RESET_REG_BOOTSTRAP;
+		bit = QCA953X_BOOTSTRAP_REF_CLK_40;
+	} else if (soc_is_qca955x()) {
+		reg = QCA955X_RESET_REG_BOOTSTRAP;
+		bit = QCA955X_BOOTSTRAP_REF_CLK_40;
+	} else if (soc_is_qca956x() || soc_is_tp9343()) {
+		reg = QCA956X_RESET_REG_BOOTSTRAP;
+		bit = QCA956X_BOOTSTRAP_REF_CLK_40;
+	} else {
+		/* no bootstrap pin for the crystal on AR71xx, AR724x, AR913x */
+		*strapped = false;
+		return 40000000;
+	}
+
+	return (ath79_reset_rr(reg) & bit) ? 40000000 : 25000000;
+}
+
+/*
+ * The clock code takes the reference clock from the device tree. Many
+ * AR933x boards leave its rate out and rely on the bootstrap pins, so
+ * register it from those for them, as the provider of the DT node so that
+ * its other consumers find it too. Otherwise warn if the device tree
+ * disagrees with the pins, as a wrong rate leaves every derived clock off,
+ * the UART baud rate included.
+ */
+static void __init ath79_setup_ref_clk(void)
+{
+	struct device_node *np, *ref_np;
+	unsigned long strap_rate;
+	struct clk_hw *hw;
+	bool strapped;
+	u32 dt_rate;
+	int ret;
+
+	strap_rate = ath79_bootstrap_ref_rate(&strapped);
+
+	np = of_find_matching_node(NULL, ath79_pll_ids);
+	ref_np = np ? of_parse_phandle(np, "clocks", 0) : NULL;
+	of_node_put(np);
+	if (!ref_np)
+		return;
+
+	if (!of_property_read_u32(ref_np, "clock-frequency", &dt_rate)) {
+		if (strapped && dt_rate != strap_rate)
+			pr_warn("ath79: reference clock is %u Hz in the device tree, but the bootstrap pins select %lu Hz\n",
+				dt_rate, strap_rate);
+		goto out_put;
+	}
+
+	hw = clk_hw_register_fixed_rate(NULL, "ref", NULL, 0, strap_rate);
+	if (IS_ERR(hw)) {
+		pr_err("ath79: failed to register the reference clock\n");
+		goto out_put;
+	}
+
+	ret = of_clk_add_hw_provider(ref_np, of_clk_hw_simple_get, hw);
+	if (ret) {
+		pr_err("ath79: failed to add the reference clock provider\n");
+		clk_hw_unregister_fixed_rate(hw);
+	}
+
+out_put:
+	of_node_put(ref_np);
+}
+
 void __init plat_time_init(void)
 {
 	struct device_node *np;
@@ -254,6 +347,7 @@ void __init plat_time_init(void)
 		ath79_reset_wr(AR71XX_RESET_REG_MISC_INT_ENABLE, misc);
 	}
 
+	ath79_setup_ref_clk();
 	of_clk_init(NULL);
 
 	np = of_get_cpu_node(0, NULL);
-- 
2.56.0

