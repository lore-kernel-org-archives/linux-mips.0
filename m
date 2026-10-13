Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91637526AB8;
	Tue, 13 Oct 2026 13:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897587; cv=none; b=p3fbJ5W27tyyP53MYvDMbPQsL+7MHCj5TKKJW2/ldol/pBJfCekn5i9979PTS7mQTdwhB4fBdBq/jm1zRfILHHTwjwvkMmjqYnUOD8vQ73YQ0o3due9SFQZitqlQ8UilhV3x9Af6mcDUbe5fpif+UUL3Kav1Y3GNUsu/pAh6WPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897587; c=relaxed/simple;
	bh=kzUQGL3xcHn+eWnNAJl0kkX+oXOB5j9w8XXL7WTPxSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X1clTl9EL9+hnbaVIWtAoFxkwTb7qZNS9ZQ3eDDqgOGyh1m8FYddB6q9E9HPDgV0s62NUYiq+NA9kv+PIbcIB0ZthkZkRv1LLF3UgcP5mAj3Tgil5LVzv3hLAjOR2icXEVU9igwwcHsXnSlf9TcCDgEwqUC8qg1uIhqkYV25yOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JeE/8vFD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JeE/8vFD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 120BA1F000FF;
	Tue, 13 Oct 2026 13:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791897586;
	bh=/bhkKljz18VyBLU+Oxl90psgFVLNm9lPwBlk41Zg9OY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JeE/8vFD9DP/E7i5SimBmhvurtnSvRDZMsmUjZsfUNY3qM28nkdcyAX7mybnTqUed
	 X+NBPJezuyE9THAk/L1IbngiumUjD+uWsEWqvop2EG6Ap8R0d94aA0SEHX7kXbRgSV
	 rUzSs7lonAjQR/tksExTtmcqNvvjKvNJnLchKoAvSKyYN/km80jB0C8ZKLcOSGM3Ma
	 ij1eEdaiE07wkXz6bGHLX2pvYQrC6ZLBYrAdFi1aE92TAGLqSvzJcT5k5zL9SsvN/P
	 LyatAEuLgLprkZNp799yTHwGyBgHCNzHRfPKm5ZQ7f+874fPyDcIZzwdL3CnDE3akB
	 99ixoe/OoOEZQ==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	mfd@lists.linux.dev
Subject: [PATCH v2 37/53] mfd: ioc3: Cross the serial IRQs on the Origin 300 IO8
Date: Tue, 13 Oct 2026 15:16:57 +0200
Message-ID: <bc7275757db3f48bac90caa755feab957c57d196.1791890466.git.kaloz@kernel.org>
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

On the IO8 base I/O board the 16550 at sregs.uarta raises
SIO_IR_SB_INT and the one at sregs.uartb raises SIO_IR_SA_INT. With
the usual mapping the console never receives, because the interrupt
it enables is never asserted.

Add an IO8 entry to ioc3_infos[] that registers the serial cells with
the two IRQ resources exchanged. The board was matched as CAD DUO and
printed "ioc3: CAD DUO"; it now prints "ioc3: IO8" and gets its serial
ports.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 drivers/mfd/ioc3.c | 67 +++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 63 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/ioc3.c b/drivers/mfd/ioc3.c
index 95794dc9931c..01c919c18b06 100644
--- a/drivers/mfd/ioc3.c
+++ b/drivers/mfd/ioc3.c
@@ -223,7 +223,37 @@ static struct mfd_cell ioc3_serial_cells[] = {
 	}
 };
 
