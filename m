Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795720904;
	b=zMA0T3rJv4hYcCMlw1jFVmvyVqR5g2aDlPEkQ/S8lwNGWxB6t1o+ywUmDJNsfB/Vo0zp
	 zdpZiNdQNzcgpvIb7leG4HneaZ6t13r0JXocAEUtmbwTrOPwzYQGx/CV2j9Y1o2Yy+esO
	 MP/yCaTzYaLXCMtk8NCY6925vZ14HBurV98sERSP+M061v2c+QYDziVWWze5GIZJVkDLm
	 yVkcGbd4WFag+kdjOpqa2N7VkEAeT2bvDy4AjwcwdO737yXn/CroG/Eeg9jz+GxL6a2yd
	 dkI67Tr75mU9X4OGDztMZ7Kma9gXNqq8hijnJmySoG2G5UXNVzxawZlPuUZdsMeQ4kA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795720904;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=SYfZ5V1jsDjj7FUYkj2tvXm8nsCskzM5brqwOrMETT0=;
	b=H7LrrC2aCHQFqSMPoYpS5sU+FQJ7gQI7d/N/dveeKcZsUh/a0vNf7fGbksufx300x1oN
	 e5MAohs/YNMTaOOYui9RMlMZ3vKMUcNBucMeyqrutL25jEinBvnSLX3akWTGmhTdCocGH
	 IfZE43PYM+Wdx6NONs4bbK609aIzgnARNlf2kyPEveehHLjtc6dZXlYny3GlZn/wAI8bg
	 IEjZMdy9x4ON8ZBn/hhygFBGi8O3O25vHY4097PuS8iG83FJw4yujOtVzB0B87fHxg85f
	 7wOLUU2/EaOR3JA951lxx/SLwpDPh549hIJypKb41LQZzh0H7TcMTu3QujqGpLAdkCQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I4A28ja1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12533606A31C;
	Thu, 26 Nov 2026 19:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I4A28ja1
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795720903;
	b=EhmQkME9C3BYZrdc8kU6tv5b0+f5/ETkyLOULVQ4Qe62zXHkbAgO3eUO6VWVQbwlC69Z
	 t0fFu7FUnU13tJZIXGYtzENzPLrus+aCcVI4C6S7gB9+ayaR9jIGrllhCBXyXJxkFCcau
	 cEJoKAHNyW6xZQJUrx2AYp8BvydC/N55DtovyUSem2yvxKqTeGzhVj4ZvP4NpVSvZbrbE
	 vd5b4bGlXz0JwMPBH38scKxDALV3fCDzPsKQQTG8dmnK6uGOxF/2C6eEQmjUAH38c6lE/
	 wmuNQ5eT4r8yArTq1HozOIFp7zNDIj+PJfORE1OPw7a2dVzQ8fuuPnzMGoAJhsU5OVw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795720903;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=SYfZ5V1jsDjj7FUYkj2tvXm8nsCskzM5brqwOrMETT0=;
	b=iVgbU9UOgo/0+GQ3fGFPYXtPx0Zf+jwBlW2tUxKSorvI+12lmiF2ZgRmeV3ZysR0Pqqg
	 CXj9rerj/okrVF7ToX3rRmF7igRUvNBz0sOsKt4COMybHCX4/bZPaeP5LeX5dDs4BgKWP
	 IsUKxJStt3Y/M4Hstdr5T1rd+b79e+Fgcq7Tayrveve/6c9GR5SkTUSR2xqVjc14yr3zq
	 9Z2fw7xJS0p8EXHwRT3Q9ec5W3h4vSl83xJts3KCd655hSjV7tTlYT5F9T/fq5hopS7d/
	 ZTSy0K7TNMxC6U7/q3lufgsX0XA+YdwC5MMRZYlHQxv+Yj3xtTA3y68v92iCGZ5v6fw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4E9F11F000C6;
	Thu, 26 Nov 2026 19:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795720903;
	bh=SYfZ5V1jsDjj7FUYkj2tvXm8nsCskzM5brqwOrMETT0=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=I4A28ja11s1PnttsNwmPy0CNcG1y8TXZsx2YlBWEG/eEodf+FBN3Pp0toJGSTcCr6
	 8X1br7KuT8Nv8leKU8O/ZZpUEOofWLmmf4k8zA+4i3bf6QsGJUDIHVMmzJNIUytGM/
	 ueBkLDUcJCUozwUlchl1p7XnxdflpwM3hoa8MohgOXh6tPuyOfF0H8Oh4PwfdDAIIE
	 TyjJZEKO5aigIq1jrXPWX2KWVGYVDSEIemgb4T4p+uzf8+kCLaVfsSu3ZPD+RROmOd
	 DeAVyT3z8m7KiyC07w3iXqpOtRU1fLc3ae3jAFyVL6jC6wqkTFprEN9b0tMCgbwaXv
	 SYCT3wY6+tKNA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A0B8B4D7B2;
	Thu, 26 Nov 2026 19:21:31 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Subject: [PATCH v3 0/5] MIPS: Add support for the Siflower SF19A2890
