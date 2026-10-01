Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C645372CF;
	Thu,  1 Oct 2026 16:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790871259; cv=none; b=ifqlpAzI4T6exU3ITGQS032c+uRThxvVeYXNW5OG5WGgdvoAS1ZGtrzR3ePyxTCM8Szkd5O+gPyZ6x47nUn4hKx1pjc1ZqJnj04kxdQaW/JDoj2vVOqwO/rUVdtCDlwxOifZAqseMdN68ckkghi+FzxJeSYmJJzxn426lnoMgsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790871259; c=relaxed/simple;
	bh=Mw5YrTwHR1XvbI/aSJQjmni8G+Cf4oB+IA9WtlUpaCk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GB1Aak6uf0Ig9lY8FV/zMS43j6uz5ckr4W622eX5Mx0a58N42AEZeR57MRgC0wUfSe1FSt51cFcPsBXPwwraW3qOHm+JiphVpQmtZ2Al5zhV2o5CZnBvLfxW+msXqC3OSgS7CBTjfd4recIPopiwBT8wftxIgrKAgtiUQf5t19E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fRsk2u1x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fRsk2u1x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04CCC1F000FF;
	Thu,  1 Oct 2026 16:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790871257;
	bh=+Gy7DnHlHXJnAY0NKjSNUBsuDK+nF2ZBGa1p8D0VqOE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fRsk2u1xZmxIFtr40Ee3QfJ3DN8xdq30qPCGU4X1KypoLVpMFK4bnMsTvKTfqoAhs
	 uU6JSNMgRHXCd/eu74C1aW96LBaoo5Xb9YRxJjD2eY0zutssSAddKtB/A7BiTTIYBz
	 eqlp1j2CFNCvl0DouhhXw6rjdR7JnIfzvbEePIyHPbbBHYbfjVqBZrlpVclzgp4Guu
	 99PYuZwSshrpXdJBszrTHw0wKWGrWL35q0zyN4Vx1Fd9b8zqHGjMyF6QhTTJGc8XNN
	 1ZEePU6QoIKbjLncQBxAHcziqdYowibFjXBLmtQpUzfUlF65Go/KblQ4Vk1ntVqwT1
	 cLv7DAmqf5Ntw==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 29/38] MIPS: SGI-IP27: wire the L1 into reset and the Ethernet address
Date: Thu,  1 Oct 2026 18:12:04 +0200
Message-ID: <8a46ae651f7012eb3145ce29b003b658162ba75e.1790857966.git.kaloz@kernel.org>
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

On Bedrock hubs restart, halt and poweroff go through the L1 system
controller, and ioc3-eth takes its MAC address from the L1's board
information area.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/sgi-ip27/ip27-l1.c    | 266 ++++++++++++++++++++++++++++++++
 arch/mips/sgi-ip27/ip27-reset.c |  47 +++++-
 2 files changed, 305 insertions(+), 8 deletions(-)

diff --git a/arch/mips/sgi-ip27/ip27-l1.c b/arch/mips/sgi-ip27/ip27-l1.c
index da3095b66cf1..25f9be350c0b 100644
--- a/arch/mips/sgi-ip27/ip27-l1.c
+++ b/arch/mips/sgi-ip27/ip27-l1.c
@@ -25,6 +25,8 @@
  */
 #include <linux/kernel.h>
 #include <linux/errno.h>
+#include <linux/etherdevice.h>
+#include <linux/hex.h>
 #include <linux/serial_reg.h>
 #include <linux/spinlock.h>
 #include <linux/stdarg.h>
@@ -66,6 +68,7 @@
 	 (L1_ADDRESS_BAY_LOCAL << L1_ADDRESS_BAY_SHIFT))
 
 #define L1_TASK_COMMAND		0x03
+#define L1_TASK_GENERAL		0x06
 
 /* response codes */
 #define L1_RESP_OK		((u32)0)
@@ -75,6 +78,27 @@
 /* L1_TASK_COMMAND requests */
 #define L1_REQ_EXEC_CMD		0x0000	/* interpret plaintext command */
 
+/* L1_TASK_GENERAL requests */
+#define L1_REQ_EEPROM		0x0006	/* access eeprom */
+
+/* L1_REQ_EEPROM additional argument values (non C-brick component) */
+#define L1_EEP_LOGIC		0x01	/* logic board */
+/* ia code */
+#define L1_EEP_BOARD		0x02	/* board ia */
+
+#define EEPROM_CHUNK		0x40
+
+/*
+ * Information Area type/length byte: bits 7-6 are the type (0 binary,
+ * 1 BCD, 2 packed 6-bit ascii, 3 8-bit ascii), bits 5-0 the length.
+ */
+#define IA_TYPE_SHIFT		6
+#define IA_TYPE_BINARY		0
+#define IA_TYPE_ASCII		3
+#define IA_LENGTH_MASK		0x3f
+#define IA_TL(t, l)		(((t) << IA_TYPE_SHIFT) | (l))
+#define IA_EOF			IA_TL(IA_TYPE_ASCII, 1)
+
 /* Async-HDLC framing bytes; linux/ppp_defs.h would drag in skbuff.h. */
 #define L1_FLAG			0x7e
 #define L1_ESC			0x7d
