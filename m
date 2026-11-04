Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793771940;
	b=W+It0qJ90NT7X5cCZuW618/icxvixnHA6b8euskQx384VQBDhB05JhnglQscJaFq/9Zi
	 bH58SJqzeqQlibar8ThjcblFhPxvq0OxPvq0HPhSDmkBQhrFRDPJM1tSq1W3wAYPnSvJF
	 FV3ksmDduy8N/N/fdClb9s7SDgegYCN/BlxpQaoGft9bS75SMTYUYmhtUBJJ4QnQlecHZ
	 dAtHnNh1umTDs6WtvkSqg/uLd4BO63d5SzO0UHcdq4TTENOmTjben3QIo/d2/lXTqT2mh
	 RdJ+n68sF4TkNorXeE2pYzocWgL53sGsUz8PxhvvsQ2DvsXlpMMKegOKUy7cml9J08w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793771940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cM57o/6Mh+j/504CxrQ254TmuGnm1Pl7GvY1G0ztF3g=;
	b=1efLBuONgj/qN2aWccGP8qvyB3dG9YJgIA45+Ke7fSaNQRrqXFngWOpnXwu8NBA+QfWv
	 dlaqYUBhEDtKhdemHewc4gPDLdWd3XIUx15ktuBvq3fPL7fvL6QTmXrVZDcxb/orp6gm8
	 5SO/J7Z4h8FeJZiS4t5b83AU3ZMewrxVRmwXdM3iczDJyj33Q9lgLigIDhweIA0uDBNqf
	 oOKXL6xcAWNyk56Bc4zmrQOPZsycPk70ms0Gy/51+wXoZjKKZIfxe6yM1CyLAJ2AeCCt9
	 ptZVdeVhmztbDyiy4dWyY2v8weGDrZPvloSjccnKAMEnOk8EXdW9Rq4TULKyGNO4GCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S2PEFlIz;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5996606D80A
	for <linux-mips@vger.kernel.org>; Wed,  4 Nov 2026 05:58:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5996606D80A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S2PEFlIz
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b08a162d4bso278916a91.3
        for <linux-mips@vger.kernel.org>; Tue, 03 Nov 2026 21:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793771939; x=1794376739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cM57o/6Mh+j/504CxrQ254TmuGnm1Pl7GvY1G0ztF3g=;
        b=S2PEFlIzgh2X2Wc5fr8YtTq3cIE0JGCGFsB9fd64iC2Ww1RpV6S/0+NPTQQ49m5Jt4
         ROvi0xEvolfAg6ZHzAn8+RKeJvo9CXzozzdbJhXfVtbDG59rf1fi72DGwybneL8epE7z
         QGw4Q3AvPXGqYe+A2Ly+24bfqezdU/KZX3jBjCto6xuwSjteIyzFraIN6wc/sIWc2Wec
         S3pvn2HR3s/SEZk89XChrKCS1Oid12QawqyjSsdQVmdeouDk2RKFoD9gjgpCnLRNwCvk
         p1p7y95x0RNVciS1oEvsEQC3PAjlIOGtHh3gaAWTNQtyNz2BuGYKxrvmH3keJyTe6kyO
         Crkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793771939; x=1794376739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cM57o/6Mh+j/504CxrQ254TmuGnm1Pl7GvY1G0ztF3g=;
        b=JF8kicEyV++5s3H/9MQtDDtbr7DyUQXyBOpyvwktAr/ms3XXpf3MftbJZILTZHwbCL
         mU2T9qWs/Bdt8VrzGSkQxBbOt+VFiUk7MZ5kgpwlsU+aIR/WrUy3Cuho/DGMmOH4bMNr
         6TW50Mf78xVLJZjccaQ26vF0qzOPYn1dJtNEfTHVkMdfQ+gJfEJ5ityWWiT6GWsroEpj
         8pUaiUz0NhKqP7d2uzCU72XvYoeYAEQvXqt7bmuBX72EwMsq7M2ZOjALDePoHcw8nxZ4
         zuJdYVfjOiSKGHJm5x5U8LrJ3giaBVJhzRYnFLOIhjDmVX8CREaa8FRicCwIkhDuvOpf
         TtkA==
