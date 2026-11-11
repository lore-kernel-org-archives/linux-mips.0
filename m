Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794385654;
	b=UZEM9pP9XpyoL6Ff7uLIdZUtBfxDaXZiMxpokNbm1WlNNOl+6H2r3D+vTRrX1NFc0U9W
	 ewhIZa8Qr9PuJn7Hm5UeW5Isl3eouJxL9shJaA+sLCj1LR4ErNw3Tf7SjsmVxUp2GhMjH
	 EVQ1Y9+SwugUOV+/+feurAWgkNVkzYik/IWycWxz4pLzO5hcgNRSWRX/W16MgY6WKSaso
	 ZX2iHJ3QXLC/B2PbE1Qzy7d8LRo4rjh1XKk1TwFJB2aUe96BzTf35036qvBNovxpXM7lf
	 3GsjkpCSmylLgi9FIA+o+CSzkpQbR0HElpxqu1/ltsKzh4pvhB1gSypiR+hhqfRrzQA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794385654;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=pRSOQNdGBNDj9KHkxI6BeTSDsLqF0DvLbwR1A+RGPZY=;
	b=RF76qqvsOaEy4oCGT8xDWw2a5OAgVCSKLSZHUI4BMVytwvDgGVWauHtn9fRx+lBPEAN6
	 2lFVjVj+sbTJ8SdUhI7lukEYnuiLnx1ehwt4erfe657rMrbRqv3hgqhHqFSzuX+VSmGX6
	 Fw0pCEYH4JbqPPCHWIo9xcIKOHA5mw1q0mDGd0XRWtce6RadHSD8g10/ALvmjEHto48/B
	 WH082yEcjybr4zsZX2APiL0fFJ3WvIqBwoRsciDibYAvPuiV8hDQWJ8xaERyuiG8ZGT+Z
	 ERItnsVUvS6+6QOooE3sKzE1z41xvgGKxlSe/x9pw6M3S3PjDAsdIjGJ41fauwem8mQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OZK+Kttk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8A2606A332;
	Wed, 11 Nov 2026 08:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OZK+Kttk
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794385654;
	b=G145VUVsfiWkbDmDXg5X4beUtYuuaO21XfkblumMsoMMrh0XL/7svXkxLEy0q0j/WNmp
	 BeG7Hngt0kQCQk5zCeOJZB24bfDt+iln7FQwNZ5RMbsUNylZUAvlht3RcC7HnS909Bn9H
	 HqN+p4u4dGCT53jfDTKTSPda/0oRW1F/E6zUB3WxX+lzsAC+QyflKnaDrEL4BfAb2QrW1
	 y0hpnw03xdy6PZpKSHx94xFTEXqytN0yGAcS5SUaQPhtJPZkG0YP7NR7Apngm4hVZshB9
	 T5WyOD1Zb5TpHVcEeNdefBCNsHYxCu9lBt7zcD3KjHyd/705j0PxW4KU3R3DzF2OZfg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794385654;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=pRSOQNdGBNDj9KHkxI6BeTSDsLqF0DvLbwR1A+RGPZY=;
	b=gRaD7//w0uR2cnh1IuODAQ/CJXcZGxb9MoQo9HbQ6STZUIkdMO3lzDP5WzuEGWUHalF2
	 jsjLiD8CMiHsmt79vcIMw1K3WxxMUyZLiPa0OYFnEorStyQLHntP5nC4+ssab7sIdhYU+
	 mfvceXWBwi3kTMyBjNpipMf2ZqRt/emPxPjHKWPWw44QwT8mL2mQUVI428D18SaXPJBQl
	 IJPf0UuGGXMfdYRAnBxGeSQZkhMfiCQ7hgpu/qH7GkIyuVBTn748ai1/W9OXNOHz0KpsX
	 xE8cSg0TihxkT09hUWO7YDlZ4I7hSLc65fnsHjLDX+t219uJJ4M7PaAmrgzPaDJ+r+Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4CB391F00A06;
	Wed, 11 Nov 2026 08:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794385654;
	bh=pRSOQNdGBNDj9KHkxI6BeTSDsLqF0DvLbwR1A+RGPZY=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=OZK+KttkHbrbjazjpBZ7unjvgWXLZPMshFVZfYgCOjyvA9nNiiJ3WMf2VaGFXzj2s
	 fEH9EQPnHnvZ85EEUUCVM+613GlQwnp2UwCSApr+4Z3ZUBtypyhAa+cOCjnU4cyL4s
	 /1VaUgFpbXCi/AmBv2O0NBBpK+z8P9Hf0gssolK19Q4iZRljgYAif0fFaQ4V7JyUgU
	 6iW0fTkaFwFYAYHEv7rPxToB8maDDq7Ai8ypTb505AnBx4eEtirpF87XXgthHEhFdH
	 283sStvr3WfpkfqIels9JbXtKyK6KXHkHMGUkzHnwLkMK4tdhH9Hcji+Quc0fVddfK
	 GdlQNn95RUH3g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id CC84B48E90;
	Wed, 11 Nov 2026 08:27:32 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Subject: [PATCH v2 0/4] MIPS: Add support for the Siflower SF19A2890
