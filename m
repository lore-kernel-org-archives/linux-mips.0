Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFB2524B19;
	Tue, 13 Oct 2026 13:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897580; cv=none; b=j8zADMiqEh7FmOHe2zPozfqaRWSX3IF+mFGsY2mURumE4wTuD4jxydhNVz6u0Mch7wItPgnmzNpWEYvzW4AL3rVMg3hvEApwNjZcnd3nZxHnGIfNms8fI0Go9BKeT9X9anQSzKcDD7FhRjvqzVKJBEY3ZFVYhxR7abFCvRDCioI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897580; c=relaxed/simple;
	bh=Tz4tpmkBODQ/Ndk0dTTmlwV0O/32PJQ0YhmkAKSN370=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=atOFi9fm9oRLlSojBmJmMJtZu8GdWyKyPlL3kkMNN01XuCvZeOdoGpkxkVTl9lLp8iH/eTkTfNtXr1o76/cbpYtldA91b67Rv5mw8vgBZ5Xm5TVOH8m/4bPDhGK4Y0h5qCVGGfdZNVuhqUyhlhBGvzPI5wSeBfpISmRq8Us4ANY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oB232XpY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oB232XpY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 395501F000FF;
	Tue, 13 Oct 2026 13:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791897578;
	bh=xHmNBMfyf0WuC2bGcPv7+19FJklzZqg/0SYt1rrIHqg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oB232XpYef4c6CB+YFJLfKwxV44BGlapDthYEQT/QBZ2tGogjwpMgpkN4BJciYf2N
	 JcY2EExhGuriWUA8L3+5lPT69NwvWWIOuTzR+j19S+w43CSz3Kdb4fPnaR30J9mOXO
	 VB6ZeqKDJucYJQPKkrJJbqVR2J3uuQxnm7v2nZUG0VkuiMF+X5Y3O5P40rUgmilngZ
	 Fozv8BklbMOKkUNc6C9/GyytFmytTdtWy4OT+3Js5P3ymFi5BKL73MRUsJJ020nmha
	 YUXPdW6/U7EIw97Pv++NELTeo0fKBtBDDQeEQpOYtbO6xn1NzYYlnHtnFsQ92/EASv
	 z4UHKfHiRR0AQ==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>
Subject: [PATCH v2 33/53] MIPS: SGI-IP27: add L1 system controller support
Date: Tue, 13 Oct 2026 15:16:53 +0200
Message-ID: <60de08740e1796b8ac0f2aaea1c70731c702ecae.1791890466.git.kaloz@kernel.org>
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

IP35-family (Bedrock hub) machines carry an L1 system controller on a
polled UART with RFC 1662 async-HDLC framing. Add the transport, the
request/response core and l1_exec_command(); on a Hub every request
fails with -ENODEV.

Ported from OpenBSD sys/arch/sgi/sgi/l1.c and licensed ISC like it,
keeping its notice.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/Kconfig             |   1 +
 arch/mips/include/asm/sn/l1.h |  14 ++
 arch/mips/sgi-ip27/Makefile   |   4 +-
 arch/mips/sgi-ip27/ip27-l1.c  | 423 ++++++++++++++++++++++++++++++++++
 4 files changed, 440 insertions(+), 2 deletions(-)
 create mode 100644 arch/mips/include/asm/sn/l1.h
 create mode 100644 arch/mips/sgi-ip27/ip27-l1.c

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 85f1c4bd6549..b7026672a4c1 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -762,6 +762,7 @@ config SGI_IP27
 	select FW_ARC64
 	select ARC_CMDLINE_ONLY
 	select BOOT_ELF64
+	select CRC_CCITT
 	select DEFAULT_SGI_PARTITION
 	select FORCE_PCI
 	select SYS_HAS_EARLY_PRINTK