X-Gm-Message-State: APuU4Z9wN7+WIuzjB2Zcqxf6bBcqOPwz++z5Ne9jl7ltfy1PVscULyxP
	kCU3VrfkafT04pxe0neYOQMmPPEw80eihajjoLFROCGYqLCFQMhq2pHHdFtIIQ==
X-Gm-Gg: AYBFou1iGpTaoTge3+N07MhAIzpwZ95ADvzQWeKvp1IBrhJssdu+/ZVckjfjciLFpZV
	Yffh1SZHjxK3nAiq/DIkzljZsqo8Fbt3MEDPYEaMcBa//nHe9ajU17UCaRC1P0xsnogeaEHJEMe
	U58u/PnDz/RJzA/PFtLk/lztK0Q88oKPAI7jumoFjoABYMP+z03x0En7MiFsmiRa5b3kN7uFChT
	l6ptSiI9tQEDRoHjiEIPL2xtXG3i728k24YA/x9S2vXMoBhU30iMLRv2Gwdqu8LdqQKu/1fDTMn
	HjFiVBEECmpi2Cuo7GkUecSbHbBiqe+pAkdGReIpJF3yyuSDoqN1VSPDlubDsojsRP+9pi9/YPm
	GH6jWJ4wvCr3RIn60pt06gasUNVvAV7b13pcCTwH7jndJEnxmCtG282bva5B0urtwRr5s246QG1
	NptHjSkQc923K2KhT3DNxpl4FYGy2UVJcR5YNaW/y8rfQgSErGHe7HIKwHeV9ILP6UO/kJkLt0m
	htlR9T+WN8fo4o26/d7SvpbSb0ODMY8/G4pUvzB9tdqfJrpBb7DdAmuCZpxdqbvwxhjGQipHJk0
	YyEnkUPSlce1DzmNU+d1PI1B/W361NVK1LjTB4iiHf9oAsYDmKz+774WF9IlOOcoefFguc32mXD
	m9rT+C3/txcIe1ep8I2kFGV+apa+BfhPq9lMdqfu2Aro1khQbbCHRkg+blS4baeC+ni0L6VfIqE
	3t2A==
X-Received: by 2002:a17:90b:4b12:b0:3a8:5fd6:cb6 with SMTP id 98e67ed59e1d1-3ae89173bedmr12547083a91.0.1793771939022;
        Tue, 03 Nov 2026 21:58:59 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c9928c4sm7840110a91.15.2026.11.03.21.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 21:58:58 -0800 (PST)
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
Subject: [PATCH 3/8] clk: ath79: move the ath79 clock driver to drivers/clk
Date: Tue,  3 Nov 2026 21:58:47 -0800
Message-ID: <20261104055852.152340-4-rosenp@gmail.com>
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

The ath79 PLL clock code only uses the clk API and its own PLL and SRIF
registers now, so move it from arch/mips/ath79 to drivers/clk, like
the Ralink clocks before it. Copy the register definitions it uses
from asm/mach-ath79/ar71xx_regs.h into the driver, so it no longer
needs the mach headers, and drop the unused ath79.h and common.h.

The driver stays a CLK_OF_DECLARE one, as the MIPS timer needs the CPU
clock from plat_time_init(). COMMON_CLK_ATH79 defaults to ATH79.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 MAINTAINERS                                   |   8 +
 arch/mips/ath79/Makefile                      |   2 +-
 drivers/clk/Kconfig                           |  12 ++
 drivers/clk/Makefile                          |   1 +
 .../ath79/clock.c => drivers/clk/clk-ath79.c  |   6 +-
 drivers/clk/clk-ath79.h                       | 194 ++++++++++++++++++
 6 files changed, 218 insertions(+), 5 deletions(-)
 rename arch/mips/ath79/clock.c => drivers/clk/clk-ath79.c (99%)
 create mode 100644 drivers/clk/clk-ath79.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 46c416cadacd..d1d11bb49875 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4352,6 +4352,14 @@ S:	Supported
 F:	Documentation/devicetree/bindings/rtc/andestech,atcrtc100.yaml
 F:	drivers/rtc/rtc-atcrtc100.c
 
+ATHEROS 71XX/9XXX CLOCK DRIVER
+M:	Alban Bedel <albeu@free.fr>
+M:	Antony Pavlov <antonynpavlov@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/qca,ath79-pll.yaml
+F:	drivers/clk/clk-ath79.*
+F:	include/dt-bindings/clock/ath79-clk.h
+
 ATHEROS 71XX/9XXX GPIO DRIVER
 M:	Alban Bedel <albeu@free.fr>
 S:	Maintained
