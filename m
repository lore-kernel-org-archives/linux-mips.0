Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793776623;
	b=Sqb/Cpi9GBc/RMtWshHgqNdF5QsNMR5jNw94+QTl4dDGSHTTXDfGzeq7PLWilzekPOCW
	 fUnYQcG3kqSXwkUF9wkUwMuLI3gAgsBh/nOBMSiw2KZcTz+suW5tq1NAK1/nmCDXMgeeX
	 KGL4R4T24oIRMW551qM3219sAYYO48RgcVsYPW8PPKViIVN9k6jW1FzGw9WagAnIclzu9
	 kTpI36pS0U8PGMUjiDmNjw3DdDn6TZzACujmXEbZjOIlDZZNgUd3rRA1xGx1PuFPHwwu+
	 s1WH/x4Rn3WfMLwjcxOV8gOTfqVX6X8H16qoKICNOxhKn4cNUH5lWp9eh2bbBW7RwEA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776623;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=hHnxw7QOm8YsU4kFHZvxSHd8NXXBBLW2fEIPfojwHBU=;
	b=dGudc9F0VIGOAZZwrBhN08tEc2GHOVA29Phc++jo8nTW0FtcutIhQo/X0HcpXxIYKokn
	 GHOouSRkEcaMHlS4i14CRgeLJThXI88xLhh6wQYMblwysKLCSCKoWXSxi2W9qQ6mk6DRb
	 CTdbKwJk50AIs1HIMPoBkHLb6bV+PtinVLiExJ+vbh9//Ztafx/zG3z4VLkXnw+GtVD0F
	 Q5XKYvsQLbDGKRUAH20hJtISr+LH69ULGGZl/l7fiCigeWbo24+qt8n3POlVCfy3JZz3A
	 CIalTSf7lNShzFpHlW2HDvarxCd4y/AlcUp5UkGbVFdRZRK5018ewbv+MnI6odXs4Bw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="i9IE/9O2";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21285606A32E;
	Wed,  4 Nov 2026 07:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i9IE/9O2
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793776622;
	b=jwFhB5UdxUm7jSZkgJrGgPdxX14r4T5qV6zMwOL050hOv4gKfoMFp7fKKArsW7p2u+uk
	 Nf7pgwWrqzf5t/PN4ovzi+o6KrIY0dpa9GmOFH5YGO0iVHU0OaWUQUmJqYRwI3l1HHXb+
	 cWkPiITT6NAHTeo128jvq+zuIY3WMJD8F87m5IFtC41ogsUtnQn7YOqsfXuHouVTcmwvc
	 mGNhTJo+IDea745iXtSKzAyzzJcADuFCLMJUUDDnevvPXEw1EnXnGXvxTg6cM0cddScCm
	 MlUbXuXHFH2M1qmEDmQP25D23i8djBzVrbs45qJ2LMO4b3u/0Qi+F17vUsbxsmKrAAQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793776622;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=hHnxw7QOm8YsU4kFHZvxSHd8NXXBBLW2fEIPfojwHBU=;
	b=d9xLztT2U9XIiuFri3I/ecfRs3UgZqJr9HHmudrZzd3OmkhuAcMCXqZvgpwW+kzIehMy
	 lmjXb2pWnVwoAbQNyePNQc/+r6wo+HEeP7A8vXGqIObOs4/yWHw7QsbYajG2j5igyH34p
	 u3E5eNTG8qTPzxcJkwFOWmQ83f0Bniho8DGoReEJGroxTo1Pbu/xMku3GMqUQoccQBcrO
	 SXJLFCZ7nzU6282TX0n28ISB1IcIf4KASiMU5PZzDK8baJEPhcIL2uz14pdFpGzPd2qro
	 +kXwoS8O0pJotj39HdNXvobgDQlq6fG8Oxm2db4uRSuw2sEg0o5CIFJTkpjmTHAs4EA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B49641F00A15;
	Wed,  4 Nov 2026 07:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793776622;
	bh=hHnxw7QOm8YsU4kFHZvxSHd8NXXBBLW2fEIPfojwHBU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=i9IE/9O21WAC9TmDqa2B0gLiDVjWEh/dH4UShzqm8wf3/NG9FXPnKZ/aMJgeUuLAL
	 4eZSmFJz4dDTQDwxx0B2ZgI7AcBNzR9IBlHsUMkWmtOaicih4iAM6se4vO3+t3aMoF
	 QRKyPOTt9JN/js/9nu2B5ZiWzz85v1uvXLpm5yXvM4z1Mr3BnMjzSHTi+NXE/Kc3Zk
	 zn0V0er4vDxSGDAjybvKIEK+1YJCuzXzeTOBXLzwM2FUGSt7KaCPSq57YHlIKJ9g3n
	 1UCwm6xMzdKDF43ecELH38XWZHyj4qerzp5JcQfPtpvxV1I/fCo4xtd0h5cl0bZX5v
	 Vz48ou9Ji0v+w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 4382346CED;
	Wed,  4 Nov 2026 07:17:01 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Wed, 04 Nov 2026 02:16:56 -0500
