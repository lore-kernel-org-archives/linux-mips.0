Received: from mailapp01.imgtec.com ([195.59.15.196]:14529 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009220AbaLRPNnRL0Vv (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 18 Dec 2014 16:13:43 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 912B23D9BDB8D
        for <linux-mips@linux-mips.org>; Thu, 18 Dec 2014 15:13:34 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH RFC 66/67] MIPS: Malta: Add support for building MIPS R6 kernel
Date: Thu, 18 Dec 2014 15:10:15 +0000
Message-ID: <1418915416-3196-67-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1418915416-3196-1-git-send-email-markos.chandras@imgtec.com>
References: <1418915416-3196-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20141218151015.EuMeV0g7KW6vOBg4wLN2XTqIO-WDcy9ZEboRLTXUwds@z>

The Malta platform supports MIPS R6 (via QEMU or real bitstreams)
so add support for it.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 3fe856572d2e..0e1106c775a5 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -332,8 +332,10 @@ config MIPS_MALTA
 	select SYS_HAS_CPU_MIPS32_R1
 	select SYS_HAS_CPU_MIPS32_R2
 	select SYS_HAS_CPU_MIPS32_R3_5
+	select SYS_HAS_CPU_MIPS32_R6
 	select SYS_HAS_CPU_MIPS64_R1
 	select SYS_HAS_CPU_MIPS64_R2
+	select SYS_HAS_CPU_MIPS64_R6
 	select SYS_HAS_CPU_NEVADA
 	select SYS_HAS_CPU_RM7000
 	select SYS_SUPPORTS_32BIT_KERNEL
-- 
2.2.0
