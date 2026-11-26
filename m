Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795720902;
	b=GvmCaUnRM21aY3DBjWLxyGZokIiAFNYtbLvAELAMTGvG/9vJmID0gcNo179hggdrrkkR
	 DLzSzaNdupqNXYEwEECsVTb06Pl1fb76Q9wwZiWyEfW7FwyFJyXm1DMQW8fRK+YdeZvK0
	 T+6NrLcVT/5rIw2phUrjXpIo5wA6970KSwCN0NmujBRu/Da11yOybmegMtoqFdLq7ePy7
	 1/DYgBqcNiV5Vz+TNWzYWNAm5V4x/4TZ9VnPdr/BCHMfnmaBFvPj/ayC4XM6GNWpN45FY
	 CImWr97yop402eTZdDkN0Zhl7ydM7fjq+mKcxVyMXUnTiOrlOFHIzBrXlpNhFDVmMEw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795720902;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=p0S9F4LIxQujZ3St8lMsBEBWLRaUd0jAUlDzWizR1eQ=;
	b=EGK2ePZiBAs9G8M15Hd5nq3PXcHcBaAwgZgk1EWgpwr13TocUy0oz7zlsUoHO67EMdSv
	 z3uVOxb+bqXyd6Bjv9aqX2lM9vhX9rWHuEhp5nBMCL0tvXH/fMtz3THf2PkNm0rpeae1l
	 oFtRU61mF66tJVVkhS9Uq0Uv5/100MyusYN8sTnm6NFumFAVTELllDCakm0LgH19c4y/c
	 r9o//pzUm97lgQy5vQl5ENVJiYEI4Gn5JR6cLGabUUDbpGLqpaD+UpZL+hhNReDFtQgM8
	 Q2PBt336HoDg1v6qedGAa/a7pHX1KWGy2sij4KK9knx7YFAjYO2j1+Th63sBVqMSzvw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="d9LVIs/y";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71812606A31E;
	Thu, 26 Nov 2026 19:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d9LVIs/y
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795720901;
	b=HDwwXChJikvva2Yi9ts9ZXEDhOcf17u6xZ2qIHPPk/BT4+CiPhehE1uzD3bB9gT37ERx
	 LbJ+yvqJbGHeY+Bi5xbWE1gbZRMrOt6SuH0TnQHvGl2Izr4Ccr74FGwjCPSEF2TMy6/ro
	 n675Fh+0jdJ9+h2qTO6Brgbz0zeCZcilZmmyOnLdf8rz9hi60ynuNad7XwzRa4a/yyELu
	 nUAgrOoMgRim2E9EVZOLOHcAdh01LL676FJTqXAwEzW0hPMkq/gJHWkcmH8ctXMus/Imi
	 cesmFZXs3ifU3838WSwFqf6/UofoZVKNdbhMR8zoTYUFwUsGxVaEWf3t8xLHzJuK5aQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795720901;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=p0S9F4LIxQujZ3St8lMsBEBWLRaUd0jAUlDzWizR1eQ=;
	b=St/cz+2kU2EWOu/VKm4tocGc4TYSBmu+WDwHk/lmrA25zjpsB+9+j9FtnSypL3DzBxY7
	 FV1eDB2LHTl4knOLfyNZPolM68gzInWvCgXf4knTqXqtnaOgeYNN60DEy0Pps3ABwJViC
	 iSTjfD6xnhDUYFKtpwilDYU+kAE0aikiGQPMCjhQD+N/9+f6On/8qye7w3i3DrsJh8q7A
	 WgqM942qNtoEsJqFRWvyw8jsPW47iOpQ0H313lql976Jw7mFSMGieNY1OY46G46sjkQYa
	 t9Uj5MWnDnCUQQcPRUMZaIjiCE+NrXsGcPICsSnVBB0B0gnSKnkaq4xjSSf4P8lPbEg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4E5A41F000C4;
	Thu, 26 Nov 2026 19:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795720901;
	bh=p0S9F4LIxQujZ3St8lMsBEBWLRaUd0jAUlDzWizR1eQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=d9LVIs/yfNE+B8z6BWO/go8QjIt4vvM4I5qQxTGD6FroX0PDMm5c5kVfOp1u8zTlF
	 45wOvf00qdz5xrmTce/flBTPxdmA8JvIDukykyLYfz66EwJ1H9oiKKCn5z9Rg+837e
	 CqLMJqbfMrCgzx9gPPmKcUyccirNjh3/CIjJ3fXRbdHDFUcOnSMLbyJFU2AnO8V4sb
	 snUdnqBJ+Ws0jVQaRU49io7iX7VlBOgMpgHS+Wo516fw0GjlI6M9TI9al4Zvuf6nkm
	 LA+fWADe3vnmBsgc6We2rMgaVnen+Pl/jZvFRYzGoIzXtkqmHG0muKEAVdi2iWujwW
	 Y3fZZfA6FA4yw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C8A1E4D7A0;
	Thu, 26 Nov 2026 19:21:31 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Thu, 26 Nov 2026 14:21:29 -0500
Subject: [PATCH v3 1/5] MIPS: Add support for Siflower MIPS SoCs
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
Message-Id: <20261126-sf19a2890-mips-v3-1-1f808d38ab37@telaak.dev>
References: <20261126-sf19a2890-mips-v3-0-1f808d38ab37@telaak.dev>
In-Reply-To: <20261126-sf19a2890-mips-v3-0-1f808d38ab37@telaak.dev>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Burton <paulburton@kernel.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Chuanhong Guo <gch981213@gmail.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, linux-mips@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795720890; l=2176;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=ziqqvVYU3GmZibawv8t72n+ZZ3zc07HtvebkWxBkx+8=;
 b=e3a0UFJ9Jt3B2ozl7AUcbIBFFgzu612gR9SV6e9RsIlujh9PrqBmZvHAAhP5Ka35GAGjFegsp
 hXGHBK7yK5/BTw2vSgDIlY3gvA8IBtgCLGNBWj7bmCnHrR9+OQDEdMC
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
DRAM, so a MACH_SIFLOWER_MIPS is created with reduced features
instead of using the generic kernel.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
[Joseph Telaak:
  - rebase on v7.4-rc1 and use the "MIPS:" prefix
  - longer Kconfig help
  - commit message grammar and paragraphs
  - move the kmalloc.h override to a patch of its own]
Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 arch/mips/Kconfig | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index ed17c9b1624c..549bc7d13dd9 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -937,6 +937,39 @@ config SIBYTE_BIGSUR
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
+	  ARM PrimeCell peripherals, so ARM_AMBA is selected. Most boards
+	  with them have 64M of DRAM or less, so this kernel leaves out the
+	  generic kernel's support for other boards.
+
 config SNI_RM
 	bool "SNI RM200/300/400"
 	select ARC_MEMORY

-- 
Git-155)


