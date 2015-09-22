Received: from mailapp01.imgtec.com ([195.59.15.196]:22291 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009102AbbIVSOIeku8U (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 22 Sep 2015 20:14:08 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 05/10] MIPS: CPS: skip Config1 presence check
Date: Tue, 22 Sep 2015 11:12:13 -0700
Message-ID: <1442945538-26141-6-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1442945538-26141-1-git-send-email-paul.burton@imgtec.com>
References: <1442945538-26141-1-git-send-email-paul.burton@imgtec.com>
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
To: linux-mips@linux-mips.org
Cc: Paul Burton <paul.burton@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org
Message-ID: <20150922181213.Kxzid5J3mIlZk88qBFf6OdKB4P9V_DHU_QBH5iL5DAU@z>

The Config1 register is architecturally defined as required, and is thus
present in all systems which may make use of cps-vec.S. Skip the check
for its presence via the Config.M bit.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 arch/mips/kernel/cps-vec.S | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/mips/kernel/cps-vec.S b/arch/mips/kernel/cps-vec.S
index 5407ce4..84af91a 100644
--- a/arch/mips/kernel/cps-vec.S
+++ b/arch/mips/kernel/cps-vec.S
@@ -50,9 +50,7 @@
 	 * MT is not supported then branch to nomt.
 	 */
 	.macro	has_mt	dest, nomt
-	mfc0	\dest, CP0_CONFIG
-	bgez	\dest, \nomt
-	 mfc0	\dest, CP0_CONFIG, 1
+	mfc0	\dest, CP0_CONFIG, 1
 	bgez	\dest, \nomt
 	 mfc0	\dest, CP0_CONFIG, 2
 	bgez	\dest, \nomt
-- 
2.5.3
