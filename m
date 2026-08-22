Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC25245012
	for <linux-mips@vger.kernel.org>; Sat, 22 Aug 2026 00:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787358189; cv=none; b=qYAk2xQxsn/9XHnca/75j+EqdkE1XwrgqrowYosReknOwMDuxKOVoRtil3Ugi0YDiiFJ15ucYgyVaZkm/PIqmTuljhk3rIQFWeXmv3yCD0dP8X8pphfqfwXKv2Lv3/xSsQ7EjVhfb+P4VZ80k9+V5O20kKjsJx9KN12dUvNO1Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787358189; c=relaxed/simple;
	bh=fwW0auxqDiAo5XfkRj9cQ6JS7BXz745bKQTeNYx5HDs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AWgcFJWc18zwj/HP5iMqVMOJn2sECCErIIIbNAudN8EyCmQUeXLMHavGbY43vFUWU2zHnJQRoHJWCcWqslXzO3MvjsYwyEfciwLNn2fxDa29SYMRz0BC8k3YIXaJRYr/BluExwKBBoWICS6LQJ+FevsRm2StjirUPPc900GJqZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cugj479Q; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cugj479Q"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84faf0fa17eso1577123b3a.2
        for <linux-mips@vger.kernel.org>; Fri, 21 Aug 2026 17:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787358187; x=1787962987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/qpemccuxZtiYRmdFeMjcTNG6m6AVdOsgUHetPS2MrI=;
        b=cugj479QBcK5cs5/dDcXlUIcwvJv7LGrrG6L3pnlh+P2/NIruOs7BDcQRiHovAo66N
         yeMG4QB6wvZTVtAJxdyELV8cHT3lZUOs1zzdQIyBT2Y3UcffmQh33RHLOGTsp8EZlnjM
         vDKOUsopn2gpcxV+m3ZFBLgqeXoS/9o1VUHA/EYL1+E3X5kFU3+4xXEql3voq/vAgA80
         G5yM+dEKOW0gJ/RS+m1w13YnC5i6qexROugJSimWKlySzTUJy9bLqvXXKQ/DzRapV2zD
         jQEcpRZV0VTWEhX9SUch5Ehu2qjKfn8jgchczMb63PpSe1zGHn8l5ieAdL3Hjtqrl20e
         6hHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787358187; x=1787962987;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/qpemccuxZtiYRmdFeMjcTNG6m6AVdOsgUHetPS2MrI=;
        b=Lf0G1uW8SIGMbqbBiK0a5+jxQeQj3xg+6eN1F1M7VufjYt0ScBiKIHhKLENjPyZlrp
         XPWu4bvoaXuVCKwtySmAudaGWsSY+EQ4WQS6OslG5oi+tld1rAIrB/xEQhxdjfs9Fins
         NXYlXeH1kGOjAqj9OiZcCQaJNwKZATGUYg6HDduXMB8HaFIWC/Zx78cg4z7JjvH1mr5u
         sR2Iq6t6JhlthBvwvWTfHyMhvxkJZ80aU+Y/+ftRXVEJCI4TjmHQWgeILDzSJddbDRVv
         F1B5HuKk2EdoqlKG7Ak+EnA3kpdPyqKcpH9vQ51J0C68T8PBa+evaaxrrdw9JGVop1O3
         EMaQ==
X-Gm-Message-State: AFuF++mC8ggGmg0Hik6PW5e3V5a/YjgrscWk9/EJSGD7qCBC2xLVDOkQ
	7xpJ+HtS+UvRGqKj/AZDb1LbkpQ1mSZObynzTgrTjoT14SkPGRx5k7r1
