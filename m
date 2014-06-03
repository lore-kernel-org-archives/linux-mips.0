Received: from mailapp01.imgtec.com ([195.59.15.196]:25298 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6822330AbaFCIqcAdLSR (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 3 Jun 2014 10:46:32 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 5A3B2F5192CB5
        for <linux-mips@linux-mips.org>; Tue,  3 Jun 2014 09:46:23 +0100 (IST)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH] MIPS: Kconfig: microMIPS and SmartMIPS are mutually exclusive
Date: Tue, 3 Jun 2014 09:46:17 +0100
Message-ID: <1401785177-7904-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20140603084617.ZUIh72F0_Ges-WB1iDSUHBqoY_XTCj8mSTa_dSjJsYo@z>

Fixes the following build problem on randconfig:

Warning: the 32-bit microMIPS architecture does not support the `smartmips'
extension
arch/mips/kernel/entry.S:90: Error: unrecognized opcode `mtlhx $24'
[...]
arch/mips/kernel/entry.S:109: Error: unrecognized opcode `mtlhx $24'

Link: https://dmz-portal.mips.com/bugz/show_bug.cgi?id=1021
Reviewed-by: Steven J. Hill <Steven.Hill@imgtec.com>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 2fe8e60..ffde3d6 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2063,7 +2063,7 @@ config ARCH_PHYS_ADDR_T_64BIT
        def_bool 64BIT_PHYS_ADDR
 
 config CPU_HAS_SMARTMIPS
-	depends on SYS_SUPPORTS_SMARTMIPS
+	depends on SYS_SUPPORTS_SMARTMIPS && !CPU_MICROMIPS
 	bool "Support for the SmartMIPS ASE"
 	help
 	  SmartMIPS is a extension of the MIPS32 architecture aimed at
-- 
1.9.3
