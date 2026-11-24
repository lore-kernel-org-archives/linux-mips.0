Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530878;
	b=YvRy0yOStB3fSqGDZFJqn8zR5BHaPicVxVxRVXMPjRGjE3gkkWDzmLzzOssH7nSrDj5R
	 doF5mHxfg1aduOI7djYqWuxjFQbjDf/LKrdXld0sUrWjityxFOhJebe1jeR4BhB8kjgKn
	 ihfwLk3C5xMZ1HQ9CEZz6yKqMKloElgtYjqJa0uLEPUu6Bu5Cl/LCEIxim4Fpm2AkX/mR
	 M8dww6tQZUBgPXJnEvpQobyq+v4Fgs576mqiwb0/6gGdqzaFRmzqr/r5W6qJn0N1HZiqw
	 00P14bWFzOE5LrC5TmBPYVDJpsOkYW3UGpjFo+sX5xME8uBHwU6ltDj78ZyJu9Pmktg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530878;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yh9lee9iPrNlXGzNa8fNoBbGIA3N5Ycm8cGoModdBE4=;
	b=OIcL72sLOeWApLWeRbjQuuLx9dp4YfI23+NqP4hP3/r2yIlvwMDlpfZPoo10/hvjfeQb
	 5AeAbGSoR3YLMrgH2F53v3VHjugv3esMQMlVXH94eeXGNIy6ko/QkeKosLCwbAjnPIRfM
	 EreR2OCw9XyLgbil9eVT/6OCoi/zmS6vh9RHTBzGJZE0CpPKe7BnuwPSRuLsOLzOvtWCV
	 MNAETAteSHG059NIhVHklEfGOAJFHRJIl/vxdGacmhIj3U1cWDbKQkw78AFj3Gyi+L0/D
	 l940h2gj0SrEG2OnKmeUTrsusSceKnTcY+YMfJlsX72Sg2U76nuWYvjnK92kCFArgGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="FeO9QD/d";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7015D606A321
	for <linux-mips@vger.kernel.org>; Tue, 24 Nov 2026 14:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FeO9QD/d
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75A241F0156C;
	Tue, 24 Nov 2026 14:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795530878;
	bh=yh9lee9iPrNlXGzNa8fNoBbGIA3N5Ycm8cGoModdBE4=;
	h=From:To:Cc:Subject:Date;
	b=FeO9QD/dIJ8bjqhbZgUJopQJovIAQHHXpr0TfqKA9siR7DwV4FB5bdwQzjN/1x+0I
	 GUUWLRr1OXHfi/NLDR+uWFiSnrWz2CbDRulFRXe4PTl1QFdnS7Qo9jt0Hh+ahmqrR9
	 duWES0zvgirVDh3jhONHQZFV3csy6nSON3TG7l6bz2Qt2/xH/K9/BPvrL5eFHrwnGZ
	 M/wlzeX9LtBzaErRE1bYLsDAd7THg9UPPBMzUgsTeH3uJQoFTgEyiX8HosWrr+ny8h
	 wU9+rPFVI86xeX9Ox/+25WhT/JM0hhHEbUd8wmz9DWiOV+IvXsxa+aRLFaeJmY44nm
	 A29L5/vO85A/Q==
From: Arnd Bergmann <arnd@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Linus Walleij <linusw@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
	linux-mips@vger.kernel.org
Subject: [PATCH] mips: txx9: drop linux/gpio.h inclusion
Date: Tue, 24 Nov 2026 15:34:26 +0100
Message-ID: <20261124143432.3234864-1-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
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

From: Arnd Bergmann <arnd@arndb.de>

This header is going away soon, so include the appropriate one instead.
The legacy interface is no longer needed since the conversion to a
lookup table, but the consumer interface is still used.

Fixes: 0caeacb11691 ("MIPS: TXX9: rbtx4927: Use GPIO lookup table for SIO DTR")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
--
This was previously part of the patch to remove the header,
but we ended up splitting that up again.
---
 arch/mips/txx9/rbtx4927/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/txx9/rbtx4927/setup.c b/arch/mips/txx9/rbtx4927/setup.c
index 223889c03186..fdbe2bd87979 100644
--- a/arch/mips/txx9/rbtx4927/setup.c
+++ b/arch/mips/txx9/rbtx4927/setup.c
@@ -48,7 +48,7 @@
 #include <linux/ioport.h>
 #include <linux/platform_device.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/gpio/machine.h>
 #include <linux/leds.h>
 #include <asm/io.h>
-- 
2.53.0

