Received: from mail-bl2lp0205.outbound.protection.outlook.com ([207.46.163.205]:59443
        "EHLO na01-bl2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6855096AbaETOtchMHQe (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 20 May 2014 16:49:32 +0200
From: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
Subject: [PATCH 11/15] MIPS: paravirt: Add pci controller for virtio
Date: Tue, 20 May 2014 16:47:12 +0200
Message-ID: <1400597236-11352-12-git-send-email-andreas.herrmann@caviumnetworks.com>
In-Reply-To: <1400597236-11352-1-git-send-email-andreas.herrmann@caviumnetworks.com>
References: <1400597236-11352-1-git-send-email-andreas.herrmann@caviumnetworks.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Andreas.Herrmann@caviumnetworks.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org
Cc: David Daney <ddaney.cavm@gmail.com>, Andreas Herrmann <andreas.herrmann@caviumnetworks.com>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <james.hogan@imgtec.com>, kvm@vger.kernel.org, David Daney <david.daney@cavium.com>
Message-ID: <20140520144712.1hc9KW3ZzTMRtFuv2oxawl9teipw69Rgg1M7fbiDy_g@z>

From: David Daney <david.daney@cavium.com>

Signed-off-by: David Daney <david.daney@cavium.com>
Signed-off-by: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
---
 arch/mips/Kconfig                |    1 +
 arch/mips/paravirt/Kconfig       |    6 ++
 arch/mips/pci/Makefile           |    2 +-
 arch/mips/pci/pci-virtio-guest.c |  140 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 148 insertions(+), 1 deletion(-)
 create mode 100644 arch/mips/paravirt/Kconfig
 create mode 100644 arch/mips/pci/pci-virtio-guest.c

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index de32ab5..3621b4d 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -814,6 +814,7 @@ source "arch/mips/cavium-octeon/Kconfig"
 source "arch/mips/loongson/Kconfig"
 source "arch/mips/loongson1/Kconfig"
 source "arch/mips/netlogic/Kconfig"
+source "arch/mips/paravirt/Kconfig"
 
 endmenu
 
diff --git a/arch/mips/paravirt/Kconfig b/arch/mips/paravirt/Kconfig
new file mode 100644
index 0000000..ecae586
--- /dev/null
+++ b/arch/mips/paravirt/Kconfig
@@ -0,0 +1,6 @@
+if MIPS_PARAVIRT
+
+config MIPS_PCI_VIRTIO
+	def_bool y
+
+endif #  MIPS_PARAVIRT
diff --git a/arch/mips/pci/Makefile b/arch/mips/pci/Makefile
index d61138a..ff8a553 100644
--- a/arch/mips/pci/Makefile
+++ b/arch/mips/pci/Makefile
@@ -21,7 +21,7 @@ obj-$(CONFIG_BCM63XX)		+= pci-bcm63xx.o fixup-bcm63xx.o \
 obj-$(CONFIG_MIPS_ALCHEMY)	+= pci-alchemy.o
 obj-$(CONFIG_SOC_AR71XX)	+= pci-ar71xx.o
 obj-$(CONFIG_PCI_AR724X)	+= pci-ar724x.o
-
+obj-$(CONFIG_MIPS_PCI_VIRTIO)	+= pci-virtio-guest.o
 #
 # These are still pretty much in the old state, watch, go blind.
 #
diff --git a/arch/mips/pci/pci-virtio-guest.c b/arch/mips/pci/pci-virtio-guest.c
new file mode 100644
index 0000000..4ce5caa
--- /dev/null
+++ b/arch/mips/pci/pci-virtio-guest.c
@@ -0,0 +1,140 @@
+/*
+ * This file is subject to the terms and conditions of the GNU General Public
+ * License.  See the file "COPYING" in the main directory of this archive
+ * for more details.
+ *
+ * Copyright (C) 2013 Cavium, Inc.
+ */
+
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/pci.h>
+
+#include <asm/byteorder.h>
+#include <asm/io.h>
+
+#define PCI_CONFIG_ADDRESS	0xcf8
+#define PCI_CONFIG_DATA		0xcfc
+
+union pci_config_address {
+	struct {
+#ifdef __LITTLE_ENDIAN
+		unsigned	register_number	: 8;		/* 7  .. 0  */
+		unsigned	devfn_number	: 8;		/* 15 .. 8  */
+		unsigned	bus_number	: 8;		/* 23 .. 16 */
+		unsigned	reserved	: 7;		/* 30 .. 24 */
+		unsigned	enable_bit	: 1;		/* 31       */
+#else
+		unsigned	enable_bit	: 1;		/* 31       */
+		unsigned	reserved	: 7;		/* 30 .. 24 */
+		unsigned	bus_number	: 8;		/* 23 .. 16 */
+		unsigned	devfn_number	: 8;		/* 15 .. 8  */
+		unsigned	register_number	: 8;		/* 7  .. 0  */
+#endif
+	};
+	u32 w;
+};
+
+int pcibios_plat_dev_init(struct pci_dev *dev)
+{
+	return 0;
+}
+
+int pcibios_map_irq(const struct pci_dev *dev, u8 slot, u8 pin)
+{
+	return ((pin + slot) % 4)+ MIPS_IRQ_PCIA;
+}
+
+static unsigned long pci_virtio_guest_write_config_addr(struct pci_bus *bus, unsigned int devfn, int reg)
+{
+	union pci_config_address pca;
+
+	pca.w = 0;
+	pca.register_number = reg;
+	pca.devfn_number = devfn;
+	pca.bus_number = bus->number;
+	pca.enable_bit = 1;
+
+	outl(pca.w, PCI_CONFIG_ADDRESS);
+
+	return PCI_CONFIG_DATA + (reg & 3);
+}
+
+static int pci_virtio_guest_write_config(struct pci_bus *bus, unsigned int devfn,
+					 int reg, int size, u32 val)
+{
+	unsigned long port = pci_virtio_guest_write_config_addr(bus, devfn, reg);
+
+	switch (size) {
+	case 1:
+		outb(val, port);
+		return PCIBIOS_SUCCESSFUL;
+	case 2:
+		outw(val, port);
+		return PCIBIOS_SUCCESSFUL;
+	case 4:
+		outl(val, port);
+		return PCIBIOS_SUCCESSFUL;
+	default:
+		return PCIBIOS_FUNC_NOT_SUPPORTED;
+	}
+}
+
+static int pci_virtio_guest_read_config(struct pci_bus *bus, unsigned int devfn,
+					int reg, int size, u32 *val)
+{
+	unsigned long port = pci_virtio_guest_write_config_addr(bus, devfn, reg);
+
+	switch (size) {
+	case 1:
+		*val = inb(port);
+		return PCIBIOS_SUCCESSFUL;
+	case 2:
+		*val = inw(port);
+		return PCIBIOS_SUCCESSFUL;
+	case 4:
+		*val = inl(port);
+		return PCIBIOS_SUCCESSFUL;
+	default:
+		return PCIBIOS_FUNC_NOT_SUPPORTED;
+	}
+}
+
+static struct pci_ops pci_virtio_guest_ops = {
+	.read  = pci_virtio_guest_read_config,
+	.write = pci_virtio_guest_write_config,
+};
+
+static struct resource pci_virtio_guest_mem_resource = {
+	.name = "Virtio MEM",
+	.flags = IORESOURCE_MEM,
+	.start	= 0x10000000,
+	.end	= 0x1dffffff
+};
+
+static struct resource pci_virtio_guest_io_resource = {
+	.name = "Virtio IO",
+	.flags = IORESOURCE_IO,
+	.start	= 0,
+	.end	= 0xffff
+};
+
+static struct pci_controller pci_virtio_guest_controller = {
+	.pci_ops = &pci_virtio_guest_ops,
+	.mem_resource = &pci_virtio_guest_mem_resource,
+	.io_resource = &pci_virtio_guest_io_resource,
+};
+
+static int __init pci_virtio_guest_setup(void)
+{
+	pr_err("pci_virtio_guest_setup\n");
+
+	/* Virtio comes pre-assigned */
+	pci_set_flags(PCI_PROBE_ONLY);
+
+	pci_virtio_guest_controller.io_map_base = mips_io_port_base;
+	register_pci_controller(&pci_virtio_guest_controller);
+	return 0;
+}
+arch_initcall(pci_virtio_guest_setup);
-- 
1.7.9.5
