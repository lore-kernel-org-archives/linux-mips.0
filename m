Received: from mailapp01.imgtec.com ([195.59.15.196]:29339 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009961AbcBBLZueOiHl (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 2 Feb 2016 12:25:50 +0100
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Subject: [PATCH] MIPS: Octeon: Add Octeon III CN7XXX interface detection
Date: Tue, 2 Feb 2016 11:25:18 +0000
Message-ID: <1454412318-27213-1-git-send-email-Zubair.Kakakhel@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Zubair.Kakakhel@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: david.daney@cavium.com
Cc: janne.huttunen@nokia.com, aaro.koskinen@nokia.com, ralf@linux-mips.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Zubair.Kakakhel@imgtec.com
Message-ID: <20160202112518.2ODvJx6Sv56H3wNEpLibGrw3Ddgg7P5Zq8z6QiaExkM@z>

Add basic CN7XXX interface detection.

This allows the kernel to boot with ethernet working as it initializes
the ethernet ports with SGMII instead of defaulting to RGMII routines.

Tested on the utm8 from Rhino Labs with a CN7130.

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
---
 arch/mips/cavium-octeon/executive/cvmx-helper.c | 41 +++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/mips/cavium-octeon/executive/cvmx-helper.c b/arch/mips/cavium-octeon/executive/cvmx-helper.c
index 376701f..1a28009 100644
--- a/arch/mips/cavium-octeon/executive/cvmx-helper.c
+++ b/arch/mips/cavium-octeon/executive/cvmx-helper.c
@@ -87,6 +87,8 @@ int cvmx_helper_get_number_of_interfaces(void)
 		return 9;
 	if (OCTEON_IS_MODEL(OCTEON_CN56XX) || OCTEON_IS_MODEL(OCTEON_CN52XX))
 		return 4;
+	if (OCTEON_IS_MODEL(OCTEON_CN7XXX))
+		return 5;
 	else
 		return 3;
 }
@@ -260,6 +262,39 @@ static cvmx_helper_interface_mode_t __cvmx_get_mode_octeon2(int interface)
 }
 
 /**
+ * @INTERNAL
+ * Return interface mode for CN7XXX.
+ */
+static cvmx_helper_interface_mode_t __cvmx_get_mode_cn7xxx(int interface)
+{
+	union cvmx_gmxx_inf_mode mode;
+
+	mode.u64 = cvmx_read_csr(CVMX_GMXX_INF_MODE(interface));
+
+	if (interface < 2) {		/* SGMII/QSGMII/XAUI */
+		switch (mode.cn68xx.mode) {
+		case 0:
+			return CVMX_HELPER_INTERFACE_MODE_DISABLED;
+		case 1:
+		case 2:
+			return CVMX_HELPER_INTERFACE_MODE_SGMII;
+		case 3:
+			return CVMX_HELPER_INTERFACE_MODE_XAUI;
+		default:
+			return CVMX_HELPER_INTERFACE_MODE_SGMII;
+		}
+	} else if (interface == 2)	/* NPI */
+		return CVMX_HELPER_INTERFACE_MODE_NPI;
+	else if (interface == 3)	/* LOOP */
+		return CVMX_HELPER_INTERFACE_MODE_LOOP;
+	else if (interface == 4)	/* RGMII (AGL) */
+		return CVMX_HELPER_INTERFACE_MODE_RGMII;
+
+	return CVMX_HELPER_INTERFACE_MODE_DISABLED;
+}
+
+
+/**
  * Get the operating mode of an interface. Depending on the Octeon
  * chip and configuration, this function returns an enumeration
  * of the type of packet I/O supported by an interface.
@@ -278,6 +313,12 @@ cvmx_helper_interface_mode_t cvmx_helper_interface_get_mode(int interface)
 		return CVMX_HELPER_INTERFACE_MODE_DISABLED;
 
 	/*
+	 * OCTEON III models
+	 */
+	if (OCTEON_IS_MODEL(OCTEON_CN7XXX))
+		return __cvmx_get_mode_cn7xxx(interface);
+
+	/*
 	 * Octeon II models
 	 */
 	if (OCTEON_IS_MODEL(OCTEON_CN6XXX) || OCTEON_IS_MODEL(OCTEON_CNF71XX))
-- 
1.9.1
