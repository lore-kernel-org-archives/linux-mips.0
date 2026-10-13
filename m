Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0FA524AE2;
	Tue, 13 Oct 2026 13:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897577; cv=none; b=DcwgT22uXfo6wA8sCAt8ZeyGOvZuYCteKia5V43oYYRH5a8KSx66XMkWw3vD6S05D8smLj31lhOp/kEkzLWicAomYToES4Ad8M09anWKmVT8+mgQjCPYJqxOBskio0hfjLRluxQNAdGsZ8jggPjvv7GhsuHxVFe3zN8q4NiVceM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897577; c=relaxed/simple;
	bh=azpbzhlaRF3k4SC9X/ZEyt+bmt0azMS6TgJ19+Fvvtc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ri7fhwcZhnMkj+L3RI/e5ks39Nv/8ohxSKpsGg0WZ85Bd/JGZ2xf5+e9m6BFTFmFIP20bX1jyNlCZp1DYzHVsvplqY8i61xrykbAh6Mj2/AHIJwm81APEVnRY6GRg62abo7MVA0oz/QFQH44JJJ8IH7z2vvK16vRN0o2WslMkLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WMUWLz4w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WMUWLz4w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 202FB1F00893;
	Tue, 13 Oct 2026 13:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791897576;
	bh=gQsEF3Fqrh3Rd+g0OmNfKuFinhNLt7DAnTglaEbixDM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WMUWLz4wnflXeWiiI8jLDMydSTeiLSHkN+bleP1vGJcqjzFfnOC7SXVMMc2+Lchc/
	 nqt96s+NnFNjZxnc1Ll3Tv6BhSEmWbRk37h+4hQ4Q8OKIm24n1tn/JChwtwgbbLlX8
	 XkEQ4/C8mYMdapidUqfX5VtuX6CeglRJRLhs83X9ARqso2Im0OfCeWZaEFjhMIfE2d
	 gRBjUzn0kKiSwTLFiFnoOIttMlh+D9v1gFUyNi0bQn17HHgyMj2z//RawqX1Fi1Lop
	 /lhdKK1uSI0DtwzkYlK1Gx6PIgPBBdlTyCnxYMU1Kc17Ll25EP2Afkgt8E0AUTbhYZ
	 arroV/RtQySfQ==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>
Subject: [PATCH v2 32/53] MIPS: SGI-IP27: dispatch the early console between IOC3 and IOC4
Date: Tue, 13 Oct 2026 15:16:52 +0200
Message-ID: <602be02b4f98ae95c072619aefb893717d71b317.1791890466.git.kaloz@kernel.org>
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

