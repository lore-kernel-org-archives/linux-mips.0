Received: from mailapp01.imgtec.com ([195.59.15.196]:29978 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27013682AbaKYJQQEyeiq (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 25 Nov 2014 10:16:16 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 63AE9C07A2D1A
        for <linux-mips@linux-mips.org>; Tue, 25 Nov 2014 09:16:08 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH] MIPS: asm: asmmacro: Drop unused 'reg' argument on MIPSR2
Date: Tue, 25 Nov 2014 09:16:06 +0000
Message-ID: <1416906966-13944-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20141125091606.Q9sYMIn5wVE1o_aO4NuAf9cAWHOEwaa3KKQbcgsgr-E@z>

The local_irq_{enable, disable} macros do not use the reg argument
so drop it.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/include/asm/asmmacro.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/asmmacro.h b/arch/mips/include/asm/asmmacro.h
index 6caf8766b80f..90f69c334a75 100644
--- a/arch/mips/include/asm/asmmacro.h
+++ b/arch/mips/include/asm/asmmacro.h
@@ -20,12 +20,12 @@
 #endif
 
 #ifdef CONFIG_CPU_MIPSR2
-	.macro	local_irq_enable reg=t0
+	.macro	local_irq_enable
 	ei
 	irq_enable_hazard
 	.endm
 
-	.macro	local_irq_disable reg=t0
+	.macro	local_irq_disable
 	di
 	irq_disable_hazard
 	.endm
-- 
2.1.3
