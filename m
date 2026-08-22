Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F8F224B1E
	for <linux-mips@vger.kernel.org>; Sat, 22 Aug 2026 00:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787358379; cv=none; b=swSGTv5S3C5MO8ugx3KjyEnEzJUcsUuXgEdrZWAxIfziFxYy6ctC35v9ADZXk+vWAWdi66E1YoFXSn33HcJAEzrS4IegrXTlNnFyDovNQS4rzhIzOmRnxPU9X/oCtg9Y5/c2u6oqn1g9skACqqln02iyoLx2WxB5Q0qEB+Ors3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787358379; c=relaxed/simple;
	bh=Dhy4yK5UtWLedG9/eCL04c6VYRiqVb4ycwRa/Dsm/CU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OP2vAXOLfnuiX7VHnKbQw/PNn0aEbnmWryBSmnFlYLt8HlKrwsEjW75U+/VInwB24kLT35HQy2saq9+UHX0d0JZjpZCbr/XOSrk9i54eNI1K0GEBBUezVbGr9cmhxhImbF8TNkyqnUR8lBMhkzeOkAz7X0uBEpQL3KH1bNJ3904=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k4UAxJ66; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k4UAxJ66"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cf452def93so19864115ad.1
        for <linux-mips@vger.kernel.org>; Fri, 21 Aug 2026 17:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787358376; x=1787963176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K3FbM9nGPaM3vrfh4QsI2b8xhpyDzmOXUgUS2zHLxcQ=;
        b=k4UAxJ665uRgBqhaSwoYR8r9Zv6OBMIqUSZdDf58FJoc5ZkGT0O2VIlAAFPyASVQt3
         JHkLfjLmMO3w8zlsRtxDAAhL6jNl3ThfjNbShn632tG+GgKbUPsUO12fxl0F3VQDRqut
         cAJvGh12D48+LqV1aun/CK3uq6e0iMbbYsphiFyVy9i9rRxlEvRTj/WGOdr7K7s1EQ/o
         CuXctZNWgFsf/MUK5qddOSWUyDVCESVOsKHAK1xPBTrOqPAxrXxPQdz0e1qpkqGz3KQ/
         /4yBxsC3cW10mbJkPr34g1Cejs5zxAclFqGcYqhJgB7H0ju3X2DQEq7gN/7L369hYHoE
         r+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787358376; x=1787963176;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K3FbM9nGPaM3vrfh4QsI2b8xhpyDzmOXUgUS2zHLxcQ=;
        b=e6rxCg09KhnTQs3kjqkTVUKjnLkNIkoDvWoaBOvrlChs/TgZg7bj+dYKldfwuQfPAS
         hPb3O29W+E2ri1WtKtaX6aqYWdnNNDUIDUvEMywg482NhBQCDEQfTuGpD73SvZMhn2rC
         u4Qpepr9JZwvMy5HlbBvCT4xuJBLcNYh/U/x7y7tAse8A33uRR7PTI151VrSgl4eIbQi
         KnWeinvzGRl+4yL38VQ2eP4dqaAEJivrB3V7+kWKSEG2HjIXooQMWKmBL+jW2xZcC5dz
         us+bvcW22NPXDjCG5kHeEkHUM6CXiSNhrOy2hcv2Xd6tHpf9NxJYibzglXEP+GOwHT82
         r6KA==
X-Gm-Message-State: AFuF++mAbk/f+SzhbFHcCehSi52mMuUxiIm7aYpaLrFOwmrRER7OkTRM
	kwQ1uD8x1ttjudcLYhX2w3eXdcAGZkO1xqqNCGGtjdrBErGdR0RPA9Yj
X-Gm-Gg: AR+sD12D7RF3kjywgJH076LHVlt6MCPZpQp9/wwRLYrV2lf2asski7G4KL+JPomJFks
	KTqHirpcoJ1BTfOhfn7uFdJSdd4A73AemqFd9pzJabVR6mO28wFxsVQNnojjefIjkWABKpcBIdJ
	2HEeM96FXJG0IaTNIKwOqABzpr/iWXfEwOHsa8wjG/iDIeTMyBRUt0u2Pw0vSp8UMnoyEzJVJb7
	+QV5BeCWVkcoTLcNc80zsc/DmAi6EnJ5EwXrd1IkEBz/dRgT2tcUysEgnRD5w+qw3pJFkoomp1G
	T+Qr8nbSgQFakq+QY2TXLA5KfjF9J1lW4oANVezD7bC0Qp1NI9G6fn9edbg91Gj92DR3JLXs4y2
	Gp2mw1E093gVZhRht3h94mxwehqKOu6L4LOBGvGUJ4Hg+lLofODzTflAKr61M+VK6W/9JhpO8MF
	OJ64/NdBg1e270QrGhIfkc7/cTjj7rV5m5O01cc3N+/LuZu74XcAklzM04JURkRxtAP/EAe3mYK
	3qLP9htMx+DEIohska2o02JIp+PC024ehqgj8ykatLXgIpsORVGkkTPW2A1/fg=
X-Received: by 2002:a17:903:19c8:b0:2bc:e299:4b3f with SMTP id d9443c01a7336-2d6501d2265mr117723765ad.10.1787358375263;
        Fri, 21 Aug 2026 17:26:15 -0700 (PDT)
Received: from hanzj-mi.. (ec2-99-79-140-187.ca-central-1.compute.amazonaws.com. [99.79.140.187])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d6767b0aeesm326935ad.36.2026.08.21.17.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 17:26:14 -0700 (PDT)
From: hanzhijian <hanzhijian1991@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hanzhijian <hanzhijian1991@gmail.com>
Subject: [PATCH] MIPS: OCTEON: fix kernel-doc comments
Date: Sat, 22 Aug 2026 08:26:03 +0800
Message-ID: <20260822002603.2381141-1-hanzhijian1991@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Cavium OCTEON executive and PCI code has 61 comments that begin
with '/**' but are missing the required kernel-doc name line (function
or union), so they are silently dropped from the generated
documentation. Add the missing name line to each, and add the missing
':' after "Returns" so the return documentation is parsed correctly.

Two file-header comments that are not kernel-doc are downgraded from
'/**' to '/*'.

No functional change.

Verified with 'scripts/kernel-doc -none', which reports zero warnings
for all touched files after this change.

Signed-off-by: hanzhijian <hanzhijian1991@gmail.com>
---
 .../executive/cvmx-boot-vector.c              |   4 +-
 .../executive/cvmx-helper-errata.c            |   8 +-
 .../executive/cvmx-helper-jtag.c              |  37 ++--
 .../executive/cvmx-helper-loop.c              |  16 +-
 .../cavium-octeon/executive/cvmx-helper-npi.c |  16 +-
 .../executive/cvmx-helper-sgmii.c             |  61 +++----
 .../cavium-octeon/executive/cvmx-helper-spi.c |  36 ++--
 .../executive/cvmx-helper-util.c              |  42 +++--
 .../cavium-octeon/executive/cvmx-helper.c     | 161 ++++++++++--------
 .../executive/cvmx-interrupt-rsl.c            |   7 +-
 .../cavium-octeon/executive/octeon-model.c    |  19 +--
 arch/mips/cavium-octeon/octeon-crypto.c       |  19 ++-
 arch/mips/pci/pci-octeon.c                    |  28 +--
 13 files changed, 239 insertions(+), 215 deletions(-)

