Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16633033D5;
	Sun,  1 Mar 2026 02:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772330678; cv=none; b=g2FiVlVg0PYnOmtCMEG8fxegbQHDa74jGHU9uQFe8VIvmbTvT3u21TiScv91ezu9jesahrSpuf029RIWB+dbmVLctx4cFH85qWdPoUnJiwqP8TmjeWzmxaY2+7eEQfwa874iayN9njOFZsXVgyWCITVcZF4c6AMlxdfoEHvOgLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772330678; c=relaxed/simple;
	bh=abJuzd8IED88yXGa/PCFUUEY+yt8wuis2nE6uP7GOL4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KrF/Wly0DDO0JkHbCB+uY8cbUvGrZTsC9xz0Q1kjRmRhKQeufTzwkCS6ffi3fL9binDbboCBOpzTOP+j9EGkQBw2evcdqUyClzaDJAsQagR2eayXwAEc0x0mvsMrZGTWIeC4IxWX93Gk6hogJH15T5kG50bL/4XEZa7XAoJQ2P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YqfM59f7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YqfM59f7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ACA2C19421;
	Sun,  1 Mar 2026 02:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772330677;
	bh=abJuzd8IED88yXGa/PCFUUEY+yt8wuis2nE6uP7GOL4=;
	h=From:To:Cc:Subject:Date:From;
	b=YqfM59f7/qqyPaoY/kIb536tFCax79KuUAik0SLjTgYTDAdplAyX6rUuo2XY9fOZU
	 Dhf5iuVzvdeM7dI6XohcW5FVlnaPTQm7jM7DBhX63t5vTaapQLAZtMKT+72SE/F7vz
	 5C5pNHqMT96z/yvkpTJMPXBvACDI9kSEIEpNj9QC/mniHki7xdFBg+mG6thR89fiMU
	 f23pIjvdywvTmov2hBwNDeADFTIhtyAVJ2yprL4PgGIrhXk/dsRmhfYhXvRoTC+k1a
	 FUGqgkwQ7I0aH1JbUGzMw/K7PmA620LipBtuHr5Ic5cvKDCwPkwDaGpdg1i/XrGS/f
	 gwdnOOsqzDiaQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	jiaxun.yang@flygoat.com
Cc: Waldemar Brodkorb <wbx@openadk.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org
Subject: FAILED: Patch "MIPS: rb532: Fix MMIO UART resource registration" failed to apply to 5.10-stable tree
Date: Sat, 28 Feb 2026 21:04:35 -0500
Message-ID: <20260301020436.1733075-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit

The patch below does not apply to the 5.10-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From e93bb4b76cfefb302534246e892c7667491cb8cc Mon Sep 17 00:00:00 2001
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Thu, 5 Feb 2026 10:08:42 +0000
Subject: [PATCH] MIPS: rb532: Fix MMIO UART resource registration

Since commit 6e690d54cfa8 ("serial: 8250: fix return error code in
serial8250_request_std_resource()"), registering an 8250 MMIO port
without mapbase no longer works, as the resource range is derived from
mapbase/mapsize.

Populate mapbase and mapsize accordingly. Also drop ugly membase KSEG1
pointer and set UPF_IOREMAP instead, letting the 8250 core perform the
ioremap.

Fixes: 6e690d54cfa8 ("serial: 8250: fix return error code in serial8250_request_std_resource()")
Cc: stable@vger.kernel.org
Reported-by: Waldemar Brodkorb <wbx@openadk.org>
Link: https://lore.kernel.org/linux-mips/aX-d0ShTplHKZT33@waldemar-brodkorb.de/
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/rb532/devices.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/mips/rb532/devices.c b/arch/mips/rb532/devices.c
index b7f6f782d9a13..ffa4d38ca95df 100644
--- a/arch/mips/rb532/devices.c
+++ b/arch/mips/rb532/devices.c
@@ -212,11 +212,12 @@ static struct platform_device rb532_wdt = {
 static struct plat_serial8250_port rb532_uart_res[] = {
 	{
 		.type           = PORT_16550A,
-		.membase	= (char *)KSEG1ADDR(REGBASE + UART0BASE),
+		.mapbase        = REGBASE + UART0BASE,
+		.mapsize        = 0x1000,
 		.irq		= UART0_IRQ,
 		.regshift	= 2,
 		.iotype		= UPIO_MEM,
-		.flags		= UPF_BOOT_AUTOCONF,
+		.flags		= UPF_BOOT_AUTOCONF | UPF_IOREMAP,
 	},
 	{
 		.flags		= 0,
-- 
2.51.0