diff --git a/arch/mips/ath79/Makefile b/arch/mips/ath79/Makefile
index 0fb3aaf42149..5df55b5e1c15 100644
--- a/arch/mips/ath79/Makefile
+++ b/arch/mips/ath79/Makefile
@@ -6,6 +6,6 @@
 # Copyright (C) 2008 Imre Kaloz <kaloz@openwrt.org>
 #
 
-obj-y	:= prom.o setup.o common.o clock.o
+obj-y	:= prom.o setup.o common.o
 
 obj-$(CONFIG_EARLY_PRINTK)		+= early_printk.o
diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 37a8e35d4178..9a3ca7d31c06 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -66,6 +66,18 @@ config COMMON_CLK_APPLE_NCO
 	  found on Apple SoCs such as t8103 (M1). The blocks are typically
 	  generators of audio clocks.
 
+config COMMON_CLK_ATH79
+	bool "Clock driver for Atheros/Qualcomm ath79 SoCs" if COMPILE_TEST
+	depends on ATH79 || COMPILE_TEST
+	depends on OF
+	default ATH79
+	help
+	  Support for the PLL controller of the Atheros/Qualcomm ath79
+	  family of MIPS SoCs: AR71xx, AR724x, AR913x, AR933x, AR934x,
+	  QCA953x, QCA955x and QCA956x. It provides the CPU, DDR, AHB and
+	  MDIO clocks, derived from the board's reference clock. The clocks
+	  are set up early, as the MIPS timer needs the CPU clock.
+
 config COMMON_CLK_MAX77686
 	tristate "Clock driver for Maxim 77620/77686/77802 MFD"
 	depends on MFD_MAX77686 || MFD_MAX77620 || COMPILE_TEST
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 52d138d4ffc8..589d2ef9dc89 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -58,6 +58,7 @@ endif
 # please keep this section sorted lexicographically by file path name
 obj-$(CONFIG_COMMON_CLK_APPLE_NCO)  	+= clk-apple-nco.o
 obj-$(CONFIG_MACH_ASM9260)		+= clk-asm9260.o
+obj-$(CONFIG_COMMON_CLK_ATH79)		+= clk-ath79.o
 obj-$(CONFIG_COMMON_CLK_AXI_CLKGEN)	+= clk-axi-clkgen.o
 obj-$(CONFIG_ARCH_AXXIA)		+= clk-axm5516.o
 obj-$(CONFIG_COMMON_CLK_BD718XX)	+= clk-bd718x7.o
diff --git a/arch/mips/ath79/clock.c b/drivers/clk/clk-ath79.c
similarity index 99%
rename from arch/mips/ath79/clock.c
rename to drivers/clk/clk-ath79.c
index 85f747cf37a8..c5da404c9c48 100644
--- a/arch/mips/ath79/clock.c
+++ b/drivers/clk/clk-ath79.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- *  Atheros AR71XX/AR724X/AR913X common routines
+ *  Atheros/Qualcomm ath79 PLL clocks
  *
  *  Copyright (C) 2010-2011 Jaiganesh Narayanan <jnarayanan@atheros.com>
  *  Copyright (C) 2011 Gabor Juhos <juhosg@openwrt.org>
@@ -21,9 +21,7 @@
 
 #include <asm/div64.h>
 
