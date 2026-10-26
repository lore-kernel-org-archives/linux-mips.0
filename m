Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793022422;
	b=UPu8H7BA1xK6YM3wqW308/vL5Zyiq3vPMU/+XAkszAcMJ411xmwvriXLc5z/SnWxYw64
	 j+98uRwuw+MfV8MaIvTfDxL2NdtA3pm6B1tFJlHPYgyrEVgkqjW1ZjrF0IRL+eOsRGm/Y
	 AgFVJy2AOKjj0YFPueSHTaNAZli+VRCM/bSx7DPP0nOkFKg8bmsnDqhdhcXI5xOg1gTqt
	 /9L6ogNlwm25JIZ5UR1JWKCWf4JqXhVKQYCrzMr1vw9r8yzmXCz07lHlwpRUZmxKS7tOE
	 p+iZdzyOvUqW9CrhIVArB9JoqHPWuDHoJ9D0g7miUjwBaSkXcLEQ24ZzAf6zgFO1fxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793022422;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=N02JM7+jqZay5FBQIpQf1LACX/mbr+RXj82lQnsUkN8=;
	b=O30/Oop8Ny9VTERqJVpEeR4Kyez9NKJUzKofo4JXhE3INW0Q8StANc/birjiqPUPPsjD
	 CogfjSY/F8YRW+/ffWW1//QgyWT8AbhKE199aJtCmapmkcetvoU10R90WHDruyJj7/pqw
	 dUeup4aoocqsQVaiZ8hLmhXqB/lw4f2GQPzhvCviWHk8OqS6bLPlS3Q9sLhsEacBk+7Xg
	 Pta1ub4CulfQfAZBfG20JVh9pIPUmn5H44ZEbob96Vdg9R+YVN4go9SNbfgDfcSXcBFEI
	 Yg87JJOs/uhhIpBIcLhtLHxorRFQ6YpC6YAqxIlOQ+MYGBOXHYFz5ICWfhdJkipKMdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eGrrusl1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D7D60A2639;
	Mon, 26 Oct 2026 13:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eGrrusl1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE84B1F01825;
	Mon, 26 Oct 2026 13:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793022421;
	bh=N02JM7+jqZay5FBQIpQf1LACX/mbr+RXj82lQnsUkN8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eGrrusl12ud5krVFttJT8R22Gyz/llhtPZ7z5eTocm0pKDW56MJEI2WrCnE5t4COZ
	 XeZfX1ACK2jatQlCvIfv5HY2dcA6JWHLM+nKPTDk5i6X/gm2V/N+fZx9TphYhT2svF
	 g/gRSyTPJ6Y7FOYgINGLt+F1FMb3L/kxwO+C3Lq6k8q8uNXyjye9ndhFXxtBHLYJp0
	 mx4I3Krczf+rNCcio83wQ5FjTjXayXWKBRMipYqi/74sMSunWSoBqs03P5WU9eUBNc
	 1zPsOq4Sq7M8ZD1dSmuTi/HHsir3LvjIa0HmAnCnsrlcfbQ0HIShb/dLMdSb+vPd7S
	 rRwY0P6UllBhA==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] MIPS: ip32_defconfig: drop dead options and add-in drivers, add audio
Date: Mon, 26 Oct 2026 14:45:43 +0100
Message-ID: <20261026134543.27207-6-kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261026134543.27207-1-kaloz@kernel.org>
References: <20261026134543.27207-1-kaloz@kernel.org>
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

Drop requests that no longer take effect: symbols whose dependencies are
no longer met (the obsolete ciphers need CRYPTO_USER_API_ENABLE_OBSOLETE)
and lines savedefconfig omits as defaults. Also drop the Tulip network
drivers and SAS/RAID transport classes, which belong to PCI cards.

Enable the O2 audio driver. The file is regenerated with savedefconfig.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/configs/ip32_defconfig | 36 ++++++++------------------------
 1 file changed, 9 insertions(+), 27 deletions(-)

diff --git a/arch/mips/configs/ip32_defconfig b/arch/mips/configs/ip32_defconfig
index 5ddbaa0aafaf..e43a6a1913e0 100644
--- a/arch/mips/configs/ip32_defconfig
+++ b/arch/mips/configs/ip32_defconfig
@@ -9,10 +9,9 @@ CONFIG_RELAY=y
 CONFIG_EXPERT=y
 CONFIG_PROFILING=y
 CONFIG_SGI_IP32=y
