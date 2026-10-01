Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D01538D71;
	Thu,  1 Oct 2026 16:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790871262; cv=none; b=mVPH29AfNobsuIKfw5bw+D7DXdEvVxUHFE4VatHR8HTDFJdoZ71zDeYi1timW8sd42O4spYMPEb5rwa5cK0fEkRCk5wnx6gw6WCWAhz5Tnoy1uoV2lKkCIyZcowhF9XiFkaKFEjenbJixBXbQRAwnA1O1K+3R6UaUAvM2pRy2O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790871262; c=relaxed/simple;
	bh=xQJ1K208mhrVC3Xgd9NJFHdlZIyW9NeJ6PTgSlumZR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oBT/J1PbgXBRnqRx4RQtc8qKaZ6jGhYJuFDfGx9wKa6eDlHdsva/Hnbd+L7mhaM6mS0uRIZe9jEe6Ev3FPwMSHtaCyQlrdjw0Spo1Ave+D7dnQc5AVoTGcOTdKgrYzyrdwibZXphIz5Bxd3ac42sIPXb1mM+wOapNALdjNzj5fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cEy9J0PQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cEy9J0PQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60F441F000FF;
	Thu,  1 Oct 2026 16:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790871261;
	bh=ni/kUjeOL1A246agl33F2QEKyGO6xtWcOiDqU8J7MD0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cEy9J0PQoj+f1eYWsA422/nNLWSbzkeFMgKfid+BhlhSVvd09QegeBfZ8a11ok/lZ
	 XSu5C8DG2OcuBidPCOCMFKw6Hm9SggT7qar9KgAzjIgVh28KRV8JWjNd/GxASoZd7x
	 PYQw76IjZK+1Ee8xMgGjk8vA1kLO2dumZZYY8rwaVmAYubEIcZyMDh3HBMsbeHfGUx
	 jLdsjpfKsmnoT9mBIaW7LFLzN2/fjN/E2h2KUn0ILfOHFagIagx2TZv5a5sxoPZZd6
	 r6K+j+9K+HQBNETNl+ffknz7GN/9jS9DkJMkhg/L54XpgmCBKMCGJ/vw85QYuOumPu
	 zyhxnsCFhGm/g==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	mfd@lists.linux.dev
Subject: [PATCH 31/38] mfd: ioc3: add IP34 system-board entry to ioc3_infos[]
Date: Thu,  1 Oct 2026 18:12:06 +0200
Message-ID: <e9b125b8ab2422717072f447c318eff41062bd79.1790857966.git.kaloz@kernel.org>
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
index fd50bae0f10b..34dbf42087ee 100644
--- a/drivers/mfd/ioc3.c
+++ b/drivers/mfd/ioc3.c
@@ -517,6 +517,51 @@ static int ip30_sysboard_setup(struct ioc3_priv_data *ipd)
 	return ioc3_led_setup(ipd);
 }
 
+static struct mfd_cell ip34_m48t35_cells[] = {
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

