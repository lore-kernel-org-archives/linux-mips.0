Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D83F525A7A;
	Tue, 13 Oct 2026 13:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897583; cv=none; b=pyYJN8JDA7FjpUmsG68BywwWzlEO4B791Sx8FlQee5qtN2MgykpJCWz5aJLsyTs+V33whTSw7SGAhHwpP4MSPZgpIZy0CACmaugHQDrrDkwS9zUEmpagmMi6ZAAS21XnkGtt6p6UKzSmKwP8JJ3DtdXMbAv+EGIqFQLSGpPxbdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897583; c=relaxed/simple;
	bh=i0Bum6msR35G8yv+MlSzmyPDVUOzOnmYzWwU7cKWbxI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=beT9ePpKdGbor84olkyFs2r6sI3K38+Cb2EVdW53jbCe2HKtjKt2GvJCsYCsnXDX0BKI8LSJJMEmIXuxoPuq0qbDDkskn0QBvY6P/6LAdn6JUSuZDSVV5e6J9gx/q1n6PM3CCSTJi4C0f6izCwFPDiNmnOI7ixfPQJF2iJzOuTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AgNvse3F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AgNvse3F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26B511F000FF;
	Tue, 13 Oct 2026 13:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791897582;
	bh=mrwS1QGXhMO3tgULxU/ve9a9YQngx8LQUzLSfrLgecM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AgNvse3FMgSNUQdLIGI7RkrKosYEX7P1vsbTbuVs6QXvnohljKOwgTPIm3ERDq+LG
	 Z/YqqgEfxwrSwtOvuHXhrcBh+m5ozI1RUmDXK3yb1o0sUYJlgtXNpfFSu5AAKl4fm3
	 7NrDo4oUUoma8V60mccG6pq3oj9Hm6qh1VEJv82dQIlSw2IHcTp+NgoFyhlJDUbLag
	 CdP6B0phI6BQqkKd1/ldMsPp3hGOkOiZEQl+fCMFD9IZLuSQZ3btCAKZnjg/zeJe2J
	 B9Yv9WHtgjNgQJetBQlsiLa9FTq3lIUHnTnPWpC+fpSrNo7GOFu9JWXnk+XONtsLwK
	 0VGpcf755GWOQ==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>
Subject: [PATCH v2 35/53] MIPS: PCI: xtalk-bridge: take the board part number from the L1
Date: Tue, 13 Oct 2026 15:16:55 +0200
Message-ID: <0e549534cbfdb0565f43fd2ebec3a16b1ae47b71.1791890466.git.kaloz@kernel.org>
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
index b2c3a8b207da..40d69681227c 100644
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
@@ -665,6 +667,29 @@ static const struct {
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
@@ -984,8 +1009,16 @@ static int bridge_probe(struct platform_device *pdev)
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