X-Gm-Gg: AR+sD12H3yU20PnQYacIJHXzN69shUnsdYQJ6k2mfeauetVcBcMISbn91j4gzJB8anW
	3cIXBkERV54Y4E/2IhjGubOvhHIKQ8bd95zpT6EwH5BRQwWaAprrN4RqFT3jz1aiXaiaAa6o7JB
	WkEo9yydp/nk/pXVSovAd5GxCzP+DznDpm1QsENW5/umkyJxp7qvyIyVygHo85tILP9wuQDebQE
	GRM3gxUSZFJFbJB6neiXL8wGYfKf4pTZWhvl7sR763amJzPd96FuiaQxVni0l8uLx8vsi8lCagQ
	fG5Kc66XRbl7tSrMGqRxElDhGPfwGCMGLgbzdQycmPIWw87EZE72plMkSkCOZCxCh7BdI2NdcFS
	YK1XO62SlGCeQAYHBTNcZHSYCGcxsRGQWwmYCFD8Oc66EQpo7TKoqG/4/qJeawvLhSpQ/w0b0+x
	pI74e0c+RBgTsbMEbT07XSbTpQZihaLwMOkSnoPNipX6fPkCZxQ0E/yTwMzEfoIk+AjCAhZ06m7
	zWvkQ4aVEUtjlLza2/tDZI+GOP5HXlj2pSCScyuTavvjA==
X-Received: by 2002:a05:6a00:2d02:b0:851:92fe:504b with SMTP id d2e1a72fcca58-8520b9fff6bmr3253411b3a.7.1787358187148;
        Fri, 21 Aug 2026 17:23:07 -0700 (PDT)
Received: from hanzj-mi.. (ec2-99-79-140-187.ca-central-1.compute.amazonaws.com. [99.79.140.187])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8520ef28844sm126470b3a.22.2026.08.21.17.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 17:23:06 -0700 (PDT)
From: hanzhijian <hanzhijian1991@gmail.com>
X-Google-Original-From: hanzhijian <hanzhijian@zepp.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hanzhijian <hanzhijian@zepp.com>
Subject: [PATCH] MIPS: OCTEON: pcie: fix kernel-doc comments
Date: Sat, 22 Aug 2026 08:22:56 +0800
Message-ID: <20260822002256.2380061-1-hanzhijian@zepp.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Cavium OCTEON PCIe driver has 21 function comments that begin with
'/**' but are missing the required kernel-doc function name line, so
they are silently dropped from the generated documentation. Add the
missing 'function_name() -' line to each, and add the missing ':' after
"Returns" so the return documentation is parsed correctly.

No functional change.

Verified with 'scripts/kernel-doc -none', which reports zero warnings
after this change.

Signed-off-by: hanzhijian <hanzhijian@zepp.com>
---
 arch/mips/pci/pcie-octeon.c | 107 +++++++++++++++++++-----------------
 1 file changed, 57 insertions(+), 50 deletions(-)

