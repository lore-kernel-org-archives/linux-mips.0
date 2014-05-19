Received: from mail-bn1blp0185.outbound.protection.outlook.com ([207.46.163.185]:55528
        "EHLO na01-bn1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6854847AbaESQzVuopRb (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 19 May 2014 18:55:21 +0200
From: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
Subject: [PATCH v2 09/12] kvm tools: Handle virtio/pci I/O space as little endian.
Date: Mon, 19 May 2014 18:53:28 +0200
Message-ID: <1400518411-9759-10-git-send-email-andreas.herrmann@caviumnetworks.com>
In-Reply-To: <1400518411-9759-1-git-send-email-andreas.herrmann@caviumnetworks.com>
References: <1400518411-9759-1-git-send-email-andreas.herrmann@caviumnetworks.com>
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
To: Pekka Enberg <penberg@kernel.org>
Cc: David Daney <ddaney.cavm@gmail.com>, Andreas Herrmann <andreas.herrmann@caviumnetworks.com>, kvm@vger.kernel.org, linux-mips@linux-mips.org, James Hogan <james.hogan@imgtec.com>, David Daney <david.daney@cavium.com>
Message-ID: <20140519165328.QF1PtSKxO5L9tGrqbHSnixuk0E65GyN85lP2z5qTghA@z>

From: David Daney <david.daney@cavium.com>

It doesn't work on big endian hosts as is.

Signed-off-by: David Daney <david.daney@cavium.com>
Signed-off-by: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
---
 tools/kvm/pci.c        |   16 +++++++++++++---
 tools/kvm/virtio/pci.c |    6 +++---
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/tools/kvm/pci.c b/tools/kvm/pci.c
index c2da152..e4857b9 100644
--- a/tools/kvm/pci.c
+++ b/tools/kvm/pci.c
@@ -10,7 +10,7 @@
 
 #define PCI_BAR_OFFSET(b)		(offsetof(struct pci_device_header, bar[b]))
 
-static union pci_config_address		pci_config_address;
+static u32 pci_config_address_bits;
 
 /* This is within our PCI gap - in an unused area.
  * Note this is a PCI *bus address*, is used to assign BARs etc.!
@@ -49,7 +49,7 @@ static void *pci_config_address_ptr(u16 port)
 	void *base;
 
 	offset	= port - PCI_CONFIG_ADDRESS;
-	base	= &pci_config_address;
+	base	= &pci_config_address_bits;
 
 	return base + offset;
 }
@@ -79,6 +79,10 @@ static struct ioport_operations pci_config_address_ops = {
 
 static bool pci_device_exists(u8 bus_number, u8 device_number, u8 function_number)
 {
+	union pci_config_address pci_config_address;
+
+	pci_config_address.w = ioport__read32(&pci_config_address_bits);
+
 	if (pci_config_address.bus_number != bus_number)
 		return false;
 
@@ -90,6 +94,9 @@ static bool pci_device_exists(u8 bus_number, u8 device_number, u8 function_numbe
 
 static bool pci_config_data_out(struct ioport *ioport, struct kvm *kvm, u16 port, void *data, int size)
 {
+	union pci_config_address pci_config_address;
+
+	pci_config_address.w = ioport__read32(&pci_config_address_bits);
 	/*
 	 * If someone accesses PCI configuration space offsets that are not
 	 * aligned to 4 bytes, it uses ioports to signify that.
@@ -103,6 +110,9 @@ static bool pci_config_data_out(struct ioport *ioport, struct kvm *kvm, u16 port
 
 static bool pci_config_data_in(struct ioport *ioport, struct kvm *kvm, u16 port, void *data, int size)
 {
+	union pci_config_address pci_config_address;
+
+	pci_config_address.w = ioport__read32(&pci_config_address_bits);
 	/*
 	 * If someone accesses PCI configuration space offsets that are not
 	 * aligned to 4 bytes, it uses ioports to signify that.
@@ -133,7 +143,7 @@ void pci__config_wr(struct kvm *kvm, union pci_config_address addr, void *data,
 			void *p = device__find_dev(DEVICE_BUS_PCI, dev_num)->data;
 			struct pci_device_header *hdr = p;
 			u8 bar = (offset - PCI_BAR_OFFSET(0)) / (sizeof(u32));
-			u32 sz = PCI_IO_SIZE;
+			u32 sz = cpu_to_le32(PCI_IO_SIZE);
 
 			if (bar < 6 && hdr->bar_size[bar])
 				sz = hdr->bar_size[bar];
diff --git a/tools/kvm/virtio/pci.c b/tools/kvm/virtio/pci.c
index 665d492..f0ae8d4 100644
--- a/tools/kvm/virtio/pci.c
+++ b/tools/kvm/virtio/pci.c
@@ -376,9 +376,9 @@ int virtio_pci__init(struct kvm *kvm, void *dev, struct virtio_device *vdev,
 							| PCI_BASE_ADDRESS_SPACE_MEMORY),
 		.status			= cpu_to_le16(PCI_STATUS_CAP_LIST),
 		.capabilities		= (void *)&vpci->pci_hdr.msix - (void *)&vpci->pci_hdr,
-		.bar_size[0]		= IOPORT_SIZE,
-		.bar_size[1]		= IOPORT_SIZE,
-		.bar_size[2]		= PCI_IO_SIZE * 2,
+		.bar_size[0]		= cpu_to_le32(IOPORT_SIZE),
+		.bar_size[1]		= cpu_to_le32(IOPORT_SIZE),
+		.bar_size[2]		= cpu_to_le32(PCI_IO_SIZE*2),
 	};
 
 	vpci->dev_hdr = (struct device_header) {
-- 
1.7.9.5
