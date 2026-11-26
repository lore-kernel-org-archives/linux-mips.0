Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795720907;
	b=f914wBk0c3FBf/woEXUyw4oFwRAbmuGI+P3ChNk2VzM5SHhIY0XVgd70CCPvcBau0hsA
	 kmU/ulhHdgeVZ+q9mwgHPlb6b4KikBuDIh/54MEhS6tIVUgeJYmfp1vshQFwPNp2iFESp
	 NZhBVXzdHUZABeAMKyNkMKzHRgXc7q2Jns8M6sqaijBqeJW4A9xZ40wyo0RPdgkh3KkFG
	 qN6gCTGdmtSVudwokmeZdJnywpJ2S7bQ0iQHAV6CoNSfuv1lm6z1Wh1OrfyvczF+zBeH2
	 y6xKsx/C42lu1cJ2nhOtWnPjhA+VxJSfoVMMFWG1RfIsTpuDv/A3VAKwSs/5n6sbTMg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795720907;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=duDFZn/9vifFKrXrrq9JNvuX6O2EDASRPRiym+nRd4U=;
	b=2L7H0FpOj4SJfc2mcUxtxGDWDaQQyEyPz+VyazNmipOMz5yZw9ApcghziJzIMH7KPb0E
	 hH+54PhOYy9MEPw3hbBoflA1JwSX50OQwmWH54wI6pWQyOKe2yOp3+5ejLYdyo6ilr8nx
	 mnTaZD7z2W15nvS/AkaP86bFTRwor3ab1IPjML+IbU8kEWRwR7zENR4GuCrLyCR/kK/8m
	 zdKo3oOM9hBcB8z9KefzFRPDF3sxa8UlRl+f004KcjzFzXHQ6I5IVr15Qnk6nTzD7tJ75
	 q0x3jdAUNcYWDxUN2xDRv5zIoUhYxHBgWe3YFM7qrZyLkZsgiF3lVv7V+erEK3E0mTA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EHIM1M7h;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4E6606A32A;
	Thu, 26 Nov 2026 19:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EHIM1M7h
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795720906;
	b=CNpQmwUrHDcvAN5oeHK4YFn8b4r50oeO0HtfPgFk19d/bhUMVuhXjEOMf60MoDMvaa2s
	 XczBCsXx8yFBWoCu5vxbvG3rpPZxYaCIDCixfZ2GeJ908YACQpFsjnVGUfl3m4hYHlTz+
	 knjZ2uqi+5W9vZzjv/Un6dL5nP/E3glzlMI3qGhpWAhGB1JDDD8ChDPmCU9u6XrEVTawT
	 /UEGR5GT1dlPL00EDKHTeTzhieF/AZY9wb4F3q5b73XLveZU7CjzvYiZquFmdrV2kttZm
	 ONkKVUcPEHjmXX/vI0kuKlBL5qx4qJcHj2NfP436Kc2X3JIDMDrMAXox8Ud64lpQkTA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795720906;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=duDFZn/9vifFKrXrrq9JNvuX6O2EDASRPRiym+nRd4U=;
	b=KwOoPa5ut+6Ua5mfRd1SDODCCohzb04OfnpMlZ3GsAboKNTG/6LrsVEsnDdhE+74PJ2y
	 gwuYPr1lvq5Oj66SmBkeJW9BAs6Jjj9EdG8FVo2aizaU/ooUQq3bdg3O3o9M5RXkxa0bK
	 Z32nwy4VOVuOaLR3PUGRsIAufY+ckSiMeywPrkB/AYl81prOnfDAPoeavJvNH13LhGODK
	 kVNX4+wk62Fs5FywTE5br3uLOVTeDNgV6nuZPLZR+fn9YgKn7HaGYHYy0wDVY86lxLKcD
	 WiFzBMZK1LZjDha3JSfGLu8pGDuXPdY6YuNod9xhs1phr6lurTNV8deFSxZRrMC/NNw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9BE2D1F000D1;
	Thu, 26 Nov 2026 19:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795720906;
	bh=duDFZn/9vifFKrXrrq9JNvuX6O2EDASRPRiym+nRd4U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=EHIM1M7hQeysY8lyGK15FjFHyGqPQpyLDuxYOiwEKzHoXUvtXZAEFzhuRPWUfQrkc
	 YIvPqfSieW5Wc80y7fn47colDgz4afIrWlvIDld6mmyz2lSEhZh97IH/K6Dp1Z4qgC
	 SdQYJfXBgk2FTazEYGnzOe322i1BOrYoluy/+Iil1ouKh1wUfJK6MGQ3e/ZViFoGUs
	 D0ih11eUdRMGYWmcY7u0i0Uk0SMg0eHHrDuejD7xDD6RLw9M1ie8+a8RSZy101azr0
	 mpEmyo/hJCahQ+Hq9z2/mmRR+bF2J3Iul9/5vymIWT2V0ob6I+oqEEE7NQkMPYlp7B
	 j6e/+ezKqNUaQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 585874D7C2;
	Thu, 26 Nov 2026 19:21:32 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Thu, 26 Nov 2026 14:21:33 -0500
Subject: [PATCH v3 5/5] MIPS: configs: Add sf19a2890_defconfig
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
Message-Id: <20261126-sf19a2890-mips-v3-5-1f808d38ab37@telaak.dev>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795720891; l=1372;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=jrZFDuNOVQSJQnzMtSdYByrN6lytb/mj6TbF+QbIufc=;
 b=+7UAfwIG1llxlmBqyXWDIPV6/ekXbV4oM0enhEGBM13qOG8PrloH4bhxfYljIwfOtesJzbTwJ
 VG9GcGrfqJ9DiA9lEL/SwJgk1TaOUVw3UnGMUFbzL/iGRCVbHwL5L/P
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
index 23ad08c7d8d1..4c8daaae5501 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25704,6 +25704,7 @@ L:	linux-mips@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/mips/siflower.yaml
 F:	arch/mips/boot/dts/siflower/
+F:	arch/mips/configs/sf19a2890_defconfig
 F:	arch/mips/include/asm/mach-siflower/
 N:	sf19a2890
 
diff --git a/arch/mips/configs/sf19a2890_defconfig b/arch/mips/configs/sf19a2890_defconfig
new file mode 100644
index 000000000000..ec0992ac6340
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


