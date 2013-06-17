Received: from multi.imgtec.com ([194.200.65.239]:32343 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6835256Ab3FQOBdYn70f (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 17 Jun 2013 16:01:33 +0200
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 6/7] drivers: ssb: Kconfig: Amend SSB_EMBEDDED dependencies
Date: Mon, 17 Jun 2013 15:00:40 +0100
Message-ID: <1371477641-7989-7-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1371477641-7989-1-git-send-email-markos.chandras@imgtec.com>
References: <1371477641-7989-1-git-send-email-markos.chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>, sibyte-users@bitmover.com, netdev@vger.kernel.org, Michael Buesch <m@bues.ch>
Message-ID: <20130617140040.CC_flZt8MwayS-uhc9bkttt5Ht1IXWqbFwINqJ9ZE0A@z>

SSB_EMBEDDED needs functions from driver_pcicore which are only
available if SSD_DRIVER_HOSTMODE is selected so make it
depend on that symbol.

Fixes the following linking problem:

drivers/ssb/embedded.c:202:
undefined reference to `ssb_pcicore_plat_dev_init'
drivers/built-in.o: In function `ssb_pcibios_map_irq':
drivers/ssb/embedded.c:247:
undefined reference to `ssb_pcicore_pcibios_map_irq'

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
Acked-by: Steven J. Hill <Steven.Hill@imgtec.com>
Cc: sibyte-users@bitmover.com
Cc: netdev@vger.kernel.org
Cc: Michael Buesch <m@bues.ch>
---
 drivers/ssb/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ssb/Kconfig b/drivers/ssb/Kconfig
index 5ff3a4f..36171fd 100644
--- a/drivers/ssb/Kconfig
+++ b/drivers/ssb/Kconfig
@@ -144,7 +144,7 @@ config SSB_SFLASH
 # Assumption: We are on embedded, if we compile the MIPS core.
 config SSB_EMBEDDED
 	bool
-	depends on SSB_DRIVER_MIPS
+	depends on SSB_DRIVER_MIPS && SSB_PCICORE_HOSTMODE
 	default y
 
 config SSB_DRIVER_EXTIF
-- 
1.8.2.1
