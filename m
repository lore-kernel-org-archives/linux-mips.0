Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58AE93EBF37;
	Mon,  2 Feb 2026 04:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770008026; cv=pass; b=fCglLxC8ZYXeQ3w2vzNTggKw37U37uqW9Ca1Wej9LzKotJtW1uge8mA3tbAK0rNjJxtIZvDeV4Y/5osTnogDjFKKcqWcNKMYaj8mcgJOWMlBG5w7dxL47m9cpZxvIUOYIoqHA1qe6T5Eb5DFTFqqzn68vLJtZjoXoo3XwpJaZhc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770008026; c=relaxed/simple;
	bh=j08+JI70vboixkBP6niNigWpHIwkjbcP5kzsx2isvuU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iTkx9ACoCOll2svOnW6k3ji2fXM1xREp8BUsxmI+hom5MO+7hz/3cBqLTdA2apVwaW1kbjDTdj081VFO1b1DBfuPgEDhFuIyxcNXkwzkt1n0/Bn1Y5a+e05qEkp9WzNlCk1k09aHLXYWrX463rwvcj/WepO6Ltl2Tw9RwxI7V+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc; spf=pass smtp.mailfrom=ziyao.cc; dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b=kMfEqRNz; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b="kMfEqRNz"
ARC-Seal: i=1; a=rsa-sha256; t=1770008014; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MNbEsIuUH8MODNdDW8agwYUfQrmYe6Rm425aOiR//Qm5KKnJLLPBtAWoI77TL1XondjhlD9C3QnEr/hJWFUfkC6T1J6gocyrohu+/IFDy0yQxteNB1hhYD+EeUx7r4I5iC5obay8tAs3m3AU2oyZSOuQykjBBEVL3aoryJFA5OU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770008014; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=R0PU0yN15ZrIX/RZ2BCnH2c6B51Ycp0m0qECho6cmdQ=; 
	b=BPoqcLv/lmAVS913unFEKPacdL9efr/k82MMP3AAYg56feYoX7bFJw4N0FR3Ge6PLrxQJpeeb7rcW7xoegnq/HsxAQxsLTDriMs6L6JTnOIDB9DRkzrD5lV8AW4eIC3izrk0Fm9TEmWMc6CgafJruuN3vvu9wKhPkQylteA9cl4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770008014;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=R0PU0yN15ZrIX/RZ2BCnH2c6B51Ycp0m0qECho6cmdQ=;
	b=kMfEqRNzgMeYIA89dURmIku4xqZyIeKoo2k6rV9Tpdlno2vDjANEwCR8bSijrmJ4
	upn/tsxoIjQM7G76WZgkuEbayeX+QRVRPnv2eCaBWLR17ICFWFHn0RZKmUXkknQJkLb
	eojSJnlL66/ipvyrESEnEFX9jR5Ynj5tTV5hNQ9I=
Received: by mx.zohomail.com with SMTPS id 1770008011546176.7331213469564;
	Sun, 1 Feb 2026 20:53:31 -0800 (PST)
From: Yao Zi <me@ziyao.cc>
To: Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yao Zi <me@ziyao.cc>
Subject: [PATCH] MIPS: Loongson64: env: Fixup serial clock-frequency when using LEFI
Date: Mon,  2 Feb 2026 04:53:22 +0000
Message-ID: <20260202045322.64105-1-me@ziyao.cc>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

When booting from LEFI firmware, the devicetree is chosen by matching
bridge type and CPU PRID. However, serials on Loongson devices may not
have the same clock frequency across different boards. For example,
CPU UARTs found on Loongson 3A4000 is supplied by the system clock,
which may be either 25MHz or 100MHz.

Luckily, LEFI firmware interface provides information about UART
address and corresponding clock frequency. Let's fixup clock-frequency
properties for serials after FDT selection by matching FDT nodes with
addresses provided by firmware.

Signed-off-by: Yao Zi <me@ziyao.cc>
---

This is tested on LS3A4000_7A1000_NUC_BOARD_V2.1, which utilizes a 25MHz
oscillator as system clock input. Without the patch, serial output is
completely broken after kernel initialization.

 arch/mips/loongson64/env.c | 98 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/arch/mips/loongson64/env.c b/arch/mips/loongson64/env.c
