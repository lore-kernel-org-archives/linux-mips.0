Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794385655;
	b=kGBDKuaoxEBr5BVN7ALxHRH4Z3749Q4KeMOJIEIR9uBGbfZfyzpxXmuBaufa0PHKARG+
	 7MMfXxk1QAgEX8qullv9KsFoE8/Tfs+gtRS4SWQ+4DA2BDde7BrpKQl0uOx8Vil//XQrh
	 00Qd6ABmgiROxvQm2gaNzMcVJxqK/DW6ERt84oT6EMJw62598EjTI1OJKt28JW/vK4RYw
	 2x6dJV+hLqzWzW0ul+vcYKlU7PjW1GcLjc4X+9CqadoOmzVOxsiA76qCSre3SJpQMHG7a
	 lFVw+G19P7g2syQmuHKBdqgco+2+RYccugthXqe/+SokB6KLUJmyXcKXOq4g/UAyrKg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794385655;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=ueEdkK7fzIDeFkftjgKCuJR0PXqv9Mw6Go7HJxAv2OA=;
	b=l5vc9rbLwil0pt3gzxZNAxkEhDEsr7ejD1nEVucKfJHIMYNwbu+iPmqmtNwu9RwrYhrH
	 sAR3wtq57pUxohy+gu925jI9YT0C7dlCdstf+irN8lf44ndXj0EKZ3LEi2MCeaCBJbLl0
	 crx6/gZWCSJan9/2QLpXm6MKLyFokGefw5+nzpOd7+IT+w42LV4d7bE98p3til+z+P3DG
	 ciLO6y5RcvlOdgEvTJ2phhvhTav1v/sOajkmZ3D0W+YyrpOIjMtwVIvI59U8oNCZfowuK
	 q3xZdGhYy243lUySSLHAxH1qsN/nGgzfY8BlgJzVTk1YFKSpBOej/kbA+Uw3HApq8SA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AsvHjJkv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CB860A260E;
	Wed, 11 Nov 2026 08:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AsvHjJkv
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794385655;
	b=T73WVWNgbxbAlwm7H6XwJnxD901kYHS1DOI6W3MVF1XI7X+prT1WMWcBGtbCAbelKDmL
	 UiYkHucTBUo+waOqhXh63274Z9K69uE5J0tUnHf6SHkCe8goex2FXuC6j1vgBwpz/wF6b
	 zSwImR5rJToUISBH8LsKK+xtG8xr5yKgrR5m+S4JVAZ7NY9MzMlz/YNjKeSbfltzff2Jt
	 wxxE83JX3Uu97gnenId19KwU4TMUs9P/+xzntxgQsm9p+xNwqBL8xgT3L7mcvqWOvtWaM
	 Dt19MIxAS3EzZsHr1OnJCbV1JFVNUtPEIk9UykzaY0l6Sn2omsPCNi9EWYc/+0Y91pw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794385655;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=ueEdkK7fzIDeFkftjgKCuJR0PXqv9Mw6Go7HJxAv2OA=;
	b=a3qawPlVE0JeGtB4eQMYxBRO+J5PHrWMjdLfh02LLpPbDPedKQxGPE98CHH6OgVh6j71
	 tumXkp4x688Rd9fJaYmk8iK+AV3cw3xSrhgFrqySkvwtREXI+46e437IEO/rfQMe35/wl
	 EF2boH79rpKBkwWBApgGDF7U9wQzIAjsMluYtTYXvbOMY9YOn82bKyIdeq9IpSwFuwnPo
	 L0xJW+RlfkuCVRIq1XVH9jmevcoxqADc1KN6qkw8ZiE52Sb7XHAdFHlshpv8un+kTan36
	 hFEVOaqWf6OvAM38kfP7gLzfNlXYq8/c3u6K2FMHsned4Rq/G7YabF+nhsE9nlIDIEg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 82D111F00A0D;
	Wed, 11 Nov 2026 08:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794385655;
	bh=ueEdkK7fzIDeFkftjgKCuJR0PXqv9Mw6Go7HJxAv2OA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=AsvHjJkv+yYLCOTUnw5k07guSJblHeX9raFclcrVmqiIsm9HyfKj1K7KqhFaOiOc9
	 I62IUEPMEbTV/LLVE4Ko6d/8B57My+NH6i1ftJL5wN9/Uf4gM7Uv00DMwHk7HGElUn
	 GOrBpc+p04K37gSvezwCt1UtSNIUXRm0z4noy2iBqkB1Ztgxbn4CAU313anZ2mcNGJ
	 3z7DJpHex8JbwdBVoxcDyMx5ocyBUW3ofvVMAC1CGEnmQ/omBALApAJw0ewhz0MBxh
	 DPNPNzjQdCDLsu52p9Kz5h1mGIDv9ZmIGDEaQTd40d9hyNrzIJWn4b28TVedbccsjo
	 noCWq1JkZCR5w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 112B448EA0;
	Wed, 11 Nov 2026 08:27:33 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Wed, 11 Nov 2026 03:27:16 -0500
Subject: [PATCH v2 2/4] MIPS: Add support for Siflower MIPS SoCs
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-sf19a2890-mips-v2-2-36730fa4f5a6@telaak.dev>
References: <20261111-sf19a2890-mips-v2-0-36730fa4f5a6@telaak.dev>
In-Reply-To: <20261111-sf19a2890-mips-v2-0-36730fa4f5a6@telaak.dev>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Burton <paulburton@kernel.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Chuanhong Guo <gch981213@gmail.com>, linux-mips@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794385652; l=3816;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=wnzU2y+51Y59diDo1d1YCBVcHHZDV13wYVJ1UVmmyT4=;
 b=ZlLoFH1VAThXFyX5eFumPiVNJDYcx3UgyyFMrJzhHoiYRzoJltOTap5irfsZaf+VBDeIzylXX
 L5ekLFHGbnDD0VGziuhbvu7UzvCo8/pyjB8joCVNjpthoEqzH7dQMpN
