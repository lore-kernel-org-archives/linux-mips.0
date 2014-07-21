Received: from mailapp01.imgtec.com ([195.59.15.196]:36196 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6861527AbaGUNgUf5aiP (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 21 Jul 2014 15:36:20 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 9B21FAEC4C3D9
        for <linux-mips@linux-mips.org>; Mon, 21 Jul 2014 14:36:09 +0100 (IST)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 1/3] MIPS: EVA: Add new EVA header
Date: Mon, 21 Jul 2014 14:35:54 +0100
Message-ID: <1405949756-10427-2-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1405949756-10427-1-git-send-email-markos.chandras@imgtec.com>
References: <1405949756-10427-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20140721133554.MA5pCGk-jMMUA-nkl_wcg3qB_cF4Qr-nwIGHww6lLLQ@z>

Generic code may need to perform certain operations when EVA is
enabled, for example, configure the segmentation registers during
boot. In order to avoid using more CONFIG_EVA ifdefs in the arch code,
such functions will be added in this header instead.
Initially this header contains a macro which will be used by generic
code later on during VPEs configuration on secondary cores.
All it does is to call the platform specific EVA init code in case
EVA is enabled.

Reviewed-by: Paul Burton <paul.burton@imgtec.com>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/include/asm/eva.h | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 arch/mips/include/asm/eva.h

diff --git a/arch/mips/include/asm/eva.h b/arch/mips/include/asm/eva.h
new file mode 100644
index 000000000000..a3d1807f227c
--- /dev/null
+++ b/arch/mips/include/asm/eva.h
@@ -0,0 +1,43 @@
+/*
+ * This file is subject to the terms and conditions of the GNU General Public
+ * License.  See the file "COPYING" in the main directory of this archive
+ * for more details.
+ *
+ * Copyright (C) 2014, Imagination Technologies Ltd.
+ *
+ * EVA functions for generic code
+ */
+
+#ifndef _ASM_EVA_H
+#define _ASM_EVA_H
+
+#include <kernel-entry-init.h>
+
+#ifdef __ASSEMBLY__
+
+#ifdef CONFIG_EVA
+
+/*
+ * EVA early init code
+ *
+ * Platforms must define their own 'platform_eva_init' macro in
+ * their kernel-entry-init.h header. This macro usually does the
+ * platform specific configuration of the segmentation registers,
+ * and it is normally called from assembly code.
+ *
+ */
+
+.macro eva_init
+platform_eva_init
+.endm
+
+#else
+
+.macro eva_init
+.endm
+
+#endif /* CONFIG_EVA */
+
+#endif /* __ASSEMBLY__ */
+
+#endif
-- 
2.0.0
