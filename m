Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81EFB526A80;
	Tue, 13 Oct 2026 13:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897585; cv=none; b=TgvyytupldRFyG7/25vNA2fxUKqKtna7mqO2CrEC53UTw814Ek6tN/mGFpePMqCcKcRyehFmgKDgnuXB2Dxbgw4TAhJSVwJcr1i+DRYYijYZdQpRRdHuBSy5odB8+N1oV8wnB+EFv/3BRB9jSv7W+xA4ctUKwG5YqC8umUjwJ08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897585; c=relaxed/simple;
	bh=bwHXxRfydIEW1nY8GDV36QkBYyY9ulofllErcgB85jk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S5E74h5yPCKyfIPrgfjcFK+GAhCi/F0itejVeL2ni8e8lJNZW4S0F9pPrgJq42ZWBFDWN0tD9DKQVOaq+CU26aqaZrJmtfS8Sv03bWOTGejogHTz3bp3rZXkX+VJljScQXN/oTZBuasI4t0L8B5b++LwCrAQ25rNYQiFz7s8kwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SVlk8kQG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SVlk8kQG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 023011F00893;
	Tue, 13 Oct 2026 13:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791897584;
	bh=Gf4lCp+btrGqtjHldoN03MibWOLYRUnv3ZC4R5Mc9zY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SVlk8kQG0OEJcUrWGp548brhdUnQyozgJeSGOkKNjy/pyFDcLEeHi1wKx22Crxhoc
	 3GO1iJ4Us3w0cLRhK+RQsYz6h+X/r5J6IHUEzDwczawt4rFaUHHXf3d1MzB6vkt1IC
	 Dk6Llnya6oogM7tZBKJ25VS7Tf0ss/J4hnE00Szr+fQvLdjhzCQ1FFpMaTNMvCzdkD
	 NmN6pwC/0ju7HBCVy7cwP4cTGUR8O2Ep2WMVZFCrIYiWQWrOTZOysz0oY+OlvkgyBH
	 JVhWUxtmNPQyxptNaxjamZ4mEMZCjydyu7z/P2HDfs7aG3GRY9pebXmCuJRJYAcJVi
	 xDrD72cC6dquQ==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	mfd@lists.linux.dev
Subject: [PATCH v2 36/53] mfd: ioc3: Add IP34 system-board entry to ioc3_infos[]
Date: Tue, 13 Oct 2026 15:16:56 +0200
Message-ID: <5dcf33cd8b5af8edcc044e37f37c57410f9b46fc.1791890466.git.kaloz@kernel.org>
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

Register the Fuel system board's on-board IOC3 and its M48T35, whose
year register counts from 1968 as on other IP35-family machines.
Bridge-side detection was already merged in commit 2c4288719806 ("MIPS:
PCI: Add detection of IOC3 on IO7, IO8, IO9 and Fuel"), which matches
the board part number "030-1707-"; the cell table had no entry to go
with it. Without one the IOC3 falls to the CAD DUO default, which
instantiates no serial cell, so Fuel comes up with no ttyS0.

Fixes: 2c4288719806 ("MIPS: PCI: Add detection of IOC3 on IO7, IO8, IO9 and Fuel")
Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 drivers/mfd/ioc3.c | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/mfd/ioc3.c b/drivers/mfd/ioc3.c
index 57956c00263f..95794dc9931c 100644
--- a/drivers/mfd/ioc3.c
+++ b/drivers/mfd/ioc3.c
@@ -517,6 +517,51 @@ static int ip30_sysboard_setup(struct ioc3_priv_data *ipd)
 	return ioc3_led_setup(ipd);
 }
 
+static const struct mfd_cell ip34_m48t35_cells[] = {
+	{
+		.name = "rtc-m48t35-ip35",
+		.resources = ioc3_m48t35_resources,
+		.num_resources = ARRAY_SIZE(ioc3_m48t35_resources),
+	}
+};
+
+/*
+ * Fuel's timekeeper is the M48T35 at IOC3_BYTEBUS_DEV0. A read at IP30's
+ * DS1685 address never completes on the Fuel system board.
+ */
+static int ip34_sysboard_setup(struct ioc3_priv_data *ipd)
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
+	ret = ioc3_serial_setup(ipd);
+	if (ret)
+		return ret;
+
+	ret = mfd_add_devices(&ipd->pdev->dev, PLATFORM_DEVID_AUTO,
+			      ip34_m48t35_cells, ARRAY_SIZE(ip34_m48t35_cells),
+			      &ipd->pdev->resource[0], 0, ipd->domain);
+	if (ret) {
+		dev_err(&ipd->pdev->dev, "Failed to add M48T35 subdev\n");
+		return ret;
+	}
+
+	ret = ioc3_kbd_setup(ipd);
+	if (ret)
+		return ret;
+
+	return ioc3_led_setup(ipd);
+}
+
 static int ioc3_menet_setup(struct ioc3_priv_data *ipd)
 {
 	int ret, io_irq;
@@ -574,6 +619,7 @@ static struct {
 	IOC3_SID("IP27 BaseIO", IP27_BASEIO, &ip27_baseio_setup),
 	IOC3_SID("IP29 System Board", IP29_SYSBOARD, &ip27_baseio6g_setup),
 	IOC3_SID("IP30 System Board", IP30_SYSBOARD, &ip30_sysboard_setup),
+	IOC3_SID("IP34 System Board", IP34_SYSBOARD, &ip34_sysboard_setup),
 	IOC3_SID("MENET", MENET, &ioc3_menet_setup),
 	IOC3_SID("MENET4", MENET4, &ioc3_menet4_setup)
 };
-- 
2.47.3

