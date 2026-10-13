Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C60522699;
	Tue, 13 Oct 2026 13:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897558; cv=none; b=gy9S+nzWShlyzQzFN2wOLs9vrRo7i35ocsuCbV319U9TFVSCA578ItylNVZR0QCEp2sUl5RbUfdkGRuASzHH3T3vzhEC3MpIgjFvHfoBzeiNVHeJXGXBlfFWCpDY+z9Jt7XMzYMEgHPOxVTqmLuCCiXexH1dUoGLP2t+DcGpkrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897558; c=relaxed/simple;
	bh=P3Kf5WpjT4f7j4S/BVQdt7wRTygBGJSV+/eNVkoromU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YGLCDN4D+n/DWKY2bPsipNv3/GFpgE6gYHkETtg671fLsMj2aA6q+Ha7aWEkRJ79wzo0BYI7aMYqMECI/UIDjvxbLLw+d9MlQu0H/34Pb8CA5NH9fkiyVLsG7KAlsJWsj9BsO5mOFvmr9V2in2M+f4DEF/nvpGQPH/17KA9dOPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L4S/kpyX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L4S/kpyX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46FBC1F00893;
	Tue, 13 Oct 2026 13:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791897557;
	bh=Nlo3aMUTYUtlSRAzSRZXo+QbL7rQYfieUL/M2GNuTA4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=L4S/kpyXoFQF66EycyjFBPbOnMbfm3A298K6IY/TFgUAZ4E0DutFtPhEzAkX65AOU
	 CRu+t9nsN6Uu1j1GPwceR2YY32Lb1fMBENhcw2FSb9p3UK8ZKVVNPi/ctRz8bgFLoU
	 yJ0fc6M1SNKCsKZViK3Xe2z5EUJ8iRW9EE7xG1JrwCfUPdox5kuTepx33c5rZwhWQ0
	 cDKaiuK60R1ZaZ8QNYtGyLudJWnhgo+58MMfWM6/peWJqe0+7C40O9pXa0wjkqxKjT
	 UHfYNvvueZ0stejnCFmvqlWuqXSCmV9gw7PNmiCj/gXQZBNOVSHzcXUGYkivmwnznA
	 /OGSdy+IlV49g==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>
Subject: [PATCH v2 24/53] MIPS: ip27_defconfig: enable the IOC3 MFD, its cell drivers and tg3
Date: Tue, 13 Oct 2026 15:16:44 +0200
Message-ID: <489b47a9e296defa08652da53d0ddaf9c977475f.1791890466.git.kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1791890466.git.kaloz@kernel.org>
References: <cover.1791890466.git.kaloz@kernel.org>
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

On IP27 the IOC3 sits behind a Bridge whose probe defers until its
1-wire PROM is readable, so also enable the SGI 1-wire master and the
DS250x slave.

Fixes: 0ce5ebd24d25 ("mfd: ioc3: Add driver for SGI IOC3 chip")
Fixes: 5dc76a96e95a ("MIPS: PCI: use information from 1-wire PROM for IOC3 detection")
Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/configs/ip27_defconfig | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/mips/configs/ip27_defconfig b/arch/mips/configs/ip27_defconfig
index ac885ff5b712..4c8abe4611b8 100644
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
@@ -250,6 +253,9 @@ CONFIG_I2C_PCA_PLATFORM=m
 CONFIG_I2C_SIMTEC=m
 CONFIG_I2C_TAOS_EVM=m
 CONFIG_I2C_STUB=m
+CONFIG_W1=y
+CONFIG_W1_MASTER_SGI=y
+CONFIG_W1_SLAVE_DS250X=y
 # CONFIG_HWMON is not set
 CONFIG_THERMAL=y
 # CONFIG_VGA_ARB is not set
@@ -260,6 +266,7 @@ CONFIG_LEDS_TRIGGER_TIMER=m
 CONFIG_LEDS_TRIGGER_HEARTBEAT=m
 CONFIG_LEDS_TRIGGER_BACKLIGHT=m
 CONFIG_LEDS_TRIGGER_DEFAULT_ON=m
+CONFIG_SGI_MFD_IOC3=y
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_M48T35=y
 CONFIG_UIO=y
-- 
2.47.3

