Received: from mailapp01.imgtec.com ([195.59.15.196]:16502 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009466AbbGAIb1COgJB (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 1 Jul 2015 10:31:27 +0200
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 7/7] Revert "MIPS: Kconfig: Disable SMP/CPS for 64-bit"
Date: Wed, 1 Jul 2015 09:31:14 +0100
Message-ID: <1435739474-31737-1-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1435738414-30944-1-git-send-email-markos.chandras@imgtec.com>
References: <1435738414-30944-1-git-send-email-markos.chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>, stable@vger.kernel.org
Message-ID: <20150701083114.GqlSu0mLodiRwQINY5PJiByd33gWfS_WfJRAuk4gwKk@z>

This reverts commit 6ca716f2e5571d25a3899c6c5c91ff72ea6d6f5e.

SMP/CPS is now supported on 64bit cores.

Cc: <stable@vger.kernel.org> # 4.1
Reviewed-by: Paul Burton <paul.burton@imgtec.com>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index f5016656494f..003cf61080b1 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2220,7 +2220,7 @@ config MIPS_CMP
 
 config MIPS_CPS
 	bool "MIPS Coherent Processing System support"
-	depends on SYS_SUPPORTS_MIPS_CPS && !64BIT
+	depends on SYS_SUPPORTS_MIPS_CPS
 	select MIPS_CM
 	select MIPS_CPC
 	select MIPS_CPS_PM if HOTPLUG_CPU
-- 
2.4.5
