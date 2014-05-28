Received: from mail-bn1lp0141.outbound.protection.outlook.com ([207.46.163.141]:9334
        "EHLO na01-bn1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6854792AbaE1WKNOTmw5 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 29 May 2014 00:10:13 +0200
From: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
Subject: [PATCH v2 02/13] MIPS: Move system level config items from CPU_CAVIUM_OCTEON to CAVIUM_OCTEON_SOC
Date: Wed, 28 May 2014 23:52:05 +0200
Message-ID: <1401313936-11867-3-git-send-email-andreas.herrmann@caviumnetworks.com>
In-Reply-To: <1401313936-11867-1-git-send-email-andreas.herrmann@caviumnetworks.com>
References: <1401313936-11867-1-git-send-email-andreas.herrmann@caviumnetworks.com>
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
Cc: David Daney <ddaney.cavm@gmail.com>, Andreas Herrmann <andreas.herrmann@caviumnetworks.com>, James Hogan <james.hogan@imgtec.com>, kvm@vger.kernel.org, David Daney <david.daney@cavium.com>
Message-ID: <20140528215205.knLcGb9JunYpBKPWWZlUKp5wN3PeIGdJaLxw7AKwhh8@z>

From: David Daney <david.daney@cavium.com>

They are a property of the SoC not the CPU itself.

Signed-off-by: David Daney <david.daney@cavium.com>
Signed-off-by: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
---
 arch/mips/Kconfig |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 125edd4..d540945 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -730,6 +730,11 @@ config CAVIUM_OCTEON_SOC
 	select ZONE_DMA32
 	select HOLES_IN_ZONE
 	select ARCH_REQUIRE_GPIOLIB
+	select LIBFDT
+	select USE_OF
+	select ARCH_SPARSEMEM_ENABLE
+	select SYS_SUPPORTS_SMP
+	select NR_CPUS_DEFAULT_16
 	help
 	  This option supports all of the Octeon reference boards from Cavium
 	  Networks. It builds a kernel that dynamically determines the Octeon
@@ -1408,16 +1413,11 @@ config CPU_SB1
 config CPU_CAVIUM_OCTEON
 	bool "Cavium Octeon processor"
 	depends on SYS_HAS_CPU_CAVIUM_OCTEON
-	select ARCH_SPARSEMEM_ENABLE
 	select CPU_HAS_PREFETCH
 	select CPU_SUPPORTS_64BIT_KERNEL
-	select SYS_SUPPORTS_SMP
-	select NR_CPUS_DEFAULT_16
 	select WEAK_ORDERING
 	select CPU_SUPPORTS_HIGHMEM
 	select CPU_SUPPORTS_HUGEPAGES
-	select LIBFDT
-	select USE_OF
 	select USB_EHCI_BIG_ENDIAN_MMIO
 	select MIPS_L1_CACHE_SHIFT_7
 	help
-- 
1.7.9.5
