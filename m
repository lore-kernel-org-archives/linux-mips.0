Received: from multi.imgtec.com ([194.200.65.239]:57287 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6824782Ab3HMJCujGzyD (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 13 Aug 2013 11:02:50 +0200
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH] MIPS: ath79: Avoid using unitialized 'reg' variable
Date: Tue, 13 Aug 2013 10:01:18 +0100
Message-ID: <1376384478-27424-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20130813090118.ddDJzQsj7y9nFjdlxKFiv0nicuHUfp5RA1q9XXlsca8@z>

Fixes the following build error:
arch/mips/include/asm/mach-ath79/ath79.h:139:20: error: 'reg' may be used
uninitialized in this function [-Werror=maybe-uninitialized]
arch/mips/ath79/common.c:62:6: note: 'reg' was declared here
In file included from arch/mips/ath79/common.c:20:0:
arch/mips/ath79/common.c: In function 'ath79_device_reset_clear':
arch/mips/include/asm/mach-ath79/ath79.h:139:20:
error: 'reg' may be used uninitialized in this function
[-Werror=maybe-uninitialized]
arch/mips/ath79/common.c:90:6: note: 'reg' was declared here

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
This patch is for the upstream-sfr/mips-for-linux-next tree
---
 arch/mips/ath79/common.c | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/arch/mips/ath79/common.c b/arch/mips/ath79/common.c
index eb3966c..6a8c00f 100644
--- a/arch/mips/ath79/common.c
+++ b/arch/mips/ath79/common.c
@@ -62,20 +62,22 @@ void ath79_device_reset_set(u32 mask)
 	u32 reg;
 	u32 t;
 
-	if (soc_is_ar71xx())
+	if (soc_is_ar71xx()) {
 		reg = AR71XX_RESET_REG_RESET_MODULE;
-	else if (soc_is_ar724x())
+	} else if (soc_is_ar724x()) {
 		reg = AR724X_RESET_REG_RESET_MODULE;
-	else if (soc_is_ar913x())
+	} else if (soc_is_ar913x()) {
 		reg = AR913X_RESET_REG_RESET_MODULE;
-	else if (soc_is_ar933x())
+	} else if (soc_is_ar933x()) {
 		reg = AR933X_RESET_REG_RESET_MODULE;
-	else if (soc_is_ar934x())
+	} else if (soc_is_ar934x()) {
 		reg = AR934X_RESET_REG_RESET_MODULE;
-	else if (soc_is_qca955x())
+	} else if (soc_is_qca955x()) {
 		reg = QCA955X_RESET_REG_RESET_MODULE;
-	else
+	} else {
 		BUG();
+		panic("Unknown SOC!");
+	}
 
 	spin_lock_irqsave(&ath79_device_reset_lock, flags);
 	t = ath79_reset_rr(reg);
@@ -90,20 +92,22 @@ void ath79_device_reset_clear(u32 mask)
 	u32 reg;
 	u32 t;
 
-	if (soc_is_ar71xx())
+	if (soc_is_ar71xx()) {
 		reg = AR71XX_RESET_REG_RESET_MODULE;
-	else if (soc_is_ar724x())
+	} else if (soc_is_ar724x()) {
 		reg = AR724X_RESET_REG_RESET_MODULE;
-	else if (soc_is_ar913x())
+	} else if (soc_is_ar913x()) {
 		reg = AR913X_RESET_REG_RESET_MODULE;
-	else if (soc_is_ar933x())
+	} else if (soc_is_ar933x()) {
 		reg = AR933X_RESET_REG_RESET_MODULE;
-	else if (soc_is_ar934x())
+	} else if (soc_is_ar934x()) {
 		reg = AR934X_RESET_REG_RESET_MODULE;
-	else if (soc_is_qca955x())
+	} else if (soc_is_qca955x()) {
 		reg = QCA955X_RESET_REG_RESET_MODULE;
-	else
+	} else {
 		BUG();
+		panic("Unknown SOC!");
+	}
 
 	spin_lock_irqsave(&ath79_device_reset_lock, flags);
 	t = ath79_reset_rr(reg);
-- 
1.8.3.2