diff --git a/arch/mips/include/asm/sn/l1.h b/arch/mips/include/asm/sn/l1.h
new file mode 100644
index 000000000000..e61935e2fac8
--- /dev/null
+++ b/arch/mips/include/asm/sn/l1.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Entry points into the SGI L1 system controller driver.
+ *
+ * Copyright (C) 2026 Imre Kaloz <kaloz@kernel.org>
+ */
+#ifndef __ASM_SN_L1_H
+#define __ASM_SN_L1_H
+
+#include <linux/types.h>
+
+int l1_exec_command(const char *cmd);
+
+#endif /* __ASM_SN_L1_H */
diff --git a/arch/mips/sgi-ip27/Makefile b/arch/mips/sgi-ip27/Makefile
index 9877fcc512b1..4b6aa641ccc6 100644
--- a/arch/mips/sgi-ip27/Makefile
+++ b/arch/mips/sgi-ip27/Makefile
@@ -4,8 +4,8 @@
 #
 
 obj-y	:= ip27-berr.o ip27-irq.o ip27-init.o ip27-klconfig.o \
-	   ip27-klnuma.o ip27-memory.o ip27-nmi.o ip27-reset.o ip27-timer.o \
-	   ip27-xtalk.o
+	   ip27-klnuma.o ip27-l1.o ip27-memory.o ip27-nmi.o ip27-reset.o \
+	   ip27-timer.o ip27-xtalk.o
 
 obj-$(CONFIG_EARLY_PRINTK)	+= ip27-console.o
 obj-$(CONFIG_SMP)		+= ip27-smp.o
