Received: from mailapp01.imgtec.com ([195.59.15.196]:41921 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27006814AbaKYJQBJVri3 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 25 Nov 2014 10:16:01 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 33160D17EF8BC
        for <linux-mips@linux-mips.org>; Tue, 25 Nov 2014 09:15:53 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH] MIPS: Kconfig: Disable SMP/CPS for 64-bit
Date: Tue, 25 Nov 2014 09:15:45 +0000
Message-ID: <1416906945-13888-1-git-send-email-markos.chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20141125091545.EZFZpBWdA3bXpCql7jmzpRYTp1mZxC9npvJ39BupS68@z>

A 64-bit build for Malta produces far too many build problems
when SMP/CPS is selected. Moreover, there is currently no 64-bit
product with SMP/CPS so we disable SMP/CPS when building for
64-bit until it is properly supported.

Cc: Paul Burton <paul.burton@imgtec.com>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index d093889332c4..34d3da926589 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2077,7 +2077,7 @@ config MIPS_CMP
 
 config MIPS_CPS
 	bool "MIPS Coherent Processing System support"
-	depends on SYS_SUPPORTS_MIPS_CPS
+	depends on SYS_SUPPORTS_MIPS_CPS && !64BIT
 	select MIPS_CM
 	select MIPS_CPC
 	select MIPS_CPS_PM if HOTPLUG_CPU
-- 
2.1.3
