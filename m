Received: from mail-ve1eur01on0130.outbound.protection.outlook.com ([104.47.1.130]:1444
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23993890AbdAQRhFLmxr0 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 17 Jan 2017 18:37:05 +0100
From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
Subject: [PATCH] octeon: prom_putchar() must be void
Date: Tue, 17 Jan 2017 18:36:44 +0100
Message-ID: <20170117173644.27984-1-alexander.sverdlin@nokia.com>
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
Cc: Alexander Sverdlin <alexander.sverdlin@nsn.com>, Alexander Sverdlin <alexander.sverdlin@nokia.com>, Ralf Baechle <ralf@linux-mips.org>, David Daney <david.daney@cavium.com>, Aaro Koskinen <aaro.koskinen@nokia.com>, "Steven J. Hill" <steven.hill@cavium.com>, linux-mips@linux-mips.org
Message-ID: <20170117173644.qqEPKzPRWfYrwsufniPjvYgWhLaPpTZLuxkom-MDW1Q@z>

From: Alexander Sverdlin <alexander.sverdlin@nsn.com>

Correct the function return type.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: David Daney <david.daney@cavium.com>
Cc: Aaro Koskinen <aaro.koskinen@nokia.com>
Cc: "Steven J. Hill" <steven.hill@cavium.com>
Cc: linux-mips@linux-mips.org
---
 arch/mips/cavium-octeon/setup.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/mips/cavium-octeon/setup.c b/arch/mips/cavium-octeon/setup.c
index 9a2db1c013d9..bb613d3e5246 100644
--- a/arch/mips/cavium-octeon/setup.c
+++ b/arch/mips/cavium-octeon/setup.c
@@ -1095,7 +1095,7 @@ void __init plat_mem_setup(void)
  * Emit one character to the boot UART.	 Exported for use by the
  * watchdog timer.
  */
-int prom_putchar(char c)
+void prom_putchar(char c)
 {
 	uint64_t lsrval;
 
@@ -1106,7 +1106,6 @@ int prom_putchar(char c)
 
 	/* Write the byte */
 	cvmx_write_csr(CVMX_MIO_UARTX_THR(octeon_uart), c & 0xffull);
-	return 1;
 }
 EXPORT_SYMBOL(prom_putchar);
 
-- 
2.11.0