diff --git a/arch/mips/sgi-ip27/ip27-l1.c b/arch/mips/sgi-ip27/ip27-l1.c
new file mode 100644
index 000000000000..da3095b66cf1
--- /dev/null
+++ b/arch/mips/sgi-ip27/ip27-l1.c
@@ -0,0 +1,423 @@
+// SPDX-License-Identifier: ISC
+/*
+ * Copyright (C) 2026 Imre Kaloz <kaloz@kernel.org>
+ *
+ * SGI L1 system controller communication, ported from OpenBSD/sgi's
+ * l1.c:
+ *
+ * Copyright (c) 2009 Miodrag Vallat.
+ *
+ * Permission to use, copy, modify, and distribute this software for any
+ * purpose with or without fee is hereby granted, provided that the above
+ * copyright notice and this permission notice appear in all copies.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
+ * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
+ * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
+ * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
+ * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
+ * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
+ * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
+ *
+ * The L1 is the IP35-family (Bedrock hub) system controller, reached
+ * over a polled UART with async-HDLC (PPP) framing. Every request fails
+ * with -ENODEV on an IP27 (Hub) machine.
+ */
+#include <linux/kernel.h>
+#include <linux/errno.h>
+#include <linux/serial_reg.h>
+#include <linux/spinlock.h>
+#include <linux/stdarg.h>
+#include <linux/string.h>
+#include <linux/types.h>
+#include <linux/unaligned.h>
+#include <linux/crc-ccitt.h>
+#include <linux/io.h>
+
+#include <asm/sn/addrs.h>
+#include <asm/sn/agent.h>
+#include <asm/sn/l1.h>
+#include <asm/sn/types.h>
+
+/* packet types */
+#define L1PKT_REQUEST		0x00
+#define L1PKT_RESPONSE		0x20
+
+/* packet subchannels */
+#define L1CH_MISC		0x10	/* available for operating system */
+
+/* argument encoding */
+#define L1_ARG_INT		0x00	/* followed by 32 bit BE value */
+#define L1_ARG_ASCII		0x01	/* followed by NUL terminated string */
+#define L1_ARG_BINARY		0x80	/* length in low 7 bits */
+
+/* command types and destination addresses */
+#define L1_ADDRESS(type, addr)	(((type) << 28) | (addr))
+
+#define L1_TYPE_L1		0x00
+
+#define L1_ADDRESS_RACK_LOCAL	0x3ff
+#define L1_ADDRESS_RACK_SHIFT	18
+#define L1_ADDRESS_BAY_LOCAL	0x3f
+#define L1_ADDRESS_BAY_SHIFT	12
+
+#define L1_ADDRESS_LOCAL \
+	((L1_ADDRESS_RACK_LOCAL << L1_ADDRESS_RACK_SHIFT) | \
+	 (L1_ADDRESS_BAY_LOCAL << L1_ADDRESS_BAY_SHIFT))
+
+#define L1_TASK_COMMAND		0x03
+
+/* response codes */
+#define L1_RESP_OK		((u32)0)
+#define L1_RESP_NXDATA		((u32)-0x68)
+#define L1_RESP_INVAL		((u32)-0x6b)
+
+/* L1_TASK_COMMAND requests */
+#define L1_REQ_EXEC_CMD		0x0000	/* interpret plaintext command */
+
+/* Async-HDLC framing bytes; linux/ppp_defs.h would drag in skbuff.h. */
+#define L1_FLAG			0x7e
+#define L1_ESC			0x7d
+#define L1_TRANS		0x20
+#define L1_FCS_INIT		0xffff
+#define L1_FCS_GOOD		0xf0b8
+
+/* A raw iteration count, not a time bound: this can run before jiffies. */
+#define L1_POLL_ITERATIONS	1000000
+
+/*
+ * The L1 UART sits in the HSPEC "local register" window, reached
+ * through the "remote HSPEC" indirection even for the local node.
+ */
+#define L1_RHSPEC_OFFSET	0x20000000	/* remote-HSPEC indirection */
+#define L1_LREG_OFFSET		0x10000000	/* local register window */
+#define L1_UART_REG(r)		(L1_LREG_OFFSET + 0x80 + ((r) << 3))
+
+#define L1_UART_ADDRESS(nasid, r) \
+	((u64 *)(NODE_HSPEC_BASE(nasid) + L1_RHSPEC_OFFSET + L1_UART_REG(r)))
+
+static int l1_serial_getc(nasid_t nasid)
+{
+	unsigned int n;
+	u64 lsr;
+
+	for (n = L1_POLL_ITERATIONS; n != 0; n--) {
+		lsr = __raw_readq(L1_UART_ADDRESS(nasid, UART_LSR));
+		if (lsr & UART_LSR_DR)
+			break;
+		cpu_relax();
+	}
+	if (n == 0)
+		return -ETIMEDOUT;
+
+	return __raw_readq(L1_UART_ADDRESS(nasid, UART_RX)) & 0xff;
+}
+
+static int l1_serial_putc(nasid_t nasid, u8 val)
+{
+	unsigned int n;
+	u64 lsr;
+
+	for (n = L1_POLL_ITERATIONS; n != 0; n--) {
+		lsr = __raw_readq(L1_UART_ADDRESS(nasid, UART_LSR));
+		if (lsr & UART_LSR_THRE)
+			break;
+		cpu_relax();
+	}
+	if (n == 0)
+		return -ETIMEDOUT;
+
+	__raw_writeq(val, L1_UART_ADDRESS(nasid, UART_TX));
+	return 0;
+}
+
+static int l1_serial_ppp_write(nasid_t nasid, u16 *crc, u8 data, bool escape)
+{
+	int rc;
+
+	if (crc)
+		*crc = crc_ccitt_byte(*crc, data);
+
+	if (escape && (data == L1_FLAG || data == L1_ESC)) {
+		rc = l1_serial_putc(nasid, L1_ESC);
+		if (rc)
+			return rc;
+		data ^= L1_TRANS;
+	}
+
+	return l1_serial_putc(nasid, data);
+}
+
+static int l1_packet_put(nasid_t nasid, const u8 *packet, size_t len)
+{
+	u16 crc = L1_FCS_INIT;
+	int rc;
+
+	rc = l1_serial_ppp_write(nasid, NULL, L1_FLAG, false);
+	if (rc)
+		return rc;
+
+	while (len-- != 0) {
+		rc = l1_serial_ppp_write(nasid, &crc, *packet++, true);
+		if (rc)
+			return rc;
+	}
+
+	crc ^= L1_FCS_INIT;
+	rc = l1_serial_ppp_write(nasid, NULL, crc & 0xff, true);
+	if (rc)
+		return rc;
+	rc = l1_serial_ppp_write(nasid, NULL, (crc >> 8) & 0xff, true);
+	if (rc)
+		return rc;
+
+	return l1_serial_ppp_write(nasid, NULL, L1_FLAG, false);
+}
+
+static int l1_packet_get(nasid_t nasid, u8 *buf, size_t buflen, size_t *rlen)
+{
+	u16 crc;
+	size_t rcvlen;
+	int data;
+
+	for (;;) {
+		data = l1_serial_getc(nasid);
+		if (data < 0)
+			return data;
+		if (data == L1_FLAG)
+			break;
+	}
+
+	rcvlen = 0;
+	crc = L1_FCS_INIT;
+	for (;;) {
+		data = l1_serial_getc(nasid);
+		if (data < 0)
+			return data;
+		if (data == L1_FLAG)	/* end of packet */
+			break;
+		if (data == L1_ESC) {
+			data = l1_serial_getc(nasid);
+			if (data < 0)
+				return data;
+			data ^= L1_TRANS;
+		}
+		if (rcvlen < buflen)
+			buf[rcvlen] = data;
+		rcvlen++;
+		crc = crc_ccitt_byte(crc, data);
+	}
+
+	if (rcvlen > buflen)
+		return -EMSGSIZE;	/* did not fit the buffer */
+	if (rcvlen < 2)
+		return -EBADMSG;	/* short packet */
+
+	rcvlen -= 2;			/* crc bytes */
+	if (crc != L1_FCS_GOOD)
+		return -EBADMSG;	/* CRC error */
+
+	*rlen = rcvlen;
+	return 0;
+}
+
+/*
+ * Returns the would-be length even when the buffer is too small, and
+ * SIZE_MAX for an unknown argument type.
+ */
+static size_t l1_command_build(u8 *buf, size_t buflen, u32 address,
+			       u16 request, int nargs, va_list ap)
+{
+	u32 data;
+	size_t len = 0;
+	int argtype;
+	const char *str;
+
+	if (buflen >= 1) {
+		*buf++ = L1PKT_REQUEST | L1CH_MISC;
+		buflen--;
+	}
+	len++;
+
+	if (buflen >= 4) {
+		put_unaligned_be32(address, buf);
+		buf += 4;
+		buflen -= 4;
+	}
+	len += 4;
+
+	if (buflen >= 2) {
+		put_unaligned_be16(request, buf);
+		buf += 2;
+		buflen -= 2;
+	}
+	len += 2;
+
+	if (buflen >= 1) {
+		*buf++ = nargs;
+		buflen--;
+	}
+	len++;
+
+	while (nargs-- != 0) {
+		argtype = va_arg(ap, int);
+		switch (argtype) {
+		case L1_ARG_INT:
+			data = va_arg(ap, u32);
+			if (buflen >= 5) {
+				*buf++ = L1_ARG_INT;
+				put_unaligned_be32(data, buf);
+				buf += 4;
+				buflen -= 5;
+			}
+			len += 5;
+			break;
+		case L1_ARG_ASCII:
+			str = va_arg(ap, const char *);
+			data = strlen(str);
+			if (buflen >= data + 2) {
+				*buf++ = L1_ARG_ASCII;
+				memcpy(buf, str, data + 1);
+				buf += data + 1;
+				buflen -= data + 2;
+			}
+			len += data + 2;
+			break;
+		case L1_ARG_BINARY:
+			data = (u32)va_arg(ap, size_t);	/* size */
+			str = va_arg(ap, const char *);	/* data */
+			if (buflen >= 1 + data) {
+				*buf++ = L1_ARG_BINARY | data;
+				memcpy(buf, str, data);
+				buf += data;
+				buflen -= data + 1;
+			}
+			len += data + 1;
+			break;
+		default:
+			WARN_ON_ONCE(1);
+			return SIZE_MAX;
+		}
+	}
+
+	return len;
+}
+
+/* The L1 multiplexes unsolicited event and console traffic onto one wire. */
+static int l1_receive_response(nasid_t nasid, u8 *pkt, size_t *pktlen)
+{
+	size_t rcvlen;
+	int rc;
+
+	for (;;) {
+		rc = l1_packet_get(nasid, pkt, *pktlen, &rcvlen);
+		if (rc == -ETIMEDOUT)
+			return rc;
+		if (rc)		/* bad packet */
+			continue;
+		if (pkt[0] != (L1PKT_RESPONSE | L1CH_MISC))
+			continue;
+
+		*pktlen = rcvlen;
+		return 0;
+	}
+}
+
+static int l1_response_to_errno(u32 response)
+{
+	switch (response) {
+	case L1_RESP_OK:
+		return 0;
+	case L1_RESP_INVAL:
+		return -EINVAL;
+	case L1_RESP_NXDATA:
+		return -ENXIO;
+	default:
+		return -EIO;
+	}
+}
+
+/*
+ * One request and its response are a single transaction on the wire,
+ * so every entry point holds this.
+ */
+static DEFINE_SPINLOCK(l1_lock);
+
+/*
+ * Run one request/response exchange in pkt, which has to be large enough
+ * for both; returns the response's argument count.
+ */
+static int l1_transact(nasid_t nasid, u8 *pkt, size_t pktsize, u32 address,
+		       u16 request, u8 **rargs, size_t *rarglen, int nargs, ...)
+{
+	va_list ap;
+	size_t pktlen;
+	int rc;
+
+	if (!system_is_ip35)
+		return -ENODEV;
+
+	va_start(ap, nargs);
+	pktlen = l1_command_build(pkt, pktsize, address, request, nargs, ap);
+	va_end(ap);
+	if (pktlen > pktsize)
+		return -ENOMEM;
+
+	rc = l1_packet_put(nasid, pkt, pktlen);
+	if (rc)
+		return rc;
+
+	pktlen = pktsize;
+	rc = l1_receive_response(nasid, pkt, &pktlen);
+	if (rc)
+		return rc;
+
+	if (pktlen < 6)
+		return -EIO;
+
+	rc = l1_response_to_errno(get_unaligned_be32(&pkt[1]));
+	if (rc)
+		return rc;
+
+	if (rargs) {
+		*rargs = pkt + 6;
+		*rarglen = pktlen - 6;
+	}
+
+	return pkt[5];
+}
+
+/*
+ * Send a plaintext command to the L1's own console command parser, the
+ * same strings a human types at the L1 console. Such a command can reset
+ * the Hub, or cut power to it, before the L1 answers, so an error here
+ * means "no response", never "retry".
+ */
+int l1_exec_command(const char *cmd)
+{
+	u32 address = L1_ADDRESS(L1_TYPE_L1,
+				 L1_ADDRESS_LOCAL | L1_TASK_COMMAND);
+	u8 pkt[64 + 64];	/* command and response packet buffer */
+	unsigned long flags;
+	bool locked;
+	int rc;
+
+	/*
+	 * Reset and poweroff reach this after smp_send_stop(), so a stopped
+	 * CPU may hold the lock for good; go to the wire either way.
+	 */
+	locked = spin_trylock_irqsave(&l1_lock, flags);
+
+	rc = l1_transact(get_nasid(), pkt, sizeof(pkt), address,
+			 L1_REQ_EXEC_CMD, NULL, NULL, 1,
+			 L1_ARG_ASCII, cmd);
+
+	if (locked)
+		spin_unlock_irqrestore(&l1_lock, flags);
+
+	if (rc < 0)
+		return rc;
+
+	/* nothing is expected back besides the response code */
+	return rc == 0 ? 0 : -EIO;
+}
-- 
2.47.3

