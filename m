Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793771948;
	b=gaoOPLgk13CnM2+K1xzCIMeoqNdKF0/Ol+kTbx6ETrLkAj2jYDNussrROaBfTdxJd6yr
	 FgEVIOLk83GMphDj7/3LZJ/A31H7yC/UEU+fHgueMKnSEeQl2wCcFofjK4IG0+fPlU50w
	 044EVQjdJrenTsON/k+YL9AF5YuDTCFK/0NWJ0v+wJHWitM2Yz6WKTCTqjphdQF3LGbjj
	 gkGuH9KhdUTg/RcQoKEK50rvoMxKZzsU3/MtxPvbbD/INGwujpaR/6dWrKOV+FyIZliiZ
	 fqQuXWnOIVe9JRCVRgafsQrGeBtR0ZGOlT9S43F4yhnaIAHoowt7tP84Qpdask6lSug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793771948;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vcGVtTeRbNMuJZikTeTy/aVLP/b0ijAI9oZ17pCLwwI=;
	b=HWiAlTBfPyoPqNQnu8j/Rb4YkLmSI/Bjrg0UqZgadBZD2uMsZKOpFwomFhiF9CQuYWsU
	 lpYsY8nhHwmYA+8fDUaqdoqP0DNRyYYvYUUwjS8vG9Ver4jVJmNfi0HLlBzqiXrX0QjA0
	 T1mINswFRHUPBdmILjlqTtp1D56h9DsFEz9Q7r4nag1rjZASCMHLvZyoes76aSk2Jk/Bh
	 9RuxjjfUScI7Y/4KOO9Jl4GZDLep5j8oe/LNl0kly94DbkXr0AHXyEGUngvUYteVu1lOA
	 gtIwCrX+ARxJTc0ZvEbZYY5ZHqZzs8V/lTXuSruyoIuaKqTb4qHSKBi4BQiS7dyz99w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RQyqnqA3;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE49E606A332
	for <linux-mips@vger.kernel.org>; Wed,  4 Nov 2026 05:59:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE49E606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RQyqnqA3
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ad2b3b1c02so199392a91.1
        for <linux-mips@vger.kernel.org>; Tue, 03 Nov 2026 21:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793771947; x=1794376747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vcGVtTeRbNMuJZikTeTy/aVLP/b0ijAI9oZ17pCLwwI=;
        b=RQyqnqA323GdSXTNNSSZ/xZ3K5TQwCzL5RgcVHfFdyzLb1ZFGAiIF0HXmzRwsq+imI
         FFCfZomhVZVCkzKYYVmVgHs/d3Sx4t4jPoIPKkn4xXMvILrRVc59mtjMx3+y2ZxCLfe1
         YAurjNgVZbwp8opPTwOzjp/0S1oR3Gb27pc+BsHW0/3GyTDswDDC1bJ4C7/MGzt+OJTV
         rjTDThLzl3ChKJcGWlZDilc2Nc02UCMyGPW6mpYCf4TGLvvcebV9fXMoeT6FfjDtkqak
         sjWYNbkdMlWbxPaWS0Bj9qeyzizqFxcFxE79aHH2jBn+gWTRjYfawW7YEvd4R+5kmk5z
         G9tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793771947; x=1794376747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vcGVtTeRbNMuJZikTeTy/aVLP/b0ijAI9oZ17pCLwwI=;
        b=XgAZYHwFkdVYzRaViKxYEK3FMTAtxZSHk1XG+8ggP0LE4QcHksw3QcmapRodIMVaDp
         lrvAzWtyz+DWKnDX+hxGjFp7fE4hUzKhimfe1RRiipBQ5WVOYrHwuqvwboEXnMR1jn82
         SS3AIQ0LuGie7iNCnhUJKo4kBJ4kCsxcvo8dPDJCq/4laqZ6Od8tjzOCp23z5nbbxw1l
         Aw0w+VEnm3Wdd/qCMUzfxxNw0PyCSJl5Rs0XUYOyKmGLt6dfQU3sHRiPek1m4VWiURNY
         pXdDGUY0ZSqspSMK9DxR311VuR9rXxg/3wlSEWIuz90hdhZ45WG40m3ejcV0nRAJZBPL
         g8GA==
X-Gm-Message-State: APuU4Z9be87IAFxFHsyZqQIyfjeI5pehLB8oiJ90qLoiq1s3khqEZWUm
	w5D2m4EV6HnSc5PHNz/tTC9J0MvBxHGpqYnShRSJngygYAK9OU0b4LSoUzCkyQ==
