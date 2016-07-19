Received: from mailapp01.imgtec.com ([195.59.15.196]:12004 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992607AbcGSOIQ4E7hv (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 19 Jul 2016 16:08:16 +0200
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: [PATCH] MIPS: OCTEON: cavium_octeon_defconfig: Enable OCTEON SATA
Date: Tue, 19 Jul 2016 15:08:06 +0100
Message-ID: <1468937286-13454-1-git-send-email-matt.redfearn@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Matt.Redfearn@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Matt Redfearn <matt.redfearn@imgtec.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
Message-ID: <20160719140806.1ibewB5VCBpDgE3o0xfL1lG-o2qMrVq-euglqxxVhlA@z>

Commit a2127e400edd ("libata: support AHCI on OCTEON platform") added a
driver for the OCTEON AHCI controller. Enable this driver in the OCTEON
defconfig.

Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
---

 arch/mips/configs/cavium_octeon_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/configs/cavium_octeon_defconfig b/arch/mips/configs/cavium_octeon_defconfig
index dcac308cec39..d470d08362c0 100644
--- a/arch/mips/configs/cavium_octeon_defconfig
+++ b/arch/mips/configs/cavium_octeon_defconfig
@@ -59,6 +59,8 @@ CONFIG_EEPROM_AT25=y
 CONFIG_BLK_DEV_SD=y
 CONFIG_ATA=y
 CONFIG_SATA_AHCI=y
+CONFIG_SATA_AHCI_PLATFORM=y
+CONFIG_AHCI_OCTEON=y
 CONFIG_PATA_OCTEON_CF=y
 CONFIG_SATA_SIL=y
 CONFIG_NETDEVICES=y
-- 
2.7.4