index be8d2ad10750..11ddf02d6a15 100644
--- a/arch/mips/loongson64/env.c
+++ b/arch/mips/loongson64/env.c
@@ -16,6 +16,7 @@
 
 #include <linux/dma-map-ops.h>
 #include <linux/export.h>
+#include <linux/libfdt.h>
 #include <linux/pci_ids.h>
 #include <linux/string_choices.h>
 #include <asm/bootinfo.h>
@@ -57,6 +58,101 @@ void __init prom_dtb_init_env(void)
 		loongson_fdt_blob = (void *)fw_arg2;
 }
 
+static int __init lefi_fixup_fdt_serial(void *fdt, u64 uart_addr, u32 uart_clk)
+{
+	int node, len, depth = -1;
+	const fdt64_t *reg;
+	fdt32_t *clk;
+
+	for (node = fdt_next_node(fdt, -1, &depth);
+	     node >= 0 && depth >= 0;
+	     node = fdt_next_node(fdt, node, &depth)) {
+		reg = fdt_getprop(fdt, node, "reg", &len);
+		if (!reg || len <= 8 || fdt64_ld(reg) != uart_addr)
+			continue;
+
+		clk = fdt_getprop_w(fdt, node, "clock-frequency", &len);
+		if (!clk) {
+			pr_warn("UART 0x%llx misses clock-frequency property\n",
+				uart_addr);
+			return -ENOENT;
+		} else if (len != 4) {
+			pr_warn("UART 0x%llx has invalid clock-frequency property\n",
+				uart_addr);
+			return -EINVAL;
+		}
+
+		fdt32_st(clk, uart_clk);
+
+		return 0;
+	}
+
+	return -ENODEV;
+}
+
+static void __init lefi_fixup_fdt(struct system_loongson *system)
+{
+	static unsigned char fdt_buf[16 << 10] __initdata;
+	struct uart_device *uartdev;
+	bool is_loongson64g;
+	u64 uart_base;
+	int ret, i;
+
+	ret = fdt_open_into(loongson_fdt_blob, fdt_buf, sizeof(fdt_buf));
+	if (ret) {
+		pr_err("Failed to open FDT to fix up\n");
+		return;
+	}
+
+	is_loongson64g = (read_c0_prid() & PRID_IMP_MASK) == PRID_IMP_LOONGSON_64G;
+
+	for (i = 0; i < system->nr_uarts; i++) {
+		uartdev = &system->uarts[i];
+
+		ret = lefi_fixup_fdt_serial(fdt_buf, uartdev->uart_base,
+					    uartdev->uartclk);
+		/*
+		 * LOONGSON64G's CPU serials are mapped to two different
+		 * addresses, one full-featured but differs from
+		 * previous generations, one fully compatible with them.
+		 *
+		 * It's unspecified that which mapping should uart_base refer
+		 * to, thus we should try fixing up with both.
+		 */
+		if (ret == -ENODEV && is_loongson64g) {
+			switch (uartdev->uart_base) {
+			case 0x1fe00100:
+				uart_base = 0x1fe001e0;
+				break;
+			case 0x1fe00110:
+				uart_base = 0x1fe001e8;
+				break;
+			case 0x1fe001e0:
+				uart_base = 0x1fe00100;
+				break;
+			case 0x1fe001e8:
+				uart_base = 0x1fe00110;
+				break;
+			default:
+				pr_err("Unexpected UART address 0x%llx passed by firmware\n",
+				       uartdev->uart_base);
+				ret = -EINVAL;
+				goto err_fixup;
+			}
+
+			ret = lefi_fixup_fdt_serial(fdt_buf, uart_base,
+						    uartdev->uartclk);
+		}
+
+err_fixup:
+		if (ret)
+			pr_err("Couldn't fix up FDT node for UART 0x%llx\n",
+			       uartdev->uart_base);
+	}
+
+	loongson_fdt_blob = fdt_buf;
+}
+
 void __init prom_lefi_init_env(void)
 {
 	struct boot_params *boot_p;
@@ -237,4 +333,6 @@ void __init prom_lefi_init_env(void)
 
 	if (!loongson_fdt_blob)
 		pr_err("Failed to determine built-in Loongson64 dtb\n");
+	else
+		lefi_fixup_fdt(esys);
 }
-- 
2.52.0

