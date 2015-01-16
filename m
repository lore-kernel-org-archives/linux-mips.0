Received: from mailapp01.imgtec.com ([195.59.15.196]:9121 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009602AbbAPKwRg2Sj2 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 16 Jan 2015 11:52:17 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id EE61146E26503
        for <linux-mips@linux-mips.org>; Fri, 16 Jan 2015 10:52:09 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH RFC v2 19/70] MIPS: Use the new "ZC" constraint for MIPS R6
Date: Fri, 16 Jan 2015 10:48:58 +0000
Message-ID: <1421405389-15512-20-git-send-email-markos.chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>, Matthew Fortune <Matthew.Fortune@imgtec.com>
Message-ID: <20150116104858.MQRFstRwgRPx04lyTDsBUJctCI5jRHx526AvvskfRo0@z>

GCC versions supporting MIPS R6 use the ZC constraint to enforce a
9-bit offset for MIPS R6. We will use that for all MIPS R6 LL/SC
instructions.

Cc: Matthew Fortune <Matthew.Fortune@imgtec.com>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/include/asm/compiler.h | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/compiler.h b/arch/mips/include/asm/compiler.h
index c73815e0123a..8f8ed0245a09 100644
--- a/arch/mips/include/asm/compiler.h
+++ b/arch/mips/include/asm/compiler.h
@@ -16,12 +16,20 @@
 #define GCC_REG_ACCUM "accum"
 #endif
 
+#ifdef CONFIG_CPU_MIPSR6
+/*
+ * GCC uses ZC for MIPS R6 to indicate a 9-bit offset although
+ * the macro name is a bit misleading
+ */
+#define GCC_OFF12_ASM() "ZC"
+#else
 #ifndef CONFIG_CPU_MICROMIPS
 #define GCC_OFF12_ASM() "R"
 #elif __GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 9)
 #define GCC_OFF12_ASM() "ZC"
 #else
 #error "microMIPS compilation unsupported with GCC older than 4.9"
-#endif
+#endif /* CONFIG_CPU_MICROMIPS */
+#endif /* CONFIG_CPU_MIPSR6 */
 
 #endif /* _ASM_COMPILER_H */
-- 
2.2.1
