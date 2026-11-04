Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793776624;
	b=PILoGZ8X+Vk77Utsp//Ux4Rfr/0kHiBVCWdG4YqWPUw9hg7w153F+G8hy2gperqX1Ij2
	 MlfFehznWqVu808jrdIIMSYUag+y2j2FEcJA/wdxA8hmtWqCiQsjNZ/3WuxdvxGkHnZWP
	 PFLma56yEhYT9HOoyglsk9g2Mg+6+45Fkr1EZwrY8Lp0Fag0cQWWglnVFcm8P9cZAFtZU
	 q51GsPxamh5e/9QwiBpsgzrCM5uECkciioz2BLGv8a8NWxxMZDNyZuFOfnhUajKSHBim9
	 0EO3j0H4j/eMS8chHFfC5rr9Vt87Bh5pl1IdW/7V0mvUA587vVNVt99KmkbICU/gQvw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776624;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=SimtLjTHe9xkB+MGIqURrfP5oU45CWzdgqAULVp2qgg=;
	b=gMOzsPiEgzMOSOO+wa5dZJwaP6uywCZ5DPv1luoCP6TrWVJa3ZbtSfF6mEN/UhasuS9V
	 baKQRI/ihEWJHPAaSeRKK2WlkkasByBkXN9msWx3QdsjpyyMQEvUQlts007lv1aH8jV87
	 znCR7rVIpD9KTn9ht4y4uKegcTofYiebkO0tXEcfcqnDTeSlHwQWHhdDxEJ/ntcY2Pnwy
	 L/WYUEEIN83lFb94RWo3NeSvcm0bJrj1HTnC65aQSCf1PO/zU3bk/actdBs4751qHm+Y3
	 i6+pj+bsFZmWRIp/KRNqyqN+E1hXUN6a+9Yz9KcMMR/47FwGISmCjUpBLwjuEXOyRVA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FDpJq8xP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210E4606A32C;
	Wed,  4 Nov 2026 07:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FDpJq8xP
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793776622;
	b=QAy1nNx/hpFuXERcywS0NEgRWLWNyvzCeFzl4QoBTXxti24aj/Ecnml0iXlvZueEzfDH
	 phNlC9ErFjJp55iba8p6dQ35DSBLa4eCyscUfbdhPrr1LF7vngSsIO+4//7iTLVQ52ILD
	 R6giipSdJAcbJ9+N6hcNIR/neL1D6x9Iol+liQcXGi7AzcBnyhdzz86exbb+RWsFCkGpz
	 uJL0LwfbX/mXd6sQAz2ERyczSQGVRUE4F15VVDEUrTbP/DqUUlW5iKVAFH7sa6YyLDTjl
	 TWOEv1ohdVzo5AolIk9wqMlMhK77VsHaNxKz4Q7HVu/wWxzOrABT5yfxEOOAf1+ahPQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793776622;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=SimtLjTHe9xkB+MGIqURrfP5oU45CWzdgqAULVp2qgg=;
	b=E6z2dDEkW8k+wBu03ZtWHoaBNYT5PqwHMCg8VWaFAKJ8SXRs5Wi1+etUK6pUJdLFtPeL
	 INzSJdFgsdc/SOuya1v7Bn6eQqkQTy1VwcreuBTuyOBGC1JzNn7j2G0heuwJvWAXSZMvq
	 dO11calSz34ODP8znO8vkK/+0wVpFVIvSszlthjnKSSNNFLr8c8kqXNPQAsBIzS2oN7DX
	 +ynPm/aV1y6fqa3NMEZIsZ38iaE4tvFBeYYhfMWNUl8rV2cIYoJc1X9N0dBpF0WjX0fRt
	 66yYxGMNYD4RIz4DjbLMPCOHMBLeexPI7gvtxaiBCpmIk9PXxoq2tvEv6gbfxpR8b3w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 74A4D1F000C1;
	Wed,  4 Nov 2026 07:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793776622;
	bh=SimtLjTHe9xkB+MGIqURrfP5oU45CWzdgqAULVp2qgg=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=FDpJq8xPM1C3LLhEvIjFfZ/mpMmnmpGGSL0K0SS44hiOKa7D0qv9O/4LSxalia6tB
	 CW7KdnWJPcCReH6f1HqNQiGArvIG43MxVInmHyAQDKJ+YrLCABSctl71FHLlsB54Pe
	 d4FHaDgbQCPMBjSehJQBDwfa47sFDzOfTJH2Uo44Mm1YFVNSoG7XlEK7IISJJ3XUmx
	 c199ydD40mZpGSPXhdY953JQ38tQ+9+bHNN5TH4qaTHBWOs9bJbmfJPFW9Twf9M+BX
	 lv/tsVJzYcLO7o8IqVQ5KH3Li0O0mfEF4y60Fht+uCI6VcatXrWVffkxCbQFnnmu74
	 UgghYqqhvysnQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 07B5046CD3;
	Wed,  4 Nov 2026 07:17:01 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Subject: [PATCH 0/4] MIPS: Add support for the Siflower SF19A2890
