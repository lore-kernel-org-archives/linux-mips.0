Received: from mail-gw3-out.broadcom.com ([216.31.210.64]:38173 "EHLO
        mail-gw3-out.broadcom.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6825884AbaAOTFrZ23IU (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 15 Jan 2014 20:05:47 +0100
From: Florian Fainelli <florian@openwrt.org>
Subject: [PATCH mips-for-linux-next] MIPS: check for D$ line size and CONFIG_MIPS_L1_SHIFT
Date: Wed, 15 Jan 2014 11:05:22 -0800
Message-ID: <1389812722-30035-1-git-send-email-florian@openwrt.org>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <florian@openwrt.org>
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
Cc: ralf@linux-mips.org, blogic@openwrt.org, Florian Fainelli <florian@openwrt.org>
Message-ID: <20140115190522.Nc5lNzlNDOMVyRWOynKYTzhNbydakcZCOQ44qtE1Cic@z>

When a platform overrides the dcache_line_size detection in its
cpu-features-override.h file, check that the value matches
(1 << CONFIG_MIPS_L1_SHIFT) to ensure both settings are correct.

Signed-off-by: Florian Fainelli <florian@openwrt.org>
---
 arch/mips/include/asm/cpu-features.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/mips/include/asm/cpu-features.h b/arch/mips/include/asm/cpu-features.h
index 6e70b03..9052fb9 100644
--- a/arch/mips/include/asm/cpu-features.h
+++ b/arch/mips/include/asm/cpu-features.h
@@ -279,6 +279,10 @@
 
 #ifndef cpu_dcache_line_size
 #define cpu_dcache_line_size()	cpu_data[0].dcache.linesz
+#else
+#if (cpu_dcache_line_size() != (1 << CONFIG_MIPS_L1_CACHE_SHIFT))
+#error "cpu_dcache_line_size does not match CONFIG_MIPS_L1_CACHE_SHIFT"
+#endif
 #endif
 #ifndef cpu_icache_line_size
 #define cpu_icache_line_size()	cpu_data[0].icache.linesz
-- 
1.8.3.2