X-Gm-Gg: AYBFou0v6bXLkvEm4P2/lpSj+d3GSFJZQonPU0w7R4NLK+/YMe9n43Ym+QEkEutyZ0O
	H2EawyYLxM0CARq0jMyT9Mt39tXeyU3zvmGSPRGSADCw6NH2eYuQlv+a57nnDjM9lFW2oRpc0po
	q/YCTp+7eHSBsJbhaNpWNiZpGtRDLFQ5xcJuvsIfz4CHhSAlmGwal3MCc76z/M3kEBD2AcF2Bum
	Box/IZJ4MB2w+mt98/66yjPwSqAriSVXguMXmbAHSKEelXqdO26fphiOTbcqIE+yJ7rsunlgYd4
	7xMTzqJfe/Tv1Jw2NwmjopNMSEiH141K9TyamQqa8bu6IoNYujAA9QlqhNaNK2CANzhQGFehJrE
	dxYeuiQT508rbWCh9MoxzrWDft1vodxJ5sUrhrnkDEhmZrxWOu1pXPnDMFhOo6uge+YyUmhJY1z
	ARCOZdNoD8lB3qIbOGJT8dbeSthHi3p/JPnMOut+XDTrsJSXKu6TmtQ+zcdZ/CwziYMXbXkgcau
	UEa6jfBmMO1PjPYIP3IlGTBV6DCu/83lz74gjTyd8E9p9wWE0ypGPAK9HXiU+976PaxE/K8Kz1k
	TxmwatLIXh4c7qIKldkzdEnEkvG5Ysz5ypBkC6mwP5Q3Sgv+766G136ma8YX+Eo4pQokTAoDt0x
	ktmwa6QwpKfHS8W8zNGSGg63wbcnVXTDLEZ3GO/m9q4kAwY3czUVVckpuHVw2IoclPpc/UJqluj
	WoLhWz9FY55tpUDmTtjh0nkY4=
X-Received: by 2002:a17:90a:d887:b0:3ac:8af9:4a77 with SMTP id 98e67ed59e1d1-3ae897c94e8mr13520420a91.10.1793771947282;
        Tue, 03 Nov 2026 21:59:07 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c9928c4sm7840110a91.15.2026.11.03.21.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 21:59:05 -0800 (PST)
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
Subject: [PATCH 8/8] clk: ath79: share the fractional PLL calculation
Date: Tue,  3 Nov 2026 21:58:52 -0800
Message-ID: <20261104055852.152340-9-rosenp@gmail.com>
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

AR934x, QCA953x and QCA955x compute their CPU and DDR PLL rates with the
same formula, ref / ref_div * (nint + nfrac / frac) / 2^out_div, written
three different ways. Use one helper for all of them, with 64-bit
intermediates.

That fixes the QCA955x DDR PLL rate, whose nfrac * ref product could
overflow 32 bits: with a 40 MHz reference clock it did for any nfrac
above 107, and with 25 MHz for any above 171. The other rates are
unchanged, as checked against the old code with random register values.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/clk-ath79.c | 47 +++++++++++++----------------------------
 1 file changed, 15 insertions(+), 32 deletions(-)

diff --git a/drivers/clk/clk-ath79.c b/drivers/clk/clk-ath79.c
index 8086b4f6378c..f9a8c9b9aa24 100644
--- a/drivers/clk/clk-ath79.c
+++ b/drivers/clk/clk-ath79.c
@@ -10,6 +10,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/kernel.h>
+#include <linux/math64.h>
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/err.h>
@@ -21,7 +22,6 @@
 #include <linux/slab.h>
 #include <dt-bindings/clock/ath79-clk.h>
 
-#include <asm/div64.h>
 
 #include "clk-ath79.h"
 
@@ -189,24 +189,17 @@ static int __init ar933x_clocks_init(void __iomem *pll_base)
 				 ref_div * out_div * ahb_div);
 }
 
-static u32 __init ar934x_get_pll_freq(u32 ref, u32 ref_div, u32 nint, u32 nfrac,
-				      u32 frac, u32 out_div)
+/* a fractional PLL: ref / ref_div * (nint + nfrac / frac) / 2^out_div */
+static unsigned long __init ath79_pll_rate(unsigned long ref, u32 ref_div,
+					   u32 nint, u32 nfrac, u32 frac,
+					   u32 out_div)
 {
-	u64 t;
-	u32 ret;
+	unsigned long rate;
 
-	t = ref;
-	t *= nint;
-	do_div(t, ref_div);
-	ret = t;
+	rate = div_u64((u64)ref * nint, ref_div);
+	rate += div_u64((u64)ref * nfrac, ref_div * frac);
 
-	t = ref;
-	t *= nfrac;
-	do_div(t, ref_div * frac);
-	ret += t;
-
-	ret /= (1 << out_div);
-	return ret;
+	return rate >> out_div;
 }
 
 static int __init ar934x_clocks_init(void __iomem *pll_base)