Date: Thu, 26 Nov 2026 14:21:28 -0500
Message-Id: <20261126-sf19a2890-mips-v3-0-1f808d38ab37@telaak.dev>
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
X-B4-Tracking: v=1; b=H4sIALiGCGsC/2WNyQ6CMBRFf4V0bU1bsIMr/8O4eMCr1AEIxUZD+
 HdbjInD8iT3nDsRj4NDT7bZRAYMzruujZCvMlI10B6RujoyEUxIzpmg3nIDQhtGr673FEolamP
 AKqNIlPoBrbsvwf3hxf5WnrAaUyUtGufHbngsj4Gn3Tte/MYDp4wioGZaMLBS70a8AJzXNQaS6
 kF8+Jz/+SL6uVQ5s1DYDcgvf57nJ/yEp5r/AAAA
X-Change-ID: 20261102-sf19a2890-mips-ab72d99af797
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Burton <paulburton@kernel.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Chuanhong Guo <gch981213@gmail.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, linux-mips@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joseph Telaak <joseph@telaak.dev>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795720890; l=4992;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=NDJVn2qtq0h1fvaOlluk96FKNRDn4kyq5YVOFaXbS3c=;
 b=o0Zf7feQVx3tXxRn1Y2vJsbcROW++R3mqWxSj4+EuovdLJ7csFjZkCjC4JMoKh8wZlMEmRoT2
 Nm1IsIqfOMZDCESlTFtkW9QaK5/XZZoLA+QV89Uu3R60EOgwLVakHuf
X-Developer-Key: i=joseph@telaak.dev; a=ed25519;
 pk=oQI+UfddlZ0wK2ac4WKOGNjUl1ZEN8j9ZVFSqEDoNP0=
X-Endpoint-Received: by B4 Relay for joseph@telaak.dev/20261104 with
 auth_id=1404
X-Original-From: Joseph Telaak <joseph@telaak.dev>
Reply-To: joseph@telaak.dev

This series adds basic support for the Siflower SF19A2890, a MIPS
interAptiv SoC (two cores, two VPEs each) for home routers, and for the
GL.iNet GL-SFT1200 ("Opal") travel router built on it. It boots to a
shell on the PL011 console with all four CPUs up.

Patches 1 and 3 are Chuanhong Guo's patch from January 2025 [1], rebased
and split in two: patch 1 adds MACH_SIFLOWER_MIPS, patch 3 the kmalloc.h
override. Jiaxun asked then why it does not use MIPS_GENERIC. It does:
MACH_SIFLOWER_MIPS selects MIPS_GENERIC and MACH_GENERIC_CORE and boots
through arch/mips/generic, the way MACH_REALTEK_RTL and MACH_INGENIC_SOC
do. What it avoids is MIPS_GENERIC_KERNEL, which selects
MIPS_L1_CACHE_SHIFT_7 and takes ARCH_DMA_MINALIGN 128 from
mach-generic/kmalloc.h, so that with DMA_NONCOHERENT no kmalloc cache
below 128 bytes exists. The interAptiv's L1 and L2 lines are 32 bytes
(the boot log reports both).

On a GL-SFT1200 (128 MB) booted to an idle initramfs, 62 s after boot:

                                       MemFree   Slab   kmalloc-128 objs
  this series (MACH_SIFLOWER_MIPS)     107444    4832   1497
  MIPS_GENERIC_KERNEL                  106442    5252   5538
  MIPS_GENERIC_KERNEL, DMA_MINALIGN 32 107660    4732   1497

