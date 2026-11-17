Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794875505;
	b=e9DBK6+jneY06uMiipxhM13Y/PoFyYUUJB8RpVxL/PgWfLuOUxh1LvJjW/fQj4TAoNqW
	 dkCW++c3grXr8nvN83sXHK3db1S8/gMzS6tboQt93M7mpHfBMNwcAK0Z6Pn7Q5BkfX1zd
	 Vmy2vA68JC6qgGUpVkh0/gFpikqWiwDXAAGFcrKy9iSC1WpwM1c9GVl3VVhQ09zWrQvK0
	 y6M+9+dOjIp95MRHF+BCifQrJhl2QbUV5xL1QJgfa4t9X0x6cGo0zswjtk4vrH5CNdZ8S
	 jVzYIWFLk5wNxmO25D8d79cj6DjhBZWMQUSn7sbLne6XlarVvYuqEFD8pqPMPLYJgEQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794875505;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=yMUhDzXaOJy+c2J8PhwTccXavO/Ui6eLbP4ybUBnyNU=;
	b=u612Yk18ael8uhg7zCX9wvg+Y41C0zPyEZwmht/RsH13n+vI5gWBzoufeQvZ3FKMh5hO
	 Gz8nZbQjsrSymYkt521Twz5TrBQ3JGwRSb/vhcrlwTbKtrqFvTZuV3VwbagbIDqa7TUTb
	 pG+mHnvMmxs9g5qj8mYMKtDNuG5gBcNG1O638fgD9k4oLrrJAFVxS4XutkVmxTZ8iyd9l
	 8zoRJWDWGkfRTi9RuTFwmWqGs/6QphtxGIenGSn0UFmrI8RnmoP8GXhJrlqnIOI8TS8De
	 ClZ1k9NBxGkKBZ0mPaxzI+X70e1OigziGoPtcwKshSUHyUC5DBtKZYdEJxUfTz/Q25Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RzU5Uih0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0C0606A330;
	Tue, 17 Nov 2026 00:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RzU5Uih0
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794875505;
	b=2oABvxrsLWugLx9u0EyCuOOjxKnO1zLkviSfaWohWfnjY8GeMpDQUZLNgAeNk+nd35o+
	 b4BjCKDTas1gUod8QOU0P1+CwItryoaC6bKRGuABIEdeJ+n3Q5SUUPFAMCH3H4S0+b9ZO
	 gfEJIZIdcOzohS1cr8zEj35D19ARPaYkqU7Eaii6FMJC6q8KMwEzr1OtpxaGE42K/U+2n
	 xQniZO/V7h71vvhAkpCrNB8XrP87tyBxj8x6+H0C/F4XEb25krPuJWEa31Yzq1MzW8NXu
	 2EJxlrJg8R0+fC58sZ3bSo2JcBXH40oQfXfag8gGIR1XaK7F8GWgVS4rBCDRBE/oyJw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794875505;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=yMUhDzXaOJy+c2J8PhwTccXavO/Ui6eLbP4ybUBnyNU=;
	b=ZV5Q3Mc6I5OxmRlMtcgNzVT1f04D01j6a2IhYlq85jTSXQ37TfFweOQfWp/c7yYeL89q
	 OhGF5eCrLX+2MWH/G0U8N1xlwfBirWDLEXYsgVHNOUgdEHjCYet8qQLCvGpzZoUewvmXM
	 VG6wdQJEhOAe1WvzgtnNnj9bZ4s+SOuZRZ3gnMDKY+63+RdAVLumrL0q+jsU6AcBkS820
	 zyaJtHN1EuF96tQG478jIBEAD+5D+4tEYJvglTeVi06RE8+1rxVTU3gCWgQI3K8SsKEm0
	 DMF1mXj9vK57R9n7GE1gdaAG+Mn4t+Njb47y1cps9xbdJyoTWGlnbyP6I7KGRogCrIQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 86D251F000C6;
	Tue, 17 Nov 2026 00:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794875505;
	bh=yMUhDzXaOJy+c2J8PhwTccXavO/Ui6eLbP4ybUBnyNU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=RzU5Uih0JHTpRQZRlX/Jz58j2ArrR35n3Nd34zXKIBPCRK2JAjIflrlWZcu5wPDSd
	 nFgTGv+TPV5Cu1v49z5iWD+Y+s5bhXn6dEmR6+UJGeUretGLxDqZ6jJS9DfRDz5kRT
	 yDpZF4qRSJRsdzQMYyZ901OABJH+TPxhnrFk/XxCJrpxWC9NYwhRYtfsyqFbn5BLY9
	 mw0bnbvqboSNbbHKQ4+Ugy6M1z/RA+c5jwBDyzwf8zt/A1ldjTbQgm2kHow3oex+2Y
	 WbiV1EXzGrMkvr3MJKtHb/qFASHqdMRXoc9yJJpxiWyKNsyhqDP6ZlUVw6mrBWsZ4u
	 I7OsAzMp29bkg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 12C964A64D;
	Tue, 17 Nov 2026 00:31:44 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Mon, 16 Nov 2026 19:31:33 -0500