X-Developer-Key: i=joseph@telaak.dev; a=ed25519;
 pk=oQI+UfddlZ0wK2ac4WKOGNjUl1ZEN8j9ZVFSqEDoNP0=
X-Endpoint-Received: by B4 Relay for joseph@telaak.dev/20261104 with
 auth_id=1404
X-Original-From: Joseph Telaak <joseph@telaak.dev>
Reply-To: joseph@telaak.dev

From: Chuanhong Guo <gch981213@gmail.com>

Siflower MIPS SoCs like SF19A2890 use a dual-core MIPS InterAptiv
processor, built-in GMAC, USB, dual-band WiFi and various other
peripherals.

Notably, they use some ARM PLxxx peripherals, and ARM_AMBA is
selected for the drivers.

Most devices on the market with this chip come with 64M or less
DRAM. A kmalloc.h with malloc alignment override is added to
conserve memory, and a MACH_SIFLOWER_MIPS is created with reduced
features instead of using the generic kernel.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
[Joseph Telaak:
  - rebase on v7.4-rc1 and use the "MIPS:" prefix
  - longer Kconfig help
  - commit message grammar and paragraphs
  - add the MAINTAINERS entry]
Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 MAINTAINERS                                   |  1 +
 arch/mips/Kconfig                             | 32 +++++++++++++++++++++++++++
 arch/mips/generic/Platform                    |  1 +
 arch/mips/include/asm/mach-siflower/kmalloc.h |  9 ++++++++
 4 files changed, 43 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7fb18c2d6959..3aa80a8dd785 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25703,6 +25703,7 @@ M:	Joseph Telaak <joseph@telaak.dev>
 L:	linux-mips@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/mips/siflower.yaml
+F:	arch/mips/include/asm/mach-siflower/
 N:	sf19a2890
 
 SILEAD TOUCHSCREEN DRIVER
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index ed17c9b1624c..e10145edeb53 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -937,6 +937,38 @@ config SIBYTE_BIGSUR
 	select ZONE_DMA32 if 64BIT
 	select SWIOTLB if ARCH_DMA_ADDR_T_64BIT && PCI
 
+config MACH_SIFLOWER_MIPS
+	bool "Siflower MIPS SoCs"
+	select MIPS_GENERIC
+	select MACH_GENERIC_CORE
+	select ARM_AMBA
+	select BOOT_RAW
+	select CEVT_R4K
+	select CLKSRC_MIPS_GIC
+	select COMMON_CLK
+	select CPU_MIPSR2_IRQ_EI
+	select CPU_MIPSR2_IRQ_VI
+	select CSRC_R4K
+	select DMA_NONCOHERENT
+	select IRQ_MIPS_CPU
+	select MIPS_CPU_SCACHE
+	select MIPS_GIC
+	select MIPS_L1_CACHE_SHIFT_5
+	select NO_EXCEPT_FILL
+	select SMP_UP if SMP
+	select SYS_HAS_CPU_MIPS32_R2
+	select SYS_SUPPORTS_32BIT_KERNEL
+	select SYS_SUPPORTS_LITTLE_ENDIAN
+	select SYS_SUPPORTS_MIPS16
+	select SYS_SUPPORTS_MIPS_CPS
+	select SYS_SUPPORTS_MULTITHREADING
+	select USE_OF
+	help
+	  Select this to build a kernel which supports SoCs from Siflower
+	  with MIPS InterAptiv cores, like Siflower SF19A2890. These have
+	  ARM PrimeCell peripherals, so ARM_AMBA is selected, and 32-byte
+	  cache lines, which allows a smaller kmalloc alignment.
+
 config SNI_RM
 	bool "SNI RM200/300/400"
 	select ARC_MEMORY
diff --git a/arch/mips/generic/Platform b/arch/mips/generic/Platform
index 0c03623f3897..c09a8484db9b 100644
--- a/arch/mips/generic/Platform
+++ b/arch/mips/generic/Platform
@@ -10,6 +10,7 @@
 
 # Note: order matters, keep the asm/mach-generic include last.
 cflags-$(CONFIG_MACH_INGENIC_SOC)	+= -I$(srctree)/arch/mips/include/asm/mach-ingenic
+cflags-$(CONFIG_MACH_SIFLOWER_MIPS)	+= -I$(srctree)/arch/mips/include/asm/mach-siflower
 cflags-$(CONFIG_MIPS_GENERIC)	+= -I$(srctree)/arch/mips/include/asm/mach-generic
 
 load-$(CONFIG_MIPS_GENERIC)	+= 0xffffffff80100000
diff --git a/arch/mips/include/asm/mach-siflower/kmalloc.h b/arch/mips/include/asm/mach-siflower/kmalloc.h
new file mode 100644
index 000000000000..0887ae3575d7
--- /dev/null
+++ b/arch/mips/include/asm/mach-siflower/kmalloc.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_MACH_SIFLOWER_KMALLOC_H
+#define __ASM_MACH_SIFLOWER_KMALLOC_H
+
+#ifdef CONFIG_DMA_NONCOHERENT
+#define ARCH_DMA_MINALIGN	32
+#endif
+
+#endif /* __ASM_MACH_SIFLOWER_KMALLOC_H */

-- 
Git-155)