@@ -96,6 +120,10 @@
 #define L1_UART_ADDRESS(nasid, r) \
 	((u64 *)(NODE_HSPEC_BASE(nasid) + L1_RHSPEC_OFFSET + L1_UART_REG(r)))
 
+/* Board IA record buffer; the probed length is checked against it. */
+#define L1_IA_BUF_SIZE		512
+static u8 l1_ia_buf[L1_IA_BUF_SIZE];
+
 static int l1_serial_getc(nasid_t nasid)
 {
 	unsigned int n;
@@ -221,6 +249,48 @@ static int l1_packet_get(nasid_t nasid, u8 *buf, size_t buflen, size_t *rlen)
 	return 0;
 }
 
+static int l1_packet_get_int(u8 **buf, size_t *buflen, u32 *rval)
+{
+	u8 *b = *buf;
+
+	if (*buflen < 5)
+		return -EIO;
+	if (*b++ != L1_ARG_INT)
+		return -EINVAL;
+
+	*rval = get_unaligned_be32(b);
+	b += 4;
+	*buf = b;
+	*buflen -= 5;
+
+	return 0;
+}
+
+static int l1_packet_get_binary(u8 **buf, size_t *buflen, u8 **rval,
+				size_t *rlen)
+{
+	u8 *b = *buf;
+	size_t datalen;
+
+	if (*buflen < 1)
+		return -EIO;
+	if ((*b & L1_ARG_BINARY) == 0)
+		return -EINVAL;
+
+	datalen = *b & ~L1_ARG_BINARY;
+	if (*buflen < 1 + datalen)
+		return -ENOMEM;
+
+	b++;
+	*rval = b;
+	*rlen = datalen;
+	*buflen -= 1 + datalen;
+	b += datalen;
+	*buf = b;
+
+	return 0;
+}
+
 /*
  * Returns the would-be length even when the buffer is too small, and
  * SIZE_MAX for an unknown argument type.
@@ -421,3 +491,199 @@ int l1_exec_command(const char *cmd)
 	/* nothing is expected back besides the response code */
 	return rc == 0 ? 0 : -EIO;
 }
