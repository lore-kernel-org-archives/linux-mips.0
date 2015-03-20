Received: from nivc-ms1.auriga.com ([80.240.102.146]:54543 "EHLO
        nivc-ms1.auriga.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27014329AbbCTQP7QMCMy (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 20 Mar 2015 17:15:59 +0100
From: Aleksey Makarov <aleksey.makarov@auriga.com>
Subject: [PATCH 3/3] MIPS: OCTEON: Enable little endian kernel.
Date: Fri, 20 Mar 2015 19:11:58 +0300
Message-ID: <1426867920-7907-4-git-send-email-aleksey.makarov@auriga.com>
In-Reply-To: <1426867920-7907-1-git-send-email-aleksey.makarov@auriga.com>
References: <1426867920-7907-1-git-send-email-aleksey.makarov@auriga.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <aleksey.makarov@auriga.com>
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
Cc: linux-kernel@vger.kernel.org, David Daney <david.daney@cavium.com>, Aleksey Makarov <aleksey.makarov@auriga.com>, Leonid Rosenboim <lrosenboim@caviumnetworks.com>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20150320161158.Pip_quYMbCZ9z9vSraW-996KDUIwP1ylgefdftT89bk@z>

From: David Daney <david.daney@cavium.com>

Now it is supported, so let people select it.

Signed-off-by: David Daney <david.daney@cavium.com>
Signed-off-by: Leonid Rosenboim <lrosenboim@caviumnetworks.com>
Signed-off-by: Aleksey Makarov <aleksey.makarov@auriga.com>
---
 arch/mips/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 3086b87..a6ca5e1 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -779,7 +779,8 @@ config CAVIUM_OCTEON_SOC
 	select SYS_SUPPORTS_64BIT_KERNEL
 	select SYS_SUPPORTS_BIG_ENDIAN
 	select EDAC_SUPPORT
-	select SYS_SUPPORTS_HOTPLUG_CPU
+	select SYS_SUPPORTS_LITTLE_ENDIAN
+	select SYS_SUPPORTS_HOTPLUG_CPU if CONFIG_CPU_BIG_ENDIAN
 	select SYS_HAS_EARLY_PRINTK
 	select SYS_HAS_CPU_CAVIUM_OCTEON
 	select SWAP_IO_SPACE
-- 
2.3.3
