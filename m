Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D394E48F83C;
	Thu,  1 Oct 2026 16:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790871278; cv=none; b=OsB2hMGcWDFoh5f0QQo/KsoYs8LOCb/mX4h1QcSrMqN8r9a18exA35VNr4B0quA7gleq3XbCz/vvUaYvudX4DpZotlqY8wYao8Mt/TZ653sJlHL+z9WmB0FtzAYvo+Jm7wvhhIif5+Ss7yrdDm9BEvEDQqo3gUj8kz3ujJsHg64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790871278; c=relaxed/simple;
	bh=DRvKTSI9ZAgs+IWprkHaymgE8PLaR0rtmWhHLY6zzY8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BSoQBB6uGgmG2T0CF63FS8Azp4y1t+aw4KGDB5bgnmPvVBjSiEqI8FMUXAq0849DHlDZH6/D45daJa8qbPGKMXT8WjVKtKapXanlQFyFJN38QoUIWtDrPRcXjr7jlua8gJONrexgVy3MvOyqDJnfnu4bS0b0Ch3qieqi85VIZv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Abn8a0N9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Abn8a0N9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68EA81F000FF;
	Thu,  1 Oct 2026 16:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790871272;
	bh=3CaAfugjwYzrJ4r+wt+PU5N7zk/QniW4cG6Ge/Ok7Ak=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Abn8a0N9wx4px8b6onYIixuNKNyI81D3jt5FQdRllR67E0wocp3GF8a0+V28fwJcP
	 +uFBh5oF0WZZOmKYj2zIYFKwqvvyIK8Mt/2n2fMeAovnFlw6pBPOldMw4mFMv/L8ky
	 VG9j+LzUYj2mhSsHAU6HAdC6L6eHMTCqD+sR7rpKDWLGMgTlUuNj3DiVqGZs5B1pv4
	 9CVUB4YJe0HvC4ttAivztO99PRkExYyUPtYa8N708CrQDMPcX6Zz9KhUCfsxlJL947
	 +ADstmtAP8t5ptlsTm9e5l7wvQ/bua9XX9mt7J7KdI2r1fOtRdWQLxC9ti6wd7RldV
	 slCYU9RlW7PTA==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 37/38] MIPS: SGI-IP27: take the console from the KLCONFIG header on IP35
Date: Thu,  1 Oct 2026 18:12:12 +0200
Message-ID: <b564d5126e8066df287d6d7fdc83bac972a90b32.1790857966.git.kaloz@kernel.org>
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

An IP35 PROM records its console UART and baud rate in the KLCONFIG
header. That UART is ttyS0 on Fuel and Tezro, so when the record is
present and the command line names no console, prefer ttyS0 at that baud
rate.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/sgi-ip27/ip27-init.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/mips/sgi-ip27/ip27-init.c b/arch/mips/sgi-ip27/ip27-init.c
index 7f16d7f437c9..6a15ba577b60 100644
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
+	snprintf(options, sizeof(options), "%d", cons->baud);
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

