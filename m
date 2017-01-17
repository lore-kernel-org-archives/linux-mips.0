Received: from mail-he1eur01on0117.outbound.protection.outlook.com ([104.47.0.117]:28255
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23993889AbdAQRhykVpY0 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 17 Jan 2017 18:37:54 +0100
From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
Subject: [PATCH] mips: rapidio: Drop dependency on PCI
Date: Tue, 17 Jan 2017 18:37:39 +0100
Message-ID: <20170117173739.28036-1-alexander.sverdlin@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <alexander.sverdlin@nokia.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
Cc: Alexander Sverdlin <alexander.sverdlin@nsn.com>, Alexander Sverdlin <alexander.sverdlin@nokia.com>, linux-mips@linux-mips.org
Message-ID: <20170117173739.BJd8dEK1iFOYxsWycIEog7DTdLzMBNuAp4S_mHj4aCQ@z>

From: Alexander Sverdlin <alexander.sverdlin@nsn.com>

Cavium Octeon is an example of the SoC where RAPIDIO works without PCI.
So drop the unnecessary dependency.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
Cc: linux-mips@linux-mips.org
---
 arch/mips/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index b3c5bde43d34..a97fbd6cbe0a 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -3089,7 +3089,6 @@ source "drivers/pcmcia/Kconfig"
 
 config RAPIDIO
 	tristate "RapidIO support"
-	depends on PCI
 	default n
 	help
 	  If you say Y here, the kernel will include drivers and
-- 
2.11.0
