Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7324535FBA;
	Thu,  1 Oct 2026 16:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790871255; cv=none; b=rQRT6pXp20jrCAPlMNrx7HfQiH0ENszwU58PPf8rlJi9Pyy9B/z5s6ysSE8qnlLo8DzwFeTeuRMgnVelQnaJ5MeuU2+zwdKND1VpgOd5EwTmnpRmE3J4H1OtNXdBDJqhR4gZ9f3A6J80LifLAbq2YJCe+28PJb825UHgOV2j63M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790871255; c=relaxed/simple;
	bh=azpbzhlaRF3k4SC9X/ZEyt+bmt0azMS6TgJ19+Fvvtc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a6XMN4XiKQO1+Gy1Lm76v4T5cR/LsCPgC+vgU4GVbvAU1Z6JAGcMvdqWVVjmd/sFDEcSPx6eaw4w+U0Dm51QBFFtqxRvTIsHyf9nM/rl5VLmnh3Wdxzh/Dghq/qyOiD9oAEPXnYsx9VVriD9ycmqi0PYc/vcOCBqlEZWhBzHVLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lQjX4pRs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lQjX4pRs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A1431F000FF;
	Thu,  1 Oct 2026 16:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790871253;
	bh=gQsEF3Fqrh3Rd+g0OmNfKuFinhNLt7DAnTglaEbixDM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lQjX4pRssfcuGw+qdsXa5xLev4spF8pnSCrwaNpiPfLwtN7KTbPBh6e1oT8VpiPBp
	 srrziuHNhfQvGeDDuoh6D7nTYpO7n/mCaCriBpxBe8zoRsP5ROJkv3/mLk1rIc7fTB
	 SRIbEnVvOpGDNVL8bJwIx1U9qwEEbyq3xXnaseOEUnuU7m2xZzKpYnhoS/Ry6oLC4Q
	 JSuHR2tj2g4QtVTrYcPOcoMNmVYewKxOMt2qtaVl+SzPBCh8/qjEHVcZKFbwOg15/n
	 lzLPqNJCrFTGKlxR9Vb+mmauumjCA1CyIn+UKNtXkeN8jprCtiuO/ns/sNMjO7Bwez
	 vRDmL/NYkCj3g==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 27/38] MIPS: SGI-IP27: dispatch the early console between IOC3 and IOC4
Date: Thu,  1 Oct 2026 18:12:02 +0200
Message-ID: <ceaf9a9acdb80a1fd6cb5cf1144d7953c213ce57.1790857966.git.kaloz@kernel.org>
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

ip27-console.c casts the console UART to struct ioc3 unconditionally,
wrong for a Tezro's IOC4, whose UARTs sit at other offsets.

console_t.type reads back 0x0300fafa there, neither chip's PCI id, so on
IP35 dispatch on uart_base, which both chips populate correctly. A Hub
keeps the IOC3 path.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/sgi-ip27/ip27-console.c | 47 ++++++++++++++++++++++++++++++-
 1 file changed, 46 insertions(+), 1 deletion(-)

diff --git a/arch/mips/sgi-ip27/ip27-console.c b/arch/mips/sgi-ip27/ip27-console.c
index 7737a88c6569..a1bcb4376f66 100644
--- a/arch/mips/sgi-ip27/ip27-console.c
+++ b/arch/mips/sgi-ip27/ip27-console.c
@@ -12,6 +12,7 @@
 #include <asm/sn/agent.h>
 #include <asm/sn/klconfig.h>
 #include <asm/sn/ioc3.h>
+#include <asm/sn/ioc4.h>
 
 #include <linux/serial.h>
 #include <linux/serial_core.h>
@@ -32,9 +33,53 @@ static inline struct ioc3_uartregs *console_uart(void)
 	return &ioc3->sregs.uarta;
 }
 
+/*
+ * On IP35 a Tezro drives its console off IOC4, a Fuel off IOC3.
+ * console_t.type cannot tell them apart -- a Tezro reads it back as
+ * 0x0300fafa, which is neither chip's PCI id -- while uart_base is
+ * populated on both, so dispatch on whether that lands on IOC3's own UART.
+ */
+static inline bool console_is_ioc4(nasid_t nasid)
+{
+	unsigned long uart_base;
+
+	if (!system_is_ip35)
+		return false;
+
+	uart_base = KL_CONFIG_CH_CONS_INFO(nasid)->uart_base;
+	if (!uart_base)
+		return false;
+
+	/* NODE_SWIN_ADDR() aliases widget 0 away; the console sits on 0xf. */
+	if (uart_base < RAW_NODE_SWIN_BASE(nasid, 0) ||
+	    uart_base >= RAW_NODE_SWIN_BASE(nasid, SWIN_WIDGET_MASK) +
+			 SWIN_SIZE)
+		return false;
+
+	return uart_base != (unsigned long)console_uart();
+}
+
+static inline struct ioc4_uartregs *console_uart_ioc4(nasid_t nasid)
+{
+	return (struct ioc4_uartregs *)KL_CONFIG_CH_CONS_INFO(nasid)->uart_base;
+}
+
 void prom_putchar(char c)
 {
-	struct ioc3_uartregs *uart = console_uart();
+	struct ioc3_uartregs *uart;
+	nasid_t nasid;
+
+	nasid = (master_nasid == INVALID_NASID) ? get_nasid() : master_nasid;
+	if (console_is_ioc4(nasid)) {
+		struct ioc4_uartregs *ioc4_uart = console_uart_ioc4(nasid);
+
+		while ((readb(&ioc4_uart->i4u_lsr) & 0x20) == 0)
+			;
+		writeb(c, &ioc4_uart->i4u_thr);
+		return;
+	}
+
+	uart = console_uart();
 
 	while ((readb(&uart->iu_lsr) & 0x20) == 0)
 		;
-- 
2.47.3

