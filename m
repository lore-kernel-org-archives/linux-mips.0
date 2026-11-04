Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793771946;
	b=zL/EPzJG7zLF1PiWOCt4xi/UA6WRZqf6W9iDiQo+grt3aFMHlsRBGGiVHUbeCKMjFWPV
	 9Js7XT3VLM+Du8JcELttH088giHC5cBVFUUr0KdMm0Bc+udMk5ygm+7ZPGIu1jYLLcwDW
	 kiQ2vNSG8AujBVQrCFuVmgadv69VKTkr3Z+x8kdW0EvS6X7PRX3mK7hgLNOQPd0f9gelo
	 qT4dOW3jSnniTxpgxKyW6R3706RXgLu3DErN8ROmHFDpDFxvZke4wrTj8r6nZSr7xZV4D
	 Dq5oG1hcmoNnldBXVfq7I4nCI46kaDjRCTlgTPOa5Lo10TwzXr4ak0CHaqtbAcZ8KcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793771946;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2Rp4lizZz5ZPmQTX2hVm2ac2qWYjm/C0ch6Hu7hghw4=;
	b=jadJwRJZiFBQvntn7JVWbijrh9zQW0v+4PyauONZm/5CNEJvaFfkb0lqdO8gok1cDlF4
	 HgTUHnjXSvWz6U3j2H1x+xfubopc7xdyzPoKHoLetTVvT0M+PtYnmw8OTr4lEcf45WY+f
	 bZ3xCU+tkhsyvNDekLgFBW1AwjSR9R+u1IhtRYcICg3UMdhV5cjDHRIk8m/1XlWko6qg+
	 HKmCTUd1jZcyKleon4yCghxHR1b+6oiR98gnNaJqjQn+EPL78syZMAPK6ALi/THQkJDdP
	 qmcU5XIabeBl0ZsdYOllL8PcvQfyRLJPCp2I8fu49GAhfg1xiVzXvDzrnIDJRr8lL6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zJQylyrI;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E38606A334
	for <linux-mips@vger.kernel.org>; Wed,  4 Nov 2026 05:59:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98E38606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zJQylyrI
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so259253a91.1
        for <linux-mips@vger.kernel.org>; Tue, 03 Nov 2026 21:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793771945; x=1794376745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Rp4lizZz5ZPmQTX2hVm2ac2qWYjm/C0ch6Hu7hghw4=;
        b=zJQylyrIaxkJ6qh/3H/fp8MxqtGJ/b8X2+J0P9MIJk71Xfz1vz299bZXbYwzp6c/MV
         d+5X7dTslB2r3icSDTd0zICkWYZJ/YFmLE52MaiHL/RBHNAoM66Efgq/QPYemCyKy1Ao
         F894GPvtqxZYVFnZYLTd4BokScEzWecc4p8n9OKIzLwUfv9QdyFOMUb9CEL64Wj5dzUf
         ZjvBBEb5anuFvYIIxztm8MdAJi9RQIekHlRHrpeW6Sfeo5/kR47lSwf8RX1GrL4GJkYW
         yXY1dX9gDARf33ZA9Pv+gN2yguvFlT2OkuYsfeSOZucvZmED752iWg4ZuazqomnOtWMG
         lX0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793771945; x=1794376745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Rp4lizZz5ZPmQTX2hVm2ac2qWYjm/C0ch6Hu7hghw4=;
        b=d3f1eH3g2ZDobseaTMhVjilWsBMCJqhnmu2TT6XlUJ3yS+5JLuiArgarw0Ks2GEYaU
         hb8hZ4g0AojE3DrFyZ2c2WNt+iLQqShKMvdkuPbYO+jWod8bFfZ6JwcPAn/5Q39YWp35
         X0pFHLb33WF7X1mypLclfdufHfulPbF1ORRnCtODHhVcawadUefhBIrtByGmeVfuAnwa
         NZeKP7NMCpAOt3im+yKp5s1iIm7iWi0cpM9lrliDsiQR8BEbMOdUtWqtN1xI1xIgoM+8
         IC38g3Y6HUNXR9UVZHdpILSOWFSm29xjjXeCYz/aqjV0JtTnv6P8Dd0ylDJUu4/XeQq/
         bU2Q==
