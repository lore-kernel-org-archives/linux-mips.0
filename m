Received: from 9pmail.ess.barracuda.com ([64.235.154.210]:45924 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23994657AbeBQUOYgyhgG (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 17 Feb 2018 21:14:24 +0100
From: Paul Burton <paul.burton@mips.com>
Subject: [PATCH v5 06/14] net: pch_gbe: Allow longer for resets
Date: Sat, 17 Feb 2018 12:10:29 -0800
Message-ID: <20180217201037.3006-7-paul.burton@mips.com>
In-Reply-To: <20180217201037.3006-1-paul.burton@mips.com>
References: <20180217201037.3006-1-paul.burton@mips.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Paul.Burton@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: netdev@vger.kernel.org
Cc: Hassan Naveed <hassan.naveed@mips.com>, Matt Redfearn <matt.redfearn@mips.com>, "David S . Miller" <davem@davemloft.net>, linux-mips@linux-mips.org, Paul Burton <paul.burton@mips.com>
Message-ID: <20180217201029.xYSS0IxIw4kR4go7NCBP16NMgBz_7xNDgUltJXBuf-I@z>

Resets of the EG20T MAC on the MIPS Boston development board take longer
than the 1000 loops that pch_gbe_wait_clr_bit was performing. Rather
than simply increasing the number of loops, switch to using
readl_poll_timeout_atomic() from linux/iopoll.h in order to provide some
independence from the speed of the CPU.

Signed-off-by: Paul Burton <paul.burton@mips.com>
Cc: David S. Miller <davem@davemloft.net>
Cc: linux-mips@linux-mips.org
Cc: netdev@vger.kernel.org

---

Changes in v5:
- Bump up the timeout based on feedback from Marcin.

Changes in v4: None
Changes in v3:
- Switch to using readl_poll_timeout_atomic().

Changes in v2: None

 drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c b/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c
index 90e795d5cc1c..77f7fbd98e8f 100644
--- a/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c
+++ b/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c
@@ -24,6 +24,7 @@
 #include <linux/ptp_classify.h>
 #include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
+#include <linux/iopoll.h>
 #include <linux/of_gpio.h>
 
 #define DRV_VERSION     "1.01"
@@ -318,13 +319,11 @@ s32 pch_gbe_mac_read_mac_addr(struct pch_gbe_hw *hw)
  */
 static void pch_gbe_wait_clr_bit(void *reg, u32 bit)
 {
+	int err;
 	u32 tmp;
 
-	/* wait busy */
-	tmp = 1000;
-	while ((ioread32(reg) & bit) && --tmp)
-		cpu_relax();
-	if (!tmp)
+	err = readl_poll_timeout_atomic(reg, tmp, !(tmp & bit), 10, 25000);
+	if (err)
 		pr_err("Error: busy bit is not cleared\n");
 }
 
-- 
2.16.1
