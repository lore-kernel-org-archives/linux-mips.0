Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA63530DE4;
	Thu,  1 Oct 2026 16:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790871238; cv=none; b=Klp70KaXW/335z1p1fMi7QWSKgMCdmnmF6akJbFkNsVNVGw5R28ED2y1Oi+EWFNcXN1oVoBtwL4BKyaZatE/WsJtwym1vzKYQY+WH6NNA6zRbYsmLna1o80V4Tw7sMrh6JLQDXpNs/dJBERWLeLtr5obaTJsJs/Vnqp4milEF6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790871238; c=relaxed/simple;
	bh=CJCmr86XS7J/ZYPpu+/BZanX1/1NchOWFxkgGWV06Yg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dt91iawZ6N5XPYcn4yToC19ny6awhyQ15aZJPBXCwVk/cNQAfp8BzHAMQMueKk1jThn+0OQTQo4I+TEN3wGKpo6hsaRb514V6angTR+K+fgxBRMexqfp/3+MDNMoIbKAm1InqLC7u26Mo5kJdkAox9Jf/U7EL6A69N42Md3dNKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XOq81aAt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XOq81aAt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D9891F000FF;
	Thu,  1 Oct 2026 16:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790871236;
	bh=42STCzYzyonlOgmhIdWQ1n/I6GrjMW4p5NMdNhHRRCE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XOq81aAtvXUTMGRyXFkN1en04blJ9Pqc8ZWF4uX9W+vARdDKSAmTEFsYSpBGCKSgi
	 71WBKurk1El5qqkDp27/EsJkDIvZGNlKrfqP/CA3I8YwF77Mo/uRVXY9xz7Es6CFpm
	 rHFtXG1S4h3Nl+Xu9TrxL8ma2OWzKKPz/r4wYvyzeVlVj2e6rNpP5vVzBYQWoTeEe0
	 kwi7kYjD2lg0Ce6KcuOOvMIfvCcjnuxIHpWqdndR6Mbu2EpuPXnKmrABCBE2kWNLgq
	 aZcr7c7u2u/PNJLjc+6ztiXj+7qvYiv0bz0zdAmxzJjd6rVBOKP448EuMhqHMqbNNX
	 6+fhQwCDGeqyA==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 19/38] MIPS: ip27_defconfig: enable the IOC3 MFD, its cell drivers and tg3
Date: Thu,  1 Oct 2026 18:11:54 +0200
Message-ID: <e4ca88a052ae97445fb4fafc5e535adf26a27eab.1790857966.git.kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790857966.git.kaloz@kernel.org>
References: <cover.1790857966.git.kaloz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CONFIG_SGI_MFD_IOC3 was unset, leaving the MFD core out of the built
kernel and the existing CONFIG_SGI_IOC3_ETH=y line unsatisfiable, since
that driver depends on it. Enable it with the 8250 and PS/2 cell
drivers, and enable tg3, which drives the Tezro's Gigabit Ethernet.

Fixes: 0ce5ebd24d25 ("mfd: ioc3: Add driver for SGI IOC3 chip")
Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/configs/ip27_defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/mips/configs/ip27_defconfig b/arch/mips/configs/ip27_defconfig
index ac885ff5b712..73abeb534550 100644
--- a/arch/mips/configs/ip27_defconfig
+++ b/arch/mips/configs/ip27_defconfig
@@ -140,6 +140,7 @@ CONFIG_ATL2=m
 CONFIG_ATL1E=m
 CONFIG_ATL1C=m
 CONFIG_B44=m
+CONFIG_TIGON3=y
 CONFIG_BNX2X=m
 CONFIG_ENIC=m
 CONFIG_BE2NET=m
@@ -219,6 +220,7 @@ CONFIG_RTL8180=m
 CONFIG_WL1251=m
 CONFIG_WL12XX=m
 # CONFIG_INPUT is not set
+CONFIG_SERIO_SGI_IOC3=m
 CONFIG_SERIO_LIBPS2=m
 CONFIG_SERIO_RAW=m
 CONFIG_SERIO_ALTERA_PS2=m
@@ -229,6 +231,7 @@ CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_8250_EXTENDED=y
 CONFIG_SERIAL_8250_MANY_PORTS=y
 CONFIG_SERIAL_8250_SHARE_IRQ=y
+CONFIG_SERIAL_8250_IOC3=y
 CONFIG_HW_RANDOM_TIMERIOMEM=m
 CONFIG_I2C_CHARDEV=m
 CONFIG_I2C_ALI1535=m
@@ -260,6 +263,7 @@ CONFIG_LEDS_TRIGGER_TIMER=m
 CONFIG_LEDS_TRIGGER_HEARTBEAT=m
 CONFIG_LEDS_TRIGGER_BACKLIGHT=m
 CONFIG_LEDS_TRIGGER_DEFAULT_ON=m
+CONFIG_SGI_MFD_IOC3=y
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_M48T35=y
 CONFIG_UIO=y
-- 
2.47.3

