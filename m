Received: from multi.imgtec.com ([194.200.65.239]:60417 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6835266Ab3FMPnoiT0bO (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 13 Jun 2013 17:43:44 +0200
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH] MIPS: Kconfig: Select USB_EHCI_HCD if USB_SUPPORt is enabled
Date: Thu, 13 Jun 2013 16:42:14 +0100
Message-ID: <1371138134-21216-1-git-send-email-markos.chandras@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Markos.Chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20130613154214.RohJphNiGQqjfjxcJojj5WRHYBJe2hr4gb78M9S2OTI@z>

Commit 94d83649e1c2f25c87dc4ead9c2ab073305
"USB: remove USB_EHCI_BIG_ENDIAN_{DESC,MMIO} depends on architecture symbol"

caused the following regression in cavium_octeon_defconfig:

warning: (MIPS_SEAD3 && PMC_MSP && CPU_CAVIUM_OCTEON) selects
USB_EHCI_BIG_ENDIAN_MMIO which has unmet direct dependencies
(USB_SUPPORT && USB && USB_EHCI_HCD)

We fix this problem by selecting the USB_EHCI_HCD missing dependency
if USB_SUPPORT is enabled.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
Acked-by: Steven J. Hill <Steven.Hill@imgtec.com> 
---
This patch is for the upstream-sfr/mips-for-linux-next
---
 arch/mips/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 87ddac9..a058ba8 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1411,6 +1411,7 @@ config CPU_CAVIUM_OCTEON
 	select CPU_SUPPORTS_HUGEPAGES
 	select LIBFDT
 	select USE_OF
+	select USB_EHCI_HCD if USB_SUPPORT
 	select USB_EHCI_BIG_ENDIAN_MMIO
 	help
 	  The Cavium Octeon processor is a highly integrated chip containing
-- 
1.8.2.1
