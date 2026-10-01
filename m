Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399B753A3AA;
	Thu,  1 Oct 2026 16:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790871270; cv=none; b=QCZto0y2Z7/hQp+u6L2Yz/liwJb9d9DpTPG0hfAT8IxmNv/0st8dusfQQK+RhAB+v7PRRHDZpJt5gdjqI0ECgJUNt/0n3DiNv/JfvBwO+dNAVsuUw/j6jXoLY0rpeGKrZbzMiMf4iH4X6t27wFpwojj+WTEfav/Exmg03JpNSfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790871270; c=relaxed/simple;
	bh=8tSZ4zbzKOqmYkLkeRrEPQVN5GUXPpHklRj95Y9dkhk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p2pCB4OBIM+SqsPaALqpKOP1iepRZxX+RenbqW9NWCJzJe6v+kkx/fQ9bOYDXhEn+cwfyHKI+MJ2cgwxRRJSMldmw+GsxWW2COof76W2qO6bERBAWsiqfcpFAwwrFcoIkyU/HcC5jum4zoErqMyEhYEmape5PWVcCu3WCRf2Dvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LdQCxVSM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LdQCxVSM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23D5B1F000FF;
	Thu,  1 Oct 2026 16:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790871269;
	bh=OXyTITu9D/IvJ9jBB3Z3XJwdAe6qBwDhHlfEXCbHj9w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LdQCxVSMAySknxP6NkZui6fpwBJt53Nh0V7U0blAfvCIN6Pw/kdbcVkhMRVcYcxr8
	 atW4ndpv6KG21YkYYRkFFb+MYxGw1cHiybfPv7M5VnRiyM5hbehXuZuPGcM19kjk3o
	 yC3Id/7rxBrmJvyq2HYOch5IGqJrAmxcRV8bfIYJ7S2un1tCBuwAgDNTNhlzRq6qh7
	 TxrmQewkmhyyxbMckfF1ONUGCOAoyhN4338s9/3pJlyzC4KKj2NGFlJPez+AgHiIA/
	 KywcRQEjuYXBA8s+WPL1+O43lEGeTuxwhOUl98OG900GkcWFghjC6SC54X7RgfYUlQ
	 +kRt8GuumvONw==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 35/38] MIPS: SGI-IP27: identify the machine by the L1 brick type
Date: Thu,  1 Oct 2026 18:12:10 +0200
Message-ID: <d4ea8cf57059fa4544c7be577c6a8033d65ced9a.1790857966.git.kaloz@kernel.org>
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

On a Bedrock hub, name the machine after the brick-type code the L1
reports for its chassis. Attached graphics makes an Origin an Onyx, so
a graphics-class KLCONFIG board picks between the two names. An
unlisted code keeps "SGI IP35".

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/include/asm/sn/l1.h  |  1 +
 arch/mips/sgi-ip27/ip27-init.c | 68 ++++++++++++++++++++++++++++++++++
 arch/mips/sgi-ip27/ip27-l1.c   | 45 ++++++++++++++++++++++
 3 files changed, 114 insertions(+)

diff --git a/arch/mips/include/asm/sn/l1.h b/arch/mips/include/asm/sn/l1.h
index 1a3b7fa0e213..f9fa8a8051e6 100644
--- a/arch/mips/include/asm/sn/l1.h
+++ b/arch/mips/include/asm/sn/l1.h
@@ -17,5 +17,6 @@
 
 int l1_exec_command(const char *cmd);
 int l1_read_board_partnum(unsigned int component, char *buf, size_t len);
+int l1_read_brick_type(void);
 
 #endif /* __ASM_SN_L1_H */
diff --git a/arch/mips/sgi-ip27/ip27-init.c b/arch/mips/sgi-ip27/ip27-init.c
index c92f1bef692e..7f16d7f437c9 100644
--- a/arch/mips/sgi-ip27/ip27-init.c
+++ b/arch/mips/sgi-ip27/ip27-init.c
@@ -13,12 +13,15 @@
 #include <linux/mm.h>
 #include <linux/export.h>
 #include <linux/cpumask.h>
+#include <linux/ctype.h>
 #include <asm/bootinfo.h>
 #include <asm/cpu.h>
 #include <asm/io.h>
+#include <asm/prom.h>
 #include <asm/sgialib.h>
 #include <asm/time.h>
 #include <asm/sn/agent.h>
+#include <asm/sn/l1.h>
 #include <asm/sn/types.h>
 #include <asm/sn/klconfig.h>
 #include <asm/sn/ioc3.h>
@@ -98,6 +101,69 @@ void per_cpu_init(void)
 	enable_percpu_irq(IP27_HUB_PEND1_IRQ, IRQ_TYPE_NONE);
 }
 