-# CONFIG_SECCOMP is not set
-CONFIG_PCI=y
 CONFIG_MIPS32_O32=y
 CONFIG_MIPS32_N32=y
+# CONFIG_SECCOMP is not set
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_PARTITION_ADVANCED=y
@@ -40,10 +39,10 @@ CONFIG_INET6_ESP=m
 CONFIG_INET6_IPCOMP=m
 CONFIG_IPV6_TUNNEL=m
 CONFIG_NETWORK_SECMARK=y
+CONFIG_PCI=y
 CONFIG_CONNECTOR=y
 CONFIG_BLK_DEV_LOOP=m
 CONFIG_BLK_DEV_NBD=m
-CONFIG_RAID_ATTRS=y
 CONFIG_SCSI=y
 CONFIG_BLK_DEV_SD=y
 CONFIG_BLK_DEV_SR=y
@@ -51,16 +50,11 @@ CONFIG_CHR_DEV_SG=m
 CONFIG_SCSI_CONSTANTS=y
 CONFIG_SCSI_LOGGING=y
 CONFIG_SCSI_SCAN_ASYNC=y
-CONFIG_SCSI_SAS_LIBSAS=y
 CONFIG_SCSI_AIC7XXX=y
 CONFIG_AIC7XXX_RESET_DELAY_MS=15000
 CONFIG_NETDEVICES=y
 CONFIG_BONDING=m
 CONFIG_DUMMY=m
-CONFIG_NET_TULIP=y
-CONFIG_DE2104X=m
-CONFIG_TULIP=m
-CONFIG_TULIP_MMIO=y
 CONFIG_SGI_O2MACE_ETH=y
 CONFIG_INPUT_EVDEV=m
 CONFIG_SERIO_MACEPS2=y
@@ -72,12 +66,12 @@ CONFIG_HW_RANDOM=y
 CONFIG_WATCHDOG=y
 CONFIG_FB=y
 CONFIG_FB_GBE=y
-# CONFIG_VGA_CONSOLE is not set
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_LOGO=y
-# CONFIG_LOGO_LINUX_MONO is not set
-# CONFIG_LOGO_LINUX_VGA16 is not set
 # CONFIG_LOGO_LINUX_CLUT224 is not set
+CONFIG_SOUND=m
+CONFIG_SND=m
+CONFIG_SND_SGI_O2=m
 # CONFIG_USB_SUPPORT is not set
 CONFIG_RTC_CLASS=y
 # CONFIG_RTC_HCTOSYS is not set
@@ -149,29 +143,17 @@ CONFIG_NLS_ISO8859_15=m
 CONFIG_NLS_KOI8_R=m
 CONFIG_NLS_KOI8_U=m
 CONFIG_NLS_UTF8=m
-CONFIG_KEYS=y
 CONFIG_CRYPTO_NULL=y
-CONFIG_CRYPTO_CBC=y
-CONFIG_CRYPTO_ECB=y
-CONFIG_CRYPTO_LRW=y
-CONFIG_CRYPTO_HMAC=y
-CONFIG_CRYPTO_XCBC=y
-CONFIG_CRYPTO_MD4=y
-CONFIG_CRYPTO_SHA1=y
-CONFIG_CRYPTO_SHA256=y
-CONFIG_CRYPTO_SHA512=y
-CONFIG_CRYPTO_WP512=y
-CONFIG_CRYPTO_ANUBIS=y
-CONFIG_CRYPTO_ARC4=y
 CONFIG_CRYPTO_BLOWFISH=y
-CONFIG_CRYPTO_CAMELLIA=y
 CONFIG_CRYPTO_CAST5=y
 CONFIG_CRYPTO_CAST6=y
 CONFIG_CRYPTO_DES=y
-CONFIG_CRYPTO_KHAZAD=y
 CONFIG_CRYPTO_SERPENT=y
-CONFIG_CRYPTO_TEA=y
 CONFIG_CRYPTO_TWOFISH=y
+CONFIG_CRYPTO_LRW=y
+CONFIG_CRYPTO_MD4=y
+CONFIG_CRYPTO_WP512=y
+CONFIG_CRYPTO_XCBC=y
 CONFIG_CRYPTO_DEFLATE=y
 CONFIG_FONTS=y
 CONFIG_FONT_8x8=y
-- 
2.47.3