-#include <asm/mach-ath79/ath79.h>
-#include <asm/mach-ath79/ar71xx_regs.h>
-#include "common.h"
+#include "clk-ath79.h"
 
 static struct clk *clks[ATH79_CLK_END];
 static struct clk_onecell_data clk_data = {
diff --git a/drivers/clk/clk-ath79.h b/drivers/clk/clk-ath79.h
new file mode 100644
index 000000000000..12d7488eb5d2
--- /dev/null
+++ b/drivers/clk/clk-ath79.h
@@ -0,0 +1,194 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Atheros/Qualcomm ath79 PLL and SRIF registers, as in
+ * asm/mach-ath79/ar71xx_regs.h
+ */
+
+#ifndef __CLK_ATH79_H
+#define __CLK_ATH79_H
+
+#include <linux/bits.h>
+
+#define AR71XX_APB_BASE		0x18000000
+#define AR934X_SRIF_BASE	(AR71XX_APB_BASE + 0x00116000)
+#define AR934X_SRIF_SIZE	0x1000
+#define AR71XX_PLL_REG_CPU_CONFIG	0x00
+#define AR71XX_PLL_FB_SHIFT		3
+#define AR71XX_PLL_FB_MASK		0x1f
+#define AR71XX_CPU_DIV_SHIFT		16
+#define AR71XX_CPU_DIV_MASK		0x3
+#define AR71XX_DDR_DIV_SHIFT		18
+#define AR71XX_DDR_DIV_MASK		0x3
+#define AR71XX_AHB_DIV_SHIFT		20
+#define AR71XX_AHB_DIV_MASK		0x7
+#define AR724X_PLL_REG_CPU_CONFIG	0x00
+#define AR724X_PLL_FB_SHIFT		0
+#define AR724X_PLL_FB_MASK		0x3ff
+#define AR724X_PLL_REF_DIV_SHIFT	10
+#define AR724X_PLL_REF_DIV_MASK		0xf
+#define AR724X_AHB_DIV_SHIFT		19
+#define AR724X_AHB_DIV_MASK		0x1
+#define AR724X_DDR_DIV_SHIFT		22
+#define AR724X_DDR_DIV_MASK		0x3
+#define AR933X_PLL_CPU_CONFIG_REG	0x00
+#define AR933X_PLL_CLOCK_CTRL_REG	0x08
+#define AR933X_PLL_CPU_CONFIG_NINT_SHIFT	10
+#define AR933X_PLL_CPU_CONFIG_NINT_MASK		0x3f
+#define AR933X_PLL_CPU_CONFIG_REFDIV_SHIFT	16
+#define AR933X_PLL_CPU_CONFIG_REFDIV_MASK	0x1f
+#define AR933X_PLL_CPU_CONFIG_OUTDIV_SHIFT	23
+#define AR933X_PLL_CPU_CONFIG_OUTDIV_MASK	0x7
+#define AR933X_PLL_CLOCK_CTRL_BYPASS		BIT(2)
+#define AR933X_PLL_CLOCK_CTRL_CPU_DIV_SHIFT	5
+#define AR933X_PLL_CLOCK_CTRL_CPU_DIV_MASK	0x3
+#define AR933X_PLL_CLOCK_CTRL_DDR_DIV_SHIFT	10
+#define AR933X_PLL_CLOCK_CTRL_DDR_DIV_MASK	0x3
+#define AR933X_PLL_CLOCK_CTRL_AHB_DIV_SHIFT	15
+#define AR933X_PLL_CLOCK_CTRL_AHB_DIV_MASK	0x7
+#define AR934X_PLL_CPU_CONFIG_REG		0x00
+#define AR934X_PLL_DDR_CONFIG_REG		0x04
+#define AR934X_PLL_CPU_DDR_CLK_CTRL_REG		0x08
+#define AR934X_PLL_SWITCH_CLOCK_CONTROL_REG	0x24
+#define AR934X_PLL_CPU_CONFIG_NFRAC_SHIFT	0
+#define AR934X_PLL_CPU_CONFIG_NFRAC_MASK	0x3f
+#define AR934X_PLL_CPU_CONFIG_NINT_SHIFT	6
+#define AR934X_PLL_CPU_CONFIG_NINT_MASK		0x3f
+#define AR934X_PLL_CPU_CONFIG_REFDIV_SHIFT	12
+#define AR934X_PLL_CPU_CONFIG_REFDIV_MASK	0x1f
+#define AR934X_PLL_CPU_CONFIG_OUTDIV_SHIFT	19
+#define AR934X_PLL_CPU_CONFIG_OUTDIV_MASK	0x3
+#define AR934X_PLL_DDR_CONFIG_NFRAC_SHIFT	0
+#define AR934X_PLL_DDR_CONFIG_NFRAC_MASK	0x3ff
+#define AR934X_PLL_DDR_CONFIG_NINT_SHIFT	10
+#define AR934X_PLL_DDR_CONFIG_NINT_MASK		0x3f
+#define AR934X_PLL_DDR_CONFIG_REFDIV_SHIFT	16
+#define AR934X_PLL_DDR_CONFIG_REFDIV_MASK	0x1f
+#define AR934X_PLL_DDR_CONFIG_OUTDIV_SHIFT	23
+#define AR934X_PLL_DDR_CONFIG_OUTDIV_MASK	0x7
+#define AR934X_PLL_CPU_DDR_CLK_CTRL_CPU_PLL_BYPASS	BIT(2)
+#define AR934X_PLL_CPU_DDR_CLK_CTRL_DDR_PLL_BYPASS	BIT(3)
+#define AR934X_PLL_CPU_DDR_CLK_CTRL_AHB_PLL_BYPASS	BIT(4)
+#define AR934X_PLL_CPU_DDR_CLK_CTRL_CPU_POST_DIV_SHIFT	5
+#define AR934X_PLL_CPU_DDR_CLK_CTRL_CPU_POST_DIV_MASK	0x1f
+#define AR934X_PLL_CPU_DDR_CLK_CTRL_DDR_POST_DIV_SHIFT	10
+#define AR934X_PLL_CPU_DDR_CLK_CTRL_DDR_POST_DIV_MASK	0x1f
+#define AR934X_PLL_CPU_DDR_CLK_CTRL_AHB_POST_DIV_SHIFT	15
+#define AR934X_PLL_CPU_DDR_CLK_CTRL_AHB_POST_DIV_MASK	0x1f
+#define AR934X_PLL_CPU_DDR_CLK_CTRL_CPUCLK_FROM_CPUPLL	BIT(20)
+#define AR934X_PLL_CPU_DDR_CLK_CTRL_DDRCLK_FROM_DDRPLL	BIT(21)
+#define AR934X_PLL_CPU_DDR_CLK_CTRL_AHBCLK_FROM_DDRPLL	BIT(24)
+#define AR934X_PLL_SWITCH_CLOCK_CONTROL_MDIO_CLK_SEL	BIT(6)
+#define AR934X_PLL_SWITCH_CLOCK_CONTROL_UART1_CLK_SEL	BIT(7)
+#define QCA953X_PLL_CPU_CONFIG_REG		0x00
+#define QCA953X_PLL_DDR_CONFIG_REG		0x04
+#define QCA953X_PLL_CLK_CTRL_REG		0x08
+#define QCA953X_PLL_CPU_CONFIG_NFRAC_SHIFT	0
+#define QCA953X_PLL_CPU_CONFIG_NFRAC_MASK	0x3f
+#define QCA953X_PLL_CPU_CONFIG_NINT_SHIFT	6
+#define QCA953X_PLL_CPU_CONFIG_NINT_MASK	0x3f
+#define QCA953X_PLL_CPU_CONFIG_REFDIV_SHIFT	12
+#define QCA953X_PLL_CPU_CONFIG_REFDIV_MASK	0x1f
+#define QCA953X_PLL_CPU_CONFIG_OUTDIV_SHIFT	19
+#define QCA953X_PLL_CPU_CONFIG_OUTDIV_MASK	0x7
+#define QCA953X_PLL_DDR_CONFIG_NFRAC_SHIFT	0
+#define QCA953X_PLL_DDR_CONFIG_NFRAC_MASK	0x3ff
+#define QCA953X_PLL_DDR_CONFIG_NINT_SHIFT	10
+#define QCA953X_PLL_DDR_CONFIG_NINT_MASK	0x3f
+#define QCA953X_PLL_DDR_CONFIG_REFDIV_SHIFT	16
+#define QCA953X_PLL_DDR_CONFIG_REFDIV_MASK	0x1f
+#define QCA953X_PLL_DDR_CONFIG_OUTDIV_SHIFT	23
+#define QCA953X_PLL_DDR_CONFIG_OUTDIV_MASK	0x7
+#define QCA953X_PLL_CLK_CTRL_CPU_PLL_BYPASS		BIT(2)
+#define QCA953X_PLL_CLK_CTRL_DDR_PLL_BYPASS		BIT(3)
+#define QCA953X_PLL_CLK_CTRL_AHB_PLL_BYPASS		BIT(4)
+#define QCA953X_PLL_CLK_CTRL_CPU_POST_DIV_SHIFT		5
+#define QCA953X_PLL_CLK_CTRL_CPU_POST_DIV_MASK		0x1f
+#define QCA953X_PLL_CLK_CTRL_DDR_POST_DIV_SHIFT		10
+#define QCA953X_PLL_CLK_CTRL_DDR_POST_DIV_MASK		0x1f
+#define QCA953X_PLL_CLK_CTRL_AHB_POST_DIV_SHIFT		15
+#define QCA953X_PLL_CLK_CTRL_AHB_POST_DIV_MASK		0x1f
+#define QCA953X_PLL_CLK_CTRL_CPUCLK_FROM_CPUPLL		BIT(20)
+#define QCA953X_PLL_CLK_CTRL_DDRCLK_FROM_DDRPLL		BIT(21)
+#define QCA953X_PLL_CLK_CTRL_AHBCLK_FROM_DDRPLL		BIT(24)
+#define QCA955X_PLL_CPU_CONFIG_REG		0x00
+#define QCA955X_PLL_DDR_CONFIG_REG		0x04
+#define QCA955X_PLL_CLK_CTRL_REG		0x08
+#define QCA955X_PLL_CPU_CONFIG_NFRAC_SHIFT	0
+#define QCA955X_PLL_CPU_CONFIG_NFRAC_MASK	0x3f
+#define QCA955X_PLL_CPU_CONFIG_NINT_SHIFT	6
+#define QCA955X_PLL_CPU_CONFIG_NINT_MASK	0x3f
+#define QCA955X_PLL_CPU_CONFIG_REFDIV_SHIFT	12
+#define QCA955X_PLL_CPU_CONFIG_REFDIV_MASK	0x1f
+#define QCA955X_PLL_CPU_CONFIG_OUTDIV_SHIFT	19
+#define QCA955X_PLL_CPU_CONFIG_OUTDIV_MASK	0x3
+#define QCA955X_PLL_DDR_CONFIG_NFRAC_SHIFT	0
+#define QCA955X_PLL_DDR_CONFIG_NFRAC_MASK	0x3ff
+#define QCA955X_PLL_DDR_CONFIG_NINT_SHIFT	10
+#define QCA955X_PLL_DDR_CONFIG_NINT_MASK	0x3f
+#define QCA955X_PLL_DDR_CONFIG_REFDIV_SHIFT	16
+#define QCA955X_PLL_DDR_CONFIG_REFDIV_MASK	0x1f
+#define QCA955X_PLL_DDR_CONFIG_OUTDIV_SHIFT	23
+#define QCA955X_PLL_DDR_CONFIG_OUTDIV_MASK	0x7
+#define QCA955X_PLL_CLK_CTRL_CPU_PLL_BYPASS		BIT(2)
+#define QCA955X_PLL_CLK_CTRL_DDR_PLL_BYPASS		BIT(3)
+#define QCA955X_PLL_CLK_CTRL_AHB_PLL_BYPASS		BIT(4)
+#define QCA955X_PLL_CLK_CTRL_CPU_POST_DIV_SHIFT		5
+#define QCA955X_PLL_CLK_CTRL_CPU_POST_DIV_MASK		0x1f
+#define QCA955X_PLL_CLK_CTRL_DDR_POST_DIV_SHIFT		10
+#define QCA955X_PLL_CLK_CTRL_DDR_POST_DIV_MASK		0x1f
+#define QCA955X_PLL_CLK_CTRL_AHB_POST_DIV_SHIFT		15
+#define QCA955X_PLL_CLK_CTRL_AHB_POST_DIV_MASK		0x1f
+#define QCA955X_PLL_CLK_CTRL_CPUCLK_FROM_CPUPLL		BIT(20)
+#define QCA955X_PLL_CLK_CTRL_DDRCLK_FROM_DDRPLL		BIT(21)
+#define QCA955X_PLL_CLK_CTRL_AHBCLK_FROM_DDRPLL		BIT(24)
+#define QCA956X_PLL_CPU_CONFIG_REG			0x00
+#define QCA956X_PLL_CPU_CONFIG1_REG			0x04
+#define QCA956X_PLL_DDR_CONFIG_REG			0x08
+#define QCA956X_PLL_DDR_CONFIG1_REG			0x0c
+#define QCA956X_PLL_CLK_CTRL_REG			0x10
+#define QCA956X_PLL_CPU_CONFIG_REFDIV_SHIFT		12
+#define QCA956X_PLL_CPU_CONFIG_REFDIV_MASK		0x1f
+#define QCA956X_PLL_CPU_CONFIG_OUTDIV_SHIFT		19
+#define QCA956X_PLL_CPU_CONFIG_OUTDIV_MASK		0x7
+#define QCA956X_PLL_CPU_CONFIG1_NFRAC_L_SHIFT		0
+#define QCA956X_PLL_CPU_CONFIG1_NFRAC_L_MASK		0x1f
+#define QCA956X_PLL_CPU_CONFIG1_NFRAC_H_SHIFT		5
+#define QCA956X_PLL_CPU_CONFIG1_NFRAC_H_MASK		0x1fff
+#define QCA956X_PLL_CPU_CONFIG1_NINT_SHIFT		18
+#define QCA956X_PLL_CPU_CONFIG1_NINT_MASK		0x1ff
+#define QCA956X_PLL_DDR_CONFIG_REFDIV_SHIFT		16
+#define QCA956X_PLL_DDR_CONFIG_REFDIV_MASK		0x1f
+#define QCA956X_PLL_DDR_CONFIG_OUTDIV_SHIFT		23
+#define QCA956X_PLL_DDR_CONFIG_OUTDIV_MASK		0x7
+#define QCA956X_PLL_DDR_CONFIG1_NFRAC_L_SHIFT		0
+#define QCA956X_PLL_DDR_CONFIG1_NFRAC_L_MASK		0x1f
+#define QCA956X_PLL_DDR_CONFIG1_NFRAC_H_SHIFT		5
+#define QCA956X_PLL_DDR_CONFIG1_NFRAC_H_MASK		0x1fff
+#define QCA956X_PLL_DDR_CONFIG1_NINT_SHIFT		18
+#define QCA956X_PLL_DDR_CONFIG1_NINT_MASK		0x1ff
+#define QCA956X_PLL_CLK_CTRL_CPU_PLL_BYPASS		BIT(2)
+#define QCA956X_PLL_CLK_CTRL_DDR_PLL_BYPASS		BIT(3)
+#define QCA956X_PLL_CLK_CTRL_AHB_PLL_BYPASS		BIT(4)
+#define QCA956X_PLL_CLK_CTRL_CPU_POST_DIV_SHIFT		5
+#define QCA956X_PLL_CLK_CTRL_CPU_POST_DIV_MASK		0x1f
+#define QCA956X_PLL_CLK_CTRL_DDR_POST_DIV_SHIFT		10
+#define QCA956X_PLL_CLK_CTRL_DDR_POST_DIV_MASK		0x1f
+#define QCA956X_PLL_CLK_CTRL_AHB_POST_DIV_SHIFT		15
+#define QCA956X_PLL_CLK_CTRL_AHB_POST_DIV_MASK		0x1f
+#define QCA956X_PLL_CLK_CTRL_CPU_DDRCLK_FROM_DDRPLL	BIT(20)
+#define QCA956X_PLL_CLK_CTRL_CPU_DDRCLK_FROM_CPUPLL	BIT(21)
+#define QCA956X_PLL_CLK_CTRL_AHBCLK_FROM_DDRPLL		BIT(24)
+#define AR934X_SRIF_CPU_DPLL1_REG	0x1c0
+#define AR934X_SRIF_CPU_DPLL2_REG	0x1c4
+#define AR934X_SRIF_DDR_DPLL1_REG	0x240
+#define AR934X_SRIF_DDR_DPLL2_REG	0x244
+#define AR934X_SRIF_DPLL1_REFDIV_SHIFT	27
+#define AR934X_SRIF_DPLL1_REFDIV_MASK	0x1f
+#define AR934X_SRIF_DPLL1_NINT_SHIFT	18
+#define AR934X_SRIF_DPLL1_NINT_MASK	0x1ff
+#define AR934X_SRIF_DPLL1_NFRAC_MASK	0x0003ffff
+#define AR934X_SRIF_DPLL2_LOCAL_PLL	BIT(30)
+#define AR934X_SRIF_DPLL2_OUTDIV_SHIFT	13
+#define AR934X_SRIF_DPLL2_OUTDIV_MASK	0x7
+
+#endif /* __CLK_ATH79_H */
-- 
2.56.0

