Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793776624;
	b=VZZYvrXxzBuQmMwH8A53UTOKY/otMQbU811WfZ5Vhbd9pqylQKbMZ0aR/ZP3C/SNj2Ai
	 XjuMy/xAUKgFh8ZhHceP1YGf3FBhLNI2MFtxLwpy85KU+YruE/0exPZZLlIpH3zIPVMyO
	 jBxEBUvcC9kO4rAs0Mc8bD1kEzis1EyYxBBTitawp1ShS4noglbU20farauBFq6EJ3hGS
	 fRBBRr0l++HWfGNFo4xXB+WiTbiTLb1+5VvVgaG6Qqh7eiLdtcNrf29OpfEvYqK3vToBd
	 sNb7El6daThLkSCUxn71px06RMUEttE70V6KkAwZkGf9w9k9lTDZBsQhAxIZ7nzUs+A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776624;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=dRK7Qsok7oSSE3g5evF3oXVO+WxMXsP/7zQJqQJec2M=;
	b=AKaiB8cZgENDM916Edia0zCRJBxhQwNeh34kwRfhtHYPS743/9DwgSZcFFhXzRO0/wls
	 LfWJhtLGdXCSN6R/GQkV3+KdSsvapJXpAx70RtGCGi0PtCM0IpAbv6hzgqiJXaPII6J9A
	 hFblJWO+cEAvjKqUrxReDLuSJLQ0VMJXYXuwoyYwwckaZirayUS2u9RhsBKqaFrSRZflY
	 C28uwsWswKlZEylf5+Ey7EKcGWnHgyAvrJYodgIVgZk+CDrQkCBqFR4mZoAYc262kJSUj
	 nwo+bYv0s3+fJS3LXb4ACG1sJJEmJOCbDiKCi7eCOT8crmG+WpBdDlwXQyrwutykj7g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ci02lN8C;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D3B606A330;
	Wed,  4 Nov 2026 07:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ci02lN8C
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793776623;
	b=EfJe65fWAFbp3tZhfuR0PVdb7qQ8p+fNeghUhIAZjI01SLyska1Ri7Cm6aLO9nYC8tcr
	 zNT02nxfV2Zn+0QIpeah+nU24Ef0GOOEqIRmKIgFkALJI+PGpZ7MbQoChma7d/DDfxNbA
	 Z1gIM0tEUSZgU3AwYP2+mQSmmoG7FV6g4W05gSgZL0urpOQwOa0fePwnvu7WC4nc97z9d
	 k3hg3PscS4Ry4Zm0hzy7Cm9A/uEgqJL2xyc2nox1LmSS4+WinlxngyBX6tKfyfHZzstnl
	 oWQwz53ocISfU4k96g9A2Zi4yJwvoYgsSGnOzvNcBF0srsV9PTHSVFsEeNyu3WPsHBg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793776623;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=dRK7Qsok7oSSE3g5evF3oXVO+WxMXsP/7zQJqQJec2M=;
	b=mQSsHWwtVCC7w/p1JsyzD9KJ6cR4wUzP1tuLTFdAqQoMVceMuU+Zqajz00EWAIWnCR6u
	 ZUrtnjxxi4uEjIS1EZU0saFcOEZKO+wV2l1Z6W1QJgUPzpDyEosLiGCWYh9QBBmuginMk
	 yq8Ta1s7MWSQRhgZKaldnS/NaWbyQ6UyoUni7lLY3aNz/sArg9BvU9HNQVLEJGfJRGD+g
	 O20tumsAVCVwTGk+MYwHa1v3QmD4cyt1HFu05OF4HLix2g6oJEIc4JRmI9Fcy4nfF39ku
	 EP5GY2O6gPncVXQ2mFtAgUqgUJqHc1sMpa91hJSm+EIJE3m5xJ5z2Xu7WPPoQUXZBWw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 915981F0093A;
	Wed,  4 Nov 2026 07:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793776623;
	bh=dRK7Qsok7oSSE3g5evF3oXVO+WxMXsP/7zQJqQJec2M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ci02lN8CjWLqCSzU65a3EDMgowLK2TNj4x53Y6O2A/SD6KqysSmv7zR5BCBopBbaZ
	 y8CuB+F04bRGqVqF3actZAP/ukjqLJfmzafD5yu7O3uPxiD1hdQA2Zb64WYMGVaxed
	 oPqG5dSNVdvFk2K5hQQof6qfEEckUV/cgiFu//Mw/E/kTHoieGunUgRUW6KIOMW+fZ
	 1LFTa+5p/xvzv2s4f8ppkuCOQiIZBXVqivnlkot9Sw61g8IheHK4vZtO7Ji+OUs0GY
	 rRukY2b258W8QP5qsiBd6vWHFcK6eUsvgm/Sp3LVYoMs3KxoN4U54xP0TSffPuDvTg
	 xmtjk5k6kGNow==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2763346CE5;
	Wed,  4 Nov 2026 07:17:01 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Wed, 04 Nov 2026 02:16:54 -0500
Subject: [PATCH 2/4] MIPS: Add support for Siflower MIPS SoCs
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
Message-Id: <20261104-sf19a2890-mips-v1-2-eae80820af68@telaak.dev>
References: <20261104-sf19a2890-mips-v1-0-eae80820af68@telaak.dev>
In-Reply-To: <20261104-sf19a2890-mips-v1-0-eae80820af68@telaak.dev>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Burton <paulburton@kernel.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Chuanhong Guo <gch981213@gmail.com>, linux-mips@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793776620; l=3748;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=RDjzO8sQ+osuE/RFFqce+hfkTOcOO0LUeslp1Icc2Hs=;
 b=DjOwpjwlPYsPz01Y25xSTh2FR1v2Nr9UW16QqF75Kn5eA4eBshdinwGRfF306yNc87Tz26QGn
 Oss1t8sGDr0AS2T/hSRcwdL5g9d3/xkOQg9WV+lpUToOAiFUkgHkzXS
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
[jt: rebased on v7.4-rc1, "MIPS:" prefix, longer Kconfig help, commit
 message grammar and paragraphs, MAINTAINERS line]
Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 MAINTAINERS                                   |  1 +
 arch/mips/Kconfig                             | 32 +++++++++++++++++++++++++++
 arch/mips/generic/Platform                    |  1 +
 arch/mips/include/asm/mach-siflower/kmalloc.h |  9 ++++++++
 4 files changed, 43 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2a7a083f2..9e715a168 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25703,6 +25703,7 @@ M:	Joseph Telaak <joseph@telaak.dev>
 L:	linux-mips@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/mips/siflower.yaml
+F:	arch/mips/include/asm/mach-siflower/
 F:	drivers/gpio/gpio-siflower.c
 N:	sf19a2890
 
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index ed17c9b16..e10145ede 100644
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
index 0c03623f3..c09a8484d 100644
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
index 000000000..d0b270e2e
--- /dev/null
+++ b/arch/mips/include/asm/mach-siflower/kmalloc.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
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


