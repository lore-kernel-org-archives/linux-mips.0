Received: from mailapp01.imgtec.com ([195.59.15.196]:27376 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009732AbbAPKv0SJI7e (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 16 Jan 2015 11:51:26 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 99E547C9DC635
        for <linux-mips@linux-mips.org>; Fri, 16 Jan 2015 10:51:18 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH RFC v2 01/70] MIPS: Add generic QEMU PRid and cpu type identifiers
Date: Fri, 16 Jan 2015 10:48:40 +0000
Message-ID: <1421405389-15512-2-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20150116104840.V2754Uk80Xbv2oM0nXjV8lIhbTaW8OKw0a4dSFr_qPA@z>

From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>

Latest versions of QEMU added support for mips32r6-generic and
mips64r6-generic cpu types so add related definitions in preparation
of MIPS R6 support. This is also used for QEMU R2 generic cpus.

Signed-off-by: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/include/asm/cpu.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
index 33866fce4d63..0b74bbf976e4 100644
--- a/arch/mips/include/asm/cpu.h
+++ b/arch/mips/include/asm/cpu.h
@@ -93,6 +93,7 @@
  * These are the PRID's for when 23:16 == PRID_COMP_MIPS
  */
 
+#define PRID_IMP_QEMU_GENERIC	0x0000
 #define PRID_IMP_4KC		0x8000
 #define PRID_IMP_5KC		0x8100
 #define PRID_IMP_20KC		0x8200
@@ -312,6 +313,8 @@ enum cpu_type_enum {
 	CPU_LOONGSON3, CPU_CAVIUM_OCTEON, CPU_CAVIUM_OCTEON_PLUS,
 	CPU_CAVIUM_OCTEON2, CPU_CAVIUM_OCTEON3, CPU_XLR, CPU_XLP,
 
+	CPU_QEMU_GENERIC,
+
 	CPU_LAST
 };
 
-- 
2.2.1
