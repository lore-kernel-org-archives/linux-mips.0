Received: from mail.windriver.com ([147.11.1.11]:38933 "EHLO
        mail.windriver.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012263AbcBTAFNiHsoD (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 20 Feb 2016 01:05:13 +0100
From: Yang Shi <yang.shi@windriver.com>
Subject: [PATCH] mips: Kconfig: replace OPROFILE=n to !OPROFILE
Date: Fri, 19 Feb 2016 15:42:11 -0800
Message-ID: <1455925331-9662-1-git-send-email-yang.shi@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Yang.Shi@windriver.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: ralf@linux-mips.org
Cc: linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
Message-ID: <20160219234211.fGHYSg6jFAQyaCyAjvfp58nV0lC4znAK76vMDe6gNHw@z>

In Kconfig "=n" is not correct syntax, "!" is the preferred way for
false-positive expression.

Signed-off-by: Yang Shi <yang.shi@windriver.com>
---
 arch/mips/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 74a3db9..ab433d3 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2484,7 +2484,7 @@ config NODES_SHIFT
 
 config HW_PERF_EVENTS
 	bool "Enable hardware performance counter support for perf events"
-	depends on PERF_EVENTS && OPROFILE=n && (CPU_MIPS32 || CPU_MIPS64 || CPU_R10000 || CPU_SB1 || CPU_CAVIUM_OCTEON || CPU_XLP || CPU_LOONGSON3)
+	depends on PERF_EVENTS && !OPROFILE && (CPU_MIPS32 || CPU_MIPS64 || CPU_R10000 || CPU_SB1 || CPU_CAVIUM_OCTEON || CPU_XLP || CPU_LOONGSON3)
 	default y
 	help
 	  Enable hardware performance counter support for perf events. If
-- 
2.0.2