Subject: [PATCH 4/4] MIPS: configs: Add sf19a2890_defconfig
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
Message-Id: <20261104-sf19a2890-mips-v1-4-eae80820af68@telaak.dev>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793776620; l=1391;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=zztkLUC+M2zOWpFkypE450mBbf/dXLLRQ6Wq8WWfycI=;
 b=Vgm4vQJhrgBlWzR/8b8vKxlphG65RyYHmw6WSyI6idNoAvjuByOzu+TE3TgdTuBF54tWeBh7Z
 4gZbROby73nCsoVRgAEtolWi3P2ulRFYu33HUHioj09SsmyoC0+ZuZF
X-Developer-Key: i=joseph@telaak.dev; a=ed25519;
 pk=oQI+UfddlZ0wK2ac4WKOGNjUl1ZEN8j9ZVFSqEDoNP0=
X-Endpoint-Received: by B4 Relay for joseph@telaak.dev/20261104 with
 auth_id=1404
X-Original-From: Joseph Telaak <joseph@telaak.dev>
Reply-To: joseph@telaak.dev
Content-Transfer-Encoding: 7bit

From: Joseph Telaak <joseph@telaak.dev>

Add a defconfig for boards with the Siflower SF19A2890. It boots with
the device tree appended to the kernel, as the GL.iNet GL-SFT1200's
U-Boot passes none.

Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 MAINTAINERS                           |  1 +
 arch/mips/configs/sf19a2890_defconfig | 15 +++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 425b52d4f..4eaa92605 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25704,6 +25704,7 @@ L:	linux-mips@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/mips/siflower.yaml
 F:	arch/mips/boot/dts/siflower/
+F:	arch/mips/configs/sf19a2890_defconfig
 F:	arch/mips/include/asm/mach-siflower/
 F:	drivers/gpio/gpio-siflower.c
 N:	sf19a2890
diff --git a/arch/mips/configs/sf19a2890_defconfig b/arch/mips/configs/sf19a2890_defconfig
new file mode 100644
index 000000000..ec0992ac6
--- /dev/null
+++ b/arch/mips/configs/sf19a2890_defconfig
@@ -0,0 +1,15 @@
+CONFIG_SYSVIPC=y
+CONFIG_NO_HZ_IDLE=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
+CONFIG_MACH_SIFLOWER_MIPS=y
+CONFIG_MIPS_CPS=y
+CONFIG_NR_CPUS=4
+CONFIG_MIPS_RAW_APPENDED_DTB=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_SERIAL_AMBA_PL011=y
+CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
+CONFIG_TMPFS=y
+CONFIG_PRINTK_TIME=y

-- 
Git-155)


