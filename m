Received: from mail-bn3nam01on0049.outbound.protection.outlook.com ([104.47.33.49]:41312
        "EHLO NAM01-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23991998AbcIJUy4NT4bH (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Sat, 10 Sep 2016 22:54:56 +0200
Subject: [PATCH v3] usb: dwc3: OCTEON: add support for device tree
From: "Steven J. Hill" <Steven.Hill@cavium.com>
Message-ID: <57D47313.7040109@cavium.com>
Date: Sat, 10 Sep 2016 15:54:43 -0500
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-Path: <Steven.Hill@cavium.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, David Daney <david.daney@cavium.com>
Message-ID: <20160910205443.lg7OW3r177mTz_K7PX0Skc0CeXe27jleuVYuj0YVEfI@z>

This patch adds support to parse probe data for
the dwc3-octeon driver using device tree. The
DWC3 IP core is found on OCTEON III processors.

Signed-off-by: Steven J. Hill <Steven.Hill@cavium.com>

Changes in v3:
- Massive simplification of glue logic. Almost all the
  work is done in the SoC platform code.
Changes in v2:
- Changed comment block to acurately describe why the DMA
  properties are being set.
- Deleted 'dwc3_octeon_remove()' function as it serves
  no purpose. Also changed driver from tristate to a
  boolen as we have no plans to make it modular.
- Changed driver dependency from CAVIUM_OCTEON_SOC to
  CPU_CAVIUM_OCTEON || COMPILE_TEST per Balbi's request.

---
 drivers/usb/dwc3/Kconfig       | 10 +++++++
 drivers/usb/dwc3/Makefile      |  1 +
 drivers/usb/dwc3/dwc3-octeon.c | 61 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 72 insertions(+)
 create mode 100644 drivers/usb/dwc3/dwc3-octeon.c

diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
index a64ce1c..f2cb24b 100644
--- a/drivers/usb/dwc3/Kconfig
+++ b/drivers/usb/dwc3/Kconfig
@@ -105,4 +105,14 @@ config USB_DWC3_ST
 	  inside (i.e. STiH407).
 	  Say 'Y' or 'M' if you have one such device.

+config USB_DWC3_OCTEON
+	bool "Cavium OCTEON III Platforms"
+	depends on CPU_CAVIUM_OCTEON || COMPILE_TEST
+	depends on OF
+	default USB_DWC3
+	help
+	  Cavium OCTEON III SoCs with one DesignWare Core USB3 IP
+	  inside (i.e. cn71xx and cn78xx).
+	  Say 'Y' or 'M' if you have one such device.
+
 endif
diff --git a/drivers/usb/dwc3/Makefile b/drivers/usb/dwc3/Makefile
index 22420e1..f1a7a3e 100644
--- a/drivers/usb/dwc3/Makefile
+++ b/drivers/usb/dwc3/Makefile
@@ -39,3 +39,4 @@ obj-$(CONFIG_USB_DWC3_PCI)		+= dwc3-pci.o
 obj-$(CONFIG_USB_DWC3_KEYSTONE)		+= dwc3-keystone.o
 obj-$(CONFIG_USB_DWC3_OF_SIMPLE)	+= dwc3-of-simple.o
 obj-$(CONFIG_USB_DWC3_ST)		+= dwc3-st.o
+obj-$(CONFIG_USB_DWC3_OCTEON)		+= dwc3-octeon.o
diff --git a/drivers/usb/dwc3/dwc3-octeon.c b/drivers/usb/dwc3/dwc3-octeon.c
new file mode 100644
index 0000000..ae84a01
--- /dev/null
+++ b/drivers/usb/dwc3/dwc3-octeon.c
@@ -0,0 +1,61 @@
+/**
+ * dwc3-octeon.c - Cavium OCTEON III DWC3 Specific Glue Layer
+ *
+ * Copyright (C) 2016 Cavium Networks
+ *
+ * Author: Steven J. Hill <steven.hill@cavium.com>
+ *
+ * This program is free software: you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2  of
+ * the License as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * Inspired by dwc3-exynos.c and dwc3-st.c files.
+ */
+
+#include <linux/module.h>
+#include <linux/device.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include <linux/dma-mapping.h>
+
+static int dwc3_octeon_probe(struct platform_device *pdev)
+{
+	struct device		*dev = &pdev->dev;
+	int			ret;
+
+	/*
+	 * Right now device-tree probed devices do not provide
+	 * "dma-ranges" or "dma-coherent" properties.
+	 */
+	ret = dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(64));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static const struct of_device_id octeon_dwc3_match[] = {
+	{ .compatible = "cavium,octeon-7130-usb-uctl", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, octeon_dwc3_match);
+
+static struct platform_driver dwc3_octeon_driver = {
+	.probe		= dwc3_octeon_probe,
+	.driver		= {
+		.name	= "octeon-dwc3",
+		.of_match_table = octeon_dwc3_match,
+		.pm	= NULL,
+	},
+};
+module_platform_driver(dwc3_octeon_driver);
+
+MODULE_ALIAS("platform:octeon-dwc3");
+MODULE_AUTHOR("Steven J. Hill <steven.hill@cavium.com");
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("DesignWare USB3 OCTEON Glue Layer");
-- 
1.9.1
