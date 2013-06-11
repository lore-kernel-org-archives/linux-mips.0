Received: from multi.imgtec.com ([194.200.65.239]:56268 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6823001Ab3FKJwYQl9E8 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 11 Jun 2013 11:52:24 +0200
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH] MIPS: Kconfig: Set default value for the "Kernel code model"
Date: Tue, 11 Jun 2013 10:52:16 +0100
Message-ID: <1370944336-13703-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20130611095216.Gx4z_poZ2s45PrfqgczM5EJ3qH4Ej9tJ1UoRAbRKUtY@z>

Certain randconfigs may not select neither CONFIG_32BIT nor
CONFIG_64BIT which can lead to build problems and to the following
Kbuild warning:

.config:154:warning: symbol value '' invalid for PHYSICAL_START

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
Acked-by: Steven J. Hill <Steven.Hill@imgtec.com>
---
This patch is for the upstream-sfr/mips-for-linux-next tree
---
 arch/mips/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 7a58ab9..dffab77 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1714,6 +1714,7 @@ menu "Kernel type"
 
 choice
 	prompt "Kernel code model"
+	default 32BIT
 	help
 	  You should only select this option if you have a workload that
 	  actually benefits from 64-bit processing or if your machine has
-- 
1.8.2.1
