Received: from mailapp01.imgtec.com ([195.59.15.196]:53310 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993973AbdFBXnab0rS4 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 3 Jun 2017 01:43:30 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH v3 6/7] net: pch_gbe: Allow longer for resets
Date: Fri, 2 Jun 2017 16:40:41 -0700
Message-ID: <20170602234042.22782-7-paul.burton@imgtec.com>
In-Reply-To: <20170602234042.22782-1-paul.burton@imgtec.com>
References: <20170602234042.22782-1-paul.burton@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Paul.Burton@imgtec.com>
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
Cc: Tobias Klauser <tklauser@distanz.ch>, "David S . Miller" <davem@davemloft.net>, Jarod Wilson <jarod@redhat.com>, linux-mips@linux-mips.org, Eric Dumazet <edumazet@google.com>, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20170602234041.0TmcbN998pt4yxBcoroqccc1iIr1QfR8I_rvBHkolnQ@z>

Resets of the EG20T MAC on the MIPS Boston development board take longer
than the 1000 loops that pch_gbe_wait_clr_bit was performing. Rather
than simply increasing the number of loops, switch to using
readl_poll_timeout_atomic() from linux/iopoll.h in order to provide some
independence from the speed of the CPU.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: David S. Miller <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jarod Wilson <jarod@redhat.com>
Cc: Tobias Klauser <tklauser@distanz.ch>
Cc: linux-mips@linux-mips.org
Cc: netdev@vger.kernel.org

---

Changes in v3:
- Switch to using readl_poll_timeout_atomic().

Changes in v2: None

 drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c b/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c
index f8791be7b3b5..3d0f4c8b1742 100644
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
+	err = readl_poll_timeout_atomic(reg, tmp, !(tmp & bit), 10, 500);
+	if (err)
 		pr_err("Error: busy bit is not cleared\n");
 }
 
-- 
2.13.0
