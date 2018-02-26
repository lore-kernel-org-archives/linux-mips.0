Received: from 9pmail.ess.barracuda.com ([64.235.150.225]:60051 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23991096AbeBZRG2VqTFO (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 26 Feb 2018 18:06:28 +0100
From: Matt Redfearn <matt.redfearn@mips.com>
Subject: [PATCH 1/4] MIPS: Introduce isa-rev.h to define MIPS_ISA_REV
Date: Mon, 26 Feb 2018 17:02:42 +0000
Message-ID: <1519664565-10955-2-git-send-email-matt.redfearn@mips.com>
In-Reply-To: <1519664565-10955-1-git-send-email-matt.redfearn@mips.com>
References: <1519664565-10955-1-git-send-email-matt.redfearn@mips.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Matt.Redfearn@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: James Hogan <jhogan@kernel.org>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, Paul Burton <paul.burton@mips.com>, Matt Redfearn <matt.redfearn@mips.com>, linux-kernel@vger.kernel.org
Message-ID: <20180226170242.JwXhYGmwU_gcVFHgoKBE8HJpL7OLB-NkoC2Gt75oqRc@z>

There are multiple instances in the kernel where we need to include or
exclude particular instructions based on the ISA revision of the target
processor. For MIPS32 / MIPS64, the compiler exports a __mips_isa_rev
define. However, when targeting MIPS I - V, this define is absent. This
leads to each use of __mips_isa_rev having to check that it is defined
first. To simplify this, introduce the isa-rev.h header which always
exports MIPS_ISA_REV. The name is changed so as to avoid confusion with
the compiler builtin and to avoid accidentally using the builtin.
MIPS_ISA_REV is defined to the compilers builtin if provided, or 0,
which satisfies all current usages.

Suggested-by: Paul Burton <paul.burton@mips.com>
Signed-off-by: Matt Redfearn <matt.redfearn@mips.com>

---

 arch/mips/include/asm/isa-rev.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 arch/mips/include/asm/isa-rev.h

diff --git a/arch/mips/include/asm/isa-rev.h b/arch/mips/include/asm/isa-rev.h
new file mode 100644
index 000000000000..683ea3454dcb
--- /dev/null
+++ b/arch/mips/include/asm/isa-rev.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2018 MIPS Tech, LLC
+ * Author: Matt Redfearn <matt.redfearn@mips.com>
+ */
+
+#ifndef __MIPS_ASM_ISA_REV_H__
+#define __MIPS_ASM_ISA_REV_H__
+
+/*
+ * The ISA revision level. This is 0 for MIPS I to V and N for
+ * MIPS{32,64}rN.
+ */
+
+/* If the compiler has defined __mips_isa_rev, believe it. */
+#ifdef __mips_isa_rev
+#define MIPS_ISA_REV __mips_isa_rev
+#else
+/* The compiler hasn't defined the isa rev so assume it's MIPS I - V (0) */
+#define MIPS_ISA_REV 0
+#endif
+
+
+#endif /* __MIPS_ASM_ISA_REV_H__ */
-- 
2.7.4
