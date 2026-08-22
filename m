Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B7926980F
	for <linux-mips@vger.kernel.org>; Sat, 22 Aug 2026 00:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787358360; cv=none; b=AYy5PCCZ/Te768wo/Bi5JXWt3K82PSJ4vdrzeCcFKGqRmOUyntIKPvgU99kylNQ4IcYHHQZLHD1K33ibY73lMj48fEZXSx9ehkAqk7bWLBMOV9kJZbcg/GsPToB7MzxPxw3hbPpNP6JCc9NlmwpEX+hbPCag7gP75557iWhu9hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787358360; c=relaxed/simple;
	bh=ccJiy1exjudUslaVXWdjFSNKpvPdhjoMpapRiKHFZK0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hTaBYdNLWGW7FDPCOLFInVK3CRr85FgsnNV5wl51gLNsaRHzzffsmkvMkZj+t5cMmV+GxWzF4RR8l2QPL/RelftjKNDIhv1DSSOnjD69/MlnoOZiN/qDP6cUY5omMfQhq/+zGwvjJkBTeDW2QLAkC6d4jQ5S69/34HrcM+YfPQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nqxhsQC7; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nqxhsQC7"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d53197d8b5so16714305ad.3
        for <linux-mips@vger.kernel.org>; Fri, 21 Aug 2026 17:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787358358; x=1787963158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZV0CMlGWVyyRUGffQdbNjl/AjRO032kSYjhagTc2NTI=;
        b=nqxhsQC7MyhobKxDaefBP4780jytXd8qTxX9gHpTGWxCGFlpCZaaZ4wOme9UK7m04M
         kHEbdPkgQHsm6fvBeR66TI4cBxecpFY9CgqXFxsULS8OiZ2v4QpjbiNI4QTr8XygAHXs
         pGfFUEnedFH1aDG28jf97e0m2TcdWR7rh4ZwkQOnG2ELTA0nFXEcbA2+r2Sj4H5vpIsP
         iYsWOaUG5PEHqZ0AAz7foFaR0y9VpdNDHFkfDv2cYvyU3FBMtFtaReVO5Jz6LVx/gEWW
         XWiyu+R0xKlhbagAlpCPSowu/Thf0RiWajgKAeHAgUbyhkT3g/2ccbX2NnCyqO0QGmKh
         z4Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787358358; x=1787963158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZV0CMlGWVyyRUGffQdbNjl/AjRO032kSYjhagTc2NTI=;
        b=TG+XTuVluI0KvBDkLpzPCQmBuaFPzDYiNFj8s88sKpV4riBFwiw00uZzceqSLSgAO2
         tQGtmCr08rBrGfvdW9jH0Bk88aKvSJbFXzR5HfzOcRmpIDg/O6e8g+DSFhfCF6qvdvnC
         gM+Yjm1OWZ0VqtM2vEXb/XdF4h646cYMQ/XPuU9pbeYZe1B0JLwzLh24UpFncVguB8Qw
         du3riBf+CTj1+p6/tPuQ0eWYqxZqL0CzSHGsbSfnvGVZ1/Ir8frZyuRjFbybrGiHQ6c4
         NpqJ4aXrEn8IJ+yrDHEQO9o9i0DEUOfEh2lOV+2Nyd082ydEzA5oEjOVsiSo72G1/HhE
         Q1gw==
X-Gm-Message-State: AFuF++lYA7iNDuRKSOSzBqURKsLRwi5HlJ2QNC5/ot5ZCpj1FXbvko3l
	mYV/7PtQczzGYb1fqMenIvLybLUGlJ6EK47Zuo1Ep0M4XQOz3WEaBzEK
X-Gm-Gg: AR+sD10vvOqzIwmuFRSeb94axhogt+OArUM1SCPdgOl8Vtpk2ZtXgbOH45QfBfIbXEz
	TXgRm6c9y+yMnX5Dw/3y6+dyc0bQNwpRdkuxvjBHqsXcy6elrlkrlsGmoPsablvk7pn029vS+sW
	AdFdVX/Uz+SISdtqq6UrVUKxYbBM9i4wehQ+14WuvqNVkODGkHIK2Rhl+skQ5fLdSz2NDlOFjAe
	3zGdw639oGUawRzkHoBtZ+qQ84yMS7HMIQt8BIoA+un+rzordg0gagfojt8hMffCKWh0WIfkDDp
	hsNdkxLRYxJIphViacEsXJ360VfPHeWrn+En2xUYd6aJGowYXGnV2aOqQJxXSXsJiSL1k0eBfcm
	GoJDT/ZfTHBuTFipy6sdNFNuXsiYIjIoqbkrXIWviRCuHc+392Ra3hylOkC8vwWAKj7sH6C4SKV
	vbXjvlktDH+5LA5/fm6bRFeyc0cdhJtqKPlvVQgdznokKqSrAP+K4n0B+KdPx9t5gjuhvAe0Rex
	bin0rtX4W77NwmDgpnQbBXfqKpJAIQAX+KWsWVdfnsiC8wXtX1Y
X-Received: by 2002:a17:903:ac5:b0:2d5:c0c9:e365 with SMTP id d9443c01a7336-2d64ae3acabmr197365825ad.3.1787358358365;
        Fri, 21 Aug 2026 17:25:58 -0700 (PDT)
Received: from hanzj-mi.. (ec2-99-79-140-187.ca-central-1.compute.amazonaws.com. [99.79.140.187])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d6768e180dsm302365ad.77.2026.08.21.17.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 17:25:54 -0700 (PDT)
From: hanzhijian <hanzhijian1991@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hanzhijian <hanzhijian1991@gmail.com>
Subject: [PATCH] MIPS: OCTEON: pcie: fix kernel-doc comments
Date: Sat, 22 Aug 2026 08:25:42 +0800
Message-ID: <20260822002543.2381024-1-hanzhijian1991@gmail.com>
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

Signed-off-by: hanzhijian <hanzhijian1991@gmail.com>
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

