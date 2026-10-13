Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D119528454;
	Tue, 13 Oct 2026 13:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897600; cv=none; b=Dnfe8PZlUW0oONjq60ZnC8sETY/ptAd9beKgcmhQZyGGrOakkdhKK0x4m2ie4iWfePaPgvqtBdW5KDH0IZxAsPyYyFJRLu6rAMoXCLmMvfTBPHm+c/nNSzsm0/NtffxnXGRenbJ8V7Rw8/SUDnsIcfSAvudSo2uBdCWCiyX8uk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897600; c=relaxed/simple;
	bh=2/4DzLg6LTfGw0x77U6EQ1s7a8EjXtkbQUKV8N+PmkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XaW1W0oRGps2Qd0Qth7zyNE3AM3DEzF+ajbkV6h2ZIH2L/GnbGrMU/6WRM/2YmSOges+a8qH+J/TvY2vJm13v2HuZrF4aYSIR2AoejlLwfwrQbyPusmoXVL5Qx9Vxo2LNKT4L7QRl1KHTGmXdtKBmnHNFNU08gxahXkgJxH3YrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TvE9Dlfq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TvE9Dlfq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B41461F00893;
	Tue, 13 Oct 2026 13:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791897598;
	bh=JmY4A6V/MsKLELtNGURDdW6A4ZaTr8hul+ZbBorQULM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TvE9DlfqwdkDebVRrI197CKDsfvweV0FiuqNTYUMeIhuriyIDU9kTkWshwXX/dOlx
	 49ljUIuHE/dOxNGzSaQLSpJ/xsWKwRPuZ07i+5+oIerrycoQyjwtT0iiscvg8cE9JS
	 jM8sOuHGA0VRIQKkZfU2XVjNIvzXzGXfzNzGTIldAMx/lW8tiFlo+0nu3Tym2dDoD9
	 9jsvCol3vSlrpuXLInFdBHdBrlmH6SozEE6SfFCxrRGxvzKFuGFeyFxpDwUIGOKhTQ
	 4Z2k9WvN6iQZDN3TrReXlBWeMx7xxs5m8GNmNCFH46tquAoLFZiMQ8H0uyhJgZaKEa
	 yLlgPhdicM/Kw==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>
Subject: [PATCH v2 43/53] MIPS: SGI-IP27: take the console from the KLCONFIG header on IP35
Date: Tue, 13 Oct 2026 15:17:03 +0200
Message-ID: <1cb07d7105623c97912d464f9fbc66ccff511254.1791890466.git.kaloz@kernel.org>
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

An IP35 PROM records its console UART and baud rate in the KLCONFIG
header. That UART is ttyS0 on Fuel and Tezro, so when the record is
present and the command line names no console, prefer ttyS0 at that baud
rate.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/sgi-ip27/ip27-init.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/mips/sgi-ip27/ip27-init.c b/arch/mips/sgi-ip27/ip27-init.c
index 7f16d7f437c9..e657155ef7c9 100644
--- a/arch/mips/sgi-ip27/ip27-init.c
+++ b/arch/mips/sgi-ip27/ip27-init.c
@@ -6,6 +6,7 @@
  * Copyright (C) 2000 - 2001 by Kanoj Sarcar (kanoj@sgi.com)
  * Copyright (C) 2000 - 2001 by Silicon Graphics, Inc.
  */
+#include <linux/console.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/sched.h>
@@ -164,6 +165,26 @@ static void __init ip27_set_machine_name(void)
 		gfx ? "with" : "without");
 }
 
+/*
+ * Prefer ttyS0 at the baud rate the IP35 PROM recorded for its console
+ * UART in the KLCONFIG header.
+ */
+static void __init ip27_setup_console(void)
+{
+	static char options[8];
+	console_t *cons;
+
+	if (!system_is_ip35 || strstr(arcs_cmdline, "console="))
+		return;
+
+	cons = KL_CONFIG_CH_CONS_INFO(master_nasid);
+	if (!cons->uart_base)
+		return;
+
+	snprintf(options, sizeof(options), "%u", (u16)cons->baud);
+	add_preferred_console("ttyS", 0, options);
+}
+
 void __init plat_mem_setup(void)
 {
 	u64 p, e, n_mode;
@@ -215,6 +236,7 @@ void __init plat_mem_setup(void)
 	set_io_port_base(IO_BASE);
 
 	ip27_set_machine_name();
+	ip27_setup_console();
 }
 
 const char *get_system_type(void)
-- 
2.47.3

