Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612544;
	b=KoTnOckFZtbZOLTlPiE73RsxJUK5KmgkUp9yjaUzkSsN2w8tek3ScvpHbaGiAosJWTfy
	 sLD49cNwfzyQG1m7pvF5Fe8UNCuUH8Km1J9IpGtOdbqZTuTVelzqFiWcjDlkxUbWxf0WP
	 nZxq1SsuNeZOHP53okqpltIu5tjFX827DYuqeEmT2Fo3DQ+jur/Xal0EOGTNc8J/3OSwB
	 VqD3OhkSd+CHR8w2C7Yuv9OjQtpeEGPVHDwZ44gbMFQSMPh6xAWGMXOmAFogMRSIKj8oq
	 TAjeokYIB8Pw7suffwil++53unQ+hfQOz1ns/9NWSzDsJAr3pHGukSGwXwFx9zojYeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612544;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=ha0p3uAWuMJixuS3xtaX7rx9I/bXe6vzg6SDabXVMCc=;
	b=xQoz5mpSZpkClQqBkTq2MeI/chZC2DVsIjaow825kfkVdkuA7I2c2lpW8bXITy6TKYqn
	 G6TiCoQcDejVE7O12dw5pB10QY5HT82+uNmFMhevPYHNp4hFMk3Cei8+Q6Rlk/Hm57Dih
	 XEQW+sUuSepqccqHjSR0/zZEQLnxtvIK6VIrbsaHL4qDJL6y+z4Tiof5RZFJXElVdLAwh
	 H/MZ59cKqxmaW7l7Qnj6XZOFd0UDWnpHJz7UA5AzIAR5I4Uk331gH4gHl+14eD0uQbTBf
	 sq1Wc/zymqb+k1Lhwm23CDcmk+Z40oztLBXqADe5ng61RgxguNINsjowROUmyO2fKyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hj3TtwT6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68777606A337;
	Mon,  2 Nov 2026 09:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hj3TtwT6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C597C1F000C1;
	Mon,  2 Nov 2026 09:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793612544;
	bh=ha0p3uAWuMJixuS3xtaX7rx9I/bXe6vzg6SDabXVMCc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hj3TtwT6MTXnwBj2o6VRecSN/mTvMA4JDFPBTBLGtKqONXJsOxCob4o0RjES9EZYp
	 1myBCXjn228C/AS3iH9aQIqdXshIDK98aZws3k4JvfwWx65TMknZY3qPLzHdczkG8D
	 FWZhb54gxTHxWgSNip6iKyIOwb+9BpiD0XQ24Y6oWjITflg5LOiREraFPkTW/OihzM
	 IlXTD+U6Zt6cxMDVHD16nzEULJ578N+46/7GoySSuzb/jQ8Cpp4kbu9hXe+/NtP0C/
	 8KytiEqAcTqwbaE5TgXL73uUEXsFVqkITarbX7vTMulp64iQUSefGTSFkTaA8tw4B0
	 AbWR/IzPxdw3Q==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>
Subject: [PATCH v2 1/2] MIPS: SGI-IP30: power off through the DS1687 RTC
Date: Mon,  2 Nov 2026 10:41:04 +0100
Message-ID: <20261102094106.21300-2-kaloz@kernel.org>
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

The Octane's power supply is switched by its DS1687 RTC. Use
ds1685_rtc_poweroff() for power-off and halt, with all HEART interrupts
masked first, instead of leaving the machine halted.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/sgi-ip30/ip30-power.c | 34 +++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/mips/sgi-ip30/ip30-power.c b/arch/mips/sgi-ip30/ip30-power.c
index 66851e17c5a7..b1b33c9cfd76 100644
--- a/arch/mips/sgi-ip30/ip30-power.c
+++ b/arch/mips/sgi-ip30/ip30-power.c
@@ -15,6 +15,7 @@
 #include <linux/delay.h>
 #include <linux/rtc/ds1685.h>
 #include <linux/interrupt.h>
+#include <linux/platform_device.h>
 #include <linux/pm.h>
 
 #include <asm/reboot.h>
@@ -31,10 +32,43 @@ static void __noreturn ip30_machine_restart(char *cmd)
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
+	if (!dev)
+		return;
+	if (!dev_get_drvdata(dev)) {
+		put_device(dev);
+		return;
+	}
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