Date: Wed, 04 Nov 2026 02:16:52 -0500
Message-Id: <20261104-sf19a2890-mips-v1-0-eae80820af68@telaak.dev>
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
X-B4-Tracking: v=1; b=H4sIAOXb6moC/yXMMQ6DMAxA0asgz42UeGjqXgUxhOAUIxVQXBAS4
 u4NML7h/x2Us7DCu9oh8yoq01jgHhXEPowfNtIVA1p8OmfRaHIU8EXWfGVWE1qPHVFInjyUaM6
 cZLuGdXNbl3bg+DsvcBx/OBhnVXIAAAA=
X-Change-ID: 20261102-sf19a2890-mips-ab72d99af797
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Burton <paulburton@kernel.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Chuanhong Guo <gch981213@gmail.com>, linux-mips@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793776620; l=3656;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=jLtPGFDJSxOa7Hz/dlsyOuLDpxX8AIEklpDcWgF25c8=;
 b=HFWvLVqQTrtu8b5WSntlf++TMyzNTXIPBRBNdcilH3Ha8MK2XqZhQdgVPZlRN59r8u9XDwWf6
 bCnJUElpG0XBeTXi6ErITVrh6OUjSMxyaLWSTsazVuKfw2GJsfrD+gv
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

Patch 1 adds a MAINTAINERS entry for the SoC that also covers those
drivers, by "N: sf19a2890" and one F: line for the GPIO driver, so that
they don't each need to touch MAINTAINERS. Until the GPIO driver lands,
get_maintainer.pl --self-test reports that F: line as matching no file.

Tested on a GL-SFT1200, booted from U-Boot over TFTP: the initramfs
shell on ttyAMA0; four CPUs, with CPUs 1-3 taken offline and back
online; the GIC timer within 0.06 s of a reference clock over 298 s; and
the UART divisors U-Boot programs (IBRD 0x43, FBRD 0x34), which confirm
the 125 MHz UART clock in the device tree.

[1] https://lore.kernel.org/r/20250120015254.124447-1-gch981213@gmail.com

---
Chuanhong Guo (1):
      MIPS: Add support for Siflower MIPS SoCs

Joseph Telaak (3):
      dt-bindings: mips: Add Siflower SF19A2890 based boards
      MIPS: dts: Add Siflower SF19A2890 and GL.iNet GL-SFT1200
      MIPS: configs: Add sf19a2890_defconfig

 .../devicetree/bindings/mips/siflower.yaml         | 26 ++++++
 MAINTAINERS                                        | 11 +++
 arch/mips/Kconfig                                  | 32 ++++++++
 arch/mips/boot/dts/Makefile                        |  1 +
 arch/mips/boot/dts/siflower/Makefile               |  2 +
 .../dts/siflower/sf19a2890-glinet-gl-sft1200.dts   | 27 ++++++
 arch/mips/boot/dts/siflower/sf19a2890.dtsi         | 96 ++++++++++++++++++++++
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


