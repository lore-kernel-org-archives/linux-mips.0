Received: from mailapp01.imgtec.com ([195.59.15.196]:6263 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010481AbbAPKvvYyWff (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 16 Jan 2015 11:51:51 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id CA581E3D6B9CE
        for <linux-mips@linux-mips.org>; Fri, 16 Jan 2015 10:51:43 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH RFC v2 08/70] MIPS: asm: module: define MODULE_PROC_FAMILY for MIPS R6
Date: Fri, 16 Jan 2015 10:48:47 +0000
Message-ID: <1421405389-15512-9-git-send-email-markos.chandras@imgtec.com>
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
Cc: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20150116104847.GJygceFgLs40vYH40P93xY6peMdIaaUHlgFzdBmrbK4@z>

From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>

Define the MODULE_PROC_FAMILY for the MIPS R6 ISA.

Signed-off-by: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/include/asm/module.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/mips/include/asm/module.h b/arch/mips/include/asm/module.h
index 800fe578dc99..0aaf9a01ea50 100644
--- a/arch/mips/include/asm/module.h
+++ b/arch/mips/include/asm/module.h
@@ -88,10 +88,14 @@ search_module_dbetables(unsigned long addr)
 #define MODULE_PROC_FAMILY "MIPS32_R1 "
 #elif defined CONFIG_CPU_MIPS32_R2
 #define MODULE_PROC_FAMILY "MIPS32_R2 "
+#elif defined CONFIG_CPU_MIPS32_R6
+#define MODULE_PROC_FAMILY "MIPS32_R6 "
 #elif defined CONFIG_CPU_MIPS64_R1
 #define MODULE_PROC_FAMILY "MIPS64_R1 "
 #elif defined CONFIG_CPU_MIPS64_R2
 #define MODULE_PROC_FAMILY "MIPS64_R2 "
+#elif defined CONFIG_CPU_MIPS64_R6
+#define MODULE_PROC_FAMILY "MIPS64_R6 "
 #elif defined CONFIG_CPU_R3000
 #define MODULE_PROC_FAMILY "R3000 "
 #elif defined CONFIG_CPU_TX39XX
-- 
2.2.1
