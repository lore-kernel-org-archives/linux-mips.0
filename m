Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD2E5383C6;
	Thu,  1 Oct 2026 16:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790871260; cv=none; b=LtJNzTQ9MjCQWyzHJK7/drDU/SsZPs9Fo9IGsJonln6TlELb/wx1V5Tt/RVu2lS2IIR2svD3u5JxIZw8JRX+r2xZvAmF9seOSB35OTntgrm+BQc74iqSIWZTQak2FI4i+US8JHHGMmECuGogIb+aEgyp2iqWfMk++iSldCIaxJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790871260; c=relaxed/simple;
	bh=RroAd8UZcU+Y375o9bFAKmGh2P6hkvDDsXtZUgaIWoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cg1GPc44retPMnQa6m24B8cJ1+8UrTsgyLrX0bJJ/WtUnLNDOIrFcKJ5mgo42q7UpLB86fOoj6j9WPkxZrOae+DjgRAWxi1nXkxNIEioeo0PYgN8iVX3Wo62ldmno6wvxUMf30FnBW17ydxkmbGwNSzwTT81zxl7dmdYV8bYwJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UfhKlnlp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UfhKlnlp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C510B1F00898;
	Thu,  1 Oct 2026 16:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790871258;
	bh=xSfka7Qm9Zhk7SLI+NPU0qQ0vaYEUintOpLLjISf/9E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UfhKlnlpKQDeBjLGoy6hRWIIk600+sjATVhKPdMhPZz4W505mcTaotITHmpgGFY3L
	 XBGkfMxFgwQKatMharOE/BX15knFdmg5m62uFuGI3q8TQPXv6fLSgWsHDiGitHktyi
	 mZT6oJPRSapu62LwAFeqQqV1ASqDx68lMfpD6bwtSHwFGD2T72Mc6SKnzxHgg1YDWL
	 fErLJc3pCwlTFthyGUEhtEsiVZk0a7dfGaz44pnzeTacMpcnFUUKHWQR8Qk5oMlPrY
	 jNpNa/gV/G1UJ9fpGTzLa9AOIDZ3uoy3Ij8w/gmKWSi1rUvDodjkyb1FOHyYYpfb/J
	 nLOOxqGj+80Lw==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 30/38] MIPS: PCI: xtalk-bridge: take the board part number from the L1
Date: Thu,  1 Oct 2026 18:12:05 +0200
Message-ID: <e8aa94c609966bfea8dd95d6636db5110cc75aab.1790857966.git.kaloz@kernel.org>
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

An XBridge answers nothing on the b_nic 1-wire pin, so
bridge_get_partnum() finds no PROM and the probe defers forever. Stop
waiting on XBridge and PIC widgets; on Bedrock hubs read the assembly
number from the L1 instead.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/include/asm/sn/l1.h    |  7 +++
 arch/mips/pci/pci-xtalk-bridge.c | 37 +++++++++++++-
 arch/mips/sgi-ip27/ip27-l1.c     | 83 ++++++++++++++++++++++++++++++++
 3 files changed, 125 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/sn/l1.h b/arch/mips/include/asm/sn/l1.h
index e61935e2fac8..1a3b7fa0e213 100644
--- a/arch/mips/include/asm/sn/l1.h
+++ b/arch/mips/include/asm/sn/l1.h
@@ -9,6 +9,13 @@
 
 #include <linux/types.h>
 
+/*
+ * Which L1 EEPROM component id carries which board is undocumented and
+ * differs from machine to machine, so a caller walks the whole range.
+ */
+#define L1_BOARD_COMPONENT_MAX	8
+
 int l1_exec_command(const char *cmd);
+int l1_read_board_partnum(unsigned int component, char *buf, size_t len);
 
 #endif /* __ASM_SN_L1_H */
diff --git a/arch/mips/pci/pci-xtalk-bridge.c b/arch/mips/pci/pci-xtalk-bridge.c
index 35ae7c423973..c97533653ef6 100644
--- a/arch/mips/pci/pci-xtalk-bridge.c
+++ b/arch/mips/pci/pci-xtalk-bridge.c
@@ -18,7 +18,9 @@
 #include <asm/pci/bridge.h>
 #include <asm/paccess.h>
 #include <asm/sn/irq_alloc.h>
+#include <asm/sn/addrs.h>
 #include <asm/sn/ioc3.h>
+#include <asm/sn/l1.h>
 
 #define CRC16_INIT	0
 #define CRC16_VALID	0xb001
@@ -583,6 +585,29 @@ static const struct {
 	BRIDGE_BOARD_SETUP("030-1707-", bridge_setup_ip34_fuel_sysboard),
 };
 
