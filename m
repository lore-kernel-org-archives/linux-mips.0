Received: from mailapp01.imgtec.com ([195.59.15.196]:64435 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011750AbcBCLeID7C3M (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 3 Feb 2016 12:34:08 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH v2 12/15] ptp: pch: Allow build on MIPS platforms
Date: Wed, 3 Feb 2016 11:30:42 +0000
Message-ID: <1454499045-5020-13-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1454499045-5020-1-git-send-email-paul.burton@imgtec.com>
References: <1454499045-5020-1-git-send-email-paul.burton@imgtec.com>
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
To: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@imgtec.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>
Message-ID: <20160203113042.ItEoJHTvXN91DDiXOM8_WpUkIgmfy03tLmKya5rGOZc@z>

Allow the ptp_pch driver to be built on MIPS platforms in preparation
for use on the MIPS Boston board.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Acked-by: Richard Cochran <richardcochran@gmail.com>
---

Changes in v2: None

 drivers/ptp/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ptp/Kconfig b/drivers/ptp/Kconfig
index ee3de34..ee43549 100644
--- a/drivers/ptp/Kconfig
+++ b/drivers/ptp/Kconfig
@@ -74,7 +74,7 @@ config DP83640_PHY
 
 config PTP_1588_CLOCK_PCH
 	tristate "Intel PCH EG20T as PTP clock"
-	depends on X86_32 || COMPILE_TEST
+	depends on X86_32 || MIPS || COMPILE_TEST
 	depends on HAS_IOMEM && NET
 	select PTP_1588_CLOCK
 	help
-- 
2.7.0