@@ -243,8 +236,7 @@ static int __init ar934x_clocks_init(void __iomem *pll_base)
 		frac = 1 << 6;
 	}
 
-	cpu_pll = ar934x_get_pll_freq(ref_rate, ref_div, nint,
-				      nfrac, frac, out_div);
+	cpu_pll = ath79_pll_rate(ref_rate, ref_div, nint, nfrac, frac, out_div);
 
 	pll = __raw_readl(dpll_base + AR934X_SRIF_DDR_DPLL2_REG);
 	if (pll & AR934X_SRIF_DPLL2_LOCAL_PLL) {
@@ -263,8 +255,7 @@ static int __init ar934x_clocks_init(void __iomem *pll_base)
 		frac = 1 << 10;
 	}
 
-	ddr_pll = ar934x_get_pll_freq(ref_rate, ref_div, nint,
-				      nfrac, frac, out_div);
+	ddr_pll = ath79_pll_rate(ref_rate, ref_div, nint, nfrac, frac, out_div);
 
 	iounmap(dpll_base);
 
@@ -325,9 +316,7 @@ static int __init qca953x_clocks_init(void __iomem *pll_base)
 	nint = FIELD_GET(QCA953X_PLL_CPU_CONFIG_NINT, pll);
 	frac = FIELD_GET(QCA953X_PLL_CPU_CONFIG_NFRAC, pll);
 
-	cpu_pll = nint * ref_rate / ref_div;
-	cpu_pll += frac * (ref_rate >> 6) / ref_div;
-	cpu_pll /= (1 << out_div);
+	cpu_pll = ath79_pll_rate(ref_rate, ref_div, nint, frac, 1 << 6, out_div);
 
 	pll = __raw_readl(pll_base + QCA953X_PLL_DDR_CONFIG_REG);
 	out_div = FIELD_GET(QCA953X_PLL_DDR_CONFIG_OUTDIV, pll);
@@ -335,9 +324,7 @@ static int __init qca953x_clocks_init(void __iomem *pll_base)
 	nint = FIELD_GET(QCA953X_PLL_DDR_CONFIG_NINT, pll);
 	frac = FIELD_GET(QCA953X_PLL_DDR_CONFIG_NFRAC, pll);
 
-	ddr_pll = nint * ref_rate / ref_div;
-	ddr_pll += frac * (ref_rate >> 6) / (ref_div << 4);
-	ddr_pll /= (1 << out_div);
+	ddr_pll = ath79_pll_rate(ref_rate, ref_div, nint, frac, 1 << 10, out_div);
 
 	clk_ctrl = __raw_readl(pll_base + QCA953X_PLL_CLK_CTRL_REG);
 
@@ -388,9 +375,7 @@ static int __init qca955x_clocks_init(void __iomem *pll_base)
 	nint = FIELD_GET(QCA955X_PLL_CPU_CONFIG_NINT, pll);
 	frac = FIELD_GET(QCA955X_PLL_CPU_CONFIG_NFRAC, pll);
 
-	cpu_pll = nint * ref_rate / ref_div;
-	cpu_pll += frac * ref_rate / (ref_div * (1 << 6));
-	cpu_pll /= (1 << out_div);
+	cpu_pll = ath79_pll_rate(ref_rate, ref_div, nint, frac, 1 << 6, out_div);
 
 	pll = __raw_readl(pll_base + QCA955X_PLL_DDR_CONFIG_REG);
 	out_div = FIELD_GET(QCA955X_PLL_DDR_CONFIG_OUTDIV, pll);
@@ -398,9 +383,7 @@ static int __init qca955x_clocks_init(void __iomem *pll_base)
 	nint = FIELD_GET(QCA955X_PLL_DDR_CONFIG_NINT, pll);
 	frac = FIELD_GET(QCA955X_PLL_DDR_CONFIG_NFRAC, pll);
 
-	ddr_pll = nint * ref_rate / ref_div;
-	ddr_pll += frac * ref_rate / (ref_div * (1 << 10));
-	ddr_pll /= (1 << out_div);
+	ddr_pll = ath79_pll_rate(ref_rate, ref_div, nint, frac, 1 << 10, out_div);
 
 	clk_ctrl = __raw_readl(pll_base + QCA955X_PLL_CLK_CTRL_REG);
 
-- 
2.56.0