+
+/* Read a component's board IA record from EEPROM. */
+static int l1_read_board_ia(nasid_t nasid, int type, unsigned int component,
+			    u8 **ria, size_t *rialen)
+{
+	u32 address = L1_ADDRESS(type, L1_ADDRESS_LOCAL | L1_TASK_GENERAL);
+	u8 pkt[64 + EEPROM_CHUNK];
+	u8 *args, *chunk;
+	size_t arglen, chunklen, ialen, iapos;
+	u32 data;
+	int rc;
+
+	rc = l1_transact(nasid, pkt, sizeof(pkt), address, L1_REQ_EEPROM,
+			 &args, &arglen, 4,
+			 L1_ARG_INT, (u32)component,
+			 L1_ARG_INT, (u32)L1_EEP_BOARD,
+			 L1_ARG_INT, (u32)0,	/* offset */
+			 L1_ARG_INT, (u32)0);	/* size (0 = probe) */
+	if (rc < 0)
+		return rc;
+	if (rc != 1)
+		return -EIO;
+
+	rc = l1_packet_get_int(&args, &arglen, &data);
+	if (rc)
+		return -EIO;
+
+	ialen = (size_t)data;
+	if (ialen == 0 || ialen > L1_IA_BUF_SIZE)
+		return -ENOMEM;
+
+	iapos = 0;
+	while (iapos < ialen) {
+		rc = l1_transact(nasid, pkt, sizeof(pkt), address,
+				 L1_REQ_EEPROM, &args, &arglen, 4,
+				 L1_ARG_INT, (u32)component,
+				 L1_ARG_INT, (u32)L1_EEP_BOARD,
+				 L1_ARG_INT, (u32)iapos,
+				 L1_ARG_INT, (u32)EEPROM_CHUNK);
+		if (rc < 0)
+			return rc;
+		if (rc != 2)
+			return -EIO;
+
+		rc = l1_packet_get_int(&args, &arglen, &data);
+		if (rc)
+			return -EIO;
+
+		rc = l1_packet_get_binary(&args, &arglen, &chunk, &chunklen);
+		if (rc)
+			return -EIO;
+
+		/* should not happen; the bound keeps the loop finite */
+		if (chunklen == 0)
+			return -EIO;
+
+		if (chunklen > ialen - iapos)
+			chunklen = ialen - iapos;
+
+		memcpy(l1_ia_buf + iapos, chunk, chunklen);
+		iapos += chunklen;
+	}
+
+	/* the sum of all IA bytes has to be 0 mod 256 */
+	data = 0;
+	for (iapos = 0; iapos < ialen; iapos++)
+		data += l1_ia_buf[iapos];
+	if ((data & 0xff) != 0)
+		return -EINVAL;
+
+	*ria = l1_ia_buf;
+	*rialen = ialen;
+	return 0;
+}
+
+/* IA record walk helper: advance past one record, without passing EOF. */
+static size_t ia_skip(const u8 *ia, size_t iapos, size_t ialen)
+{
+	size_t npos;
+
+	if (ia[iapos] == IA_EOF)
+		return iapos;
+
+	npos = iapos + 1 + (ia[iapos] & IA_LENGTH_MASK);
+	return npos >= ialen ? iapos : npos;
+}
+
+static int l1_get_brick_ethernet_address(nasid_t nasid, u8 *enaddr)
+{
+	u8 *ia;
+	u8 group;
+	size_t iapos, ialen;
+	int i, rc;
+
+	/* assumes the local brick's L1 answers for this node */
+	rc = l1_read_board_ia(nasid, L1_TYPE_L1, L1_EEP_LOGIC, &ia, &ialen);
+	if (rc)
+		return rc;
+
+	/*
+	 * ia[0] is the board-IA format version. Below 2 the encryption-key
+	 * (G/P/Y) and Ethernet-address groups follow the fixed records
+	 * implicitly; from 2 on an extra selector record comes first: 0
+	 * keys only, 1 keys then address, 2 neither, 3 a config group.
+	 * Otherwise the walk follows l1_get_brick_ethernet_address() in
+	 * OpenBSD/sgi's l1.c.
+	 */
+	if (ia[1] < 2 || ia[1] * 8UL > ialen)
+		return -EINVAL;
+
+	/* skip the fixed part, then mfg, product, serial, part */
+	iapos = 6;
+	iapos = ia_skip(ia, iapos, ialen);
+	iapos = ia_skip(ia, iapos, ialen);
+	iapos = ia_skip(ia, iapos, ialen);
+	iapos = ia_skip(ia, iapos, ialen);
+	/* skip FRU (1 raw byte) */
+	if (iapos < ialen - 1)
+		iapos++;
+	/* skip board rev, eeprom size, temp waiver */
+	iapos = ia_skip(ia, iapos, ialen);
+	iapos = ia_skip(ia, iapos, ialen);
+	iapos = ia_skip(ia, iapos, ialen);
+
+	if (ia[0] >= 2) {
+		if (iapos + 1 >= ialen)
+			return -ENXIO;
+		group = ia[iapos + 1];
+		iapos = ia_skip(ia, iapos, ialen);
+		if (group != 1)
+			return -ENXIO;	/* no ethernet-address group here */
+		/* the three encryption-key records precede the address */
+		iapos = ia_skip(ia, iapos, ialen);
+		iapos = ia_skip(ia, iapos, ialen);
+		iapos = ia_skip(ia, iapos, ialen);
+	} else {
+		if (iapos < ialen && ia[iapos] == IA_TL(IA_TYPE_BINARY, 4)) {
+			iapos = ia_skip(ia, iapos, ialen);
+			iapos = ia_skip(ia, iapos, ialen);
+			iapos = ia_skip(ia, iapos, ialen);
+		}
+	}
+
+	if (iapos >= ialen - 1 - 12 || ia[iapos] != IA_TL(IA_TYPE_ASCII, 12))
+		return -EINVAL;
+
+	iapos++;
+	for (i = 0; i < ETH_ALEN; i++) {
+		int hi = hex_to_bin(ia[iapos + i * 2]);
+		int lo = hex_to_bin(ia[iapos + i * 2 + 1]);
+
+		if (hi < 0 || lo < 0)
+			return -EINVAL;
+		enaddr[i] = (hi << 4) | lo;
+	}
+
+	return is_valid_ether_addr(enaddr) ? 0 : -EINVAL;
+}
+
+static u8 ip27_l1_mac_addr[ETH_ALEN];
+static bool ip27_l1_mac_addr_valid;
+static bool ip27_l1_mac_addr_tried;
+
+/*
+ * A board that sources its MAC elsewhere, such as Tezro's tg3, yields
+ * nothing here, so a failure logs at debug level rather than warning.
+ */
+unsigned char *arch_get_platform_mac_address(void)
+{
+	unsigned long flags;
+	int rc;
+
+	if (!system_is_ip35)
+		return NULL;
+
+	spin_lock_irqsave(&l1_lock, flags);
+
+	if (!ip27_l1_mac_addr_tried) {
+		ip27_l1_mac_addr_tried = true;
+
+		rc = l1_get_brick_ethernet_address(get_nasid(),
+						   ip27_l1_mac_addr);
+		if (rc) {
+			pr_debug("l1: EEPROM MAC address read failed (%d)\n",
+				 rc);
+		} else {
+			ip27_l1_mac_addr_valid = true;
+			pr_info("l1: EEPROM Ethernet address %pM\n",
+				ip27_l1_mac_addr);
+		}
+	}
+
+	spin_unlock_irqrestore(&l1_lock, flags);
+
+	return ip27_l1_mac_addr_valid ? ip27_l1_mac_addr : NULL;
+}
diff --git a/arch/mips/sgi-ip27/ip27-reset.c b/arch/mips/sgi-ip27/ip27-reset.c
index 5ac5ad638734..1e55636393f0 100644
--- a/arch/mips/sgi-ip27/ip27-reset.c
+++ b/arch/mips/sgi-ip27/ip27-reset.c
@@ -3,12 +3,17 @@
  * License.  See the file "COPYING" in the main directory of this archive
  * for more details.
  *
