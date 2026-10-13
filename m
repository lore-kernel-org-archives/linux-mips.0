Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B884F93DA;
	Tue, 13 Oct 2026 11:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791892767; cv=none; b=kMn6a/ai0Fk5MXBWZ0w42R5aor8CH4xRPWRVKN3EaeBBUcRlzC5ZkzeQZjgBcjfwc3ruVYWLdMl6M3/bskVdnpsW5/CeYnhZrR3B0RtuW53VTpYG4/gCqb/HovliqLrb4asv6tMbxB/UtorXxu9FAEfKpnEuhDiSWaOgatIuCZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791892767; c=relaxed/simple;
	bh=TUypSZ6yFVNRfkDyuWMXE3JPWMjCq93doE8esAE135I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uwu/AWCxO4niPVQLQqk5ZrB0Iz494w55OoyxIHfnDAEmzNyEesVDDYRchTan0MPZrWWgqHhf2BWdTofkFfP2N+AxbbGXMl2ppQ8hd0iqQue4Cys+kyn1Inog7ksm96yvC2sjA7uSgcA57gxTpvUQdtToc+Yt/5Re2YF3HZPCIHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nXbatkUJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nXbatkUJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 358D21F000FF;
	Tue, 13 Oct 2026 11:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791892766;
	bh=b8LqUE5zZjnu/F0ommukM7Q2UNDOkpwhBMuorXf824E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nXbatkUJdPktdb1TY+EaV/iFSJPbv3UNQdlUH5/gsjjC3MfScdV7MfnpXck9mdf7+
	 grwl26fPhJm1I0YV9RQdgm5CUNtVA8jw5lPmDYlwNZpDrn36LyBpR9/IBY1hdc9INS
	 6ohU+PCj7EglWjFJTv9JuCkCFXlwfuWORUfH/w4Ir7G0Aqj6eXZ1GbvTUXGGEtIC7r
	 KWOwjfRkols2IoplHM10Nib7k5q/oyQ4FuBeRsqpILXA8+q7xDS8b/F83uYdw4oSRa
	 J1PrAUvsOn/OVj2sg4GkvcNfNpzy8iiq/NBxx//Umfjh1Mmj+zvgKYCNUbfeQThpKG
	 i5ii4iXHxB9Yg==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>
Subject: [PATCH 1/2] MIPS: SGI-IP30: power off through the DS1687 RTC
Date: Tue, 13 Oct 2026 13:58:19 +0200
Message-ID: <20261013115820.13293-2-kaloz@kernel.org>
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

The Octane's power supply is switched by its DS1687 RTC. Use
ds1685_rtc_poweroff() for power-off and halt, with all HEART interrupts
masked first, instead of leaving the machine halted.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/sgi-ip30/ip30-power.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/mips/sgi-ip30/ip30-power.c b/arch/mips/sgi-ip30/ip30-power.c
index 66851e17c5a7..2b862b27e114 100644
--- a/arch/mips/sgi-ip30/ip30-power.c
+++ b/arch/mips/sgi-ip30/ip30-power.c
@@ -15,6 +15,7 @@
 #include <linux/delay.h>
 #include <linux/rtc/ds1685.h>
 #include <linux/interrupt.h>
+#include <linux/platform_device.h>
 #include <linux/pm.h>
 
 #include <asm/reboot.h>
@@ -31,10 +32,39 @@ static void __noreturn ip30_machine_restart(char *cmd)
 	unreachable();
 }
 
+static void ip30_machine_power_off(void)
+{
+	struct device *dev;
+	int cpu;
+
+	if (!IS_REACHABLE(CONFIG_RTC_DRV_DS1685_FAMILY))
+		return;
+
+	dev = bus_find_device_by_name(&platform_bus_type, NULL, "rtc-ds1685");
+	if (!dev || !dev_get_drvdata(dev))
+		return;
+
+	/* Devices losing power may still interrupt; keep their handlers out. */
+	for (cpu = 0; cpu < HEART_MAX_CPUS; cpu++)
+		heart_write(HEART_CLR_ALL_MASK, &heart_regs->imr[cpu]);
+	heart_write(HEART_ACK_ALL_MASK, &heart_regs->clear_isr);
+
+	ds1685_rtc_poweroff(to_platform_device(dev));
+}
+
 static int __init ip30_reboot_setup(void)
 {
 	_machine_restart = ip30_machine_restart;
 
+	/*
+	 * The DS1687 RTC switches the power supply off.  Halt powers off
+	 * too, as the power button needs a running kernel.
+	 */
+	if (IS_REACHABLE(CONFIG_RTC_DRV_DS1685_FAMILY)) {
+		_machine_halt = ip30_machine_power_off;
+		pm_power_off = ip30_machine_power_off;
+	}
+
 	return 0;
 }
 
-- 
2.47.3