-static int ioc3_serial_setup(struct ioc3_priv_data *ipd)
+/*
+ * The UART at sregs.uarta raises IOC3_IRQ_SERIAL_B on the IO8 and
+ * sregs.uartb raises IOC3_IRQ_SERIAL_A.
+ */
+static const struct resource ioc3_uarta_crossed_resources[] = {
+	DEFINE_RES_MEM(offsetof(struct ioc3, sregs.uarta),
+		       sizeof_field(struct ioc3, sregs.uarta)),
+	DEFINE_RES_IRQ(IOC3_IRQ_SERIAL_B)
+};
+
+static const struct resource ioc3_uartb_crossed_resources[] = {
+	DEFINE_RES_MEM(offsetof(struct ioc3, sregs.uartb),
+		       sizeof_field(struct ioc3, sregs.uartb)),
+	DEFINE_RES_IRQ(IOC3_IRQ_SERIAL_A)
+};
+
+static const struct mfd_cell ioc3_serial_crossed_cells[] = {
+	{
+		.name = "ioc3-serial8250",
+		.resources = ioc3_uarta_crossed_resources,
+		.num_resources = ARRAY_SIZE(ioc3_uarta_crossed_resources),
+	},
+	{
+		.name = "ioc3-serial8250",
+		.resources = ioc3_uartb_crossed_resources,
+		.num_resources = ARRAY_SIZE(ioc3_uartb_crossed_resources),
+	}
+};
+
+static int __ioc3_serial_setup(struct ioc3_priv_data *ipd,
+			       const struct mfd_cell *cells, int num_cells)
 {
 	struct ioc3 __iomem *regs = ipd->base;
 	int ret;
@@ -241,8 +271,8 @@ static int ioc3_serial_setup(struct ioc3_priv_data *ipd)
 	udelay(1000); /* Wait until mode switch is done */
 
 	ret = mfd_add_devices(&ipd->pdev->dev, PLATFORM_DEVID_AUTO,
-			      ioc3_serial_cells, ARRAY_SIZE(ioc3_serial_cells),
-			      &ipd->pdev->resource[0], 0, ipd->domain);
+			      cells, num_cells, &ipd->pdev->resource[0], 0,
+			      ipd->domain);
 	if (ret) {
 		dev_err(&ipd->pdev->dev, "Failed to add 16550 subdevs\n");
 		return ret;
@@ -251,6 +281,12 @@ static int ioc3_serial_setup(struct ioc3_priv_data *ipd)
 	return 0;
 }
 
+static int ioc3_serial_setup(struct ioc3_priv_data *ipd)
+{
+	return __ioc3_serial_setup(ipd, ioc3_serial_cells,
+				   ARRAY_SIZE(ioc3_serial_cells));
+}
+
 static const struct resource ioc3_kbd_resources[] = {
 	DEFINE_RES_MEM(offsetof(struct ioc3, serio),
 		       sizeof_field(struct ioc3, serio)),
@@ -601,6 +637,28 @@ static int ioc3_cad_duo_setup(struct ioc3_priv_data *ipd)
 	return ioc3_kbd_setup(ipd);
 }
 
+static int ioc3_io8_setup(struct ioc3_priv_data *ipd)
+{
+	int ret, io_irq;
+
+	io_irq = ioc3_map_irq(ipd->pdev, PCI_SLOT(ipd->pdev->devfn),
+			      PCI_INTERRUPT_INTB);
+	ret = ioc3_irq_domain_setup(ipd, io_irq);
+	if (ret)
+		return ret;
+
+	ret = ioc3_eth_setup(ipd);
+	if (ret)
+		return ret;
+
+	ret = __ioc3_serial_setup(ipd, ioc3_serial_crossed_cells,
+				  ARRAY_SIZE(ioc3_serial_crossed_cells));
+	if (ret)
+		return ret;
+
+	return ioc3_kbd_setup(ipd);
+}
+
 /* Helper macro for filling ioc3_info array */
 #define IOC3_SID(_name, _sid, _setup) \
 	{								   \
@@ -621,7 +679,8 @@ static struct {
 	IOC3_SID("IP30 System Board", IP30_SYSBOARD, &ip30_sysboard_setup),
 	IOC3_SID("IP34 System Board", IP34_SYSBOARD, &ip34_sysboard_setup),
 	IOC3_SID("MENET", MENET, &ioc3_menet_setup),
-	IOC3_SID("MENET4", MENET4, &ioc3_menet4_setup)
+	IOC3_SID("MENET4", MENET4, &ioc3_menet4_setup),
+	IOC3_SID("IO8", IO8, &ioc3_io8_setup)
 };
 #undef IOC3_SID
 
-- 
2.47.3

