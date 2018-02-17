Received: from 9pmail.ess.barracuda.com ([64.235.150.224]:50538 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992923AbeBQUOhoibyG (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 17 Feb 2018 21:14:37 +0100
From: Paul Burton <paul.burton@mips.com>
Subject: [PATCH v5 13/14] ptp: pch: Allow build on MIPS platforms
Date: Sat, 17 Feb 2018 12:10:36 -0800
Message-ID: <20180217201037.3006-14-paul.burton@mips.com>
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
Message-ID: <20180217201036.rYA1vbL9fmZOqwCngwFelU92WOqFZahOx_JmScxhGiE@z>

Allow the ptp_pch driver to be built on MIPS platforms in preparation
for use on the MIPS Boston board.

Signed-off-by: Paul Burton <paul.burton@mips.com>
Acked-by: Richard Cochran <richardcochran@gmail.com>
Cc: David S. Miller <davem@davemloft.net>
Cc: linux-mips@linux-mips.org
Cc: netdev@vger.kernel.org

---

Changes in v5:
- Newly included in this series to satisfy Kconfig.

Changes in v4: None
Changes in v3: None
Changes in v2: None

 drivers/ptp/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ptp/Kconfig b/drivers/ptp/Kconfig
index a21ad10d613c..8618982ab96a 100644
--- a/drivers/ptp/Kconfig
+++ b/drivers/ptp/Kconfig
@@ -90,7 +90,7 @@ config DP83640_PHY
 
 config PTP_1588_CLOCK_PCH
 	tristate "Intel PCH EG20T as PTP clock"
-	depends on X86_32 || COMPILE_TEST
+	depends on X86_32 || MIPS || COMPILE_TEST
 	depends on HAS_IOMEM && NET
 	imply PTP_1588_CLOCK
 	help
-- 
2.16.1
