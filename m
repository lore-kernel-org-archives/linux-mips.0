Received: from mout.gmx.net ([212.227.15.15]:53890 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S23990410AbeAZJjR5jf2U (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 26 Jan 2018 10:39:17 +0100
From: Sven Joachim <svenjoac@gmx.de>
Subject: [PATCH] ssb: Do not disable PCI host on non-Mips
Date: Fri, 26 Jan 2018 10:38:01 +0100
Message-ID: <87vafpq7t2.fsf@turtle.gmx.de>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <svenjoac@gmx.de>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Michael Buesch <m@bues.ch>, linux-wireless@vger.kernel.org
Cc: James Hogan <jhogan@kernel.org>, linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>James Hogan <jhogan@kernel.org>, Paul Burton <paul.burton@mips.com>, Matt Redfearn <matt.redfearn@imgtec.com>, Guenter Roeck <linux@roeck-us.net>
Message-ID: <20180126093801.D9O98TqIjCPy8vdpAOJAgfB7QNiuIWXkNZMzt_vexCs@z>

After upgrading an old laptop to 4.15-rc9, I found that the eth0 and
wlan0 interfaces had disappeared.  It turns out that the b43 and b44
drivers require SSB_PCIHOST_POSSIBLE which depends on
PCI_DRIVERS_LEGACY, a config option that only exists on Mips.

Fixes: 58eae1416b80 ("ssb: Disable PCI host for PCI_DRIVERS_GENERIC")
Cc: stable@vger.org
Signed-off-by: Sven Joachim <svenjoac@gmx.de>
---
 drivers/ssb/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ssb/Kconfig b/drivers/ssb/Kconfig
index 71c73766ee22..65af12c3bdb2 100644
--- a/drivers/ssb/Kconfig
+++ b/drivers/ssb/Kconfig
@@ -32,7 +32,7 @@ config SSB_BLOCKIO
 
 config SSB_PCIHOST_POSSIBLE
 	bool
-	depends on SSB && (PCI = y || PCI = SSB) && PCI_DRIVERS_LEGACY
+	depends on SSB && (PCI = y || PCI = SSB) && (PCI_DRIVERS_LEGACY || !MIPS)
 	default y
 
 config SSB_PCIHOST
-- 
2.15.1