diff --git a/arch/mips/cavium-octeon/executive/cvmx-boot-vector.c b/arch/mips/cavium-octeon/executive/cvmx-boot-vector.c
index 76446db66..b259c350e 100644
--- a/arch/mips/cavium-octeon/executive/cvmx-boot-vector.c
+++ b/arch/mips/cavium-octeon/executive/cvmx-boot-vector.c
@@ -153,8 +153,8 @@ static void cvmx_boot_vector_init(void *mem)
 }
 
 /**
- * Get a pointer to the per-core table of reset vector pointers
- *
+ * cvmx_boot_vector_get() - Get a pointer to the per-core table of reset
+ *	vector pointers
  */
 struct cvmx_boot_vector_element *cvmx_boot_vector_get(void)
 {
diff --git a/arch/mips/cavium-octeon/executive/cvmx-helper-errata.c b/arch/mips/cavium-octeon/executive/cvmx-helper-errata.c
index 4b26fedec..697b6e760 100644
--- a/arch/mips/cavium-octeon/executive/cvmx-helper-errata.c
+++ b/arch/mips/cavium-octeon/executive/cvmx-helper-errata.c
@@ -25,7 +25,7 @@
  * Contact Cavium Networks for more information
  ***********************license end**************************************/
 
-/**
+/*
  *
  * Fixes and workaround for Octeon chip errata. This file
  * contains functions called by cvmx-helper to workaround known
@@ -40,9 +40,9 @@
 #include <asm/octeon/cvmx-helper-jtag.h>
 
 /**
- * Due to errata G-720, the 2nd order CDR circuit on CN52XX pass
- * 1 doesn't work properly. The following code disables 2nd order
- * CDR for the specified QLM.
+ * __cvmx_helper_errata_qlm_disable_2nd_order_cdr() - Due to errata G-720, the
+ *	2nd order CDR circuit on CN52XX pass 1 doesn't work properly. The following
+ *	code disables 2nd order CDR for the specified QLM.
  *
  * @qlm:    QLM to disable 2nd order CDR for.
  */
diff --git a/arch/mips/cavium-octeon/executive/cvmx-helper-jtag.c b/arch/mips/cavium-octeon/executive/cvmx-helper-jtag.c
index 1fceb7fd2..4f1180b93 100644
--- a/arch/mips/cavium-octeon/executive/cvmx-helper-jtag.c
+++ b/arch/mips/cavium-octeon/executive/cvmx-helper-jtag.c
@@ -26,7 +26,7 @@
  * Contact Cavium Networks for more information
  ***********************license end**************************************/
 
-/**
+/*
  *
  * Helper utilities for qlm_jtag.
  *
@@ -37,11 +37,11 @@
 
 
 /**
- * Initialize the internal QLM JTAG logic to allow programming
- * of the JTAG chain by the cvmx_helper_qlm_jtag_*() functions.
- * These functions should only be used at the direction of Cavium
- * Networks. Programming incorrect values into the JTAG chain
- * can cause chip damage.
+ * cvmx_helper_qlm_jtag_init() - Initialize the internal QLM JTAG logic to
+ *	allow programming of the JTAG chain by the cvmx_helper_qlm_jtag_*()
+ *	functions. These functions should only be used at the direction of Cavium
+ *	Networks. Programming incorrect values into the JTAG chain can cause chip
+ *	damage.
  */
 void cvmx_helper_qlm_jtag_init(void)
 {
@@ -71,17 +71,17 @@ void cvmx_helper_qlm_jtag_init(void)
 }
 
 /**
- * Write up to 32bits into the QLM jtag chain. Bits are shifted
- * into the MSB and out the LSB, so you should shift in the low
- * order bits followed by the high order bits. The JTAG chain is
- * 4 * 268 bits long, or 1072.
+ * cvmx_helper_qlm_jtag_shift() - Write up to 32bits into the QLM jtag chain.
+ *	Bits are shifted into the MSB and out the LSB, so you should shift in the
+ *	low order bits followed by the high order bits. The JTAG chain is 4 * 268
+ *	bits long, or 1072.
  *
  * @qlm:    QLM to shift value into
  * @bits:   Number of bits to shift in (1-32).
  * @data:   Data to shift in. Bit 0 enters the chain first, followed by
  *		 bit 1, etc.
  *
- * Returns The low order bits of the JTAG chain that shifted out of the
+ * Returns: The low order bits of the JTAG chain that shifted out of the
  *	   circle.
  */
 uint32_t cvmx_helper_qlm_jtag_shift(int qlm, int bits, uint32_t data)
@@ -101,11 +101,10 @@ uint32_t cvmx_helper_qlm_jtag_shift(int qlm, int bits, uint32_t data)
 }
 
 /**
- * Shift long sequences of zeros into the QLM JTAG chain. It is
- * common to need to shift more than 32 bits of zeros into the
- * chain. This function is a convenience wrapper around
- * cvmx_helper_qlm_jtag_shift() to shift more than 32 bits of
- * zeros at a time.
+ * cvmx_helper_qlm_jtag_shift_zeros() - Shift long sequences of zeros into the
+ *	QLM JTAG chain. It is common to need to shift more than 32 bits of zeros
+ *	into the chain. This function is a convenience wrapper around
+ *	cvmx_helper_qlm_jtag_shift() to shift more than 32 bits of zeros at a time.
  *
  * @qlm:    QLM to shift zeros into
  * @bits:
@@ -122,9 +121,9 @@ void cvmx_helper_qlm_jtag_shift_zeros(int qlm, int bits)
 }
 
 /**
- * Program the QLM JTAG chain into all lanes of the QLM. You must
- * have already shifted in 268*4, or 1072 bits into the JTAG
- * chain. Updating invalid values can possibly cause chip damage.
+ * cvmx_helper_qlm_jtag_update() - Program the QLM JTAG chain into all lanes
+ *	of the QLM. You must have already shifted in 268*4, or 1072 bits into the
+ *	JTAG chain. Updating invalid values can possibly cause chip damage.
  *
  * @qlm:    QLM to program
  */