+/*
+ * The boot brick's L1 type character names the machine family. What makes
+ * an Origin an Onyx is attached graphics, so a graphics-class board in the
+ * KLCONFIG picks between the two names; gfx_model is NULL for a family
+ * that has only one.
+ */
+static const struct {
+	char brick_type;
+	const char *model;
+	const char *gfx_model;
+} ip27_models[] = {
+	{ '4', "SGI Origin 300", "SGI Onyx 300" },
+	{ '7', "SGI Origin 350", "SGI Onyx 350" },
+	{ '8', "SGI Onyx 350", NULL },		/* graphics blade */
+	{ '9', "SGI Tezro", NULL },		/* deskside */
+	{ 'A', "SGI Fuel", NULL },
+	{ 'C', "SGI Origin 3000", "SGI Onyx 3000" },
+	{ 'Q', "SGI Tezro Rackmount", NULL },
+};
+
+static bool __init ip27_has_graphics(void)
+{
+	nasid_t nasid;
+
+	for_each_online_node(nasid)
+		if (find_lboard_class((lboard_t *)KL_CONFIG_INFO(nasid),
+				      KLCLASS_GFX))
+			return true;
+
+	return false;
+}
+
+static void __init ip27_set_machine_name(void)
+{
+	int brick_type, i;
+	bool gfx;
+
+	if (!system_is_ip35)
+		return;
+
+	brick_type = l1_read_brick_type();
+	if (brick_type < 0)
+		return;
+
+	gfx = ip27_has_graphics();
+
+	for (i = 0; i < ARRAY_SIZE(ip27_models); i++) {
+		if (ip27_models[i].brick_type != brick_type)
+			continue;
+
+		if (gfx && ip27_models[i].gfx_model)
+			mips_set_machine_name(ip27_models[i].gfx_model);
+		else
+			mips_set_machine_name(ip27_models[i].model);
+		return;
+	}
+
+	mips_set_machine_name(get_system_type());
+	pr_info("Unlisted L1 brick type 0x%02x '%c', %s a graphics board\n",
+		brick_type, isprint(brick_type) ? brick_type : '?',
+		gfx ? "with" : "without");
+}
+
 void __init plat_mem_setup(void)
 {
 	u64 p, e, n_mode;
@@ -147,6 +213,8 @@ void __init plat_mem_setup(void)
 	ioport_resource.start = 0;
 	ioport_resource.end = ~0UL;
 	set_io_port_base(IO_BASE);
+
+	ip27_set_machine_name();
 }
 
 const char *get_system_type(void)
diff --git a/arch/mips/sgi-ip27/ip27-l1.c b/arch/mips/sgi-ip27/ip27-l1.c
index 173a506595da..98c94d14bd5f 100644
--- a/arch/mips/sgi-ip27/ip27-l1.c
+++ b/arch/mips/sgi-ip27/ip27-l1.c
@@ -79,6 +79,7 @@
 #define L1_REQ_EXEC_CMD		0x0000	/* interpret plaintext command */
 
 /* L1_TASK_GENERAL requests */
+#define L1_REQ_BRICK_ID		0x0003	/* rack, slot and brick type */
 #define L1_REQ_EEPROM		0x0006	/* access eeprom */
 
 /* L1_REQ_EEPROM additional argument values (non C-brick component) */
@@ -733,6 +734,50 @@ int l1_read_board_partnum(unsigned int component, char *buf, size_t len)
 	return 0;
 }
 
+/*
+ * The L1 answers two integers; the low byte of the second is the
+ * one-character brick-type code of its chassis.
+ */
+static int l1_get_brick_type(void)
+{
+	u32 address = L1_ADDRESS(L1_TYPE_L1,
+				 L1_ADDRESS_LOCAL | L1_TASK_GENERAL);
+	u8 pkt[64];		/* command and response packet buffer */
+	u8 *args;
+	size_t arglen;
+	u32 rack_slot, brick_type;
+	int rc;
+
+	rc = l1_transact(get_nasid(), pkt, sizeof(pkt), address,
+			 L1_REQ_BRICK_ID, &args, &arglen, 0);
+	if (rc < 0)
+		return rc;
+	if (rc != 2)
+		return -EIO;
+
+	rc = l1_packet_get_int(&args, &arglen, &rack_slot);
+	if (rc)
+		return rc;
+
+	rc = l1_packet_get_int(&args, &arglen, &brick_type);
+	if (rc)
+		return rc;
+
+	return brick_type & 0xff;
+}
+
+int l1_read_brick_type(void)
+{
+	unsigned long flags;
+	int rc;
+
+	spin_lock_irqsave(&l1_lock, flags);
+	rc = l1_get_brick_type();
+	spin_unlock_irqrestore(&l1_lock, flags);
+
+	return rc;
+}
+
 static u8 ip27_l1_mac_addr[ETH_ALEN];
 static bool ip27_l1_mac_addr_valid;
 static bool ip27_l1_mac_addr_tried;
-- 
2.47.3

