Received: from mailapp01.imgtec.com ([195.59.15.196]:58788 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010525AbbAPKwAHq5Ka (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 16 Jan 2015 11:52:00 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 84BB221C8034E
        for <linux-mips@linux-mips.org>; Fri, 16 Jan 2015 10:51:52 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH RFC v2 10/70] MIPS: asm: asmmacro: Drop unused 'reg' argument on MIPSR2
Date: Fri, 16 Jan 2015 10:48:49 +0000
Message-ID: <1421405389-15512-11-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1421405389-15512-1-git-send-email-markos.chandras@imgtec.com>
References: <1421405389-15512-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20150116104849.9xdg6rJq9QHkA2U1cxRG2Cyi_kg41VA6p2b0r2OYr60@z>

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
2.2.1
