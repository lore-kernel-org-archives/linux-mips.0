Received: from mail-db5eur01on0041.outbound.protection.outlook.com ([104.47.2.41]:43296
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23990557AbdJKSMIYhtkD (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 11 Oct 2017 20:12:08 +0200
From: James Hartley <james.hartley@sondrel.com>
Subject: [PATCH] MAINTAINERS: Update Pistachio platform maintainers
Date: Wed, 11 Oct 2017 19:11:32 +0100
Message-ID: <1507745492-13349-1-git-send-email-james.hartley@sondrel.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <james.hartley@sondrel.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: davem@davemloft.net
Cc: linux-mips@linux-mips.org, james.hartley@sondrel.com, James Hartley <james.hartley@imgtec.com>

From: James Hartley <james.hartley@imgtec.com>

Neither of the current maintainers works for Imagination any more.

Removed both imgtec email addresses and added back mine for
occasional reviews, also changed from Maintained to Odd Fixes to
reflect the time that I will be able to spend on it.

Signed-off-by: James Hartley <james.hartley@sondrel.com>
---
 MAINTAINERS | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ccc5181..5ccf3b5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10731,10 +10731,9 @@ S:	Maintained
 F:	drivers/pinctrl/spear/
 
 PISTACHIO SOC SUPPORT
-M:	James Hartley <james.hartley@imgtec.com>
-M:	Ionela Voinescu <ionela.voinescu@imgtec.com>
+M:	James Hartley <james.hartley@sondrel.com>
 L:	linux-mips@linux-mips.org
-S:	Maintained
+S:	Odd Fixes
 F:	arch/mips/pistachio/
 F:	arch/mips/include/asm/mach-pistachio/
 F:	arch/mips/boot/dts/img/pistachio*
-- 
2.7.4