diff --git a/arch/mips/cavium-octeon/executive/cvmx-helper-loop.c b/arch/mips/cavium-octeon/executive/cvmx-helper-loop.c
index bfbd46115..5050d01d3 100644
--- a/arch/mips/cavium-octeon/executive/cvmx-helper-loop.c
+++ b/arch/mips/cavium-octeon/executive/cvmx-helper-loop.c
@@ -37,13 +37,13 @@
 #include <asm/octeon/cvmx-pip-defs.h>
 
 /**
- * Probe a LOOP interface and determine the number of ports
- * connected to it. The LOOP interface should still be down
- * after this call.
+ * __cvmx_helper_loop_probe() - Probe a LOOP interface and determine the
+ *	number of ports connected to it. The LOOP interface should still be down
+ *	after this call.
  *
  * @interface: Interface to probe
  *
- * Returns Number of ports on the interface. Zero to disable.
+ * Returns: Number of ports on the interface. Zero to disable.
  */
 int __cvmx_helper_loop_probe(int interface)
 {
@@ -70,13 +70,13 @@ int __cvmx_helper_loop_probe(int interface)
 }
 
 /**
- * Bringup and enable a LOOP interface. After this call packet
- * I/O should be fully functional. This is called with IPD
- * enabled but PKO disabled.
+ * __cvmx_helper_loop_enable() - Bringup and enable a LOOP interface. After
+ *	this call packet I/O should be fully functional. This is called with IPD
+ *	enabled but PKO disabled.
  *
  * @interface: Interface to bring up
  *
- * Returns Zero on success, negative on failure
+ * Returns: Zero on success, negative on failure
  */
 int __cvmx_helper_loop_enable(int interface)
 {
diff --git a/arch/mips/cavium-octeon/executive/cvmx-helper-npi.c b/arch/mips/cavium-octeon/executive/cvmx-helper-npi.c
index cb210d2ef..2b8cd7569 100644
--- a/arch/mips/cavium-octeon/executive/cvmx-helper-npi.c
+++ b/arch/mips/cavium-octeon/executive/cvmx-helper-npi.c
@@ -38,13 +38,13 @@
 #include <asm/octeon/cvmx-pip-defs.h>
 
 /**
- * Probe a NPI interface and determine the number of ports
- * connected to it. The NPI interface should still be down
- * after this call.
+ * __cvmx_helper_npi_probe() - Probe a NPI interface and determine the number
+ *	of ports connected to it. The NPI interface should still be down after this
+ *	call.
  *
  * @interface: Interface to probe
  *
- * Returns Number of ports on the interface. Zero to disable.
+ * Returns: Number of ports on the interface. Zero to disable.
  */
 int __cvmx_helper_npi_probe(int interface)
 {
@@ -64,13 +64,13 @@ int __cvmx_helper_npi_probe(int interface)
 }
 
 /**
- * Bringup and enable a NPI interface. After this call packet
- * I/O should be fully functional. This is called with IPD
- * enabled but PKO disabled.
+ * __cvmx_helper_npi_enable() - Bringup and enable a NPI interface. After this
+ *	call packet I/O should be fully functional. This is called with IPD enabled
+ *	but PKO disabled.
  *
  * @interface: Interface to bring up
  *
- * Returns Zero on success, negative on failure
+ * Returns: Zero on success, negative on failure
  */
 int __cvmx_helper_npi_enable(int interface)
 {
diff --git a/arch/mips/cavium-octeon/executive/cvmx-helper-sgmii.c b/arch/mips/cavium-octeon/executive/cvmx-helper-sgmii.c
index e07d8f15e..91a3773a4 100644
--- a/arch/mips/cavium-octeon/executive/cvmx-helper-sgmii.c
+++ b/arch/mips/cavium-octeon/executive/cvmx-helper-sgmii.c
@@ -42,12 +42,13 @@
 #include <asm/octeon/cvmx-pcsxx-defs.h>
 
 /**
- * Perform initialization required only once for an SGMII port.
+ * __cvmx_helper_sgmii_hardware_init_one_time() - Perform initialization
+ *	required only once for an SGMII port.
  *
  * @interface: Interface to init
  * @index:     Index of prot on the interface
  *
- * Returns Zero on success, negative on failure
+ * Returns: Zero on success, negative on failure
  */
 static int __cvmx_helper_sgmii_hardware_init_one_time(int interface, int index)
 {
@@ -126,13 +127,13 @@ static int __cvmx_helper_sgmii_hardware_init_one_time(int interface, int index)
 }
 
 /**
- * Initialize the SERTES link for the first time or after a loss
- * of link.
+ * __cvmx_helper_sgmii_hardware_init_link() - Initialize the SERTES link for
+ *	the first time or after a loss of link.
  *
  * @interface: Interface to init
  * @index:     Index of prot on the interface
  *
- * Returns Zero on success, negative on failure
+ * Returns: Zero on success, negative on failure
  */
 static int __cvmx_helper_sgmii_hardware_init_link(int interface, int index)
 {
@@ -189,14 +190,14 @@ static int __cvmx_helper_sgmii_hardware_init_link(int interface, int index)
 }
 
 /**
- * Configure an SGMII link to the specified speed after the SERTES
- * link is up.
+ * __cvmx_helper_sgmii_hardware_init_link_speed() - Configure an SGMII link to
+ *	the specified speed after the SERTES link is up.
  *
  * @interface: Interface to init
  * @index:     Index of prot on the interface
  * @link_info: Link state to configure
  *
- * Returns Zero on success, negative on failure
+ * Returns: Zero on success, negative on failure
  */
 static int __cvmx_helper_sgmii_hardware_init_link_speed(int interface,
 							int index,
@@ -295,14 +296,14 @@ static int __cvmx_helper_sgmii_hardware_init_link_speed(int interface,
 }
 
 /**
- * Bring up the SGMII interface to be ready for packet I/O but
- * leave I/O disabled using the GMX override. This function
- * follows the bringup documented in 10.6.3 of the manual.
+ * __cvmx_helper_sgmii_hardware_init() - Bring up the SGMII interface to be
+ *	ready for packet I/O but leave I/O disabled using the GMX override. This
+ *	function follows the bringup documented in 10.6.3 of the manual.
  *
  * @interface: Interface to bringup
  * @num_ports: Number of ports on the interface
  *
- * Returns Zero on success, negative on failure
+ * Returns: Zero on success, negative on failure
  */
 static int __cvmx_helper_sgmii_hardware_init(int interface, int num_ports)
 {
@@ -331,13 +332,13 @@ int __cvmx_helper_sgmii_enumerate(int interface)
 	return 4;
 }
 /**
- * Probe a SGMII interface and determine the number of ports
- * connected to it. The SGMII interface should still be down after
- * this call.
+ * __cvmx_helper_sgmii_probe() - Probe a SGMII interface and determine the
+ *	number of ports connected to it. The SGMII interface should still be down
+ *	after this call.
  *
  * @interface: Interface to probe
  *
- * Returns Number of ports on the interface. Zero to disable.
+ * Returns: Number of ports on the interface. Zero to disable.
  */
 int __cvmx_helper_sgmii_probe(int interface)
 {
@@ -355,13 +356,13 @@ int __cvmx_helper_sgmii_probe(int interface)
 }
 
 /**
- * Bringup and enable a SGMII interface. After this call packet
- * I/O should be fully functional. This is called with IPD
- * enabled but PKO disabled.
+ * __cvmx_helper_sgmii_enable() - Bringup and enable a SGMII interface. After
+ *	this call packet I/O should be fully functional. This is called with IPD
+ *	enabled but PKO disabled.
  *
  * @interface: Interface to bring up
  *
- * Returns Zero on success, negative on failure
+ * Returns: Zero on success, negative on failure
  */
 int __cvmx_helper_sgmii_enable(int interface)
 {
@@ -385,14 +386,14 @@ int __cvmx_helper_sgmii_enable(int interface)
 }
 
 /**
- * Return the link state of an IPD/PKO port as returned by
- * auto negotiation. The result of this function may not match
- * Octeon's link config if auto negotiation has changed since
- * the last call to cvmx_helper_link_set().
+ * __cvmx_helper_sgmii_link_get() - Return the link state of an IPD/PKO port
+ *	as returned by auto negotiation. The result of this function may not match
+ *	Octeon's link config if auto negotiation has changed since the last call to
+ *	cvmx_helper_link_set().
  *
  * @ipd_port: IPD/PKO port to query
  *
- * Returns Link state
+ * Returns: Link state
  */
 union cvmx_helper_link_info __cvmx_helper_sgmii_link_get(int ipd_port)
 {
@@ -494,15 +495,15 @@ union cvmx_helper_link_info __cvmx_helper_sgmii_link_get(int ipd_port)
 }
 
 /**
- * Configure an IPD/PKO port for the specified link state. This
- * function does not influence auto negotiation at the PHY level.
- * The passed link state must always match the link state returned
- * by cvmx_helper_link_get().
+ * __cvmx_helper_sgmii_link_set() - Configure an IPD/PKO port for the
+ *	specified link state. This function does not influence auto negotiation at
+ *	the PHY level. The passed link state must always match the link state
+ *	returned by cvmx_helper_link_get().
  *
  * @ipd_port:  IPD/PKO port to configure
  * @link_info: The new link state
  *
- * Returns Zero on success, negative on failure
+ * Returns: Zero on success, negative on failure
  */
 int __cvmx_helper_sgmii_link_set(int ipd_port,
 				 union cvmx_helper_link_info link_info)
diff --git a/arch/mips/cavium-octeon/executive/cvmx-helper-spi.c b/arch/mips/cavium-octeon/executive/cvmx-helper-spi.c
index 525914e9b..6df2f54c8 100644
--- a/arch/mips/cavium-octeon/executive/cvmx-helper-spi.c
+++ b/arch/mips/cavium-octeon/executive/cvmx-helper-spi.c
@@ -60,13 +60,13 @@ int __cvmx_helper_spi_enumerate(int interface)
 }
 
 /**
- * Probe a SPI interface and determine the number of ports
- * connected to it. The SPI interface should still be down after
- * this call.
+ * __cvmx_helper_spi_probe() - Probe a SPI interface and determine the number
+ *	of ports connected to it. The SPI interface should still be down after this
+ *	call.
  *
  * @interface: Interface to probe
  *
- * Returns Number of ports on the interface. Zero to disable.
+ * Returns: Number of ports on the interface. Zero to disable.
  */
 int __cvmx_helper_spi_probe(int interface)
 {
@@ -93,13 +93,13 @@ int __cvmx_helper_spi_probe(int interface)
 }
 
 /**
- * Bringup and enable a SPI interface. After this call packet I/O
- * should be fully functional. This is called with IPD enabled but
- * PKO disabled.
+ * __cvmx_helper_spi_enable() - Bringup and enable a SPI interface. After this
+ *	call packet I/O should be fully functional. This is called with IPD enabled
+ *	but PKO disabled.
  *
  * @interface: Interface to bring up
  *
- * Returns Zero on success, negative on failure
+ * Returns: Zero on success, negative on failure
  */
 int __cvmx_helper_spi_enable(int interface)
 {
@@ -131,14 +131,14 @@ int __cvmx_helper_spi_enable(int interface)
 }
 
 /**
- * Return the link state of an IPD/PKO port as returned by
- * auto negotiation. The result of this function may not match
- * Octeon's link config if auto negotiation has changed since
- * the last call to cvmx_helper_link_set().
+ * __cvmx_helper_spi_link_get() - Return the link state of an IPD/PKO port as
+ *	returned by auto negotiation. The result of this function may not match
+ *	Octeon's link config if auto negotiation has changed since the last call to
+ *	cvmx_helper_link_set().
  *
  * @ipd_port: IPD/PKO port to query
  *
- * Returns Link state
+ * Returns: Link state
  */
 union cvmx_helper_link_info __cvmx_helper_spi_link_get(int ipd_port)
 {
@@ -183,15 +183,15 @@ union cvmx_helper_link_info __cvmx_helper_spi_link_get(int ipd_port)
 }
 
 /**
- * Configure an IPD/PKO port for the specified link state. This
- * function does not influence auto negotiation at the PHY level.
- * The passed link state must always match the link state returned
- * by cvmx_helper_link_get().
+ * __cvmx_helper_spi_link_set() - Configure an IPD/PKO port for the specified
+ *	link state. This function does not influence auto negotiation at the PHY
+ *	level. The passed link state must always match the link state returned by
+ *	cvmx_helper_link_get().
  *
  * @ipd_port:  IPD/PKO port to configure
  * @link_info: The new link state
  *
- * Returns Zero on success, negative on failure
+ * Returns: Zero on success, negative on failure
  */
 int __cvmx_helper_spi_link_set(int ipd_port, union cvmx_helper_link_info link_info)
 {
diff --git a/arch/mips/cavium-octeon/executive/cvmx-helper-util.c b/arch/mips/cavium-octeon/executive/cvmx-helper-util.c
index abaf91f6a..be83b948e 100644
--- a/arch/mips/cavium-octeon/executive/cvmx-helper-util.c
+++ b/arch/mips/cavium-octeon/executive/cvmx-helper-util.c
@@ -46,11 +46,12 @@
 #include <asm/octeon/cvmx-ipd-defs.h>
 
 /**
- * Convert a interface mode into a human readable string
+ * cvmx_helper_interface_mode_to_string() - Convert a interface mode into a
+ *	human readable string
  *
  * @mode:   Mode to convert
  *
- * Returns String
+ * Returns: String
  */
 const char *cvmx_helper_interface_mode_to_string(enum cvmx_helper_interface_mode
 						 mode)
@@ -81,7 +82,8 @@ const char *cvmx_helper_interface_mode_to_string(enum cvmx_helper_interface_mode
 }
 
 /**
- * Setup Random Early Drop on a specific input queue
+ * cvmx_helper_setup_red_queue() - Setup Random Early Drop on a specific input
+ *	queue
  *
  * @queue:  Input queue to setup RED on (0-7)
  * @pass_thresh:
@@ -90,7 +92,8 @@ const char *cvmx_helper_interface_mode_to_string(enum cvmx_helper_interface_mode
  * @drop_thresh:
  *		 All incoming packets will be dropped when there are less
  *		 than this many free packet buffers in FPA 0.
- * Returns Zero on success. Negative on failure
+ *
+ * Returns: Zero on success. Negative on failure
  */
 static int cvmx_helper_setup_red_queue(int queue, int pass_thresh,
 				       int drop_thresh)
@@ -118,7 +121,8 @@ static int cvmx_helper_setup_red_queue(int queue, int pass_thresh,
 }
 
 /**
- * Setup Random Early Drop to automatically begin dropping packets.
+ * cvmx_helper_setup_red() - Setup Random Early Drop to automatically begin
+ *	dropping packets.
  *
  * @pass_thresh:
  *		 Packets will begin slowly dropping when there are less than
@@ -126,7 +130,8 @@ static int cvmx_helper_setup_red_queue(int queue, int pass_thresh,
  * @drop_thresh:
  *		 All incoming packets will be dropped when there are less
  *		 than this many free packet buffers in FPA 0.
- * Returns Zero on success. Negative on failure
+ *
+ * Returns: Zero on success. Negative on failure
  */
 int cvmx_helper_setup_red(int pass_thresh, int drop_thresh)
 {
@@ -168,14 +173,14 @@ int cvmx_helper_setup_red(int pass_thresh, int drop_thresh)
 EXPORT_SYMBOL_GPL(cvmx_helper_setup_red);
 
 /**
- * Setup the common GMX settings that determine the number of
- * ports. These setting apply to almost all configurations of all
- * chips.
+ * __cvmx_helper_setup_gmx() - Setup the common GMX settings that determine
+ *	the number of ports. These setting apply to almost all configurations of
+ *	all chips.
  *
  * @interface: Interface to configure
  * @num_ports: Number of ports on the interface
  *
- * Returns Zero on success, negative on failure
+ * Returns: Zero on success, negative on failure
  */
 int __cvmx_helper_setup_gmx(int interface, int num_ports)
 {
@@ -277,13 +282,13 @@ int __cvmx_helper_setup_gmx(int interface, int num_ports)
 }
 
 /**
- * Returns the IPD/PKO port number for a port on the given
- * interface.
+ * cvmx_helper_get_ipd_port() - Returns the IPD/PKO port number for a port on
+ *	the given interface.
  *
  * @interface: Interface to use
  * @port:      Port on the interface
  *
- * Returns IPD/PKO port number
+ * Returns: IPD/PKO port number
  */
 int cvmx_helper_get_ipd_port(int interface, int port)
 {
@@ -306,11 +311,12 @@ int cvmx_helper_get_ipd_port(int interface, int port)
 EXPORT_SYMBOL_GPL(cvmx_helper_get_ipd_port);
 
 /**
- * Returns the interface number for an IPD/PKO port number.
+ * cvmx_helper_get_interface_num() - Returns the interface number for an
+ *	IPD/PKO port number.
  *
  * @ipd_port: IPD/PKO port number
  *
- * Returns Interface number
+ * Returns: Interface number
  */
 int cvmx_helper_get_interface_num(int ipd_port)
 {
@@ -335,12 +341,12 @@ int cvmx_helper_get_interface_num(int ipd_port)
 EXPORT_SYMBOL_GPL(cvmx_helper_get_interface_num);
 
 /**
- * Returns the interface index number for an IPD/PKO port
- * number.
+ * cvmx_helper_get_interface_index_num() - Returns the interface index number
+ *	for an IPD/PKO port number.
  *
  * @ipd_port: IPD/PKO port number
  *
- * Returns Interface index number
+ * Returns: Interface index number
  */
 int cvmx_helper_get_interface_index_num(int ipd_port)
 {
diff --git a/arch/mips/cavium-octeon/executive/cvmx-helper.c b/arch/mips/cavium-octeon/executive/cvmx-helper.c
index 1985cd668..adcf60ae2 100644
--- a/arch/mips/cavium-octeon/executive/cvmx-helper.c
+++ b/arch/mips/cavium-octeon/executive/cvmx-helper.c
@@ -50,12 +50,12 @@
 static int interface_port_count[9];
 
 /**
- * Return the number of interfaces the chip has. Each interface
- * may have multiple ports. Most chips support two interfaces,
- * but the CNX0XX and CNX1XX are exceptions. These only support
- * one interface.
+ * cvmx_helper_get_number_of_interfaces() - Return the number of interfaces
+ *	the chip has. Each interface may have multiple ports. Most chips support
+ *	two interfaces, but the CNX0XX and CNX1XX are exceptions. These only
+ *	support one interface.
  *
- * Returns Number of interfaces on chip
+ * Returns: Number of interfaces on chip
  */
 int cvmx_helper_get_number_of_interfaces(void)
 {
@@ -77,13 +77,13 @@ int cvmx_helper_get_number_of_interfaces(void)
 EXPORT_SYMBOL_GPL(cvmx_helper_get_number_of_interfaces);
 
 /**
- * Return the number of ports on an interface. Depending on the
- * chip and configuration, this can be 1-16. A value of 0
- * specifies that the interface doesn't exist or isn't usable.
+ * cvmx_helper_ports_on_interface() - Return the number of ports on an
+ *	interface. Depending on the chip and configuration, this can be 1-16. A
+ *	value of 0 specifies that the interface doesn't exist or isn't usable.
  *
  * @interface: Interface to get the port count for
  *
- * Returns Number of ports on interface. Can be Zero.
+ * Returns: Number of ports on interface. Can be Zero.
  */
 int cvmx_helper_ports_on_interface(int interface)
 {
@@ -92,8 +92,10 @@ int cvmx_helper_ports_on_interface(int interface)
 EXPORT_SYMBOL_GPL(cvmx_helper_ports_on_interface);
 
 /**
+ * __cvmx_get_mode_cn68xx() - Return interface mode for CN68xx.
  * @INTERNAL
- * Return interface mode for CN68xx.
+ *
+ * @interface: interface to get the mode for
  */
 static enum cvmx_helper_interface_mode __cvmx_get_mode_cn68xx(int interface)
 {
@@ -144,8 +146,10 @@ static enum cvmx_helper_interface_mode __cvmx_get_mode_cn68xx(int interface)
 }
 
 /**
+ * __cvmx_get_mode_octeon2() - Return interface mode for an Octeon II
  * @INTERNAL
- * Return interface mode for an Octeon II
+ *
+ * @interface: interface to get the mode for
  */
 static enum cvmx_helper_interface_mode __cvmx_get_mode_octeon2(int interface)
 {
@@ -244,8 +248,10 @@ static enum cvmx_helper_interface_mode __cvmx_get_mode_octeon2(int interface)
 }
 
 /**
+ * __cvmx_get_mode_cn7xxx() - Return interface mode for CN7XXX.
  * @INTERNAL
- * Return interface mode for CN7XXX.
+ *
+ * @interface: interface to get the mode for
  */
 static enum cvmx_helper_interface_mode __cvmx_get_mode_cn7xxx(int interface)
 {
@@ -280,13 +286,13 @@ static enum cvmx_helper_interface_mode __cvmx_get_mode_cn7xxx(int interface)
 }
 
 /**
- * Get the operating mode of an interface. Depending on the Octeon
- * chip and configuration, this function returns an enumeration
- * of the type of packet I/O supported by an interface.
+ * cvmx_helper_interface_get_mode() - Get the operating mode of an interface.
+ *	Depending on the Octeon chip and configuration, this function returns an
+ *	enumeration of the type of packet I/O supported by an interface.
  *
  * @interface: Interface to probe
  *
- * Returns Mode of the interface. Unknown or unsupported interfaces return
+ * Returns: Mode of the interface. Unknown or unsupported interfaces return
  *	   DISABLED.
  */
 enum cvmx_helper_interface_mode cvmx_helper_interface_get_mode(int interface)
@@ -362,15 +368,15 @@ enum cvmx_helper_interface_mode cvmx_helper_interface_get_mode(int interface)
 EXPORT_SYMBOL_GPL(cvmx_helper_interface_get_mode);
 
 /**
- * Configure the IPD/PIP tagging and QoS options for a specific
- * port. This function determines the POW work queue entry
- * contents for a port. The setup performed here is controlled by
- * the defines in executive-config.h.
+ * __cvmx_helper_port_setup_ipd() - Configure the IPD/PIP tagging and QoS
+ *	options for a specific port. This function determines the POW work queue
+ *	entry contents for a port. The setup performed here is controlled by the
+ *	defines in executive-config.h.
  *
  * @ipd_port: Port to configure. This follows the IPD numbering, not the
  *		   per interface numbering
  *
- * Returns Zero on success, negative on failure
+ * Returns: Zero on success, negative on failure
  */
 static int __cvmx_helper_port_setup_ipd(int ipd_port)
 {
@@ -411,13 +417,13 @@ static int __cvmx_helper_port_setup_ipd(int ipd_port)
 }
 
 /**
- * This function sets the interface_port_count[interface] correctly,
- * without modifying any hardware configuration.  Hardware setup of
- * the ports will be performed later.
+ * cvmx_helper_interface_enumerate() - This function sets the
+ *	interface_port_count[interface] correctly, without modifying any hardware
+ *	configuration. Hardware setup of the ports will be performed later.
  *
  * @interface: Interface to probe
  *
- * Returns Zero on success, negative on failure
+ * Returns: Zero on success, negative on failure
  */
 int cvmx_helper_interface_enumerate(int interface)
 {
@@ -485,15 +491,15 @@ int cvmx_helper_interface_enumerate(int interface)
 }
 
 /**
- * This function probes an interface to determine the actual
- * number of hardware ports connected to it. It doesn't setup the
- * ports or enable them. The main goal here is to set the global
- * interface_port_count[interface] correctly. Hardware setup of the
- * ports will be performed later.
+ * cvmx_helper_interface_probe() - This function probes an interface to
+ *	determine the actual number of hardware ports connected to it. It doesn't
+ *	setup the ports or enable them. The main goal here is to set the global
+ *	interface_port_count[interface] correctly. Hardware setup of the ports will
+ *	be performed later.
  *
  * @interface: Interface to probe
  *
- * Returns Zero on success, negative on failure
+ * Returns: Zero on success, negative on failure
  */
 int cvmx_helper_interface_probe(int interface)
 {
@@ -553,14 +559,14 @@ int cvmx_helper_interface_probe(int interface)
 }
 
 /**
- * Setup the IPD/PIP for the ports on an interface. Packet
- * classification and tagging are set for every port on the
- * interface. The number of ports on the interface must already
- * have been probed.
+ * __cvmx_helper_interface_setup_ipd() - Setup the IPD/PIP for the ports on an
+ *	interface. Packet classification and tagging are set for every port on the
+ *	interface. The number of ports on the interface must already have been
+ *	probed.
  *
  * @interface: Interface to setup IPD/PIP for
  *
- * Returns Zero on success, negative on failure
+ * Returns: Zero on success, negative on failure
  */
 static int __cvmx_helper_interface_setup_ipd(int interface)
 {
@@ -575,10 +581,11 @@ static int __cvmx_helper_interface_setup_ipd(int interface)
 }
 
 /**
- * Setup global setting for IPD/PIP not related to a specific
- * interface or port. This must be called before IPD is enabled.
+ * __cvmx_helper_global_setup_ipd() - Setup global setting for IPD/PIP not
+ *	related to a specific interface or port. This must be called before IPD is
+ *	enabled.
  *
- * Returns Zero on success, negative on failure.
+ * Returns: Zero on success, negative on failure.
  */
 static int __cvmx_helper_global_setup_ipd(void)
 {
@@ -597,13 +604,14 @@ static int __cvmx_helper_global_setup_ipd(void)
 }
 
 /**
- * Setup the PKO for the ports on an interface. The number of
- * queues per port and the priority of each PKO output queue
- * is set here. PKO must be disabled when this function is called.
+ * __cvmx_helper_interface_setup_pko() - Setup the PKO for the ports on an
+ *	interface. The number of queues per port and the priority of each PKO
+ *	output queue is set here. PKO must be disabled when this function is
+ *	called.
  *
  * @interface: Interface to setup PKO for
  *
- * Returns Zero on success, negative on failure
+ * Returns: Zero on success, negative on failure
  */
 static int __cvmx_helper_interface_setup_pko(int interface)
 {
@@ -641,10 +649,10 @@ static int __cvmx_helper_interface_setup_pko(int interface)
 }
 
 /**
- * Setup global setting for PKO not related to a specific
- * interface or port. This must be called before PKO is enabled.
+ * __cvmx_helper_global_setup_pko() - Setup global setting for PKO not related
+ *	to a specific interface or port. This must be called before PKO is enabled.
  *
- * Returns Zero on success, negative on failure.
+ * Returns: Zero on success, negative on failure.
  */
 static int __cvmx_helper_global_setup_pko(void)
 {
@@ -676,9 +684,10 @@ static int __cvmx_helper_global_setup_pko(void)
 }
 
 /**
- * Setup global backpressure setting.
+ * __cvmx_helper_global_setup_backpressure() - Setup global backpressure
+ *	setting.
  *
- * Returns Zero on success, negative on failure
+ * Returns: Zero on success, negative on failure
  */
 static int __cvmx_helper_global_setup_backpressure(void)
 {
@@ -710,15 +719,15 @@ static int __cvmx_helper_global_setup_backpressure(void)
 }
 
 /**
- * Enable packet input/output from the hardware. This function is
- * called after all internal setup is complete and IPD is enabled.
- * After this function completes, packets will be accepted from the
- * hardware ports. PKO should still be disabled to make sure packets
- * aren't sent out partially setup hardware.
+ * __cvmx_helper_packet_hardware_enable() - Enable packet input/output from
+ *	the hardware. This function is called after all internal setup is complete
+ *	and IPD is enabled. After this function completes, packets will be accepted
+ *	from the hardware ports. PKO should still be disabled to make sure packets
+ *	aren't sent out partially setup hardware.
  *
  * @interface: Interface to enable
  *
- * Returns Zero on success, negative on failure
+ * Returns: Zero on success, negative on failure
  */
 static int __cvmx_helper_packet_hardware_enable(int interface)
 {
@@ -772,9 +781,10 @@ static int __cvmx_helper_packet_hardware_enable(int interface)
 }
 
 /**
- * Function to adjust internal IPD pointer alignments
+ * __cvmx_helper_errata_fix_ipd_ptr_alignment() - Function to adjust internal
+ *	IPD pointer alignments
  *
- * Returns 0 on success
+ * Returns: 0 on success
  *	   !0 on failure
  */
 static int __cvmx_helper_errata_fix_ipd_ptr_alignment(void)
@@ -966,10 +976,11 @@ static int __cvmx_helper_errata_fix_ipd_ptr_alignment(void)
 }
 
 /**
- * Called after all internal packet IO paths are setup. This
- * function enables IPD/PIP and begins packet input and output.
+ * cvmx_helper_ipd_and_packet_input_enable() - Called after all internal
+ *	packet IO paths are setup. This function enables IPD/PIP and begins packet
+ *	input and output.
  *
- * Returns Zero on success, negative on failure
+ * Returns: Zero on success, negative on failure
  */
 int cvmx_helper_ipd_and_packet_input_enable(void)
 {
@@ -1002,13 +1013,13 @@ int cvmx_helper_ipd_and_packet_input_enable(void)
 EXPORT_SYMBOL_GPL(cvmx_helper_ipd_and_packet_input_enable);
 
 /**
- * Initialize the PIP, IPD, and PKO hardware to support
- * simple priority based queues for the ethernet ports. Each
- * port is configured with a number of priority queues based
- * on CVMX_PKO_QUEUES_PER_PORT_* where each queue is lower
- * priority than the previous.
+ * cvmx_helper_initialize_packet_io_global() - Initialize the PIP, IPD, and
+ *	PKO hardware to support simple priority based queues for the ethernet
+ *	ports. Each port is configured with a number of priority queues based on
+ *	CVMX_PKO_QUEUES_PER_PORT_* where each queue is lower priority than the
+ *	previous.
  *
- * Returns Zero on success, non-zero on failure
+ * Returns: Zero on success, non-zero on failure
  */
 int cvmx_helper_initialize_packet_io_global(void)
 {
@@ -1062,14 +1073,14 @@ int cvmx_helper_initialize_packet_io_global(void)
 EXPORT_SYMBOL_GPL(cvmx_helper_initialize_packet_io_global);
 
 /**
- * Return the link state of an IPD/PKO port as returned by
- * auto negotiation. The result of this function may not match
- * Octeon's link config if auto negotiation has changed since
- * the last call to cvmx_helper_link_set().
+ * cvmx_helper_link_get() - Return the link state of an IPD/PKO port as
+ *	returned by auto negotiation. The result of this function may not match
+ *	Octeon's link config if auto negotiation has changed since the last call to
+ *	cvmx_helper_link_set().
  *
  * @ipd_port: IPD/PKO port to query
  *
- * Returns Link state
+ * Returns: Link state
  */
 union cvmx_helper_link_info cvmx_helper_link_get(int ipd_port)
 {
@@ -1122,15 +1133,15 @@ union cvmx_helper_link_info cvmx_helper_link_get(int ipd_port)
 EXPORT_SYMBOL_GPL(cvmx_helper_link_get);
 
 /**
- * Configure an IPD/PKO port for the specified link state. This
- * function does not influence auto negotiation at the PHY level.
- * The passed link state must always match the link state returned
- * by cvmx_helper_link_get().
+ * cvmx_helper_link_set() - Configure an IPD/PKO port for the specified link
+ *	state. This function does not influence auto negotiation at the PHY level.
+ *	The passed link state must always match the link state returned by
+ *	cvmx_helper_link_get().
  *
  * @ipd_port:  IPD/PKO port to configure
  * @link_info: The new link state
  *
- * Returns Zero on success, negative on failure
+ * Returns: Zero on success, negative on failure
  */
 int cvmx_helper_link_set(int ipd_port, union cvmx_helper_link_info link_info)
 {
diff --git a/arch/mips/cavium-octeon/executive/cvmx-interrupt-rsl.c b/arch/mips/cavium-octeon/executive/cvmx-interrupt-rsl.c
index d23f46736..6729355e4 100644
--- a/arch/mips/cavium-octeon/executive/cvmx-interrupt-rsl.c
+++ b/arch/mips/cavium-octeon/executive/cvmx-interrupt-rsl.c
@@ -42,8 +42,8 @@
 void __cvmx_interrupt_gmxx_rxx_int_en_enable(int index, int block);
 
 /**
- * Enable ASX error interrupts that exist on CN3XXX, CN50XX, and
- * CN58XX.
+ * __cvmx_interrupt_asxx_enable() - Enable ASX error interrupts that exist on
+ *	CN3XXX, CN50XX, and CN58XX.
  *
  * @block:  Interface to enable 0-1
  */
@@ -69,7 +69,8 @@ void __cvmx_interrupt_asxx_enable(int block)
 	cvmx_write_csr(CVMX_ASXX_INT_EN(block), csr.u64);
 }
 /**
- * Enable GMX error reporting for the supplied interface
+ * __cvmx_interrupt_gmxx_enable() - Enable GMX error reporting for the
+ *	supplied interface
  *
  * @interface: Interface to enable
  */
diff --git a/arch/mips/cavium-octeon/executive/octeon-model.c b/arch/mips/cavium-octeon/executive/octeon-model.c
index 98996cc08..e46717b13 100644
--- a/arch/mips/cavium-octeon/executive/octeon-model.c
+++ b/arch/mips/cavium-octeon/executive/octeon-model.c
@@ -32,10 +32,11 @@ enum octeon_feature_bits __octeon_feature_bits __read_mostly;
 EXPORT_SYMBOL_GPL(__octeon_feature_bits);
 
 /**
- * Read a byte of fuse data
+ * cvmx_fuse_read_byte() - Read a byte of fuse data
+ *
  * @byte_addr:	 address to read
  *
- * Returns fuse value: 0 or 1
+ * Returns: fuse value: 0 or 1
  */
 static uint8_t __init cvmx_fuse_read_byte(int byte_addr)
 {
@@ -493,17 +494,15 @@ static const char *__init octeon_model_get_string_buffer(uint32_t chip_id,
 }
 
 /**
- * Given the chip processor ID from COP0, this function returns a
- * string representing the chip model number. The string is of the
- * form CNXXXXpX.X-FREQ-SUFFIX.
- * - XXXX = The chip model number
- * - X.X = Chip pass number
- * - FREQ = Current frequency in Mhz
- * - SUFFIX = NSP, EXP, SCP, SSP, or CP
+ * octeon_model_get_string() - Given the chip processor ID from COP0, this
+ *	function returns a string representing the chip model number. The string is
+ *	of the form CNXXXXpX.X-FREQ-SUFFIX. - XXXX = The chip model number - X.X =
+ *	Chip pass number - FREQ = Current frequency in Mhz - SUFFIX = NSP, EXP,
+ *	SCP, SSP, or CP
  *
  * @chip_id: Chip ID
  *
- * Returns Model string
+ * Returns: Model string
  */
 const char *__init octeon_model_get_string(uint32_t chip_id)
 {
diff --git a/arch/mips/cavium-octeon/octeon-crypto.c b/arch/mips/cavium-octeon/octeon-crypto.c
index 0ff855939..173a8a904 100644
--- a/arch/mips/cavium-octeon/octeon-crypto.c
+++ b/arch/mips/cavium-octeon/octeon-crypto.c
@@ -13,11 +13,12 @@
 #include <linux/sched/task_stack.h>
 
 /**
- * Enable access to Octeon's COP2 crypto hardware for kernel use. Wrap any
- * crypto operations in calls to octeon_crypto_enable/disable in order to make
- * sure the state of COP2 isn't corrupted if userspace is also performing
- * hardware crypto operations. Allocate the state parameter on the stack.
- * Returns with preemption disabled.
+ * octeon_crypto_enable() - Enable access to Octeon's COP2 crypto hardware for
+ *	kernel use. Wrap any crypto operations in calls to
+ *	octeon_crypto_enable/disable in order to make sure the state of COP2 isn't
+ *	corrupted if userspace is also performing hardware crypto operations.
+ *	Allocate the state parameter on the stack. Returns with preemption
+ *	disabled.
  *
  * @state: Pointer to state structure to store current COP2 state in.
  *
@@ -45,12 +46,12 @@ unsigned long octeon_crypto_enable(struct octeon_cop2_state *state)
 EXPORT_SYMBOL_GPL(octeon_crypto_enable);
 
 /**
- * Disable access to Octeon's COP2 crypto hardware in the kernel. This must be
- * called after an octeon_crypto_enable() before any context switch or return to
- * userspace.
+ * octeon_crypto_disable() - Disable access to Octeon's COP2 crypto hardware
+ *	in the kernel. This must be called after an octeon_crypto_enable() before
+ *	any context switch or return to userspace.
  *
  * @state:	Pointer to COP2 state to restore
- * @flags:	Return value from octeon_crypto_enable()
+ * @crypto_flags: Return value from octeon_crypto_enable()
  */
 void octeon_crypto_disable(struct octeon_cop2_state *state,
 			   unsigned long crypto_flags)
diff --git a/arch/mips/pci/pci-octeon.c b/arch/mips/pci/pci-octeon.c
index 36d12cea3..4bf770f3f 100644
--- a/arch/mips/pci/pci-octeon.c
+++ b/arch/mips/pci/pci-octeon.c
@@ -37,7 +37,11 @@
 u64 octeon_bar1_pci_phys;
 
 /**
- * This is the bit decoding used for the Octeon PCI controller addresses
+ * union octeon_pci_address - This is the bit decoding used for the Octeon PCI
+ *	controller addresses
+ *
+ * @u64: the address as a single 64-bit value
+ * @s: the address split into bit fields
  */
 union octeon_pci_address {
 	uint64_t u64;
@@ -61,7 +65,7 @@ int (*octeon_pcibios_map_irq)(const struct pci_dev *dev, u8 slot, u8 pin);
 enum octeon_dma_bar_type octeon_dma_bar_type = OCTEON_DMA_BAR_TYPE_INVALID;
 
 /**
- * Map a PCI device to the appropriate interrupt line
+ * pcibios_map_irq() - Map a PCI device to the appropriate interrupt line
  *
  * @dev:    The Linux PCI device structure for the device to map
  * @slot:   The slot number for this device on __BUS 0__. Linux
@@ -69,7 +73,8 @@ enum octeon_dma_bar_type octeon_dma_bar_type = OCTEON_DMA_BAR_TYPE_INVALID;
  *		 slot on Bus 0 where this device eventually hooks to.
  * @pin:    The PCI interrupt pin read from the device, then swizzled
  *		 as it goes through each bridge.
- * Returns Interrupt number for the device
+ *
+ * Returns: Interrupt number for the device
  */
 int pcibios_map_irq(const struct pci_dev *dev, u8 slot, u8 pin)
 {
@@ -168,13 +173,12 @@ int pcibios_plat_dev_init(struct pci_dev *dev)
 }
 
 /**
- * Return the mapping of PCI device number to IRQ line. Each
- * character in the return string represents the interrupt
- * line for the device at that position. Device 1 maps to the
- * first character, etc. The characters A-D are used for PCI
- * interrupts.
+ * octeon_get_pci_interrupts() - Return the mapping of PCI device number to
+ *	IRQ line. Each character in the return string represents the interrupt line
+ *	for the device at that position. Device 1 maps to the first character, etc.
+ *	The characters A-D are used for PCI interrupts.
  *
- * Returns PCI interrupt mapping
+ * Returns: PCI interrupt mapping
  */
 const char *octeon_get_pci_interrupts(void)
 {
@@ -221,7 +225,8 @@ const char *octeon_get_pci_interrupts(void)
 }
 
 /**
- * Map a PCI device to the appropriate interrupt line
+ * octeon_pci_pcibios_map_irq() - Map a PCI device to the appropriate
+ *	interrupt line
  *
  * @dev:    The Linux PCI device structure for the device to map
  * @slot:   The slot number for this device on __BUS 0__. Linux
@@ -229,7 +234,8 @@ const char *octeon_get_pci_interrupts(void)
  *		 slot on Bus 0 where this device eventually hooks to.
  * @pin:    The PCI interrupt pin read from the device, then swizzled
  *		 as it goes through each bridge.
- * Returns Interrupt number for the device
+ *
+ * Returns: Interrupt number for the device
  */
 int __init octeon_pci_pcibios_map_irq(const struct pci_dev *dev,
 				      u8 slot, u8 pin)
-- 
2.43.0