diff --git a/arch/mips/pci/pcie-octeon.c b/arch/mips/pci/pcie-octeon.c
index b080c7c6c..1d009e899 100644
--- a/arch/mips/pci/pcie-octeon.c
+++ b/arch/mips/pci/pcie-octeon.c
@@ -95,12 +95,13 @@ union cvmx_pcie_address {
 static int cvmx_pcie_rc_initialize(int pcie_port);
 
 /**
- * Return the Core virtual base address for PCIe IO access. IOs are
- * read/written as an offset from this address.
+ * cvmx_pcie_get_io_base_address() - Return the Core virtual base address
+ *	for PCIe IO access. IOs are read/written as an offset from this
+ *	address.
  *
  * @pcie_port: PCIe port the IO is for
  *
- * Returns 64bit Octeon IO base address for read/write
+ * Returns: 64bit Octeon IO base address for read/write
  */
 static inline uint64_t cvmx_pcie_get_io_base_address(int pcie_port)
 {
@@ -116,12 +117,12 @@ static inline uint64_t cvmx_pcie_get_io_base_address(int pcie_port)
 }
 
 /**
- * Size of the IO address region returned at address
- * cvmx_pcie_get_io_base_address()
+ * cvmx_pcie_get_io_size() - Size of the IO address region returned at
+ *	address cvmx_pcie_get_io_base_address().
  *
  * @pcie_port: PCIe port the IO is for
  *
- * Returns Size of the IO window
+ * Returns: Size of the IO window
  */
 static inline uint64_t cvmx_pcie_get_io_size(int pcie_port)
 {
@@ -129,12 +130,13 @@ static inline uint64_t cvmx_pcie_get_io_size(int pcie_port)
 }
 
 /**
- * Return the Core virtual base address for PCIe MEM access. Memory is
- * read/written as an offset from this address.
+ * cvmx_pcie_get_mem_base_address() - Return the Core virtual base address
+ *	for PCIe MEM access. Memory is read/written as an offset from this
+ *	address.
  *
  * @pcie_port: PCIe port the IO is for
  *
- * Returns 64bit Octeon IO base address for read/write
+ * Returns: 64bit Octeon IO base address for read/write
  */
 static inline uint64_t cvmx_pcie_get_mem_base_address(int pcie_port)
 {
@@ -148,12 +150,12 @@ static inline uint64_t cvmx_pcie_get_mem_base_address(int pcie_port)
 }
 
 /**
- * Size of the Mem address region returned at address
- * cvmx_pcie_get_mem_base_address()
+ * cvmx_pcie_get_mem_size() - Size of the Mem address region returned at
+ *	address cvmx_pcie_get_mem_base_address().
  *
  * @pcie_port: PCIe port the IO is for
  *
- * Returns Size of the Mem window
+ * Returns: Size of the Mem window
  */
 static inline uint64_t cvmx_pcie_get_mem_size(int pcie_port)
 {
@@ -161,13 +163,14 @@ static inline uint64_t cvmx_pcie_get_mem_size(int pcie_port)
 }
 
 /**
- * Read a PCIe config space register indirectly. This is used for
- * registers of the form PCIEEP_CFG??? and PCIERC?_CFG???.
+ * cvmx_pcie_cfgx_read() - Read a PCIe config space register indirectly.
+ *	This is used for registers of the form PCIEEP_CFG??? and
+ *	PCIFRC?_CFG???.
  *
  * @pcie_port:	PCIe port to read from
  * @cfg_offset: Address to read
  *
- * Returns Value read
+ * Returns: Value read
  */
 static uint32_t cvmx_pcie_cfgx_read(int pcie_port, uint32_t cfg_offset)
 {
@@ -189,8 +192,9 @@ static uint32_t cvmx_pcie_cfgx_read(int pcie_port, uint32_t cfg_offset)
 }
 
 /**
- * Write a PCIe config space register indirectly. This is used for
- * registers of the form PCIEEP_CFG??? and PCIERC?_CFG???.
+ * cvmx_pcie_cfgx_write() - Write a PCIe config space register indirectly.
+ *	This is used for registers of the form PCIEEP_CFG??? and
+ *	PCIFRC?_CFG???.
  *
  * @pcie_port:	PCIe port to write to
  * @cfg_offset: Address to write
@@ -215,7 +219,8 @@ static void cvmx_pcie_cfgx_write(int pcie_port, uint32_t cfg_offset,
 }
 
 /**
- * Build a PCIe config space request address for a device
+ * __cvmx_pcie_build_config_addr() - Build a PCIe config space request
+ *	address for a device
  *
  * @pcie_port: PCIe port to access
  * @bus:       Sub bus
@@ -223,7 +228,7 @@ static void cvmx_pcie_cfgx_write(int pcie_port, uint32_t cfg_offset,
  * @fn:	       Device sub function
  * @reg:       Register to access
  *
- * Returns 64bit Octeon IO address
+ * Returns: 64bit Octeon IO address
  */
 static inline uint64_t __cvmx_pcie_build_config_addr(int pcie_port, int bus,
 						     int dev, int fn, int reg)
@@ -258,7 +263,7 @@ static inline uint64_t __cvmx_pcie_build_config_addr(int pcie_port, int bus,
 }
 
 /**
- * Read 8bits from a Device's config space
+ * cvmx_pcie_config_read8() - Read 8bits from a Device's config space
  *
  * @pcie_port: PCIe port the device is on
  * @bus:       Sub bus
@@ -266,7 +271,7 @@ static inline uint64_t __cvmx_pcie_build_config_addr(int pcie_port, int bus,
  * @fn:	       Device sub function
  * @reg:       Register to access
  *
- * Returns Result of the read
+ * Returns: Result of the read
  */
 static uint8_t cvmx_pcie_config_read8(int pcie_port, int bus, int dev,
 				      int fn, int reg)
@@ -280,7 +285,7 @@ static uint8_t cvmx_pcie_config_read8(int pcie_port, int bus, int dev,
 }
 
 /**
- * Read 16bits from a Device's config space
+ * cvmx_pcie_config_read16() - Read 16bits from a Device's config space
  *
  * @pcie_port: PCIe port the device is on
  * @bus:       Sub bus
@@ -288,7 +293,7 @@ static uint8_t cvmx_pcie_config_read8(int pcie_port, int bus, int dev,
  * @fn:	       Device sub function
  * @reg:       Register to access
  *
- * Returns Result of the read
+ * Returns: Result of the read
  */
 static uint16_t cvmx_pcie_config_read16(int pcie_port, int bus, int dev,
 					int fn, int reg)
@@ -302,7 +307,7 @@ static uint16_t cvmx_pcie_config_read16(int pcie_port, int bus, int dev,
 }
 
 /**
- * Read 32bits from a Device's config space
+ * cvmx_pcie_config_read32() - Read 32bits from a Device's config space
  *
  * @pcie_port: PCIe port the device is on
  * @bus:       Sub bus
@@ -310,7 +315,7 @@ static uint16_t cvmx_pcie_config_read16(int pcie_port, int bus, int dev,
  * @fn:	       Device sub function
  * @reg:       Register to access
  *
- * Returns Result of the read
+ * Returns: Result of the read
  */
 static uint32_t cvmx_pcie_config_read32(int pcie_port, int bus, int dev,
 					int fn, int reg)
@@ -324,7 +329,7 @@ static uint32_t cvmx_pcie_config_read32(int pcie_port, int bus, int dev,
 }
 
 /**
- * Write 8bits to a Device's config space
+ * cvmx_pcie_config_write8() - Write 8bits to a Device's config space
  *
  * @pcie_port: PCIe port the device is on
  * @bus:       Sub bus
@@ -343,7 +348,7 @@ static void cvmx_pcie_config_write8(int pcie_port, int bus, int dev, int fn,
 }
 
 /**
- * Write 16bits to a Device's config space
+ * cvmx_pcie_config_write16() - Write 16bits to a Device's config space
  *
  * @pcie_port: PCIe port the device is on
  * @bus:       Sub bus
@@ -362,7 +367,7 @@ static void cvmx_pcie_config_write16(int pcie_port, int bus, int dev, int fn,
 }
 
 /**
- * Write 32bits to a Device's config space
+ * cvmx_pcie_config_write32() - Write 32bits to a Device's config space
  *
  * @pcie_port: PCIe port the device is on
  * @bus:       Sub bus
@@ -381,7 +386,8 @@ static void cvmx_pcie_config_write32(int pcie_port, int bus, int dev, int fn,
 }
 
 /**
- * Initialize the RC config space CSRs
+ * __cvmx_pcie_rc_initialize_config_space() - Initialize the RC config
+ *	space CSRs
  *
  * @pcie_port: PCIe port to initialize
  */
@@ -579,13 +585,13 @@ static void __cvmx_pcie_rc_initialize_config_space(int pcie_port)
 }
 
 /**
- * Initialize a host mode PCIe gen 1 link. This function takes a PCIe
- * port from reset to a link up state. Software can then begin
- * configuring the rest of the link.
+ * __cvmx_pcie_rc_initialize_link_gen1() - Initialize a host mode PCIe
+ *	gen 1 link. This function takes a PCIe port from reset to a link up
+ *	state. Software can then begin configuring the rest of the link.
  *
  * @pcie_port: PCIe port to initialize
  *
- * Returns Zero on success
+ * Returns: Zero on success
  */
 static int __cvmx_pcie_rc_initialize_link_gen1(int pcie_port)
 {
@@ -687,12 +693,12 @@ static void __cvmx_increment_ba(union cvmx_sli_mem_access_subidx *pmas)
 }
 
 /**
- * Initialize a PCIe gen 1 port for use in host(RC) mode. It doesn't
- * enumerate the bus.
+ * __cvmx_pcie_rc_initialize_gen1() - Initialize a PCIe gen 1 port for
+ *	use in host(RC) mode. It doesn't enumerate the bus.
  *
  * @pcie_port: PCIe port to initialize
  *
- * Returns Zero on success
+ * Returns: Zero on success
  */
 static int __cvmx_pcie_rc_initialize_gen1(int pcie_port)
 {
@@ -1084,13 +1090,13 @@ static int __cvmx_pcie_rc_initialize_gen1(int pcie_port)
 }
 
 /**
-  * Initialize a host mode PCIe gen 2 link. This function takes a PCIe
- * port from reset to a link up state. Software can then begin
- * configuring the rest of the link.
+ * __cvmx_pcie_rc_initialize_link_gen2() - Initialize a host mode PCIe
+ *	gen 2 link. This function takes a PCIe port from reset to a link up
+ *	state. Software can then begin configuring the rest of the link.
  *
  * @pcie_port: PCIe port to initialize
  *
- * Return Zero on success.
+ * Return: Zero on success.
  */
 static int __cvmx_pcie_rc_initialize_link_gen2(int pcie_port)
 {
@@ -1143,12 +1149,12 @@ static int __cvmx_pcie_rc_initialize_link_gen2(int pcie_port)
 
 
 /**
- * Initialize a PCIe gen 2 port for use in host(RC) mode. It doesn't enumerate
- * the bus.
+ * __cvmx_pcie_rc_initialize_gen2() - Initialize a PCIe gen 2 port for
+ *	use in host(RC) mode. It doesn't enumerate the bus.
  *
  * @pcie_port: PCIe port to initialize
  *
- * Returns Zero on success.
+ * Returns: Zero on success.
  */
 static int __cvmx_pcie_rc_initialize_gen2(int pcie_port)
 {
@@ -1439,11 +1445,12 @@ static int __cvmx_pcie_rc_initialize_gen2(int pcie_port)
 }
 
 /**
- * Initialize a PCIe port for use in host(RC) mode. It doesn't enumerate the bus.
+ * cvmx_pcie_rc_initialize() - Initialize a PCIe port for use in host(RC)
+ *	mode. It doesn't enumerate the bus.
  *
  * @pcie_port: PCIe port to initialize
  *
- * Returns Zero on success
+ * Returns: Zero on success
  */
 static int cvmx_pcie_rc_initialize(int pcie_port)
 {
@@ -1458,7 +1465,8 @@ static int cvmx_pcie_rc_initialize(int pcie_port)
 /* Above was cvmx-pcie.c, below original pcie.c */
 
 /**
- * Map a PCI device to the appropriate interrupt line
+ * octeon_pcie_pcibios_map_irq() - Map a PCI device to the appropriate
+ *	interrupt line
  *
  * @dev:    The Linux PCI device structure for the device to map
  * @slot:   The slot number for this device on __BUS 0__. Linux
@@ -1466,7 +1474,8 @@ static int cvmx_pcie_rc_initialize(int pcie_port)
  *		 slot on Bus 0 where this device eventually hooks to.
  * @pin:    The PCI interrupt pin read from the device, then swizzled
  *		 as it goes through each bridge.
- * Returns Interrupt number for the device
+ *
+ * Returns: Interrupt number for the device
  */
 int octeon_pcie_pcibios_map_irq(const struct pci_dev *dev, u8 slot, u8 pin)
 {
@@ -1859,9 +1868,7 @@ static int device_needs_bus_num_war(uint32_t deviceid)
 }
 
 /**
- * Initialize the Octeon PCIe controllers
- *
- * Returns
+ * octeon_pcie_setup() - Initialize the Octeon PCIe controllers
  */
 static int __init octeon_pcie_setup(void)
 {
-- 
2.43.0