- * Reset an IP27.
+ * Reset an IP27, or an IP35-family (Bedrock hub) machine.
+ *
+ * On Bedrock hubs restart and halt ask the L1 system controller to reset
+ * the machine and fall back to an NI port reset if it has not acted
+ * within five seconds; poweroff asks the L1 to cut power.
  *
  * Copyright (C) 1997, 1998, 1999, 2000, 06 by Ralf Baechle
  * Copyright (C) 1999, 2000 Silicon Graphics, Inc.
  */
 #include <linux/compiler.h>
+#include <linux/delay.h>
 #include <linux/kernel.h>
 #include <linux/sched.h>
 #include <linux/timer.h>
@@ -25,6 +30,7 @@
 #include <asm/sn/agent.h>
 #include <asm/sn/arch.h>
 #include <asm/sn/gda.h>
+#include <asm/sn/l1.h>
 
 #include "ip27-common.h"
 
@@ -34,6 +40,15 @@ void machine_power_off(void) __noreturn;
 
 #define noreturn while(1);				/* Silence gcc.	 */
 
+static void ip35_reset(void)
+{
+	l1_exec_command("rst");
+	mdelay(5000);
+	LOCAL_HUB_S(NI_RESET_ENABLE_IP35, NI_RESET_OK_IP35);
+	LOCAL_HUB_S(NI_PORT_RESET_IP35,
+		    NI_RESET_ACTION_IP35 | NI_RESET_LOCAL_IP35);
+}
+
 /* XXX How to pass the reboot command to the firmware??? */
 static void ip27_machine_restart(char *command)
 {
@@ -45,12 +60,16 @@ static void ip27_machine_restart(char *command)
 #ifdef CONFIG_SMP
 	smp_send_stop();
 #endif
+	if (system_is_ip35) {
+		ip35_reset();
+	} else {
 #if 0
-	for_each_online_node(i)
-		REMOTE_HUB_S(i, PROMOP_REG, PROMOP_REBOOT);
+		for_each_online_node(i)
+			REMOTE_HUB_S(i, PROMOP_REG, PROMOP_REBOOT);
 #else
-	LOCAL_HUB_S(NI_PORT_RESET, NPR_PORTRESET | NPR_LOCALRESET);
+		LOCAL_HUB_S(NI_PORT_RESET, NPR_PORTRESET | NPR_LOCALRESET);
 #endif
+	}
 	noreturn;
 }
 
@@ -61,15 +80,27 @@ static void ip27_machine_halt(void)
 #ifdef CONFIG_SMP
 	smp_send_stop();
 #endif
-	for_each_online_node(i)
-		REMOTE_HUB_S(i, PROMOP_REG, PROMOP_RESTART);
-	LOCAL_HUB_S(NI_PORT_RESET, NPR_PORTRESET | NPR_LOCALRESET);
+	if (system_is_ip35) {
+		ip35_reset();
+	} else {
+		for_each_online_node(i)
+			REMOTE_HUB_S(i, PROMOP_REG, PROMOP_RESTART);
+		LOCAL_HUB_S(NI_PORT_RESET, NPR_PORTRESET | NPR_LOCALRESET);
+	}
 	noreturn;
 }
 
 static void ip27_machine_power_off(void)
 {
-	/* To do ...  */
+	if (system_is_ip35) {
+#ifdef CONFIG_SMP
+		smp_send_stop();
+#endif
+		l1_exec_command("pwr d");
+		mdelay(5000);
+		pr_info("Please power off the system manually.\n");
+	}
+	/* IP27 (Hub) has no software poweroff path. */
 	noreturn;
 }
 
-- 
2.47.3