+/*
+ * The L1 answers one board information area per EEPROM component id, and
+ * which id carries which board is undocumented. Ask for each in turn and take
+ * the first answer the table above knows.
+ */
+static int bridge_l1_partnum(char *partnum, size_t len)
+{
+	unsigned int component;
+	int i;
+
+	for (component = 0; component < L1_BOARD_COMPONENT_MAX; component++) {
+		if (l1_read_board_partnum(component, partnum, len))
+			continue;
+
+		for (i = 0; i < ARRAY_SIZE(bridge_ioc3_devid); i++)
+			if (!strncmp(partnum, bridge_ioc3_devid[i].match,
+				     strlen(bridge_ioc3_devid[i].match)))
+				return 0;
+	}
+
+	return -ENODEV;
+}
+
 static void bridge_setup_board(struct bridge_controller *bc, char *partnum)
 {
 	int i;
@@ -657,8 +682,16 @@ static int bridge_probe(struct platform_device *pdev)
 	int err;
 
 	/* get part number from one wire prom */
-	if (bridge_get_partnum(virt_to_phys((void *)bd->bridge_addr), partnum))
-		return -EPROBE_DEFER; /* not available yet */
+	if (bridge_get_partnum(virt_to_phys((void *)bd->bridge_addr),
+			       partnum)) {
+		/* Only a classic Bridge waits for its 1-wire PROM. */
+		if (!bd->is_xbridge && !bd->is_pic)
+			return -EPROBE_DEFER; /* not available yet */
+
+		if (!IS_ENABLED(CONFIG_SGI_IP27) || !system_is_ip35 ||
+		    bridge_l1_partnum(partnum, sizeof(partnum)))
+			partnum[0] = '\0';
+	}
 
 	parent = irq_get_default_domain();
 	if (!parent)
diff --git a/arch/mips/sgi-ip27/ip27-l1.c b/arch/mips/sgi-ip27/ip27-l1.c
index 25f9be350c0b..173a506595da 100644
--- a/arch/mips/sgi-ip27/ip27-l1.c
+++ b/arch/mips/sgi-ip27/ip27-l1.c
@@ -650,6 +650,89 @@ static int l1_get_brick_ethernet_address(nasid_t nasid, u8 *enaddr)
 	return is_valid_ether_addr(enaddr) ? 0 : -EINVAL;
 }
 
+/*
+ * The L1 stores SGI assembly numbers with underscores where the printed
+ * form has dashes: "030_1707_003" for "030-1707-003".
+ */
+static int l1_get_board_partnum(nasid_t nasid, unsigned int component,
+				char *buf, size_t len)
+{
+	size_t iapos, ialen, fieldlen, i;
+	u8 *ia;
+	int rc;
+
+	rc = l1_read_board_ia(nasid, L1_TYPE_L1, component, &ia, &ialen);
+	if (rc)
+		return rc;
+
+	if (ia[1] < 2 || ia[1] * 8UL > ialen)
+		return -EINVAL;
+
+	/* skip the fixed part, then mfg, product, serial */
+	iapos = 6;
+	iapos = ia_skip(ia, iapos, ialen);
+	iapos = ia_skip(ia, iapos, ialen);
+	iapos = ia_skip(ia, iapos, ialen);
+
+	if (iapos >= ialen || (ia[iapos] >> IA_TYPE_SHIFT) != IA_TYPE_ASCII)
+		return -EINVAL;
+
+	fieldlen = ia[iapos] & IA_LENGTH_MASK;
+	if (fieldlen == 0 || iapos + 1 + fieldlen > ialen || fieldlen >= len)
+		return -EINVAL;
+
+	iapos++;
+	for (i = 0; i < fieldlen; i++)
+		buf[i] = ia[iapos + i] == '_' ? '-' : ia[iapos + i];
+	buf[fieldlen] = '\0';
+
+	return 0;
+}
+
+/*
+ * Part numbers cannot change at runtime, so failures are cached along
+ * with successes and each component is queried once.
+ */
+#define L1_PARTNUM_SIZE		24
+static char l1_partnum[L1_BOARD_COMPONENT_MAX][L1_PARTNUM_SIZE];
+static int l1_partnum_rc[L1_BOARD_COMPONENT_MAX];
+static bool l1_partnum_cached[L1_BOARD_COMPONENT_MAX];
+
+int l1_read_board_partnum(unsigned int component, char *buf, size_t len)
+{
+	unsigned long flags;
+
+	if (component >= L1_BOARD_COMPONENT_MAX)
+		return -EINVAL;
+
+	spin_lock_irqsave(&l1_lock, flags);
+
+	if (!l1_partnum_cached[component]) {
+		l1_partnum_rc[component] =
+			l1_get_board_partnum(get_nasid(), component,
+					     l1_partnum[component],
+					     sizeof(l1_partnum[component]));
+		l1_partnum_cached[component] = true;
+
+		if (l1_partnum_rc[component])
+			pr_debug("l1: component %u: no part number (%d)\n",
+				 component, l1_partnum_rc[component]);
+		else
+			pr_debug("l1: component %u: part number %s\n",
+				 component, l1_partnum[component]);
+	}
+
+	spin_unlock_irqrestore(&l1_lock, flags);
+
+	if (l1_partnum_rc[component])
+		return l1_partnum_rc[component];
+
+	if (strscpy(buf, l1_partnum[component], len) < 0)
+		return -E2BIG;
+
+	return 0;
+}
+
 static u8 ip27_l1_mac_addr[ETH_ALEN];
 static bool ip27_l1_mac_addr_valid;
 static bool ip27_l1_mac_addr_tried;
-- 
2.47.3