(kB, means of two boots.) So the whole difference, about 1 MB, comes
from the 128-byte kmalloc alignment; the larger L1_CACHE_SHIFT costs
nothing measurable. If the generic kernel sized its kmalloc alignment
from the probed cache lines at run time, as arm64 does, this board could
use MIPS_GENERIC_KERNEL, and I can send that change in place of a
platform of its own if you prefer.

The SoC's clock controller has a driver of its own, sent to the clk
tree [2]. Its drivers depend on MACH_SIFLOWER_MIPS, so the clk series
carries patch 1 of this series as its own patch 1, unchanged, and
whichever of the MIPS and clk trees takes it first can put it on an
immutable branch for the other. Thomas, would you ack it there, or
take it and provide the branch?

Until that driver is merged, the dtsi describes the clock rates the
bootloader programs with fixed clocks; a later patch replaces them. The
pin controller, GPIO, USB PHY, DWC2 and GMAC drivers go to their own
trees.

Patch 2 adds a MAINTAINERS entry for the SoC. Its "N: sf19a2890" also
matches the SoC's drivers in other trees, which add entries of their
own.

Tested on a GL-SFT1200, booted from U-Boot over TFTP: the initramfs
shell on ttyAMA0; four CPUs, with CPUs 1-3 taken offline and back
online; the GIC timer within 0.06 s of a reference clock over 298 s; and
the UART divisors U-Boot programs (IBRD 0x43, FBRD 0x34), which confirm
the 125 MHz UART clock in the device tree.

[1] https://lore.kernel.org/r/20250120015254.124447-1-gch981213@gmail.com
[2] https://lore.kernel.org/r/20261125-sf19a2890-sysm-v6-0-181875c10682@telaak.dev

---
Changes in v3:
- Split Chuanhong's patch: MACH_SIFLOWER_MIPS first, as the clk series
  carries it, and the kmalloc.h override in patch 3 (Brian, on the clk
  series).
- Lengthen the MACH_SIFLOWER_MIPS help.
- Put the platform patch first and the bindings and MAINTAINERS entry
  second; the kmalloc.h patch adds its F: line.
- Collect Conor's Acked-by on the bindings.
- Link to v2: https://patch.msgid.link/20261111-sf19a2890-mips-v2-0-36730fa4f5a6@telaak.dev

Changes in v2:
- Write my note on Chuanhong's patch as a list.
- Drop drivers/gpio/gpio-siflower.c from the MAINTAINERS entry; the GPIO
  series now adds an entry of its own (Conor).
- Use the current SPDX identifiers in the new files.
- Order the dtsi's nodes and properties as dt-check-style --mode=strict
  expects, with a blank line before status.
- Link to v1: https://patch.msgid.link/20261104-sf19a2890-mips-v1-0-eae80820af68@telaak.dev

---
Chuanhong Guo (2):
      MIPS: Add support for Siflower MIPS SoCs
      MIPS: siflower: Override the kmalloc alignment

Joseph Telaak (3):
      dt-bindings: mips: Add Siflower SF19A2890 based boards
      MIPS: dts: Add Siflower SF19A2890 and GL.iNet GL-SFT1200
      MIPS: configs: Add sf19a2890_defconfig

 .../devicetree/bindings/mips/siflower.yaml         | 26 ++++++
 MAINTAINERS                                        | 10 +++
 arch/mips/Kconfig                                  | 33 ++++++++
 arch/mips/boot/dts/Makefile                        |  1 +
 arch/mips/boot/dts/siflower/Makefile               |  2 +
 .../dts/siflower/sf19a2890-glinet-gl-sft1200.dts   | 27 ++++++
 arch/mips/boot/dts/siflower/sf19a2890.dtsi         | 97 ++++++++++++++++++++++
 arch/mips/configs/sf19a2890_defconfig              | 15 ++++
 arch/mips/generic/Platform                         |  1 +
 arch/mips/include/asm/mach-siflower/kmalloc.h      |  9 ++
 10 files changed, 221 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261102-sf19a2890-mips-ab72d99af797

Best regards,
--  
Joseph Telaak <joseph@telaak.dev>


