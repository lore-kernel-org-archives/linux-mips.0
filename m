Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612547;
	b=X4RtrqQKUX3c16XxPNbOgPTdVXgxHyQlXKWXYyIJ2Mj/VrCAc7VhCNKKAgKCHKMfh2aZ
	 tz8vk4QNAcbSBpOhsiRsCOIvgiuyEl3MCdEFqzpRFeqyn6mIyMOv5y6iSJxQiz7NqMq5+
	 OcCT54YxilvIDeBG+699/J4PZ8P0p0TlxkPTO+xCBHAhM/e5EyOcxyLjAza9gVbxnDVlF
	 dzmX/WK41dCKnGd+3wzBQDELTq2YCxjrnpkLSzD+I1szf0R6Qd8EDL2Kn2KXTgXR3UP/D
	 WfFy9N2CTtLdQUUVEj/BTjH0doCG+q+lgGybLDrNobc5Z/5zDY38RsNU9Q2SO3viB6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612547;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=1Jv2HSfsFmShe1KbpG+Ifb4gaTqXBdvVkT/A02E3Ako=;
	b=YBQ3s/0Pu+8bRHfBQhckQcfZOjiMRSeL7FJy0MPlS6hytPEZznpjPr7YbIXNVouM/Wkd
	 n0ti3MtONzmyQDVmcshXuP6iyDBhDom/R6p1wBL0m6WPbLtswnG3AW9vPqtnaqThSX9qr
	 aYp+VyA09TfUU3MBfDTsPxnD079TRHXXhM9pG12N7ISFv1gU9EBIYPW3X3QZ0+am0Ft3Q
	 7GME3eaAnR3gjKhKCXzODM+ZazACNMwTuojLhMDj2pHudNr69E+9mBUKJ2YToPidZpvqs
	 KzTkawhpWK5uWp/UXjzbA6rlSHh0ZCzdp46imd6SUlwh7NJmZgmIL+2HMRvR1RX99ZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NfcRnVGe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB441606A32D;
	Mon,  2 Nov 2026 09:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NfcRnVGe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB5AF1F00919;
	Mon,  2 Nov 2026 09:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793612546;
	bh=1Jv2HSfsFmShe1KbpG+Ifb4gaTqXBdvVkT/A02E3Ako=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NfcRnVGeFksUegJI5AICG04e5BkrIhVS/MeX0ZnXeC0bDuci1/mm3lSxsMK9ag0+c
	 1RDEPGqvcvqCMXD1jdCUVCC07kz1AFZro9QtQ2BlVwsaa6iceCAnZSU8odBWzZuAek
	 ARGg6e5ZyL5auQ3NWYw2mkyHUPoBuiR5iNA4xa1GpdsquKl54KznfJ11Aiu0VdbQfW
	 pj4wl9nTrGG/YmzVlQcE9l3ZUf2QiiBsIdJhAblQUQs/y72wXh0QdDN27UYWIbZojH
	 M+xlLA9+zVl3SXrpqVPKtIgJCIeZ9DZUxUacjVFQiy1m+HXx1cZ0X+hkqt4O/Jmwnb
	 FuJtfkPib4Zng==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Sashiko <sashiko-bot@kernel.org>,
	mfd@lists.linux.dev
Subject: [PATCH v2 2/2] MIPS: SGI-IP30: shut down cleanly on a power button press
Date: Mon,  2 Nov 2026 10:41:05 +0100
Message-ID: <20261102094106.21300-3-kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102094106.21300-1-kaloz@kernel.org>
References: <20261102094106.21300-1-kaloz@kernel.org>
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

The power button raises a kickstart interrupt on the DS1687, and
rtc-ds1685 cuts power at once unless the platform supplies a
prepare_poweroff hook. Supply one that starts an orderly power-off,
cutting power directly on a second press or after 120 seconds.

Power-off drives the RTC's index/data register pair, so only the first
of several concurrent callers proceeds and the rest wait. The timeout
holds the device lock against an unbind of rtc-ds1685.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/sashiko-outbox-169717@kernel.org/
Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/include/asm/sgi/heart.h |  2 ++
 arch/mips/sgi-ip30/ip30-power.c   | 60 +++++++++++++++++++++++++++++++
 drivers/mfd/ioc3.c                |  6 ++++
 3 files changed, 68 insertions(+)

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
index b1b33c9cfd76..cff8f4875429 100644
--- a/arch/mips/sgi-ip30/ip30-power.c
+++ b/arch/mips/sgi-ip30/ip30-power.c
@@ -7,6 +7,7 @@
  *               2009 Johannes Dickgreber <tanzy@gmx.de>
  */
 
+#include <linux/console.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -17,6 +18,8 @@
 #include <linux/interrupt.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
+#include <linux/reboot.h>
+#include <linux/workqueue.h>
 
 #include <asm/reboot.h>
 #include <asm/sgi/heart.h>
@@ -32,6 +35,8 @@ static void __noreturn ip30_machine_restart(char *cmd)
 	unreachable();
 }
 
+static atomic_t ip30_power_off_claimed = ATOMIC_INIT(0);
+
 static void ip30_machine_power_off(void)
 {
 	struct device *dev;
@@ -48,14 +53,69 @@ static void ip30_machine_power_off(void)
 		return;
 	}
 
+	/*
+	 * The RTC registers are reached through an index/data pair, so one
+	 * CPU at a time may drive them, and a second button press, the
+	 * timeout and pm_power_off can arrive together.  Interrupts go off
+	 * first so the claimant cannot be preempted by a waiter on its CPU;
+	 * the waiters spin until the power drops.
+	 */
+	local_irq_disable();
+	if (atomic_xchg(&ip30_power_off_claimed, 1))
+		for (;;)
+			cpu_relax();
+
 	/* Devices losing power may still interrupt; keep their handlers out. */
 	for (cpu = 0; cpu < HEART_MAX_CPUS; cpu++)
 		heart_write(HEART_CLR_ALL_MASK, &heart_regs->imr[cpu]);
 	heart_write(HEART_ACK_ALL_MASK, &heart_regs->clear_isr);
 
+	/*
+	 * Nothing schedules before the power drops, so the RTC's message must
+	 * be printed from this context, not left to the console thread.  The
+	 * emergency section is never left.
+	 */
+	nbcon_cpu_emergency_enter();
 	ds1685_rtc_poweroff(to_platform_device(dev));
 }
 
+#define IP30_POWERDOWN_TIMEOUT	120	/* seconds */
+
+static bool ip30_shutting_down;
+
+static void ip30_power_timeout(struct work_struct *work)
+{
+	struct device *dev;
+
+	dev = bus_find_device_by_name(&platform_bus_type, NULL, "rtc-ds1685");
+	if (!dev)
+		return;
+
+	/*
+	 * Unbinding rtc-ds1685 frees the RTC under the device lock, so hold
+	 * it across the drvdata check and the power-off.
+	 */
+	device_lock(dev);
+	ip30_machine_power_off();
+	device_unlock(dev);
+	put_device(dev);
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

