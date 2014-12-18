Received: from mailapp01.imgtec.com ([195.59.15.196]:43769 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009135AbaLRPKrBW7Tq (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 18 Dec 2014 16:10:47 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 465E84A3F7E1D
        for <linux-mips@linux-mips.org>; Thu, 18 Dec 2014 15:10:38 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH RFC 01/67] MIPS: Add generic QEMU R6 PRid and cpu type identifiers
Date: Thu, 18 Dec 2014 15:09:10 +0000
Message-ID: <1418915416-3196-2-git-send-email-markos.chandras@imgtec.com>
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
Cc: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20141218150910.pp-kinqiva1I2su8Dqp1_1-At2AGxWgm3EsuE0p60co@z>

From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>

Latest versions of QEMU added support for mips32r6-generic and
mips64r6-generic cpu types so add related definitions in preparation
of MIPS R6 support.

Signed-off-by: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/include/asm/cpu.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
index dfdc77ed1839..23a5dbc0ee06 100644
--- a/arch/mips/include/asm/cpu.h
+++ b/arch/mips/include/asm/cpu.h
@@ -93,6 +93,7 @@
  * These are the PRID's for when 23:16 == PRID_COMP_MIPS
  */
 
+#define PRID_IMP_QEMUR6		0x0000
 #define PRID_IMP_4KC		0x8000
 #define PRID_IMP_5KC		0x8100
 #define PRID_IMP_20KC		0x8200
@@ -311,6 +312,8 @@ enum cpu_type_enum {
 	CPU_LOONGSON3, CPU_CAVIUM_OCTEON, CPU_CAVIUM_OCTEON_PLUS,
 	CPU_CAVIUM_OCTEON2, CPU_CAVIUM_OCTEON3, CPU_XLR, CPU_XLP,
 
+	CPU_QEMUR6,
+
 	CPU_LAST
 };
 
-- 
2.2.0
