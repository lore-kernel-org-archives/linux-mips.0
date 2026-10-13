Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A94F3AE18C;
	Tue, 13 Oct 2026 11:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791892769; cv=none; b=MN6iNty6Ps2CBmFovEp5YILSjXC7XVDKIuI+RQU6C55TWy7TGcwsbbMe14FiM9La/TmmgJeRWoFt6yfTsauxfTdmbKQQLVW01Z0WibQomcbV7jY36MBss2z3YSP8JGKICBF/P/7cAZuVYL+BcmaIU7hTRsZwSHYJkNQArMjv6V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791892769; c=relaxed/simple;
	bh=SZzA6vvUJYM0lz1rUR6EObh0Mygb+GIMbqCbKzpkYF4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WCa5OxC88wwFeJy4zC7LT28T8jeCL861h+g2FHi03tJhg+alW1lDihZgD4swv2Ii3xdq+Yn6zgG+bH5/URjBKbAi0xb5uimosgizOezARFiQG4N5qDQzoKgq52nhu3nSjOToCKrOrFfOMwxftDTs7ip2y/FXh4GZgKgiewc49pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LYo1n4l3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LYo1n4l3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 142491F00893;
	Tue, 13 Oct 2026 11:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791892768;
	bh=MU0vUS/kZ7mz97MIn2LIV0y2OfYrimt1hD5AoeM1eE4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LYo1n4l3fs4zCg+zJx0cDkWTBEO8xboWYWTDuikLdvcX/Lh1NI1Y7+zEHr9k3RkIn
	 R67aIXAuZIr7qvITuyaGLqbWplDNI/U7Yx3YD3LygxCtLRWN8axyuRnrmJV+gZn05v
	 mdXsZuu3Frpmg6kX3tsoLA2G93/WLsso5I7LPiJhM9bbBedDLS9LO9jdi4hWw8flvv
	 VMCNb/hUg5YN7/Rr6Mzcg0sFDqCSp1bLT2LTdocORqA+NhwpqLBTNAVSlE3nEqgPAx
	 QgQGmKS8VwkVXO5aVkEjwN6WJOsIz5tAJPNb/SIEiY2CSzrtvz0MmRjkUCJ8qR/Olv
	 CVdSRsnMtTc7g==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	mfd@lists.linux.dev
Subject: [PATCH 2/2] MIPS: SGI-IP30: shut down cleanly on a power button press
Date: Tue, 13 Oct 2026 13:58:20 +0200
Message-ID: <20261013115820.13293-3-kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261013115820.13293-1-kaloz@kernel.org>
References: <20261013115820.13293-1-kaloz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The power button raises a kickstart interrupt on the DS1687, and
rtc-ds1685 cuts power at once unless the platform supplies a
prepare_poweroff hook. Supply one that starts an orderly power-off,
cutting power directly on a second press or after 120 seconds.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/include/asm/sgi/heart.h |  2 ++
 arch/mips/sgi-ip30/ip30-power.c   | 26 ++++++++++++++++++++++++++
 drivers/mfd/ioc3.c                |  6 ++++++
 3 files changed, 34 insertions(+)

diff --git a/arch/mips/include/asm/sgi/heart.h b/arch/mips/include/asm/sgi/heart.h
index c224c2e3575a..736cabb7fdbb 100644
--- a/arch/mips/include/asm/sgi/heart.h
+++ b/arch/mips/include/asm/sgi/heart.h
@@ -317,6 +317,8 @@ struct ip30_heart_regs {		/* 0x0ff00000 */
 
 extern struct ip30_heart_regs __iomem *heart_regs;
 
+void ip30_prepare_poweroff(void);
+
 #define heart_read	____raw_readq
 #define heart_write	____raw_writeq
 
diff --git a/arch/mips/sgi-ip30/ip30-power.c b/arch/mips/sgi-ip30/ip30-power.c
index 2b862b27e114..1200fef108b1 100644
--- a/arch/mips/sgi-ip30/ip30-power.c
+++ b/arch/mips/sgi-ip30/ip30-power.c
@@ -17,6 +17,8 @@
 #include <linux/interrupt.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
+#include <linux/reboot.h>
+#include <linux/workqueue.h>
 
 #include <asm/reboot.h>
 #include <asm/sgi/heart.h>
@@ -52,6 +54,30 @@ static void ip30_machine_power_off(void)
 	ds1685_rtc_poweroff(to_platform_device(dev));
 }
 
+#define IP30_POWERDOWN_TIMEOUT	120	/* seconds */
+
+static bool ip30_shutting_down;
+
+static void ip30_power_timeout(struct work_struct *work)
+{
+	ip30_machine_power_off();
+}
+
+static DECLARE_DELAYED_WORK(ip30_power_work, ip30_power_timeout);
+
+/* Called by the RTC driver when the power button is pressed. */
+void ip30_prepare_poweroff(void)
+{
+	/* A second press powers off at once. */
+	if (ip30_shutting_down)
+		ip30_machine_power_off();
+
+	/* Shut down through userspace, powering off anyway if it stalls. */
+	ip30_shutting_down = true;
+	orderly_poweroff(true);
+	schedule_delayed_work(&ip30_power_work, IP30_POWERDOWN_TIMEOUT * HZ);
+}
+
 static int __init ip30_reboot_setup(void)
 {
 	_machine_restart = ip30_machine_restart;
diff --git a/drivers/mfd/ioc3.c b/drivers/mfd/ioc3.c
index 5f8ac364b610..8f603651cc8e 100644
--- a/drivers/mfd/ioc3.c
+++ b/drivers/mfd/ioc3.c
@@ -24,6 +24,9 @@
 
 #include <asm/pci/bridge.h>
 #include <asm/sn/ioc3.h>
+#ifdef CONFIG_SGI_IP30
+#include <asm/sgi/heart.h>
+#endif
 
 #define IOC3_IRQ_SERIAL_A	6
 #define IOC3_IRQ_SERIAL_B	15
@@ -321,6 +324,9 @@ static struct ds1685_rtc_platform_data ip30_rtc_platform_data = {
 	.no_irq = false,
 	.uie_unsupported = true,
 	.access_type = ds1685_reg_indirect,
+#ifdef CONFIG_SGI_IP30
+	.plat_prepare_poweroff = ip30_prepare_poweroff,
+#endif
 };
 
 static const struct resource ioc3_rtc_ds1685_resources[] = {
-- 
2.47.3