Date: Wed, 11 Nov 2026 03:27:14 -0500
Message-Id: <20261111-sf19a2890-mips-v2-0-36730fa4f5a6@telaak.dev>
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
X-B4-Tracking: v=1; b=H4sIAOQm9GoC/12Nyw6CMBBFf4V0bU07MdC68j8MiwGmMj6AdLDRE
 P5dwLhxeZJzz52UUGQSdcwmFSmxcN8tALtM1S12F9LcLKzAQG6tAS3BegTnjX7wIBqrAhrvMRS
 +UMtoiBT4tQXP5ZflWV2pHtfKarQsYx/f22Oyq/eLH/7jyWqjCckZBwZD7k4j3RFv+4aSKud5/
 gDvcMjFvwAAAA==
X-Change-ID: 20261102-sf19a2890-mips-ab72d99af797
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Burton <paulburton@kernel.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Chuanhong Guo <gch981213@gmail.com>, linux-mips@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794385651; l=3973;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=fNtQMrwhc9IhmMCGlFC3FW2vYrQH+RedPZ5jVpQML1I=;
 b=smHLuaml02zJCWo1iJnWieATlWapyzVeI2ZtFjFL7HhhE3x35AaeM0Mr0YvIYECQA1ncqbWxW
 IrHSGo1QAYbA/7Dx3AjeCEqTmxwz4lhOeyZqeExoUQUOfP4Go7S271z
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

Patch 2 is Chuanhong Guo's patch from January 2025 [1], rebased. Jiaxun
asked then why it does not use MIPS_GENERIC. It does: MACH_SIFLOWER_MIPS
selects MIPS_GENERIC and MACH_GENERIC_CORE and boots through
arch/mips/generic, the way MACH_REALTEK_RTL and MACH_INGENIC_SOC do. What
it avoids is MIPS_GENERIC_KERNEL, which selects MIPS_L1_CACHE_SHIFT_7 and
takes ARCH_DMA_MINALIGN 128 from mach-generic/kmalloc.h, so that with
DMA_NONCOHERENT no kmalloc cache below 128 bytes exists. The interAptiv's
L1 and L2 lines are 32 bytes (the boot log reports both).

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

The SoC's clock controller has a driver of its own, sent to the clk tree.
Until it is merged, the dtsi describes the clock rates the bootloader
programs with fixed clocks; a later patch replaces them. The pin
controller, GPIO, USB PHY, DWC2 and GMAC drivers go to their own trees.

Patch 1 adds a MAINTAINERS entry for the SoC. Its "N: sf19a2890" also
matches the SoC's drivers in other trees, which add entries of their
own.

Tested on a GL-SFT1200, booted from U-Boot over TFTP: the initramfs
shell on ttyAMA0; four CPUs, with CPUs 1-3 taken offline and back
online; the GIC timer within 0.06 s of a reference clock over 298 s; and
the UART divisors U-Boot programs (IBRD 0x43, FBRD 0x34), which confirm
the 125 MHz UART clock in the device tree.

[1] https://lore.kernel.org/r/20250120015254.124447-1-gch981213@gmail.com

---
Changes in v2:
- Write my note on Chuanhong's patch as a list.
- Drop drivers/gpio/gpio-siflower.c from the MAINTAINERS entry; the GPIO
  series now adds an entry of its own (Conor).
- Use the current SPDX identifiers in the new files.
- Order the dtsi's nodes and properties as dt-check-style --mode=strict
  expects, with a blank line before status.
- Link to v1: https://patch.msgid.link/20261104-sf19a2890-mips-v1-0-eae80820af68@telaak.dev

---
Chuanhong Guo (1):
      MIPS: Add support for Siflower MIPS SoCs

Joseph Telaak (3):
      dt-bindings: mips: Add Siflower SF19A2890 based boards
      MIPS: dts: Add Siflower SF19A2890 and GL.iNet GL-SFT1200
      MIPS: configs: Add sf19a2890_defconfig

 .../devicetree/bindings/mips/siflower.yaml         | 26 ++++++
 MAINTAINERS                                        | 10 +++
 arch/mips/Kconfig                                  | 32 +++++++
 arch/mips/boot/dts/Makefile                        |  1 +
 arch/mips/boot/dts/siflower/Makefile               |  2 +
 .../dts/siflower/sf19a2890-glinet-gl-sft1200.dts   | 27 ++++++
 arch/mips/boot/dts/siflower/sf19a2890.dtsi         | 97 ++++++++++++++++++++++
 arch/mips/configs/sf19a2890_defconfig              | 15 ++++
 arch/mips/generic/Platform                         |  1 +
 arch/mips/include/asm/mach-siflower/kmalloc.h      |  9 ++
 10 files changed, 220 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261102-sf19a2890-mips-ab72d99af797

Best regards,
--  
Joseph Telaak <joseph@telaak.dev>