Subject: [PATCH v2 2/2] phy: siflower: Add SF19A2890 USB 2.0 PHY driver
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-sf19a2890-usb-phy-v2-2-df3ce9d23f5a@telaak.dev>
References: <20261116-sf19a2890-usb-phy-v2-0-df3ce9d23f5a@telaak.dev>
In-Reply-To: <20261116-sf19a2890-usb-phy-v2-0-df3ce9d23f5a@telaak.dev>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Chuanhong Guo <gch981213@gmail.com>, linux-mips@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794875503; l=7116;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=8HvG1pdy9K5Hi5HXJ2aiw/2AyyYBFJcOC4UpudfQu64=;
 b=UdoDRWnPY4rkXXAP+VdrRfKV79cOCnmlpxd0Xtt/IKof8gn0MJ9dzSntD39By6SLP3IdPoBks
 Ena7c97tAyRBbECyvTTycQfpFEAGME8WjZViEmS5jVGQHLGiZTCzFEi
X-Developer-Key: i=joseph@telaak.dev; a=ed25519;
 pk=oQI+UfddlZ0wK2ac4WKOGNjUl1ZEN8j9ZVFSqEDoNP0=
X-Endpoint-Received: by B4 Relay for joseph@telaak.dev/20261104 with
 auth_id=1404
X-Original-From: Joseph Telaak <joseph@telaak.dev>
Reply-To: joseph@telaak.dev

From: Chuanhong Guo <gch981213@gmail.com>

Add a driver for the USB 2.0 PHY of the Siflower SF19A2890. Powering it
on enables its reference clock, releases its two resets and takes it
out of sleep.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
[Joseph Telaak:
  - take the SF19A2890 PHY only, from Chuanhong's siflower-7.1 branch
  - name the resets "por" and "phy"
  - get and toggle the two resets with the bulk reset API
  - dev_err_probe() for the resets
  - drop the unused includes and drvdata
  - Kconfig dependencies and help, commit message and subject]
Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 MAINTAINERS                              |   1 +
 drivers/phy/Kconfig                      |   1 +
 drivers/phy/Makefile                     |   1 +
 drivers/phy/siflower/Kconfig             |  12 +++
 drivers/phy/siflower/Makefile            |   2 +
 drivers/phy/siflower/phy-sf19a2890-usb.c | 132 +++++++++++++++++++++++++++++++
 6 files changed, 149 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7033d9b6152d..b9d5cfd3e30b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25703,6 +25703,7 @@ M:	Joseph Telaak <joseph@telaak.dev>
 L:	linux-phy@lists.infradead.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/phy/siflower,sf19a2890-usb-phy.yaml
+F:	drivers/phy/siflower/phy-sf19a2890-usb.c
 
 SILEAD TOUCHSCREEN DRIVER
 M:	Hans de Goede <hansg@kernel.org>
diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 105fbe408aa2..8ba351e23c09 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -194,6 +194,7 @@ source "drivers/phy/realtek/Kconfig"
 source "drivers/phy/renesas/Kconfig"
 source "drivers/phy/rockchip/Kconfig"
 source "drivers/phy/samsung/Kconfig"
+source "drivers/phy/siflower/Kconfig"
 source "drivers/phy/socionext/Kconfig"
 source "drivers/phy/sophgo/Kconfig"
 source "drivers/phy/spacemit/Kconfig"
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index c6dd02003bbe..8c917c4c5531 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -46,6 +46,7 @@ obj-$(CONFIG_GENERIC_PHY)		+= allwinner/	\
 					   renesas/	\
 					   rockchip/	\
 					   samsung/	\
+					   siflower/	\
 					   socionext/	\
 					   sophgo/	\
 					   spacemit/	\