X-Gm-Message-State: APuU4Z/JL733HJN1NlS5mPDrsk8geyaNdkAmqUxxUx3mag9Y0drlg+22
	p3wfX6BS/b0s4Zpehu/54HWRlPEPpx99RWYQIZ5sr7hvD83niXXAw2tiENoRgg==
X-Gm-Gg: AYBFou2YnJcPZJ/oCilk5AbhNKuIe99L9Ualsm334QvADS1bRCqPEwkD48Eqe0edlna
	mJcnPAdP0yg4vTykCbuaGyQNkGtCBwg+2OTB9HSeeuv0Prve9zmDmujLx1xcfi5MbPyBuCYO22m
	FKaUYRjbV4Ot9A5vNqVZz5nCpZg68s2JV6nWWboKXsubf1UYoZHEimuLq9knzAbz3tmp5ab2c4N
	8Came5+Gc7u3mOnV9aWu5Y5hwbZsmXrGNfUL5uv8BCBqS6tlHJcs917PneFqp7sSXG7bCyBTdWM
	LosivorB4GHFnIcXZbvBaIJrXoKt2mQvKJutbviJo5tv/LlVVyVF4NRecJ0SHg1MFzHjzuPULvk
	o3hlVpSUA2rMYt+B8Nnq38ngOqSKpfUzhRryPUHwLp0Lf6V08C0xEa5XaWUEwHY0sFoL+ap4/eG
	5b320GfK0QUycbD8FjcSHiufw7ZmJ8fP+2pvdD1XmCGJGJA0LEHwg++EJLH7nCAmw0YfYeIzXfC
	u4I2lqjsJ4qaVSyQUhkF9JEwk9psZ+bF9paXLjvyQJ9jHS1q2ZZ5PJhYCvRt8q9jh0FRzy8830H
	FSAr1Xm9m1h8UiU8NBlrV28ubJcoQydNcQGuttuDA37J+rEBIoZss8aJiUVoJAjbbouu2onPY24
	4QCuP/3KaJq75+mu3LBJPdjE8cHccGcdCnAtrwZQF/4T8vPYgN/zWxy5VUt8ONsmHwHzRtVr/Ae
	eL0Q==
X-Received: by 2002:a17:90b:2247:b0:3ac:7c4d:8be6 with SMTP id 98e67ed59e1d1-3ae89836523mr12002205a91.40.1793771944775;
        Tue, 03 Nov 2026 21:59:04 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c9928c4sm7840110a91.15.2026.11.03.21.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 21:59:04 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mips@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Alban Bedel <albeu@free.fr>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK)
Subject: [PATCH 7/8] clk: ath79: give each compatible its own init function
Date: Tue,  3 Nov 2026 21:58:51 -0800
Message-ID: <20261104055852.152340-8-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104055852.152340-1-rosenp@gmail.com>
References: <20261104055852.152340-1-rosenp@gmail.com>
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

Every compatible already has its own CLK_OF_DECLARE(), yet they all
shared one init function, which then matched the compatible again to
pick the SoC code. Have each CLK_OF_DECLARE() call a small wrapper
that passes the SoC init function to the common code instead.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/clk-ath79.c | 72 +++++++++++++++++++++++++++--------------
 1 file changed, 47 insertions(+), 25 deletions(-)

diff --git a/drivers/clk/clk-ath79.c b/drivers/clk/clk-ath79.c
index 768c9e410b59..8086b4f6378c 100644
--- a/drivers/clk/clk-ath79.c
+++ b/drivers/clk/clk-ath79.c
@@ -504,11 +504,12 @@ static int __init qca956x_clocks_init(void __iomem *pll_base)
 	return ath79_set_clks(cpu_rate, ddr_rate, ahb_rate);
 }
 
-static void __init ath79_clocks_init_dt(struct device_node *np)
+static void __init ath79_clocks_init_dt(struct device_node *np,
+					int (*soc_init)(void __iomem *pll_base))
 {
 	struct clk *ref_clk;
 	void __iomem *pll_base;
-	int ret = -ENODEV;
+	int ret;
 
 	clk_data = kzalloc_flex(*clk_data, hws, ATH79_CLK_END);
 	if (!clk_data)
@@ -534,21 +535,7 @@ static void __init ath79_clocks_init_dt(struct device_node *np)
 		goto err_clk;
 	}
 
