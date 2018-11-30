Received: from mga17.intel.com ([192.55.52.151]:10480 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S23992081AbeK3T1m4dqHU (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 30 Nov 2018 20:27:42 +0100
From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: [PATCH RFC 01/15] MIPS: replace **** with a hug
Date: Fri, 30 Nov 2018 11:27:10 -0800
Message-Id: <20181130192737.15053-2-jarkko.sakkinen@linux.intel.com>
In-Reply-To: <20181130192737.15053-1-jarkko.sakkinen@linux.intel.com>
References: <20181130192737.15053-1-jarkko.sakkinen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-Path: <jarkko.sakkinen@intel.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-kernel@vger.kernel.org
Cc: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Joshua Kinard <kumba@gentoo.org>, "open list:MIPS" <linux-mips@linux-mips.org>

In order to comply with the CoC, replace **** with a hug.

Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
---
 arch/mips/pci/ops-bridge.c      | 24 ++++++++++++------------
 arch/mips/sgi-ip22/ip22-setup.c |  2 +-
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/mips/pci/ops-bridge.c b/arch/mips/pci/ops-bridge.c
index a1d2c4ae0d1b..c755c4c92fa9 100644
--- a/arch/mips/pci/ops-bridge.c
+++ b/arch/mips/pci/ops-bridge.c
@@ -56,7 +56,7 @@ static int pci_conf0_read_config(struct pci_bus *bus, unsigned int devfn,
 		return PCIBIOS_DEVICE_NOT_FOUND;
 
 	/*
-	 * IOC3 is fucking fucked beyond belief ...  Don't even give the
+	 * IOC3 is hugging hugged beyond belief ...  Don't even give the
 	 * generic PCI code a chance to look at it for real ...
 	 */
 	if (cf == (PCI_VENDOR_ID_SGI | (PCI_DEVICE_ID_SGI_IOC3 << 16)))
@@ -76,7 +76,7 @@ static int pci_conf0_read_config(struct pci_bus *bus, unsigned int devfn,
 oh_my_gawd:
 
 	/*
-	 * IOC3 is fucking fucked beyond belief ...  Don't even give the
+	 * IOC3 is hugging hugged beyond belief ...  Don't even give the
 	 * generic PCI code a chance to look at the wrong register.
 	 */
 	if ((where >= 0x14 && where < 0x40) || (where >= 0x48)) {
@@ -85,7 +85,7 @@ static int pci_conf0_read_config(struct pci_bus *bus, unsigned int devfn,
 	}
 
 	/*
-	 * IOC3 is fucking fucked beyond belief ...  Don't try to access
+	 * IOC3 is hugging hugged beyond belief ...  Don't try to access
 	 * anything but 32-bit words ...
 	 */
 	addr = &bridge->b_type0_cfg_dev[slot].f[fn].l[where >> 2];
@@ -118,7 +118,7 @@ static int pci_conf1_read_config(struct pci_bus *bus, unsigned int devfn,
 		return PCIBIOS_DEVICE_NOT_FOUND;
 
 	/*
-	 * IOC3 is fucking fucked beyond belief ...  Don't even give the
+	 * IOC3 is hugging hugged beyond belief ...  Don't even give the
 	 * generic PCI code a chance to look at it for real ...
 	 */
 	if (cf == (PCI_VENDOR_ID_SGI | (PCI_DEVICE_ID_SGI_IOC3 << 16)))
@@ -139,7 +139,7 @@ static int pci_conf1_read_config(struct pci_bus *bus, unsigned int devfn,
 oh_my_gawd:
 
 	/*
-	 * IOC3 is fucking fucked beyond belief ...  Don't even give the
+	 * IOC3 is hugging hugged beyond belief ...  Don't even give the
 	 * generic PCI code a chance to look at the wrong register.
 	 */
 	if ((where >= 0x14 && where < 0x40) || (where >= 0x48)) {
@@ -148,7 +148,7 @@ static int pci_conf1_read_config(struct pci_bus *bus, unsigned int devfn,
 	}
 
 	/*
-	 * IOC3 is fucking fucked beyond belief ...  Don't try to access
+	 * IOC3 is hugging hugged beyond belief ...  Don't try to access
 	 * anything but 32-bit words ...
 	 */
 	bridge->b_pci_cfg = (busno << 16) | (slot << 11);
@@ -189,7 +189,7 @@ static int pci_conf0_write_config(struct pci_bus *bus, unsigned int devfn,
 		return PCIBIOS_DEVICE_NOT_FOUND;
 
 	/*
-	 * IOC3 is fucking fucked beyond belief ...  Don't even give the
+	 * IOC3 is hugging hugged beyond belief ...  Don't even give the
 	 * generic PCI code a chance to look at it for real ...
 	 */
 	if (cf == (PCI_VENDOR_ID_SGI | (PCI_DEVICE_ID_SGI_IOC3 << 16)))
@@ -213,14 +213,14 @@ static int pci_conf0_write_config(struct pci_bus *bus, unsigned int devfn,
 oh_my_gawd:
 
 	/*
-	 * IOC3 is fucking fucked beyond belief ...  Don't even give the
+	 * IOC3 is hugging hugged beyond belief ...  Don't even give the
 	 * generic PCI code a chance to touch the wrong register.
 	 */
 	if ((where >= 0x14 && where < 0x40) || (where >= 0x48))
 		return PCIBIOS_SUCCESSFUL;
 
 	/*
-	 * IOC3 is fucking fucked beyond belief ...  Don't try to access
+	 * IOC3 is hugging hugged beyond belief ...  Don't try to access
 	 * anything but 32-bit words ...
 	 */
 	addr = &bridge->b_type0_cfg_dev[slot].f[fn].l[where >> 2];
@@ -257,7 +257,7 @@ static int pci_conf1_write_config(struct pci_bus *bus, unsigned int devfn,
 		return PCIBIOS_DEVICE_NOT_FOUND;
 
 	/*
-	 * IOC3 is fucking fucked beyond belief ...  Don't even give the
+	 * IOC3 is hugging hugged beyond belief ...  Don't even give the
 	 * generic PCI code a chance to look at it for real ...
 	 */
 	if (cf == (PCI_VENDOR_ID_SGI | (PCI_DEVICE_ID_SGI_IOC3 << 16)))
@@ -281,14 +281,14 @@ static int pci_conf1_write_config(struct pci_bus *bus, unsigned int devfn,
 oh_my_gawd:
 
 	/*
-	 * IOC3 is fucking fucked beyond belief ...  Don't even give the
+	 * IOC3 is hugging hugged beyond belief ...  Don't even give the
 	 * generic PCI code a chance to touch the wrong register.
 	 */
 	if ((where >= 0x14 && where < 0x40) || (where >= 0x48))
 		return PCIBIOS_SUCCESSFUL;
 
 	/*
-	 * IOC3 is fucking fucked beyond belief ...  Don't try to access
+	 * IOC3 is hugging hugged beyond belief ...  Don't try to access
 	 * anything but 32-bit words ...
 	 */
 	addr = &bridge->b_type0_cfg_dev[slot].f[fn].l[where >> 2];
diff --git a/arch/mips/sgi-ip22/ip22-setup.c b/arch/mips/sgi-ip22/ip22-setup.c
index b69daa02401b..50f04fe491ca 100644
--- a/arch/mips/sgi-ip22/ip22-setup.c
+++ b/arch/mips/sgi-ip22/ip22-setup.c
@@ -36,7 +36,7 @@ void __init plat_mem_setup(void)
 	board_be_init = ip22_be_init;
 
 	/* Init the INDY HPC I/O controller.  Need to call this before
-	 * fucking with the memory controller because it needs to know the
+	 * hugging with the memory controller because it needs to know the
 	 * boardID and whether this is a Guiness or a FullHouse machine.
 	 */
 	sgihpc_init();
-- 
2.19.1
