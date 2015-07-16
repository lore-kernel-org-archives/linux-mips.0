Received: from mailapp01.imgtec.com ([195.59.15.196]:9822 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010433AbbGPMY546s4- (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 16 Jul 2015 14:24:57 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id D95DEBEEB7EEA
        for <linux-mips@linux-mips.org>; Thu, 16 Jul 2015 13:24:49 +0100 (IST)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH] MIPS: Kconfig: Drop the EXPERIMENTAL tag from MIPS R6
Date: Thu, 16 Jul 2015 13:24:46 +0100
Message-ID: <1437049486-4170-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20150716122446.BePCA8hjTcY7K2CSag4MG2ft1sMEDyHSKosEpM9z1WQ@z>

The MIPS R6 ISA support has been part of mainline since v4.0
and it should be in a good shape nowadays so it is not an
experimental feature anymore.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 51bc4873e7e8..885414ece0ac 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1368,7 +1368,7 @@ config CPU_MIPS32_R2
 	  otherwise CPU_MIPS32_R1 is a safe bet for any MIPS32 system.
 
 config CPU_MIPS32_R6
-	bool "MIPS32 Release 6 (EXPERIMENTAL)"
+	bool "MIPS32 Release 6"
 	depends on SYS_HAS_CPU_MIPS32_R6
 	select CPU_HAS_PREFETCH
 	select CPU_SUPPORTS_32BIT_KERNEL
@@ -1419,7 +1419,7 @@ config CPU_MIPS64_R2
 	  otherwise CPU_MIPS64_R1 is a safe bet for any MIPS64 system.
 
 config CPU_MIPS64_R6
-	bool "MIPS64 Release 6 (EXPERIMENTAL)"
+	bool "MIPS64 Release 6"
 	depends on SYS_HAS_CPU_MIPS64_R6
 	select CPU_HAS_PREFETCH
 	select CPU_SUPPORTS_32BIT_KERNEL
-- 
2.4.5