-	if (of_device_is_compatible(np, "qca,ar7100-pll"))
-		ret = ar71xx_clocks_init(pll_base);
-	else if (of_device_is_compatible(np, "qca,ar7240-pll") ||
-		 of_device_is_compatible(np, "qca,ar9130-pll"))
-		ret = ar724x_clocks_init(pll_base);
-	else if (of_device_is_compatible(np, "qca,ar9330-pll"))
-		ret = ar933x_clocks_init(pll_base);
-	else if (of_device_is_compatible(np, "qca,ar9340-pll"))
-		ret = ar934x_clocks_init(pll_base);
-	else if (of_device_is_compatible(np, "qca,qca9530-pll"))
-		ret = qca953x_clocks_init(pll_base);
-	else if (of_device_is_compatible(np, "qca,qca9550-pll"))
-		ret = qca955x_clocks_init(pll_base);
-	else if (of_device_is_compatible(np, "qca,qca9560-pll"))
-		ret = qca956x_clocks_init(pll_base);
+	ret = soc_init(pll_base);
 
 	/* the rates are fixed, so the registers aren't needed any more */
 	iounmap(pll_base);
@@ -578,11 +565,46 @@ static void __init ath79_clocks_init_dt(struct device_node *np)
 	clk_data = NULL;
 }
 
-CLK_OF_DECLARE(ar7100_clk, "qca,ar7100-pll", ath79_clocks_init_dt);
-CLK_OF_DECLARE(ar7240_clk, "qca,ar7240-pll", ath79_clocks_init_dt);
-CLK_OF_DECLARE(ar9130_clk, "qca,ar9130-pll", ath79_clocks_init_dt);
-CLK_OF_DECLARE(ar9330_clk, "qca,ar9330-pll", ath79_clocks_init_dt);
-CLK_OF_DECLARE(ar9340_clk, "qca,ar9340-pll", ath79_clocks_init_dt);
-CLK_OF_DECLARE(ar9530_clk, "qca,qca9530-pll", ath79_clocks_init_dt);
-CLK_OF_DECLARE(ar9550_clk, "qca,qca9550-pll", ath79_clocks_init_dt);
-CLK_OF_DECLARE(ar9560_clk, "qca,qca9560-pll", ath79_clocks_init_dt);
+static void __init ar71xx_clocks_init_dt(struct device_node *np)
+{
+	ath79_clocks_init_dt(np, ar71xx_clocks_init);
+}
+
+static void __init ar724x_clocks_init_dt(struct device_node *np)
+{
+	ath79_clocks_init_dt(np, ar724x_clocks_init);
+}
+
+static void __init ar933x_clocks_init_dt(struct device_node *np)
+{
+	ath79_clocks_init_dt(np, ar933x_clocks_init);
+}
+
+static void __init ar934x_clocks_init_dt(struct device_node *np)
+{
+	ath79_clocks_init_dt(np, ar934x_clocks_init);
+}
+
+static void __init qca953x_clocks_init_dt(struct device_node *np)
+{
+	ath79_clocks_init_dt(np, qca953x_clocks_init);
+}
+
+static void __init qca955x_clocks_init_dt(struct device_node *np)
+{
+	ath79_clocks_init_dt(np, qca955x_clocks_init);
+}
+
+static void __init qca956x_clocks_init_dt(struct device_node *np)
+{
+	ath79_clocks_init_dt(np, qca956x_clocks_init);
+}
+
+CLK_OF_DECLARE(ar7100_clk, "qca,ar7100-pll", ar71xx_clocks_init_dt);
+CLK_OF_DECLARE(ar7240_clk, "qca,ar7240-pll", ar724x_clocks_init_dt);
+CLK_OF_DECLARE(ar9130_clk, "qca,ar9130-pll", ar724x_clocks_init_dt);
+CLK_OF_DECLARE(ar9330_clk, "qca,ar9330-pll", ar933x_clocks_init_dt);
+CLK_OF_DECLARE(ar9340_clk, "qca,ar9340-pll", ar934x_clocks_init_dt);
+CLK_OF_DECLARE(ar9530_clk, "qca,qca9530-pll", qca953x_clocks_init_dt);
+CLK_OF_DECLARE(ar9550_clk, "qca,qca9550-pll", qca955x_clocks_init_dt);
+CLK_OF_DECLARE(ar9560_clk, "qca,qca9560-pll", qca956x_clocks_init_dt);
-- 
2.56.0

