Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDCD52B1D1;
	Tue, 13 Oct 2026 13:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897606; cv=none; b=C+M0NfMVSFwXhyo4UHjnmxixQ8ueL7TN7fzCe5ZqbEHa+p16ynUv/ciRksnsJb6PhB1iYgvTggJpFX3cuh1QOCDOlObup2v7O5HoCLgsOcnv6f0OjXQ4CMk03uobTJk6eP/87uoxbaqcl1UhQhWU/h+l/B0lD0Y6qJL6O/GRmxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897606; c=relaxed/simple;
	bh=Z43gTV09WBJzMiJRzjF/kOfgtuw+6+OGfem94eldhKc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qfca5fg237tht2GMYKlY4hp2p11pfx/L+ItIxmBEdf8R/c6Y33mwqXmJHaHWKuqinK2bEd4YW4GPdZNszRDbfQ7rE2ZelR6b2jcE3d6cwtxOrqOQsqOjQgoXNCtl1jyadcLMBUtBDq2VODa0lf1/dc7fnolmoiFHpfgkND79mvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jHef1GY7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jHef1GY7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 173391F000FF;
	Tue, 13 Oct 2026 13:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791897605;
	bh=pUfK1+yPBspuGQGQTIODMMuZcWN4seT8rTN/PrlxJiU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jHef1GY7mqUReMUk8r7GNCfM9MGsd8a+KyyI1R/NQQDf6jxcKBTab3C3wXMofd12O
	 +SqToQ6Delg6WldEZxfGV1AG8GRzoB86oH9gvm3ljsCSu5+qlcNGu/bvKkG2iqzFU+
	 XbEIPPvD0Zo+q1RdGZCGFki1d7EWDfNl3fI2YTbk1UZJQgAPQ6YBFKedXgKLER+vCQ
	 zCdDo4lwUSQrBKyd80TqZ1wAPpQCIn3T1saOw6dzU6VptL8IZOihOF5zS7DASbvqaz
	 6EEf/L1WMu9hMQgHVL8K57ldQLvkcXBtgtm7/XrWyN5c3KZ2S7Ib0yBotHMiaIi767
	 1Zrg0KG5JibnA==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	mfd@lists.linux.dev
Subject: [PATCH v2 46/53] mfd: ioc3: Add IOC4 ATA/ATAPI cell
Date: Tue, 13 Oct 2026 15:17:06 +0200
Message-ID: <754bae380c938b63eeaa87e3dccf9755314675ed.1791890466.git.kaloz@kernel.org>
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

Add an IOC4 cell for pata_sgiioc4: a DEFINE_RES_MEM() over struct
ioc4_ata_regs and a DEFINE_RES_IRQ() for other_ir bit 0
(IOC4_OTHER_IR_ATA_INT). It joins ioc4_cells[] between the kbd and rtc
cells.

The ATA passthrough bit follows the drive's INTRQ line, which stays
asserted until Status is read, unlike the discrete events on the rest
of other_ir. Make it the one level-triggered bit of the other_ir bank.
libata reads Status while servicing the interrupt, so ioc3_irq_ack()'s
W1C write is the only ack needed.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/include/asm/sn/ioc4.h |  1 +
 drivers/mfd/ioc3.c              | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/arch/mips/include/asm/sn/ioc4.h b/arch/mips/include/asm/sn/ioc4.h
index 781fcfb81b5e..d23676ae82b4 100644
--- a/arch/mips/include/asm/sn/ioc4.h
+++ b/arch/mips/include/asm/sn/ioc4.h
@@ -129,6 +129,7 @@ struct ioc4 {
 #define IOC4_OTHER_IR_GEN_INT		0xff000000	/* generic pins */
 
 #define IOC4_OTHER_IR_KBD_INT_BIT	6	/* bit index */
+#define IOC4_OTHER_IR_ATA_INT_BIT	0	/* bit index */
 
 #define IOC4_SSCR_DMA_EN	0x10000000	/* enable ring buffer DMA */
 
diff --git a/drivers/mfd/ioc3.c b/drivers/mfd/ioc3.c
index 01c919c18b06..b471c90e737c 100644
--- a/drivers/mfd/ioc3.c
+++ b/drivers/mfd/ioc3.c
@@ -850,6 +850,13 @@ static const struct ioc3_variant ioc3_variant = {
 	(IOC4_SIO_IR_PORT_INT(0) | IOC4_SIO_IR_PORT_INT(1) | \
 	 IOC4_SIO_IR_PORT_INT(2) | IOC4_SIO_IR_PORT_INT(3))
 
+/*
+ * In other_ir only ATA passthrough is level triggered. It follows the
+ * drive's INTRQ line, which stays asserted until the host reads Status;
+ * the other other_ir bits are discrete events.
+ */
+#define IOC4_OTHER_LVL_MASK	IOC4_OTHER_IR_ATA_INT
+
 #define IOC4_UART_RES(port) {						\
 	DEFINE_RES_MEM(offsetof(struct ioc4, uart[port]),		\
 		       sizeof_field(struct ioc4, uart[port])),		\
@@ -869,6 +876,12 @@ static const struct resource ioc4_kbd_resources[] = {
 	DEFINE_RES_IRQ(IOC4_IRQ_OTHER_BASE + IOC4_OTHER_IR_KBD_INT_BIT)
 };
 
+static const struct resource ioc4_ata_resources[] = {
+	DEFINE_RES_MEM(offsetof(struct ioc4, ata),
+		       sizeof_field(struct ioc4, ata)),
+	DEFINE_RES_IRQ(IOC4_IRQ_OTHER_BASE + IOC4_OTHER_IR_ATA_INT_BIT)
+};
+
 static const struct resource ioc4_rtc_resources[] = {
 	DEFINE_RES_MEM(IOC4_BYTEBUS_DEV0, M48T35_REG_SIZE)
 };
@@ -898,6 +911,11 @@ static const struct mfd_cell ioc4_cells[] = {
 		.resources = ioc4_kbd_resources,
 		.num_resources = ARRAY_SIZE(ioc4_kbd_resources),
 	},
+	{
+		.name = "pata_sgiioc4",
+		.resources = ioc4_ata_resources,
+		.num_resources = ARRAY_SIZE(ioc4_ata_resources),
+	},
 	{
 		.name = "rtc-m48t35-ip35",
 		.resources = ioc4_rtc_resources,
@@ -974,6 +992,7 @@ static const struct ioc3_irq_bank ioc4_irq_banks[] = {
 		.ir = offsetof(struct ioc4, other_ir),
 		.ies = offsetof(struct ioc4, other_ies),
 		.iec = offsetof(struct ioc4, other_iec),
+		.lvl_mask = IOC4_OTHER_LVL_MASK,
 	},
 };
 
-- 
2.47.3