diff --git a/drivers/phy/siflower/Kconfig b/drivers/phy/siflower/Kconfig
new file mode 100644
index 000000000000..5ae1f83d1449
--- /dev/null
+++ b/drivers/phy/siflower/Kconfig
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config PHY_SF19A2890_USB
+	tristate "Siflower SF19A2890 USB 2.0 PHY driver"
+	depends on MACH_SIFLOWER_MIPS || COMPILE_TEST
+	depends on OF
+	select GENERIC_PHY
+	help
+	  Enable this to support the USB 2.0 PHY of the Siflower SF19A2890,
+	  used by its DWC2 controller. Its reference clock and its resets
+	  come from the USB block's clock and reset manager.
+	  Say M or Y if the kernel is to run on this SoC.
diff --git a/drivers/phy/siflower/Makefile b/drivers/phy/siflower/Makefile
new file mode 100644
index 000000000000..a12383193429
--- /dev/null
+++ b/drivers/phy/siflower/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_PHY_SF19A2890_USB)	+= phy-sf19a2890-usb.o
diff --git a/drivers/phy/siflower/phy-sf19a2890-usb.c b/drivers/phy/siflower/phy-sf19a2890-usb.c
new file mode 100644
index 000000000000..a7de66e54cba
--- /dev/null
+++ b/drivers/phy/siflower/phy-sf19a2890-usb.c
@@ -0,0 +1,132 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/array_size.h>
+#include <linux/clk.h>
+#include <linux/device-id/of.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+
+#define USB_SLEEPM 0x4
+
+struct sf19a2890_usb_phy {
+	struct device *dev;
+	struct clk *phy_clk;
+	/* Asserted in this order, deasserted in reverse */
+	struct reset_control_bulk_data resets[2];
+	void __iomem *base;
+};
+
+static int sf19a2890_usb_phy_power_on(struct phy *phy)
+{
+	struct sf19a2890_usb_phy *p_phy = phy_get_drvdata(phy);
+	int ret;
+
+	ret = clk_prepare_enable(p_phy->phy_clk);
+	if (ret) {
+		dev_err(p_phy->dev, "failed to enable the PHY clock: %d\n",
+			ret);
+		return ret;
+	}
+
+	ret = reset_control_bulk_deassert(ARRAY_SIZE(p_phy->resets),
+					  p_phy->resets);
+	if (ret)
+		goto err_disable_clk;
+
+	writel(1, p_phy->base + USB_SLEEPM);
+	return 0;
+
+err_disable_clk:
+	clk_disable_unprepare(p_phy->phy_clk);
+	return ret;
+}
+
+static int sf19a2890_usb_phy_power_off(struct phy *phy)
+{
+	struct sf19a2890_usb_phy *p_phy = phy_get_drvdata(phy);
+
+	writel(0, p_phy->base + USB_SLEEPM);
+	reset_control_bulk_assert(ARRAY_SIZE(p_phy->resets), p_phy->resets);
+	clk_disable_unprepare(p_phy->phy_clk);
+	return 0;
+}
+
+static const struct phy_ops sf19a2890_usb_phy_ops = {
+	.power_on = sf19a2890_usb_phy_power_on,
+	.power_off = sf19a2890_usb_phy_power_off,
+	.owner = THIS_MODULE,
+};
+
+static int sf19a2890_usb_phy_probe(struct platform_device *pdev)
+{
+	struct sf19a2890_usb_phy *p_phy;
+	struct phy_provider *provider;
+	struct phy *phy;
+	int ret;
+
+	p_phy = devm_kzalloc(&pdev->dev, sizeof(*p_phy), GFP_KERNEL);
+	if (!p_phy)
+		return -ENOMEM;
+
+	p_phy->dev = &pdev->dev;
+
+	p_phy->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(p_phy->base))
+		return PTR_ERR(p_phy->base);
+
+	p_phy->phy_clk = devm_clk_get(p_phy->dev, NULL);
+	if (IS_ERR(p_phy->phy_clk))
+		return dev_err_probe(p_phy->dev, PTR_ERR(p_phy->phy_clk),
+				     "failed to get the PHY clock\n");
+
+	p_phy->resets[0].id = "por";
+	p_phy->resets[1].id = "phy";
+	ret = devm_reset_control_bulk_get_exclusive(p_phy->dev,
+						    ARRAY_SIZE(p_phy->resets),
+						    p_phy->resets);
+	if (ret)
+		return dev_err_probe(p_phy->dev, ret,
+				     "failed to get the resets\n");
+
+	ret = reset_control_bulk_assert(ARRAY_SIZE(p_phy->resets),
+					p_phy->resets);
+	if (ret)
+		return ret;
+
+	phy = devm_phy_create(p_phy->dev, NULL, &sf19a2890_usb_phy_ops);
+	if (IS_ERR(phy))
+		return dev_err_probe(p_phy->dev, PTR_ERR(phy),
+				     "failed to create the PHY\n");
+
+	phy_set_drvdata(phy, p_phy);
+
+	provider = devm_of_phy_provider_register(p_phy->dev,
+						 of_phy_simple_xlate);
+	if (IS_ERR(provider))
+		return dev_err_probe(p_phy->dev, PTR_ERR(provider),
+				     "failed to register the PHY provider\n");
+
+	return 0;
+}
+
+static const struct of_device_id sf19a2890_usb_phy_of_match[] = {
+	{ .compatible = "siflower,sf19a2890-usb-phy" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, sf19a2890_usb_phy_of_match);
+
+static struct platform_driver sf19a2890_usb_phy_driver = {
+	.probe		= sf19a2890_usb_phy_probe,
+	.driver		= {
+		.name	= "sf19a2890-usb-phy",
+		.of_match_table = sf19a2890_usb_phy_of_match,
+	},
+};
+module_platform_driver(sf19a2890_usb_phy_driver);
+
+MODULE_AUTHOR("Ziying Wu <ziying.wu@siflower.com.cn>");
+MODULE_DESCRIPTION("Siflower SF19A2890 USB 2.0 PHY driver");
+MODULE_LICENSE("GPL");

-- 
Git-155)


